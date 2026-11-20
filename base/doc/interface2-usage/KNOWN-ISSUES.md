# Known flaws of the detection rules (update-usage.py)

These are limits of the static rules that we know of and have decided
to live with for now. Recorded 2026-11-21. For each fix, add a test case
to `tests.toml` and look at the `--dry-run` report.
Single cases can always be fixed by an `[[override]]` in `config.toml`.

## Missed changes (false negatives)

1. **Register set from another register.** In `\topsep\topsepi`, memoir
   line 4721, the assignment counts as a use. A bare assignment is only
   recognised when a number or kernel constant (`\z@`, `\@ne`, …)
   follows. Reason: `\vskip\topsep` and `\topsep\topsepi` look the same
   to a static rule.
   *Possible rule:* treat `\reg\otherreg` as an assignment when it
   starts a statement (after `{`, at the start of a line, or after
   `\relax`), unless a reading command comes before it.

2. **Definitions through constructed names** are only recognised in the
   forms `\expandafter\def\csname X\endcsname`, `\@namedef{X}`,
   `\csdef{X}`, `\cslet{X}` and `\AddToHook{cmd/X/…}`. Not recognised:
   - names built from pieces (`\csname @al\the…\endcsname`);
   - `\@namedef` with an expanded argument;
   - `\cs_set:cpn {X}`, the expl3 `c` variants;
   - `\let` forms with `\csname` on the right-hand side are fine, but
     with `\csname` on the left only via `\expandafter`.

3. **Only `tex/latex` is searched.** Files under `tex/generic` (e.g.
   packages used by LaTeX via `\input`) are not searched.

4. **Changes hidden behind wrappers.** For example, a package-specific
   `\my@def\X{…}` that internally does `\def`, or `\AtBeginDocument{…}`
   containing a definition done via token list manipulation.

5. **expl3 code** is only searched for the definers listed in
   `DEF_LATEX` (`\cs_set:Npn` and friends, `\tl_set:N…`). Other ways of
   changing a command, e.g. `\cs_gset_eq:cN` or `\tl_put_right:cn`, are
   missed.

## Wrong changes (false positives)

6. **Local redefinitions inside a group** are reported as changes. For
   example, hyperref's `\let\edef\HyPsd@DefCommand` inside
   `\pdfstringdef`, tabu's `\let\def\@empty` while measuring, and
   language files that switch `\@alph` only while a language is active.
   *Decision (2026-11-21):* keep them listed for now. A static rule
   can't reliably tell a local from a global change; look at them when
   reviewing the data.
   *Partial fix (2026-11-20):* commands listed in `[toplevel_only]` in
   `config.toml` (`\label`, `\index`, `\glossary`) only count changes
   at the top level of a file (or inside `\AtBeginDocument`,
   `\AddToHook`, `\@ifpackageloaded`, … which run once). Brace counting
   is approximate (see item 12). Add commands there when packages
   legitimately switch them off locally.

7. **`:` as a letter.** In expl3 regime and some packages (e.g.
   AlProTex: `\futurelet\let:val`), `:` is a letter, so `\let:val` is a
   different command. Only `_` is treated as a letter (end of name);
   `:` isn't, because `\def\foo:` is a common delimiter. Handled by an
   override for AlProTex.

8. **Conditional definitions** like `\ifx\X\undefined \def\X…\fi` or
   `\@ifundefined{X}{\def\X…}{}` count as changes, although they only
   define `\X` if it doesn't exist (like `\providecommand`, which *is*
   excluded).

9. **LaTeX-style definers used as arguments.** For TeX's `\def` and
   `\let` a candidate is rejected unless a parameter text and `{` (or
   a token) follow. The LaTeX definers (`\renewcommand`,
   `\patchcmd`, …) have no such check, so e.g. `\@ifstar\renewcommand…`
   passed as an argument would still count.

10. **Commands taking definers as arguments** are only recognised for a
    fixed list (`\let`, `\ifx`, `\noexpand`, `\string`, `\meaning`, …;
    see `ARG_BEFORE`). Other cases are caught only by the check of what
    follows (item 9 for LaTeX definers).

11. **Catcode tricks.** Comments are stripped with a plain `%` rule.
    Files that make `%` active or change catcodes otherwise (e.g.
    aastex: `\catcode`\%\active \let%…`) can be misread.

## Temporary changes (save/restore rule)

12. **Brace depth is approximate.** The rule only accepts a save
    `\let\S\X` at brace depth 0. The depth is computed by counting `{`
    and `}`, which is fooled by catcode changes and by braces in
    `\catcode`\{` and the like. In practice some saves/restores inside
    macro bodies are accepted too (e.g. hardwrap, arabtex-granada),
    which Frank considered fine.

13. **Restore by group end** is not recognised. A change made inside
    `\begingroup…\endgroup` counts as permanent (see item 6).

14. **Other save forms** like `\NewCommandCopy\S\X` or
    `\cs_set_eq:NN \S \X` with a later restore are not recognised as
    temporary.

## Package naming

15. **Lists use the file name**, so different files with the same name
    in different directories are merged. Dated rollback copies
    (`glossaries-2020-03-19`, `caption3_2019-09-01`, …) appear as
    separate packages. They could be dropped with `ignore_files` in
    `config.toml`, if wanted.

16. **`.tex` files under `tex/latex`** include examples and
    documentation-like files (e.g. `PfC*.tex`). They are listed like
    packages.

## Usage of `--explain`

17. **The bare-assignment rule** matches every occurrence of a register.
    `--explain` therefore doesn't print a "looked like a change"
    remark for it when no value follows; those occurrences are counted
    as plain uses.
