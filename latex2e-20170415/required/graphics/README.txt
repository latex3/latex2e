%%
%% Copyright 1993-2017 LaTeX Project
%%
%% This file is part of the Standard LaTeX `Graphics Bundle'.
%%
%% This file, and all the other files in this bundle as listed below,
%% may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.3c or, at your option, any later version.
%%
%% The latest version of this license is in
%%
%%   http://www.latex-project.org/lppl.txt
%%
%% and version 1.3c or later is part of all distributions of LaTeX 
%% version 2005/12/01 or later.


The LaTeX Colour and Graphics Packages
========================================
             

This is a collection of LaTeX packages for:
 * producing colour
 * including graphics (eg PostScript) files 
 * rotation and scaling of text
in LaTeX documents.

=======================================================================


THIS DIRECTORY CONTAINS 
======================

README          This File
changes.txt     Log of changes to the packages.
graphics.ins    Install file for docstrip.

Standard packages
=================
color.dtx       Source for color package
graphics.dtx    Source for graphics package
trig.dtx        Source for trig package (required by graphics)

Non Standard Packages
=====================
graphicx.dtx    Source for graphicx package (extension of graphics)
epsfig.dtx      Source for epsfig package (extension of graphicx)
rotating.dtx    Source for rotating package (extension of graphicx)
keyval.dtx      Source for keyval pacakge (required by both the above)
lscape.sty      Produce landscape pages in a (mainly) portrait document.

Driver Files
============
drivers.dtx     Source for driver files for supported drivers.

User Documentation
==================
grfguide.tex    User Guide to all the packages in this bundle.
                WARNING: 
                This file calls color and graphics packages
                without a driver option. 
                You *must* set up two files 
                                 color.cfg and graphics.cfg
                containing (for example)
                                \ExecuteOptions{dvips}
                Before running this file.

rotex.tex       examples of use of rotating package.

=============================================

TO UNPACK THE PACKAGES
======================

latex graphics.ins

This will produce the 

.sty package files

Similarly you can run

latex graphics-drivers.ins

to produce the

.def driver files.

Not all supported drivers are included in this file as they are
maintained elsewhere.

=============================================

USING THE PACKAGES
==================

Move files ending in .sty .def  to a standard TeX input directory.

Make a default option for your site by creating two files
     color.cfg and graphics.cfg
containing (if dvips is your default driver)
\ExecuteOptions{dvips}

You may then LaTeX the user guide:
latex grfguide.tex.

==============================================




