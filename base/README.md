The LaTeX kernel
================

Release 2020-02-02 patch level 5

Overview
--------

This bundle provides the core LaTeX kernel. In addition to this bundle,
a minimal LaTeX system also needs the files contained in the

- LaTeX team documentation (`doc`)
- Packages which must be available (`required`). These are
  - Essential tools (`tools`)
  - Core graphics and color support (`graphics`)
  - Key mathematics support (`amsmath`)

This file contains a small set of pointers to other more complete
documentation on installing and using a LaTeX system.

Documentation
-------------

Full documentation of the LaTeX system is provided by

- _LaTeX: A Document Preparation System_; Lamport, Addison-Wesley
- _The LaTeX Companion_, 2ed; Mittelbach and Goossens with Braams, Carlisle
  and Rowley, Addison-Wesley
- _Guide to LaTeX_, 4ed; Kopka and Daly, Addison-Wesley

The distribution is described in files ending `.txt` or `.md`; briefly,
the most significant of these files are

- `README.md` is this file
- `manifest.txt` lists all the files in this LaTeX distribution,
   with one line of information about the contents
- `unpacked.txt` lists all the files in the unpacked LaTeX distribution
- `legal.txt` and `lppl.txt` (LaTeX Project Public License) describe the
   LaTeX copyright, warranty and copying restrictions.
- `patches.txt` describes the how important changes will be distributed
   between releases
- `texpert.txt` contains information about the system that may still be
   useful for TeX experts
- `tex2.txt` contains important information for users of extremely
   old versions of TeX (pre 1990)
- `autoload.txt` describes a variant of LaTeX that is no longer supported
- `bugs.txt` describes how to submit a bug report for LaTeX

Other documentation files include files with names of the form:

   <xxx>guide.tex

You will probably need to update your system before you can typeset
these files.  Each file needs three LaTeX runs.  Some of these are
also available as PDF files on [CTAN](https://www.ctan.org).

The following files contain further information:

- `ltx3info.tex` gives you some historical information about the LaTeX3
   project
- `manual.err` lists errata in _LaTeX: A Document Preparation System_ (Lamport)
- `tlc2.err` lists errata in _The LaTeX Companion_ (Mittelbach et al.)

The files `ltnews*.tex` (part of the `doc` bundle) contain the LaTeX
newsletters, the highest number being the most recent.

For historical reasons, the base distribution and the core documentation
are bundled separately. Documentation is found in the `doc` bundle. In an
installed TeX system, `base` and `doc` should be placed within the same
location; the distinction is therefore primarily of importance when looking
at the development code.

Installation
------------

We no longer distribute installation instructions for the various TeX
implementations. All modern TeX systems include LaTeX as-standard, and end
users should in general use the release versions supplied in this way.

Release distribution is carried out only through the CTAN archives.

Requirements
------------

The LaTeX kernel requires the e-TeX extensions to TeX, which were finalised
in the late 1990s and are available in modern TeX-derived engines. Some new
features require `\ifincsname`, which is currently available in release
versions of pdfTeX, XeTeX and LuaTeX, and is being introduced shortly in
e-pTeX and e-upTeX.

License
-------

The contents of this bundle are distributed under the [LaTeX Project
Public License](https://www.latex-project.org/lppl/lppl-1-3c/),
version 1.3c or later.

-----

<p>Copyright (C) 1989-2020 The LaTeX Project <br />
<a href="http://latex-project.org/">http://latex-project.org/</a> <br />
All rights reserved.</p>
