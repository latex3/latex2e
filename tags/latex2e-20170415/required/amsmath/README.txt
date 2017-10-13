README for latex-amsmath bundle
American Mathematical Society, LaTeX3 Project

Copyright 2001-2004, 2007, 2008, 2010, 2011, 2013 American Mathematical Society.
Copyright 2016-2017 LaTeX3 Project and American Mathematical Society.

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

Version 2.17
Fixes a bug in the spacing around the closing delimiter in generalised
fractions in xetex and luatex version added in release 2.16.
Fixes a bug that overfull lines did not always produce warnings.


========================================================================
V. CHANGE LOG

The file changes.txt lists recent changes in reverse chronological order.

The file diffs-m.txt contains information on development and changes
prior to 2000.

[end]
