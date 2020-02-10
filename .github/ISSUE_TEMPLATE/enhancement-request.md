---
name: Enhancement request
about: Core LaTeX2e rarely adds new features
title: ''
labels: ''
assignees: ''

---

## Brief outline of the enhancement

**LaTeX2e generally cannot add new features without an extreme amount of care to accommodate backwards compatibility. Please do not be offended if your request is closed for being infeasible.**

## Minimal example showing the current behaviour

```latex
\RequirePackage{latexbug}       % <--should be always the first line (see CONTRIBUTING)!
\documentclass{article}

  % Any preamble code goes here

\begin{document}

  % Demonstration of issue here
  
\end{document}
```

## Minimal example showing the desired new behaviour

```latex
\RequirePackage{latexbug}       % <--should be always the first line (see CONTRIBUTING)!
\documentclass{article}

  % Any preamble code goes here

\begin{document}

  % Demonstration of issue here
  
\end{document}
```
