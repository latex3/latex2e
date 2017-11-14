## README for the `tools` bundle


This bundle consists of LaTeX2e packages written and supported by
members of the LaTeX3 Project Team.

The documented source code of each package is in a file with extension
`.dtx`.  Running LaTeX on the file `tools.ins` will produce all the
package files, and some associated files.

So you should first process `tools.ins`:

    latex tools.ins

The files with extensions `.sty` and `.tex` (including a file whose
name is just `.tex`) should then be moved to a directory on LaTeX's
standard input path.

Documentation for the individual packages may then be obtained by
running LaTeX on the `.dtx` files.

For example:

    latex array.dtx

will produce the file `array.pdf`, documenting the array package.


The file `manifest.txt` contains a list of the main files in the
distribution together with a one-or-two line summary of each package.


### Copyright

Copyright is maintained on each of these packages by the author(s)
of the package. 


### Distribution Conditions

All the files in this bundle may be distributed under the conditions
of the LaTeX Project Public License, either version 1.3c of this
license or (at your option) any later version.  The latest version of
this license is in
    https://www.latex-project.org/lppl.txt
and version 1.3c or later is part of all distributions of LaTeX 
version 2005/12/01 or later.

The list of all files belonging to the Tools Bundle is
given in the file `manifest.txt`.

Commercial users of the `multicol` package are asked to read the
notice at the head of the file multicol.dtx.

The use of these files is otherwise unrestricted.


### Reporting Bugs

If you wish to report a problem or bug in any of these packages
please use the 
[Issue Tracker for LaTeX2e on GitHub](https://github.com/latex3/latex2e/issues)
and follow the guidelines that pop up if you press the `New issue` button.


In particular, to check that you are really seeing a bug, please write
a short, self-contained document that shows the problem. This should
include the `latexbug` package, which will warn if your test file is
not suitable for one or the other reason. See the [CONTRIBUTING
guide](https://github.com/latex3/latex2e/blob/master/CONTRIBUTING.md)
for further details, or if you need to obtain the `latexbug` package.

If the bug turns out to be with third-party software then please
contact the developer, and not us!



### Copyright

This README file is copyright 1993-2017 The LaTeX3 Project.

