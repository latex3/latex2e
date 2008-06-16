README for the `cyrillic' bundle  (June 2001)
=============================

This `bundle' consists of LaTeX2e packages for Cyrillic languages
supported by the LaTeX3 Project Team.

Running LaTeX on the file cyrlatex.ins will produce all the package
files, and some associated files.

So you should first process cyrlatex.ins:

  latex cyrlatex.ins

The files with extensions `.def', `.fd', `.sty' and `.tex' should
then be moved to a directory on LaTeX's standard input path.

NOTE that this bundle must be used with at least the December 1998
LaTeX2e Release. In particular, this prevents an error because of the
old version of docstrip.tex (see the file readme.txt from the `tools'
bundle).

The documented source code of each component may then be obtained by
running LaTeX on a files with extensions `.dtx' and `.fdd'.

For example:

  latex cyoutenc.dtx

will produce the file cyoutenc.dvi, documenting the output encodings
source code.

The file manifest.txt contains a list of the main files in the
distribution together with a one-or-two line summary of each file.


Reporting Bugs
==============

If you wish to report a problem or bug in any of these packages, use
the latexbug.tex program that comes with the standard LaTeX
distribution.  Please ensure that you select the `cyrillic' category
when prompted with a menu of categories, so that the message will be
automatically forwarded to the appropriate supporters and the correct
part of our database.

Please also use this category if you are unable to reproduce a bug in
some other part of LaTeX without using these packages.

When reporting bugs, please produce a small test file that shows the
problem, and ensure that you are using the current version of the
package, and of the base LaTeX software.


Distribution Conditions
=======================

All the files in this bundle are distributed under the terms of
the LaTeX Project Public License (LPPL) as found in the base
LaTeX distribution,  CTAN:macros/latex/base/lppl.txt;
either version 1 of the license, or (at your option) any later
version.

--- Copyright 2005 the LaTeX3 project.  All rights reserved ---
