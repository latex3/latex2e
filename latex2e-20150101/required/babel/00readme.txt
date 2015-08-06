                       Babel Distribution Guide

                             17 March 2008


Welcome to the Babel system!

This file contains the distribution guide for version 3.8 of the
Babel system. The Babel system is distributed under the terms of 
the LaTeX Project Public License version 1.3 or later. A copy of 
the LPPL can be found in the LaTeX distribution.

The Babel system supports multilingual typesetting.
This version of the Babel system is compatible with LaTeX2e.
Whenever the instructions talk about LaTeX, read LaTeX2e.

This system is maintained by Johannes Braams in cooperation with
various people around the world.

The Babel system is described in:

 * The LaTeX Companion 2nd edn., Mittelbach and Goossens et al, Addison-Wesley


This distribution is described in the files ending with .txt.  You
should read install.txt before starting to install Babel.

 * 00readme.txt is this file.

 * changes.txt is a chronological list of the changes to babel

 * install.txt describes how to install Babel.
 * install.OzTeX-4 describes how to install Babel on a Mac with a
                   recent OzTeX distribution (4.0+).
 * install.OzTeX-pre4 describes how to install Babel on a Mac with an
                     old OzTeX distribution (before 4.0).

 * manifest.bbl lists all the files in the Babel distribution.

 * bugs.txt describes how to submit a bug report for Babel.

 * todo.txt lists a few things that haven't been done yet

 * howtoget.txt lists the places where to get the Babel system and
                other related software.

You are not allowed to change the files in this distribution.

If you want to add your own options to extend Babel with local
language definitions you can do that by adding \DeclareOption 
statements to a configuration file, bblopt.cfg.

If you like the babel system, please send me a postcard with a nice
postage stamp for my collection!

Please do not request updates from me.  Distribution is done only
through mail servers and TeX organisations.


Please send bug reports to the LaTeX bug reporting address, 
latex-bugs@latex-project.org. Please read the file bugs.txt in this
distribution and follow the guidelines.

WARNINGS:
---------
- The file wnhyphen.tex (russian hyphenation pattern file) contains
  changes of uppercase and lowercase codes. Amongst these is
  \uccode`\~=`\^ which may lead to unexpected results when the ~
  occurs in the argument of \uppercase

Send any suggestions, additions, complaints, to me:
e-mail:  babel at braams.xs4all.nl
address: Kersengaarde 33
         2723 BP Zoetermeer
         The Netherlands
Note that I am more likely to respond to e-mail.
--- Copyright 1997,2008 Johannes Braams.  All rights reserved ---
