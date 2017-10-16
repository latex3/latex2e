# The LaTeX2e Kernel Code Repository

## Overview

This repository hosts development of the core LaTeX distribution, which
comprises:

- The LaTeX kernel itself (`base`)
- LaTeX team documentation (`doc`)
- Packages which must be available (`required`). These are
  - Essential tools (`tools`)
  - Core graphics and color support (`graphics`)
  - Support for multiple languages (`babel`)
  - Key mathematics support (`amsmath`)

The master public Git repository is hosted on
[Github](https://github.com/latex3/latex2e).

## Issues

Only issues *specifically related to these components* should be logged here
(https://github.com/latex3/latex2e/issues). The LaTeX ecosystem is large, and
there are *many* (thousands) of additional packages not maintained by us:
issues related to the use of those need to be reported to the relevant
maintainers.

To help you making the right decision where to report an issue we ask to start
your minimal example file showing the problem *always* with

    \RequirePackage{latexbug}

More details on creating issue reports for the core LaTeX distribution
are given in our CONTRIBUTING guide.

## Support

We are unable to provide advice/support here: community sites such as
[TeX-LaTeX StackExchange](http://tex.stackexchange.com) and [The LaTeX
Community](http://latex-community.org) are available for general help. See also
https://www.latex-project.org/help for further suggestions.

## Code fixes

Changes to the core LaTeX distribution have to be approached bearing in mind
the importance of maintaining stability. This means that all changes have to be
carefully weighed up, balancing the issues addressed by a change with
the effects on existing documents. We strongly suggest raising suggestions on
the [LaTeX-L mailing
list](https://listserv.uni-heidelberg.de/cgi-bin/wa?A0=latex-l) early.

You can subscribe to the LaTeX-L mailing list by sending mail to

    listserv@urz.uni-heidelberg.de

with the body containing

    subscribe LATEX-L <Your-First-Name> <Your-Second-Name>

## Development team

The LaTeX kernel is developed by [The LaTeX3 Project](https://latex-project.org).

## Copyright

This README file is copyright 2017 The LaTeX3 Project.
