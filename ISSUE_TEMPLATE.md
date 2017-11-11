Hey, you think you found a bug in LaTeX? Pity! These guidelines will help you
to create a good report to our bugs database.

## Brief outline

Please replace this line with a brief summary of your issue.

## Minimal example

To check that you are really seeing a bug, please write a short, self-contained
document that shows the problem. This should include the `latexbug` package,
which will warn if you are using any third-party packages or document classes.
If the bug turns out to be with third-party software then please contact the
developer, and not us!

```latex
\RequirePackage{latexbug}
\documentclass{article}
\begin{document}
% Demonstration of issue here
\end{document}
```
## Log file

Once you have constructed a minimal example, run LaTeX on *exactly* that input
and check that `latexbug` doesn't pick up any third-party files. If all looks
good, attach the `.log` file by dragging-and-dropping onto the issue report.