## README for the  Standard LaTeX `Graphics` bundle

This bundle consists of LaTeX2e packages written and supported by
members of the LaTeX3 Project Team.

It is a collection of LaTeX packages for:
- producing colour
- including graphics (eg PostScript) files 
- rotation and scaling of text
in LaTeX documents.



### THIS DIRECTORY CONTAINS 

#### Support files 

| File           | Notes                          |
| ---            | ---                            |
| README.md      | This file                      |
| changes.txt    | Log of changes to the packages |
| graphics.ins   | Install file for docstrip      |

#### Basic packages

| File           | Notes                                          |
| ---            | ---                                            |
| color.dtx      | Source for color package                       |
| graphics.dtx   | Source for graphics package                    |
| trig.dtx       | Source for trig package (required by graphics) |

#### Extension Packages

| File           | Notes |
| ---            |  ---  |
| graphicx.dtx   | Source for graphicx package (extension of graphics)     |
| epsfig.dtx     | Source for epsfig package (extension of graphicx).      |
| rotating.dtx   | Source for rotating package (extension of graphicx).    |
| keyval.dtx     | Source for keyval pacakge (required by both the above)  |
| lscape.sty     | Produce landscape pages in a (mainly) portrait document |

#### Driver Files

| File           | Notes                                         |
| ---            |  ---                                          |
| drivers.dtx    | Source for driver files for supported drivers |

#### User Documentation

| File           | Notes                                         |
| ---            |  ---                                          |
| grfguide.tex   | User Guide to all the packages in this bundle |
|                | **WARNING:** *This file calls color and graphics packages without a driver option.  You **must** therefore set up two files `color.cfg` and `graphics.cfg` containing (for example) `\ExecuteOptions{dvips}` before running this file.* |
| rotex.tex      | Examples of use of rotating package           |



### TO UNPACK THE PACKAGES

     latex graphics.ins

This will produce the `.sty` package files.

Similarly you can run

     latex graphics-drivers.ins

to produce the `.def` driver files.

Not all supported drivers are included in this file as they are
maintained elsewhere.


### USING THE PACKAGES

Move files ending in `.sty` or  `.def`  to a standard TeX input directory.

Make a default option for your site by creating two files `color.cfg` and `graphics.cfg`
containing (if dvips is your default driver)
     \ExecuteOptions{dvips}

You may then LaTeX the user guide by running:

     latex grfguide.tex



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

The list of all files belonging to this bundle is listed above.

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

