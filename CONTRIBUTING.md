Thanks for considering contributing to LaTeX2e: feedback, fixes and
ideas are all useful. Here, we ([The LaTeX3
Project](https://www.latex-project.org)) have collected together a few
pointers to help things along.

## Bugs

There are thousands of packages and the LaTeX Project Team only supports
a few dozen core packages beside the kernel code. So if a bug is due to
code from a contributed third-party package the LaTeX Project Team is
not able to help or fix the code as that is maintained by others. As
such, we ask you follow the procedure below as it will help to weed
cases where we cannot help.

To report a bug it is important to provide a short test file that
exhibits the issue. The [`latexbug`](https://github.com/latex3/latexbug)
package should be loaded at the very top of any such test file used to
report a bug in LaTeX as follows:

```latex
\RequirePackage{latexbug}    % <- first line
\documentclass{article}      % or some other class
...                          % code showing the problem
```

If the `latexbug` package is not part of your distribution you can
download it
[GitHub](https://raw.githubusercontent.com/latex3/latexbug/master/latexbug.sty).
In that case simply place it in the directory next to your test file (or
place it into your local `texmf` tree so that it will be always found –
how to do that depends on the installation you use).

If you think the bug is in core LaTeX (as maintained by the LaTeX Team)
but `latexbug` complains about are needed to demonstrate the problem,
then please continue and send the bug report to us but explain this
explicitly in your description of bug.

## Layout and interface deficiencies

Upfront we should probably stress that 'deficiencies' in the design of
of the standard document classes (`article`, `report` and `book`) as
well a questionable but long established interface behavior of commands
is something that we will normally not change, even if we can all agree
that a different behavior or a different layout would have been a better
choice. You are, of course, welcome to report issues in these areas,
using the procedure explained below, but in all likelihood such reports
will be marked as 'won't fix'.

The reason is is that the kernel interfaces and the document classes
have been used for many years in essentially all documents (even
documents using different classes often build them upon the standard
classes in the background) and thus such changes would break or as a
minimum noticeably change nearly all existing documents. See also the
file [LaTeX2e News Issue
07](https://www.latex-project.org/news/latex2e-news/ltnews07.pdf) with
regard to this policy.

## Code contributions

If you want to discuss a possible contribution before (or instead of)
making a pull request, drop a line to
[the team](mailto:latex-team@latex-project.org).

The stability of LaTeX is very important and this means that change in
the kernel is necessarily very conservative. It also means that a lot of
discussion happens before any changes are made. If you do decide to post
a pull request, please bear this in mind: we do appreciate ideas, but
cannot always integrate them into the kernel.

If you are submitting a pull request, notice that

- The first line of commit messages should be a short summary (up to about
  50 chars); leave a blank line then give more detail if required
- We use Travis-CI for (light) testing so add `[ci skip]` to documentation-only
  commit messages
- We favour a single linear history so will rebase accepted pull requests
- Where a commit fixes or closes an issue, please include this information
  in the first line of the commit message [`(fixes #X)` or similar]
