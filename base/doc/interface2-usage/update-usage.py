#!/usr/bin/env python3
r"""
update-usage.py -- refresh the usage lists in interface2.tex

For every command documented in interface2.tex (function, variable and
constant environments) this script searches a TeX Live tree
(texmf-dist/tex/latex, minus the core bundles) and records which files
change the command and which only use it. The result is written back
into interface2.tex as \modifiedby / \setby / \usedby / \publicusedby
lines directly after each \end{function|variable|constant}; any existing
such lines are replaced. It also writes a \sourcefile{<dtx>} line before
each entry, naming the kernel file(s) defining its commands (shown as a
margin note).

Which list command is used comes from the entry itself:
  variable without [readonly]  -> \setby      (setting is expected)
  function with [settable]      -> \setby      (redefining is expected)
  everything else              -> \modifiedby (changing is not expected)
  [user] entries               -> no "used by" list
  [int] entries                -> \usedby, otherwise \publicusedby

Usage
  update-usage.py                 update ../interface2.tex in place
  update-usage.py --dry-run       only report what would change
  update-usage.py --test          run the rule tests in tests.toml
  update-usage.py --explain CMD FILE
                                  show how FILE uses CMD: each change found
                                  (with rule and line), candidates that were
                                  rejected and why, and the plain uses. FILE
                                  may be a path or a name found by kpsewhich,
                                  e.g.  --explain edef caption3.sty
  update-usage.py --texmf DIR     search DIR instead of the configured tree
  update-usage.py --only CMD ...  only sweep these commands (for testing;
                                  combine with --dry-run)

Settings and manual corrections live in config.toml; tests for the
detection rules in tests.toml; known limits of the rules in
KNOWN-ISSUES.md. When you change or add a rule below, add a
test case for it (and run --test).

Requires Python 3.11 or later (tomllib).
"""

import argparse
import json
import os
import re
import subprocess
import sys
try:
    import tomllib
except ImportError:
    sys.exit('update-usage.py needs Python 3.11 or later (for tomllib); this is '
             f'Python {sys.version.split()[0]} ({sys.executable}).\n'
             'Run it with a newer python, e.g.  /opt/homebrew/bin/python3 update-usage.py ...')
from collections import defaultdict

HERE = os.path.dirname(os.path.abspath(__file__))

# =====================================================================
# Detection rules
#
# A file *modifies* \X if one of the MODIFICATION RULES finds \X as the
# object of a definition, patch or assignment, and the change is not
# merely temporary (see TEMPORARY CHANGES). Any other occurrence of \X
# makes the file a *reader*. Comments are stripped before matching.
# =====================================================================

# Name-end: a command name ends at a non-letter. "_" is included because
# in expl3 code \let_token is a different command from \let.
E = r'(?![A-Za-z@_])'
WS = r'[ \t]*'

# Prefixes allowed in front of a definer.
PFX = r'(?:\\(?:global|long|protected|outer)' + E + r'\s*)*'

# --- definers --------------------------------------------------------
# TeX definers. Kept apart from the LaTeX ones because they take no
# braces around the defined command and need extra checks (AFTER_*).
DEF_TEX = PFX + r'(?:\\[gex]?def)' + E
LET_TEX = PFX + r'(?:\\let|\\futurelet)' + E

# LaTeX/package/expl3 definers and patchers; the command may be braced.
# \providecommand & friends are deliberately missing: they don't change
# an existing definition.
DEF_LATEX = (PFX + r'(?:\\(?:re)?newcommand\*?|\\DeclareRobustCommand\*?'
             r'|\\(?:Re|New|Declare)(?:Expandable)?DocumentCommand'
             r'|\\(?:New|Renew|Declare)CommandCopy'
             r'|\\[gx]?(?:patch|appto|preto)cmd|\\x(?:patch|appto|preto)cmd'
             r'|\\[gl]@addto@macro|\\addto|\\renewrobustcmd\*?|\\robustify'
             r'|\\pretocmd|\\apptocmd'
             r'|\\cs_(?:g?set|new)(?:_protected)?(?:_nopar)?:N[a-z]*'
             r'|\\cs_g?set_eq:NN|\\tl_g?(?:set|put_right|put_left):N[a-z]*)' + E)

# What must follow the defined command so that the definer is really
# executed (and not just passed as an argument, e.g.
# \caption@setdefault\def\edef} or T{\def\edef\gdef}):
#   \def\X   a parameter text (no braces) and then "{"
#   \let\X   some token, not a closing brace
AFTER_DEF = r'[^{}]{0,200}?\{'
AFTER_LET = r'\s*=?\s*[^}\s]'

# \expandafter chains: \expandafter\def\expandafter\foo{...} defines \foo.
# \@xp is the ams short name for \expandafter. A chain only counts if it
# starts before the definer; \let\@xp\expandafter \let... is no chain.
XA_TOKEN = r'\\(?:expandafter|@xp)' + E + r'\s*'
XA = WS + '(?:' + XA_TOKEN + ')*'
CHAIN = '(?:' + XA_TOKEN + ')+'
CHAIN_COMMANDS = {'expandafter', '@xp'}   # never "defined" by a chain

# A definer that is itself an argument does not define anything:
#   \let\foo\edef ...    \ifx\x\let ...    \noexpand\def ...
ARG_BEFORE = re.compile(
    r'(?:\\(?:let|ifx|futurelet|cs_set_eq:NN|cs_new_eq:NN|cs_gset_eq:NN)'
    r'\s*(?:\\[A-Za-z@_:]+|#+\d)\s*=?\s*'
    r'|\\(?:let|[gex]?def|ifx|noexpand|string|meaning|show|detokenize'
    r'|unexpanded|futurelet)\s*=?\s*)$')
# ... unless the \let before it is already complete:
#   \let\@nx\noexpand \def\foo{...}
LET_COMPLETE = re.compile(
    r'\\(?:let|futurelet)\s*\\[A-Za-z@_:]+\s*=?\s*\\[A-Za-z@_:]+\s*$')

# Definitions through a constructed name.
NAMEDEF = (r'(?:\\expandafter\s*' + PFX + r'(?:\\[gex]?def|\\let)' + E +
           r'\s*\\csname\s*(?:NAME)\s*\\endcsname'
           r'|\\@namedef\s*\{\s*(?:NAME)\s*\}'
           r'|\\(?:g|e|x)?csdef\s*\{\s*(?:NAME)\s*\}'
           r'|\\cslet\s*\{\s*(?:NAME)\s*\}'
           r'|\\AddToHook\s*\{\s*cmd/(?:NAME)/)')

# --- assignments (only for registers, see config.toml) ---------------
ASSIGN = (r'(?:(?:\\setlength|\\addtolength|\\advance|\\multiply|\\divide'
          r'|\\settowidth|\\settoheight|\\settodepth|\\setbox|\\sbox|\\savebox'
          r'|\\global|\\deflength)' + E + r'\s*\{?\s*(?:CS)' + E +
          r'|(?:CS)' + E + r'\s*=)')
COUNTER = r'\\(?:set|addto|step|refstep)counter\s*\{\s*(?:NAME)\s*\}'
# Bare assignment \X<value>: the value must start like a number or a
# kernel constant, and \X must not be read by the command in front of it
# (\vskip\topsep 3pt, \ifdim\@tempdima>..., \advance\x\@tempdima 2...).
BARE_VALUE = (r'\s*(?:[-+]?[\d.]|\\z@|\\p@|\\@ne|\\m@ne|\\tw@|\\thr@@'
              r'|\\@M|\\maxdimen|\\@m)')
READ_BEFORE = re.compile(
    r'\\(?:vskip|hskip|kern|advance|ifdim|ifnum|ifcase|the|multiply|divide'
    r'|vspace\*?|hspace\*?|addvspace|addpenalty|penalty|number|showthe'
    r'|romannumeral|setlength|addtolength|by|vrule|hrule|wd|ht|dp|box|copy'
    r'|unhbox|unvbox|unhcopy|unvcopy|[a-z@]*skip|raise|lower|moveleft'
    r'|moveright|to|spread)\s*\{?\s*$'
    r'|\\(?:advance|multiply|divide|setlength|addtolength)\s*\{?\s*'
    r'\\[A-Za-z@]+\s*\}?\s*(?:by)?\s*\{?\s*$'
    r'|[<>=]\s*$')


class Rule:
    r"""One way of changing \cmd.

    Most rules describe what comes *before* \cmd (BEFORE, e.g. a definer)
    and what must come after it (AFTER). For speed the occurrences of
    \cmd are found first and only the text just in front of each is
    checked. Rules that don't fit this scheme (e.g. \@namedef{name})
    give a PATTERN that is searched in the whole file.
    """
    WINDOW = 200    # how far before \cmd a BEFORE pattern may start

    def __init__(self, name, before=None, pattern=None, after=None,
                 definer=False, read_before=False):
        self.name = name
        self.before = re.compile('(?:' + before + r')\Z') if before is not None else None
        self.pattern = re.compile(pattern) if pattern else None
        self.after = re.compile(after) if after else None
        self.definer = definer          # apply the ARG_BEFORE check
        self.read_before = read_before  # apply the READ_BEFORE check

    def ok(self, text, start, end):
        if self.definer:
            pre = text[max(0, start - 60):start]
            if ARG_BEFORE.search(pre) and not LET_COMPLETE.search(pre):
                return False
        if self.read_before:
            if READ_BEFORE.search(text[max(0, start - 40):start]):
                return False
        return self.after is None or bool(self.after.match(text, end))

    def diagnose(self, text, start, end):
        """Why a candidate at START..END is (not) a change; None if ok."""
        if self.definer:
            pre = text[max(0, start - 60):start]
            if ARG_BEFORE.search(pre) and not LET_COMPLETE.search(pre):
                return 'the definer is itself an argument of the command before it'
        if self.read_before:
            if READ_BEFORE.search(text[max(0, start - 40):start]):
                return 'the register is read by the command before it'
        if self.after is not None and not self.after.match(text, end):
            if self.read_before:
                return 'no number or kernel constant follows'
            return 'not followed by what a real definition needs'
        return None

    def matches(self, text, occurrences, cmd_len):
        r"""(start, end) of all changes found; OCCURRENCES are the start
        positions of \cmd in TEXT."""
        found = []
        if self.before is not None:
            for p in occurrences:
                m = self.before.search(text, max(0, p - self.WINDOW), p)
                if m and self.ok(text, m.start(), p + cmd_len):
                    found.append((m.start(), p + cmd_len))
        else:
            for m in self.pattern.finditer(text):
                if self.ok(text, m.start(), m.end()):
                    found.append((m.start(), m.end()))
        return found


def modification_rules(cmd, is_register):
    """All rules that detect a change of \\cmd."""
    nm = re.escape(cmd)
    rules = []
    if cmd not in CHAIN_COMMANDS:
        rules += [
            Rule('def', DEF_TEX + WS, after=AFTER_DEF, definer=True),
            Rule('let', LET_TEX + WS, after=AFTER_LET, definer=True),
            Rule('latex-def', DEF_LATEX + WS + r'\{?' + WS, definer=True),
            Rule('chain-def', CHAIN + DEF_TEX + XA, after=AFTER_DEF, definer=True),
            Rule('chain-let', CHAIN + LET_TEX + XA, after=AFTER_LET, definer=True),
            Rule('chain-latex-def', CHAIN + DEF_LATEX + XA + r'\{?' + XA,
                 definer=True),
        ]
    else:
        # \expandafter/\@xp themselves: only a plain definition that is not
        # part of a chain (\expandafter\def\expandafter\foo defines \foo)
        nochain = r'(?<!expandafter)(?<!@xp)(?<!expandafter )(?<!@xp )'
        rules += [
            Rule('def', nochain + DEF_TEX + WS, after=r'(?!\s*\\)' + AFTER_DEF,
                 definer=True),
            Rule('let', nochain + LET_TEX + WS, after=AFTER_LET, definer=True),
        ]
    rules.append(Rule('namedef', pattern=NAMEDEF.replace('NAME', nm)))
    if is_register:
        rules.append(Rule('assign',
                          pattern=ASSIGN.replace('CS', re.escape('\\' + cmd))))
        rules.append(Rule('bare-assign', before='', after=BARE_VALUE,
                          read_before=True))
        if cmd.startswith('c@'):
            rules.append(Rule('counter',
                              pattern=COUNTER.replace('NAME', re.escape(cmd[2:]))))
    return rules


# --- temporary changes -------------------------------------------------
def _depth_at(text, pos):
    t = text[:pos].replace('\\{', '').replace('\\}', '')
    return t.count('{') - t.count('}')


def temporary_only(text, cmd, positions):
    r"""True if every change of \cmd lies between a top-level save
    \let\S\cmd and a later restore \let\cmd\S (e.g., fp.sty silencing
    \message while loading). A permanent wrapper
    \let\S\cmd \def\cmd{...\S...} without restore is not temporary."""
    if not positions:
        return False
    cs = re.escape('\\' + cmd) + E
    for sv in re.finditer(r'\\let\s*(\\[A-Za-z@]+)\s*=?\s*' + cs, text):
        if _depth_at(text, sv.start()) != 0:
            continue
        saved = re.escape(sv.group(1)) + E
        for rs in re.finditer(PFX + r'\\let\s*' + cs + r'\s*=?\s*' + saved, text):
            if rs.start() < sv.end() or _depth_at(text, rs.start()) != 0:
                continue
            if all(sv.end() <= p < rs.start() or p == rs.start()
                   for p in positions):
                return True
    return False


# =====================================================================
# Sweep
# =====================================================================
STRIP_COMMENT = re.compile(r'(?<!\\)%.*')
PRESENT = re.compile(r'\\([A-Za-z@]+)')
PRESENT_BY_NAME = re.compile(
    r'(?:cmd/|csname\s*|namedef\s*\{|csdef\s*\{|cslet\s*\{)([A-Za-z@]+)')
PRESENT_COUNTER = re.compile(r'counter\s*\{\s*([A-Za-z@]+)')


def read_source(path):
    with open(path, encoding='latin-1') as fh:
        return '\n'.join(STRIP_COMMENT.sub('', l.rstrip('\n')) for l in fh)


# --- top-level changes -------------------------------------------------
# Wrappers whose argument is executed once, as if at top level. A change
# inside them still counts for commands in [toplevel_only].
ONCE_WRAPPER = re.compile(
    r'\\(?:AtBeginDocument|AtEndPreamble|AfterEndPreamble|AtEndOfPackage'
    r'|AtEndOfClass|ExplSyntaxOn'
    r'|AddToHook\s*\{[^{}]*\}(?:\s*\[[^\]]*\])?'
    r'|hook_gput_code:nnn\s*\{[^{}]*\}\s*\{[^{}]*\}'
    r'|g@addto@macro\s*\\@begindocumenthook'
    r'|(?:@ifpackageloaded|@ifclassloaded|IfPackageLoadedTF?|IfClassLoadedTF?'
    r'|IfFileExists|@ifpackagelater|IfPackageAtLeastTF?)'
    r'\s*\{[^{}]*\}(?:\s*\{[^{}]*\})?)\s*$')


def at_top_level(text, pos):
    """True if pos is outside any braces, apart from the argument braces
    of the wrappers in ONCE_WRAPPER. A plain group {...} counts as
    inside, since a change there is local too."""
    t = text[:pos].replace('\\{', '  ').replace('\\}', '  ')
    stack = []
    for i, ch in enumerate(t):
        if ch == '{':
            stack.append(i)
        elif ch == '}' and stack:
            stack.pop()
    return all(ONCE_WRAPPER.search(text[max(0, b - 120):b]) for b in stack)


def classify(text, cmd, rules, toplevel_only=False):
    """'modifier' or 'reader' for \\cmd in text, plus the changes found
    as (rule, start, end). With toplevel_only, changes inside other code
    (e.g. \\let\\label\\relax while typesetting a TOC entry) are ignored."""
    occ = [m.start() for m in re.finditer(re.escape('\\' + cmd) + E, text)]
    found = [(r, a, b) for r in rules for a, b in r.matches(text, occ, len(cmd) + 1)]
    if toplevel_only:
        found = [(r, a, b) for r, a, b in found if at_top_level(text, a)]
    if found and not temporary_only(text, cmd, [a for _, a, _ in found]):
        return 'modifier', found
    return 'reader', found


def package_name(path):
    base = os.path.basename(path)
    for ext in ('.sty', '.cls'):
        if base.endswith(ext):
            return base[:-len(ext)]
    return base


def iter_files(root, cfg):
    exclude = set(cfg['sweep']['exclude_dirs'])
    exts = tuple(cfg['sweep']['extensions'])
    ignore = [re.compile(p) for p in cfg['sweep'].get('ignore_files', [])]
    for dirpath, dirs, files in os.walk(root):
        top = os.path.relpath(dirpath, root).split(os.sep)[0]
        if top in exclude:
            dirs[:] = []
            continue
        dirs.sort()
        for f in sorted(files):
            if f.endswith(exts) and not any(p.search(f) for p in ignore):
                yield os.path.join(dirpath, f)


def sweep(root, commands, registers, cfg):
    rules = {c: modification_rules(c, c in registers) for c in commands}
    toponly = set(cfg.get('toplevel_only', {}).get('names', []))
    cmdset = set(commands)
    res = {c: {'modifiers': set(), 'readers': set()} for c in commands}
    for path in iter_files(root, cfg):
        try:
            text = read_source(path)
        except OSError:
            continue
        if '\\' not in text:
            continue
        present = set(PRESENT.findall(text)) | set(PRESENT_BY_NAME.findall(text))
        present |= {'c@' + n for n in PRESENT_COUNTER.findall(text)}
        name = package_name(path)
        for c in present & cmdset:
            kind, _ = classify(text, c, rules[c], c in toponly)
            res[c]['modifiers' if kind == 'modifier' else 'readers'].add(name)
    return res


def apply_overrides(res, cfg):
    """Manual corrections from config.toml."""
    for o in cfg.get('override', []):
        c, pkg, status = o['command'], o['package'], o['status']
        if c not in res:
            continue
        res[c]['modifiers'].discard(pkg)
        res[c]['readers'].discard(pkg)
        if status == 'modifier':
            res[c]['modifiers'].add(pkg)
        elif status == 'reader':
            res[c]['readers'].add(pkg)
        elif status != 'none':
            sys.exit(f'config: unknown status {status!r} for {c}/{pkg}')


# =====================================================================
# interface2.tex
# =====================================================================
ENV_BEGIN = re.compile(r'\\begin\{(function|variable|constant)\}(?:\[([^\]]*)\])?')
USAGE_LINE = re.compile(r'\\(modifiedby|setby|usedby|publicusedby)\b(?:\[([^\]]*)\])?')
USAGE_COMMANDS = ('modifiedby', 'setby', 'usedby', 'publicusedby')


def parse_entries(lines):
    entries = []
    i = 0
    while i < len(lines):
        m = ENV_BEGIN.match(lines[i])
        if m:
            env = m.group(1)
            j = i
            while not lines[j].startswith('\\end{%s}' % env):
                j += 1
            body = '\n'.join(lines[i:j + 1])[len(m.group(0)):]
            k = body.index('{')
            depth = 0
            for p in range(k, len(body)):
                depth += (body[p] == '{') - (body[p] == '}')
                if depth == 0:
                    break
            names = [n.strip().lstrip('\\')
                     for n in body[k + 1:p].replace('\n', ' ').split(',')
                     if n.strip()]
            opts = [o.strip() for o in (m.group(2) or '').split(',') if o.strip()]
            entries.append(dict(env=env, opts=opts, names=names, start=i, end=j))
            i = j
        i += 1
    return entries


def strip_usage(lines):
    """Remove existing usage lines; return remaining lines and the old
    lists as {cmd: {'modifiers': set, 'readers': set}} (for the report)."""
    owner = {}   # line index of \end{...} -> names of that entry
    for e in parse_entries(lines):
        owner[e['end']] = e['names']
    out, old = [], defaultdict(dict)
    names, i = [], 0
    while i < len(lines):
        if i in owner:
            names = owner[i]
        m = USAGE_LINE.match(lines[i])
        if not m:
            out.append(lines[i])
            i += 1
            continue
        depth, chunk = 0, []
        while True:
            chunk.append(lines[i])
            depth += lines[i].count('{') - lines[i].count('}')
            i += 1
            if depth <= 0:
                break
        text = ' '.join(chunk)
        items = text[text.index('{', m.end()) + 1:text.rindex('}')]
        cmd = m.group(2) or (names[0] if names else '?')
        kind = 'modifiers' if m.group(1) in ('modifiedby', 'setby') else 'readers'
        old[cmd][kind] = {x.strip().replace('\\_', '_')
                          for x in items.split(',') if x.strip()}
    return out, old


def format_list(command, items, opt):
    s = '\\%s%s{%s}' % (command, '[%s]' % opt if opt else '',
                        ', '.join(x.replace('_', '\\_') for x in items))
    lines, cur = [], ''
    for w in s.split(' '):
        if cur and len(cur) + 1 + len(w) > 72:
            lines.append(cur)
            cur = '  ' + w
        else:
            cur = cur + (' ' if cur else '') + w
    lines.append(cur)
    return lines


def written_lists(entry, res):
    """The lists written for an entry: [(name, list command, items, opt)]."""
    names = [n for n in entry['names'] if n in res]
    multi = len(entry['names']) > 1
    opts = entry['opts']
    # "Set by" for variables meant to be set, and for functions marked
    # [settable] (meant to be redefined, e.g. the \\...@elt list markers)
    settable = ((entry['env'] == 'variable' and 'readonly' not in opts)
                or 'settable' in opts)
    changed, used = [], []
    for n in names:
        opt = n if multi else None
        changed.append((n, 'setby' if settable else 'modifiedby',
                        sorted(res[n]['modifiers']), opt))
        if 'user' not in opts:
            used.append((n, 'usedby' if 'int' in opts else 'publicusedby',
                         sorted(res[n]['readers']), opt))
    return changed + used


def usage_lines(entry, res):
    return [line for _, cmd, items, opt in written_lists(entry, res)
            for line in format_list(cmd, items, opt)]


def sweepable(name):
    return re.fullmatch(r'[A-Za-z@]+', name) and name != 'foo'


# =====================================================================
# Source files (margin notes)
# =====================================================================
SRC_DEF = re.compile(
    r'(?:\\(?:global|long|protected)\s*)*\\(?:[gex]?def|let|(?:re)?newcommand\*?'
    r'|DeclareRobustCommand\*?|providecommand\*?|NewDocumentCommand'
    r'|DeclareTextCommand(?:Default)?|DeclareTextSymbol(?:Default)?'
    r'|DeclareTextAccent(?:Default)?|DeclareTextCompositeCommand'
    r'|DeclareMathSymbol|DeclareMathDelimiter|DeclareMathRadical'
    r'|DeclareMathAccent|DeclareSymbolFont\w*'
    r'|NewExpandableDocumentCommand|DeclareExpandableDocumentCommand'
    r'|DeclareDocumentCommand|newcount|newdimen|newskip|newbox|newtoks|newif'
    r'|chardef|mathchardef|countdef|dimendef|skipdef'
    r'|cs_new(?:_protected)?(?:_nopar)?:Np[nxe]|cs_new_eq:NN|cs_gset_eq:NN)'
    r'\s*\{?\s*\\([A-Za-z@]+|[^A-Za-z@\s])')
SRC_MACRO = re.compile(r'\\begin\{(?:macro|function|variable)\}(?:\[[^\]]*\])?\{([^}]*)\}')


def kernel_sources(cfg):
    """{command: dtx base name} for the kernel files. A `macro`
    environment documenting the command wins over a mere definition."""
    sc = cfg.get('sources', {})
    base = os.path.normpath(os.path.join(HERE, sc.get('dir', '../..')))
    files = []
    incl = os.path.join(base, sc.get('include_list', 'doc/source2e.tex'))
    if os.path.isfile(incl):
        with open(incl, encoding='utf-8') as fh:
            files = re.findall(r'^\s*\\DocInclude\{([^}]+)\}', fh.read(), re.M)
    files += sc.get('extra', [])
    documented, defined = {}, {}
    for f in files:
        path = os.path.join(base, f + '.dtx')
        if not os.path.isfile(path):
            continue
        with open(path, encoding='latin-1') as fh:
            text = fh.read()
        for m in SRC_MACRO.finditer(text):
            for n in m.group(1).split(','):
                documented.setdefault(n.strip().lstrip('\\'), f)
        for line in text.split('\n'):
            if not line.startswith('%'):
                for m in SRC_DEF.finditer(line):
                    defined.setdefault(m.group(1), f)
    return {**defined, **documented}


def entry_sources(entry, sources):
    files = []
    for n in entry['names']:
        # [TF] entries list the base name; the sources name \fooTF etc.
        f = next((sources[x] for x in (n, n + 'TF', n + 'T', n + 'F')
                  if x in sources), None)
        if f and f not in files:
            files.append(f)
    return files


# =====================================================================
# Tests
# =====================================================================
def run_tests(path, cfg):
    with open(path, 'rb') as fh:
        tests = tomllib.load(fh)['test']
    registers = set(cfg['registers']['names'])
    failed = 0
    for t in tests:
        text = '\n'.join(STRIP_COMMENT.sub('', l) for l in t['code'].split('\n'))
        cmd = t['command']
        is_reg = t.get('register', cmd in registers)
        toponly = t.get('toplevel_only', cmd in
                        cfg.get('toplevel_only', {}).get('names', []))
        kind, found = classify(text, cmd, modification_rules(cmd, is_reg), toponly)
        if not found and not re.search(re.escape('\\' + cmd) + E, text):
            kind = 'absent'
        ok = kind == t['expect']
        failed += not ok
        print(f"{'ok  ' if ok else 'FAIL'} {t['name']}: \\{cmd} -> {kind}"
              + ('' if ok else f" (expected {t['expect']})"))
    print(f'{len(tests) - failed}/{len(tests)} tests passed')
    return failed == 0


def explain(cmd, path, cfg):
    """Show every occurrence of \\cmd in a file and how it was judged."""
    if not os.path.isfile(path):   # allow plain names like caption3.sty
        found_path = subprocess.run(['kpsewhich', path], capture_output=True,
                                    text=True).stdout.strip()
        if not found_path:
            sys.exit(f'file not found: {path}')
        path = found_path
    text = read_source(path)
    registers = set(cfg['registers']['names'])
    rules = modification_rules(cmd, cmd in registers)
    toponly = cmd in cfg.get('toplevel_only', {}).get('names', [])
    kind, found = classify(text, cmd, rules, toponly)
    print(f'{path}: \\{cmd} -> {kind.upper()}')
    if toponly:
        print(f'  (\\{cmd} is in [toplevel_only]: changes inside other code are ignored)')
    occ = [m.start() for m in re.finditer(re.escape('\\' + cmd) + E, text)]
    end_len = len(cmd) + 1

    def where(a, b):
        line = text.count('\n', 0, a) + 1
        ctx = text[max(0, a - 35):b + 25].replace('\n', ' | ')
        return f'line {line:5}: {ctx}'

    uses = []
    for p in occ:
        verdict = None
        for r in rules:
            if r.before is None:
                continue
            m = r.before.search(text, max(0, p - r.WINDOW), p)
            if not m:
                continue
            why = r.diagnose(text, m.start(), p + end_len)
            if why is None:
                verdict = f'CHANGED (rule {r.name})'
                if toponly and not at_top_level(text, m.start()):
                    verdict = (f'local change (rule {r.name}) -- inside other'
                               ' code, ignored')
                break
            if r.name == 'bare-assign':   # matches every register use: no news
                continue
            verdict = f'used -- rule {r.name} looked like a change, but {why}'
        if verdict:
            print(f'  {verdict}\n      {where(p, p + end_len)}')
        else:
            uses.append(p)
    if uses:
        print(f'  plain uses: {len(uses)} (lines '
              + ', '.join(str(text.count('\n', 0, p) + 1) for p in uses[:15])
              + (', ...' if len(uses) > 15 else '') + ')')
    for r, a, b in found:
        if r.before is None:
            print(f'  CHANGED (rule {r.name})\n      {where(a, b)}')
    if not occ and not found:
        print(f'  \\{cmd} does not occur in this file (after removing comments)')
    if found and kind == 'reader':
        print('  -> all changes are temporary (saved with \\let and restored),'
              ' so the file counts as a user')


# =====================================================================
# Main
# =====================================================================
def default_texmf():
    try:
        d = subprocess.run(['kpsewhich', '-var-value', 'TEXMFDIST'],
                           capture_output=True, text=True).stdout.strip()
    except OSError:
        d = ''
    return os.path.join(d, 'tex', 'latex') if d else ''


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--config', default=os.path.join(HERE, 'config.toml'))
    ap.add_argument('--tests', default=os.path.join(HERE, 'tests.toml'))
    ap.add_argument('--file', default=os.path.join(HERE, '..', 'interface2.tex'))
    ap.add_argument('--texmf')
    ap.add_argument('--dry-run', action='store_true')
    ap.add_argument('--test', action='store_true')
    ap.add_argument('--explain', nargs=2, metavar=('CMD', 'FILE'))
    ap.add_argument('--only', nargs='+', metavar='CMD')
    args = ap.parse_args()

    with open(args.config, 'rb') as fh:
        cfg = tomllib.load(fh)

    if args.test:
        sys.exit(0 if run_tests(args.tests, cfg) else 1)
    if args.explain:
        explain(args.explain[0].lstrip('\\'), args.explain[1], cfg)
        return

    root = args.texmf or cfg['sweep'].get('texmf') or default_texmf()
    if not root or not os.path.isdir(root):
        sys.exit(f'TeX tree not found: {root!r} (use --texmf)')

    with open(args.file, encoding='utf-8') as fh:
        lines = fh.read().split('\n')
    lines = [l for l in lines if not l.startswith('\\sourcefile{')]
    lines, old = strip_usage(lines)
    entries = parse_entries(lines)
    commands = sorted({n for e in entries for n in e['names'] if sweepable(n)})
    if args.only:
        commands = [c.lstrip('\\') for c in args.only]
    registers = set(cfg['registers']['names'])
    unknown = registers - set(commands)
    if unknown and not args.only:
        print('note: registers not documented:', ' '.join(sorted(unknown)))

    print(f'sweeping {root} for {len(commands)} commands ...', file=sys.stderr)
    res = sweep(root, commands, registers, cfg)
    apply_overrides(res, cfg)

    # report changes against the previous lists
    changes = 0
    for e in entries:
        for n, cmd, items, _ in written_lists(e, res):
            kind = 'modifiers' if cmd in ('modifiedby', 'setby') else 'readers'
            before, now = old.get(n, {}).get(kind, set()), set(items)
            if before == now:
                continue
            changes += 1
            plus, minus = sorted(now - before), sorted(before - now)
            def show(sign, xs):
                if len(xs) > 10:
                    return f' {sign}{len(xs)} ({", ".join(xs[:5])}, ...)'
                return ''.join(f' {sign}{x}' for x in xs)
            print(f'\\{n} {cmd}:' + show('+', plus) + show('-', minus))
    print(f'{changes} lists changed', file=sys.stderr)

    if args.dry_run or args.only:
        return
    sources = kernel_sources(cfg)
    for e in reversed(entries):
        lines[e['end'] + 1:e['end'] + 1] = usage_lines(e, res)
        files = entry_sources(e, sources)
        if files:
            lines[e['start']:e['start']] = ['\\sourcefile{%s}' % ','.join(files)]
    with open(args.file, 'w', encoding='utf-8') as fh:
        fh.write('\n'.join(lines))
    print(f'updated {args.file}', file=sys.stderr)


if __name__ == '__main__':
    main()
