## Babel 3.22

This package manages culturally-determined typographical (and other)
rules, and hyphenation patterns for a wide range of languages.  Many
language styles work with pdflatex, as well as with xelatex and
lualatex out of the box.  A few even work with plain formats.

The latest stable version is available on <https://ctan.org/pkg/babel>.

Version 3.9a fixed lots of bugs and added some new features, intended
mainly to make it compatible somehow with Unicode engines. Some bugs
have not been fixed to avoid backward incompatibilities, but they have
been documented. Most of the new features (like package options) were
intended to overcome issues in previous releases without changing
significantly the behaviour of Babel.

Current development is focused on Unicode engines (XeTeX and LuaTeX).
New features related to font selection, bidi writing and the like will
be added incrementally. Versions numbers drop the letter and now 3.10,
3.11, etc., will be used instead. So, 3.9t is the last in the former
series.

Included is a set of ini files for about 200 languages.

Languages are not part of the Babel core any more; in particular, it
shall be no longer necessary to synchronize Babel core releases with
releases of Babel language files. See CONTRIB for further details
about contributing a language. You may also create an ini file or
improve the existing ones -- it's a trivial task (no programming
skills required at all), but don't hesitate to ask for help.

The best way to install and/or update it is with the help of package
managers.

Changes are described in babel.pdf with the label "New <version>". The
manual has been expanded to include some tips and tricks, but it will
be improved in next releases.

### Reporting Bugs

If you wish to report a problem or bug in any of these packages please
use the
[Issue Tracker for LaTeX2e on GitHub](https://github.com/latex3/latex2e/issues)
and follow the guidelines that pop up if you press the `New issue`
button.

In particular, to check that you are really seeing a bug, please write
a short, self-contained document that shows the problem. This should
include the `latexbug` package, which will warn if your test file is
not suitable for one or the other reason. See the
[CONTRIBUTING guide](https://github.com/latex3/latex2e/blob/master/CONTRIBUTING.md)
for further details, or if you need to obtain the `latexbug` package.

If the bug turns out to be with third-party software then please
contact the developer, and not us!

You may also report them to the author more informally on:

   http://www.texnia.com/contact.html

Bugs related to specific languages are best reported to their
respective authors.

### New

```
3.22   - Fix - Error with \chapter if empty in ini
       - Prelimimary support for Sanskrit
       - Unknown languages in aux files do not raise an error
         any more (only show a warning).
3.21   - Fix - equation numbers raised an error.
       - Two minor changes: if no language is requested load nil 
         instead of raising an error, and the message 'babel <x.x>...'
         is not printed to the log any more.
3.20   - ini files with the field digits.native define
         \<language>digits and \<language>counters. \arabic can be
         redefined to use native digits.
       - Fix - mapfont in bidi=basic didn't take into account combining
         marks (eg, Arabic vowels).
       - Fix - A bug introduced in 3.19, which sometimes reversed text 
         in \hbox'es.
       - Fix for luatex 1.07 - An internal change in luatex broke
         bidi at 'automatic' hyphens.
       - Fix for latest latex - babel.ins raised an error.
3.19   - Most changes are for luatex:
         . The main new feature is a bidi method for both implicit L in
           R text, and implicit R in L text, with the possibility of
           switching the font automatically. Still somewhat
           experimental, but it should work in most cases.
         . layout=extras for a couple of miscellaneous readjustments.
         . bidi equation numbers.
       - Also, for all engines, new field in some ini files:
         digits.native (to be used in future releases).
         
3.18   - More bidi in luatex: captions (required only in multilingual
         docs) and tabular (required for R tables). Also an experimental
         support for captions in xetex and pdftex (tabular is not yet
         supported).
       - New ini files: ar-DZ, ar-MA, ar-SY
       - Fix - \begin{hyphenrules} didn't work with polyglossia.
       - Fix - switch.def was loaded twice.
       
3.17   - A tool for bidi footnotes.
       - Fix - \ragged... didn't work for bidi.
       
3.16   - New package option layout for bidi documents.
       - Quotes in TU encoding
       - Fix - \<language>date did not work correctly
       - Fix - with some languages (eg, british), using
         \babelfont raised an error.

3.15  - New command \babelfont (in Unicode engines) to define
        language/script dependent fonts. Related to it, new
        keys (script, language) in \babelprovide.
      - A common mistake is to leave some space(s) in \captions<lang>,
        which go to the document. Now babel removes them.
      - Fix - Error with hyphenrules in \babelprovide in some cases.
      - Fix - \hyphenrules doesn't set \languagename any more (which
        was against the documented behavior),
	
3.14  - R text (Hebrew-like) and AL text (Arabic-like) in luatex, with
        "European" and "Arabic" numbers, mirroring and unmarked L text.
      - Fix - `import' ignored `hyphenrules' in ini files.

3.13  - Existing ldf files takes priority over declared options with
        \DeclareOption (except hebrew).
      - With a few exceptions, ini files have reached version 1.0.
      - New key `import' for \babelprovide, which also defines dates. 
```

Javier Bezos
2018/06/05

