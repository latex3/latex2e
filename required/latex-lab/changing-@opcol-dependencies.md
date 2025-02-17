
## Files containing `\@opcol`



---------------------

### Files (probably) broken


#### /usr/local/texlive/2024/texmf-dist/tex/latex/flowfram/flowfram.sty

```
    \@opcol \@startcolumn
    \@whilesw \if@fcolmade \fi {\@opcol \@startcolumn }%
      \@opcol
    \@makecol\@opcol
\def\@opcol{%
```

 - implements `\@opcol`as if always in dblcolumn mode, is that intended?
 - implementation doesn't handle new mark mechanism, so most likely partly broken


---------------------

### Files incompatible with tagging but otherwise probably ok

#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex4-1/revtex4-1.cls

```
\let\@opcol\@undefined
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex/ltxgrid.sty

```
\let\@opcol\@undefined
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex/revtex4-2.cls

```
\let\@opcol\@undefined
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex4/revtex4.cls

```
\let\@opcol\@undefined
```




---------------------

### Files to check



#### /usr/local/texlive/2024/texmf-dist/tex/latex/rotpages/rotpages.sty

```
  \def\@opcol{\relax}%
```

 - disables `\@opcol` and `\@startcolumn`
 - might be ok



---------------------

### Files ok but should use hook {cmd/@opcol/before}


#### /usr/local/texlive/2024/texmf-dist/tex/latex/jlreq/jlreq.cls

```
  \tl_put_left:Nn \@opcol{\jlreq@hook@@opcol}
```

 - should be implemented with `{cmd/@opcol/before}`
 



---------------------

### Files ok


#### /usr/local/texlive/2024/texmf-dist/tex/latex/fix2col/fix2col.sty

```
       \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
       \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/eledmac/eledmac.sty

```
    \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
    \l@d@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/memoir/memoir.cls

```
    \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
    \@makecol\@opcol
  %   \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
  %   \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/dblfloatfix/dblfloatfix.sty

```
    \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
    \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/nidanfloat/nidanfloat.sty

```
    \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
    \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/footbib/footbib.sty

```
  \@deferlist\@whilesw\if@fcolmade\fi{\@opcol\@makefcolumn\@deferlist
  \@opcol\clearpage\fi}
    \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
    \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/sttools/cuted.sty

```
        \@opcol
            {\@opcol \@startcolumn}%
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/sttools/stfloats.sty

```
            \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
            \@makecol\@opcol
            \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
            \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/ledmac/ledmac.sty

```
    \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
    \l@d@makecol\@opcol
```



#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/fixltx2e.sty

```
       \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
       \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/fltrace.sty

```
    \@opcol
       \@opcol\@startcolumn}%
\def \@opcol {%
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/latexrelease.sty

```
       \@whilesw\if@fcolmade \fi{\@opcol\@makefcolumn\@deferlist}%
       \@makecol\@opcol
                     {\@opcol\@makefcolumn\@deferlist}%
       \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/paracol/paracol.sty

```
    \@opcol
    \@whilesw\if@fcolmade\fi{\@opcol \@startcolumn}%
    \@startcolumn \@whilesw\if@fcolmade\fi{\@opcol\@startcolumn}%
```
