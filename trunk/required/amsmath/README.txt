README for latex-amsmath bundle [2017/04/14]
           American Mathematical Society, LaTeX3 Project

Copyright 2001-2004, 2007, 2008, 2010, 2011, 2013 American Mathematical Society.
Copyright 2016 LaTeX3 Project and American Mathematical Society.

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3c
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3c or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status `maintained'.

The Current Maintainer of this work is the LaTeX3 Project.


                               CONTENTS
I.   OVERVIEW
II.  INSTALLATION AND GETTING STARTED
III. SUBMITTING BUG REPORTS
IV.  REMARKS ON THIS RELEASE
V.   CHANGE LOG

========================================================================
I. OVERVIEW

The amsmath package is an extension package for LaTeX that provides
additional features to facilitate mathematical typesetting. It has been
developed by the American Mathematical Society and released for general
use as a service to the mathematical community. A number of smaller
auxiliary packages are also distributed with the amsmath package.

Effective in 2016, maintenance of amsmath was transferred from AMS to
the LaTeX3 Project; as amsmath is considered a "required" package, this
centralizes control over the core LaTeX components.

========================================================================
II. INSTALLATION AND GETTING STARTED

In order to use amsmath you need to have TeX installed first.
For information on getting TeX see one of the following:

    http://www.tug.org/
    http://www.ams.org/tex/tex-resources

It is recommended to install a comprehensive distribution, such as
TeX Live, MiKTeX for Windows, or MacTeX for Macintosh.
As part of the "required" LaTeX package subset, amsmath
will already be available if one of these distributions is chosen,

If you are installing amsmath manually, the most recent version
will be available from the CTAN archives
https://www.ctan.org/pkg/amsmath


The primary documentation for amsmath is in

    amsldoc.pdf

Additional documentation files include:

    diffs-m.txt
    subeqn.pdf
    technote.pdf
    testmath.pdf

which are included in the collection.  All of these can be accessed
easily with most distributions by entering "texdoc filename" at the
command line, or via "TeXdoc Online" at http://texdoc.net .

========================================================================
III. SUBMITTING BUG REPORTS

Bug reports should be submitted using the standard LaTeX bug reporting
system:

See the form at

http://www.latex-project.org/bugs/

and follow the resulting instructions. Select "amslatex" when asked
for a category.

Questions regarding usage can be posted at http://tex.stackexchange.com .
Check first to see whether your question has already been answered.

========================================================================
IV. REMARKS ON THIS RELEASE

Version 2.16 adds some control over spacing around aligned/gathered and
adjustments to the generalized fraction code so that it works in xetex.

========================================================================
V. CHANGE LOG (REVERSE CHRONOLOGICAL ORDER)


2017-04-14  David Carlisle  <latex-bugs@latex-project.org>

	* amscd.dtx: typo fix in ProvidesPackage line.

2016-11-05 amsmath.dtx 2.16a
     alignedleftspace[yes|no|yesifneg] package options
     New genfrac implementation for XeTeX and LuaTeX
     Delete obsolete install.txt file.
     
     
2016-06-28 amsmath.dtx 2.15d
     avoid error on \dots \left ....

2016-05-26 amsmath.dtx 2.15c
     ignore spaces at start of \intertext

2016-03-10 amsmath.dtx 2.15b
     Preserve box0 in \resetMathstrut@
     In xetex, and luatex, add version of \newmcodes@
	that works even if - has a \Umathcode definition.

2016-03-03 amsmath.dtx 2.15a
     One missing % added to mathstrut handling.


2016-02-20 amsmath.dtx 2.15
     Updates for new \mathchardef handling in luatex
     Fix for \long macros after \dots
     (such as \iff as redefined by this package)

2013-01-14 amsmath.dtx 2.14

    * amsmath.sty 2.14
      -- Minimal changes to make amsmath compatible with stix.sty.

2000-07-18 amsmath.dtx 2.13
    -- After the numbering patches in 2.11, \notag failed in certain
       circumstances: introduce some more auxiliary functions to sort
       things out, and redefine \nonumber.

2000-06-29 amstext.dtx 2.01
    -- Use \f@size instead of \tf@size because they are not
       necessarily the same and the former is better for putting a few
       words into a display.

2000-06-06 amsmath.dtx 2.12
    -- Fix transposed lines in 2.11 patch.

2000-06-02 amsmath.dtx 2.11

    * amsmath.sty 2.11
      -- Prevent "Arithmetic overflow" error by guarding against
         divide-by-zero in \x@calc@shift@lc (align environment).

    * amsdtx.dtx
      -- Moved to the amscls distribution.

2000-05-25 amsmath.dtx 2.10
    -- Clear up error message for \allowdisplaybreaks[0].
    -- Make mathdisplay re-entrant by introducing mathdisplay@stack,
       to clear up numbering problems in unusual circumstances such as
       \[ \] nested inside minipage inside equation.

2000-04-21 amsmath.dtx 2.09
    -- Ensure good catcodes for " etc.

2000-03-16 amsmath.dtx 2.08
    -- Fixed erroneous tag placement on split with fleqn/tbtags options.

2000-03-15 amsmath.dtx 2.07
    -- Add \reset@strutbox@ to deal with the following bug: After
       $...\mbox{\Huge $...$}...$, line spacing is wrong in a
       following "gather" or other environment that uses \strut@.
    -- Patch to fix bug with intlimits option: too much space in the
       middle of \iint.
    -- Overhaul math accents again to fix a couple of bugs reported by
       Thimm.

2000-03-10 amsmath.dtx 2.06
    -- Change \MathAccent to \mathaccentV so \DeclareMathAccent won't
       give an error when redefining an accent.

2000-01-06 amsmath.dtx 2.05
    -- Fixed incorrect placement of fleqn/reqno equation numbers
       inside indented lists (displaywidth < columnwidth). Changed the
       multline/fleqn/leqno indent to match mathmargin when possible
       instead of always just using multlinetaggap.

The file diffs-m.txt contains information on development and changes
prior to 2000.

[end]
