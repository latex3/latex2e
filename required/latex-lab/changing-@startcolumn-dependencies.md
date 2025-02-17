
# Files containing `\@startcolumn`

## Files with no support

#### /usr/local/texlive/2024/texmf-dist/tex/latex/accessibility/accessibility.sty

```
  \let\original@startcolumn\@startcolumn%
  \renewcommand{\@startcolumn}{%
```

## Files ok

#### /usr/local/texlive/2024/texmf-dist/tex/latex/flowfram/flowfram.sty

```
    \@opcol \@startcolumn
    \@whilesw \if@fcolmade \fi {\@opcol \@startcolumn }%
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/sttools/cuted.sty

```
        \@startcolumn
            {\@opcol \@startcolumn}%
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/fltrace.sty

```
    \@startcolumn
       \@opcol\@startcolumn}%
\def \@startcolumn {%
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/paracol/paracol.sty

```
    \@startcolumn
    \@whilesw\if@fcolmade\fi{\@opcol \@startcolumn}%
    \@startcolumn \@whilesw\if@fcolmade\fi{\@opcol\@startcolumn}%
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/rotpages/rotpages.sty

```
  \def\@startcolumn{\relax}%
```

basically disables it within some env.


## Files ok but should use hook `{cmd/@startcolumn/before}

#### /usr/local/texlive/2024/texmf-dist/tex/latex/hypdvips/hypdvips.sty

```
\global\let\pp@backup@@startcolumn\@startcolumn
\gdef\@startcolumn{%
```

## Files to check


#### /usr/local/texlive/2024/texmf-dist/tex/latex/tools/ftnright.sty

```
\def\@startcolumn{%
```

`\@xstartcol` is old `\@startcolumn`. Redef is complex




#### /usr/local/texlive/2024/texmf-dist/tex/latex/platex-tools/pxftnright.sty

```
%   * \@startcolumn is redefined
\def\@startcolumn{%
```

should follow ftnright rewrite

