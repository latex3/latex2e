Hey, you think you found a bug in LaTeX? Pity! These guidelines will help you
to create a good report to our bugs database.

## Brief outline

Please replace this line with a brief summary of your issue.

## Minimal example

To check that you are really seeing a bug, please write a short, self-contained
document that shows the problem. This should include the `latexbug` package,
which will warn if your test file is not suitable for one or the other reason.
See CONTRIBUTING for details and also if you need to obtain the package.

If the bug turns out to be with third-party software then please contact the
developer, and not us!

```latex
\RequirePackage{latexbug}     % <--should be always the first line!
\documentclass{article}
\begin{document}
% Demonstration of issue here
\end{document}
```
## Log (and possibly PDF) file

Once you have constructed a minimal example, run LaTeX on *exactly* that input
and check that `latexbug` doesn't report any problems. If all looks
good, attach the `.log` file by dragging-and-dropping it onto the issue report.

In some cases it may also be helpful to attach the resulting .pdf file.