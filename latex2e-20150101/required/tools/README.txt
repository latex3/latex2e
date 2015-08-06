
%
% Copyright 1993-2015
% The LaTeX3 Project and any individual authors listed elsewhere
% in this file. 
% 
% This file is part of the Standard LaTeX `Tools Bundle'.
% -------------------------------------------------------
% 
% It may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3c
% of this license or (at your option) any later version.
% The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX 
% version 2005/12/01 or later.
% 
% The list of all files belonging to the LaTeX `Tools Bundle' is
% given in the file `manifest.txt'.
% 


README for the `tools' bundle  (December 1999)
=============================

This `bundle' consists of LaTeX2e packages written and supported by
members of the LaTeX3 Project Team.

The documented source code of each package is in a file with extension
`.dtx'.  Running LaTeX on the file tools.ins will produce all the
package files, and some associated files.

So you should first process tools.ins:

  latex tools.ins

The files with extensions `.sty' and `.tex' (including a file whose
name is just `.tex') should then be moved to a directory on LaTeX's
standard input path.

See the Note at the end of this file if you have problems processing
the tools.ins file.

Documentation for the individual packages may then be obtained by
running LaTeX on the `.dtx' files.

For example:

  latex array.dtx

will produce the file array.dvi, documenting the array package.


The file manifest.txt contains a list of the main files in the
distribution together with a one-or-two line summary of each package.


Copyright
=========
Copyright is maintained on each of these packages by the author(s)
of the package. 


Distribution Conditions
=======================

All the files in this bundle may be distributed under the conditions
of the LaTeX Project Public License, either version 1.1 of this
license or (at your option) any later version.  The latest version of
this license is in
   http://www.latex-project.org/lppl.txt
and version 1.1 or later is part of all distributions of LaTeX 
version 1999/06/01 or later.

The list of all files belonging to the `Tools Bundle' is
given in the file `manifest.txt'.

Commercial users of the multicol package are asked to read the
notice at the head of the file multicol.dtx.

The use of these files is otherwise unrestricted.


Reporting Bugs
==============

If you wish to report a problem or bug in any of these packages, use
the latexbug.tex program that comes with the standard LaTeX
distribution.  Please ensure that you enter `tools' category when
prompted with a menu of categories, so that the message will be
automatically forwarded to the appropriate part of our database.

When reporting bugs, please produce a small test file that shows the
problem, and ensure that you are using the current version of the
package, and of the base LaTeX software.


