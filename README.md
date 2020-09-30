# The LaTeX2e Kernel Code Repository

## Overview

> **Important notice:** This repository holds the unpackaged sources
> of LaTeX2e as well as code under development in various
> branches. For this reason it is only of interest to a small number
> of developers in this form and building a working version from the
> sources is a non-trivial exercise.
>
> The normal way to obtain LaTeX is therefore not to get it from this
> repository, but through the packaged version available from
> https://ctan.org and automatically distributed as part of major TeX
> distributions such as TeXLive, MacTeX or MiKTeX.


This repository hosts development of the core LaTeX distribution, which
comprises:

- The LaTeX kernel itself (`base`)
- LaTeX team documentation (`doc`)
- Packages which must be available (`required`). These are
  - Essential tools (`tools`)
  - Core graphics and color support (`graphics`)
  - Key mathematics support (`amsmath`)

The master public Git repository is hosted on
[GitHub](https://github.com/latex3/latex2e).

Note that Babel moved to its own repository in 2019:
[GitHub](https://github.com/latex3/babel); any issues related to Babel should
be reported there.

## LaTeX Version number

The LaTeX version is defined in the file `ltvers.dtx` in the two commands
`\fmtversion`  (the main version) and `\patch@level` (the patch level).
A negative patch level indicates a pretest version.

Each component of the core distribution contains a `README` file which
is tagged with the appropriate release string prior to upload to CTAN.

## Issues

Only issues *specifically related to these components* should be logged [with
the team on GitHub](https://github.com/latex3/latex2e/issues). The LaTeX
ecosystem is large, and there are *many* (thousands) of additional packages not
maintained by us: issues related to the use of those need to be reported to the
relevant maintainers because we are usually unable to help in that case.

To help you making the right decision where to report an issue we ask to start
your minimal example file showing the problem *always* with

    \RequirePackage{latexbug}

> Please look at the report generated from `latexbug` and if it
> indicates that you are using packages not maintained by the LaTeX
> Project check if your problem is still present after removing
> them. If so contact the maintainers of these third-party packages
> and file a bug report with them.

More details on creating issue reports for the core LaTeX distribution
are given in our [CONTRIBUTING guide](CONTRIBUTING.md).

## Support

We are unable to provide advice/support here: community sites such as
[TeX-LaTeX StackExchange](http://tex.stackexchange.com) and [The LaTeX
Community](http://latex-community.org) are available for general help. See also
[the help pages on our website](https://www.latex-project.org/help) for further
suggestions.

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

This README file is copyright 2019 The LaTeX Project.
