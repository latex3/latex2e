
## Files containing `\@outputpage`


## Files most certainly broken


-------------------------------


## Files to check




#### /usr/local/texlive/2024/texmf-dist/tex/latex/fancybox/fancybox.sty

```
% Otherwise, it is the usual \@outputpage
  \def\@outputpage{\fb@outputpage}}
  \gdef\@outputpage{\fb@outputpage}%
  \def\@outputpage{\fb@outputpage}
  \gdef\@outputpage{\fb@outputpage}
  \def\@outputpage{\fb@outputpage}%
  \def\@outputpage{\fb@outputpage}%
```

 - needs checking
 - are there any hooks and are needed to support this?



#### /usr/local/texlive/2024/texmf-dist/tex/latex/flowfram/flowfram.sty

```
        \@outputpage
         \@outputpage
\def\@outputpage{%
    \@outputpage
      \@outputpage
         {\@outputpage \@startdblcolumn }%
```

 - needs checking
 - implements its own OR so not compatible with tagging right now
 - also may not work fully correctly with latest mark mechanism (sets \firstmark\botmark, for example)
 - are there any hooks and are needed to support this?


#### /usr/local/texlive/2024/texmf-dist/tex/latex/vruler/vruler.sty

```
\let\@outputpage@backup\@outputpage \let\plainoutput@backup\plainoutput
    % we assume all LaTeX versions have \@outputpage in the form of
    % \@outputpage= ...\vbox{ ... \vbox{...}...}... , where 2nd \vbox
  \toksfive=\expandafter{\@outputpage\s@ftymark}%temp toks
\edef\@outputpage{\the\toksone \noexpand\vbox{\the\tokstwo \noexpand\vbox{%
\def\unsetvruler{\Ruler@Startedfalse \let\@outputpage\@outputpage@backup
```

 - needs checking
 - probably works, but not with tagging
 - could probably be done much simpler these days using hooks



#### /usr/local/texlive/2024/texmf-dist/tex/latex/gentombow/gentombow.sty

```
% required for patching \@outputpage
% patch \@outputpage
\let\pxgtmb@emu@outputpage\@outputpage
  \global\let\@outputpage\pxgtmb@emu@outputpage
    Failed in patching \string\@outputpage!\MessageBreak
```

 - needs checking
 - not sure this is going to work, with or without tagging






#### /usr/local/texlive/2024/texmf-dist/tex/latex/paracol/paracol.sty

```
    \global\advance\pcol@basepage\@ne \@outputpage
\let\pcol@@outputpage\@outputpage
\def\@outputpage{\begingroup
      \pcol@Logstart{\@outputpage{rightset}}%
      \pcol@Logend{\@outputpage{rightset}}%
  \pcol@Logstart{\@outputpage{left}}%
  \pcol@Logend{\@outputpage{left}}}
    \pcol@Logstart{\@outputpage{right}}%
    \pcol@Logend{\@outputpage{right}}%
    \pcol@outputfalse \@outputpage \pcol@outputtrue
  \@outputpage
  \@outputpage
      \@outputpage
    \@outputpage}}
    \ifvoid\@outputbox\else \@outputpage \fi
```

 - needs checking
 - might work, but could probably be implemented better with just hooks


#### /usr/local/texlive/2024/texmf-dist/tex/latex/newlfm/newlfm.cls

```
\def\@outputpage{%
```

 - needs checking
 - implements its own OR, so no tagging
 - is it still working?


-------------------------------------------------


## Files ok


#### /usr/local/texlive/2024/texmf-dist/tex/latex/arydshln/arydshln.sty

```
                        \@outputpage
            \@outputpage
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/jpsj/jpsj2.cls

```
      \@outputpage \begingroup \@dblfloatplacement \@startdblcolumn
      \@whilesw\if@fcolmade \fi{\@outputpage\@startdblcolumn}\endgroup
 \@outputpage \begingroup \@dblfloatplacement \@startdblcolumn
 \@whilesw\if@fcolmade \fi{\@outputpage\@startdblcolumn}\endgroup}
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/fix2col/fix2col.sty

```
    \@outputpage
      \@whilesw\if@fcolmade \fi{\@outputpage\@startdblcolumn}%
              \@whilesw\if@fcolmade \fi{\@outputpage
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/tools/longtable.sty

```
          \@outputpage
    \@outputpage
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/tools/ftnright.sty

```
  \@combinedblfloats\@outputpage
    {\@outputpage\@startdblcolumn}%
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/tools/multicol.sty

```
   \@makecol\@outputpage
   \@whilesw\if@fcolmade\fi{\@outputpage
```




#### /usr/local/texlive/2024/texmf-dist/tex/latex/longfigure/longfigure.sty

```
          \@outputpage
    \@outputpage
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/wordcount/wordcount.tex

```
\AtBeginDocument{\def\@outputpage{\showpagebox}}
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/glossaries/styles/glossary-longbooktabs.sty

```
           \@outputpage
     \@outputpage
```

 - Not relevant here.
 - But patches longtable ... is this necessary?


#### /usr/local/texlive/2024/texmf-dist/tex/latex/arabtex/altxext.sty

```
	\@combinedblfloats \@outputpage 
	{\@outputpage \@startdblcolumn }\endgroup
```



#### /usr/local/texlive/2024/texmf-dist/tex/latex/arabi/fmultico.sty

```
   \@makecol\@outputpage
   \@whilesw\if@fcolmade\fi{\@outputpage
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/preprint/balance.sty

```
     \@outputpage \begingroup \@dblfloatplacement
     {\@outputpage\@startdblcolumn}\endgroup
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/eledmac/eledmac.sty

```
           \@whilesw\if@fcolmade \fi{\@outputpage
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/tugboat/ltugboat.cls

```
       \@outputpage \begingroup \@dblfloatplacement \@startdblcolumn
       \@whilesw\if@fcolmade \fi{\@outputpage\@startdblcolumn}\endgroup
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/aguplus/aguplus.sty

```
     \@outputpage \begingroup \@dblfloatplacement
     {\@outputpage\@startdblcolumn}\endgroup
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/shipunov/etiketka.cls

```
    \@outputpage
        {\@outputpage
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/jacow/jacow.cls

```
    \@outputpage
      \@whilesw\if@fcolmade \fi{\@outputpage\@startdblcolumn}%
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/ltxmisc/iagproc.cls

```
     \@outputpage \begingroup \@dblfloatplacement
     {\@outputpage\@startdblcolumn}\endgroup
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/dblfloatfix/dblfloatfix.sty

```
          \@whilesw\if@fcolmade \fi{\@outputpage
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/nidanfloat/nidanfloat.sty

```
    \@outputpage
      \@whilesw\if@fcolmade \fi{\@outputpage\@startdblcolumn}%
          \@whilesw\if@fcolmade \fi{\@outputpage
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/footbib/footbib.sty

```
  \if@fcolmade\fi{\@outputpage\@makefcolumn\@dbldeferlist}\endgroup\else
          \@whilesw\if@fcolmade \fi{\@outputpage\@makefcolumn\@dbldeferlist}%
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/sttools/flushend.sty

```
        \@outputpage
                {\@outputpage\@startdblcolumn}%
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/sttools/cuted.sty

```
        \@outputpage
                {\@outputpage \@startdblcolumn}%
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/sttools/stfloats.sty

```
                        \@whilesw\if@fcolmade \fi{\@outputpage
                        \@whilesw\if@fcolmade \fi{\@outputpage
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/sttools/midfloat.sty

```
    \@outputpage
        {\@outputpage
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/cd-cover/cd-cover.cls

```
    \@outputpage
        {\@outputpage
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/ledmac/ledmac.sty

```
           \@whilesw\if@fcolmade \fi{\@outputpage
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/csquotes/csquotes.sty

```
  \ifx\protect\noexpand % \@outputpage
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/fixltx2e.sty

```
    \@outputpage
      \@whilesw\if@fcolmade \fi{\@outputpage\@startdblcolumn}%
              \@whilesw\if@fcolmade \fi{\@outputpage
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/fltrace.sty

```
    \@outputpage
    \@outputpage
      \@whilesw\if@fcolmade \fi{\@outputpage
    \@outputpage
        {\@outputpage
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/latexrelease.sty

```
              \@whilesw\if@fcolmade \fi{\@outputpage
                    {\@outputpage\@makefcolumn\@dbldeferlist}%
  {\@outputpage}{Reset language for hyphenation}%
\def\@outputpage{%
  {\@outputpage}{Reset language for hyphenation}%
\def\@outputpage{%
    \@outputpage
      \@whilesw\if@fcolmade \fi{\@outputpage
    \@outputpage
        {\@outputpage
```





-------------------------------


## Files ok but should use hook `{cmd/@outputpage/before}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex4-1/revtex4-1.cls

```
\prepdef\@outputpage{\@outputpage@head}%
\appdef\@outputpage{\@outputpage@tail}%
 \@outputpage
 \@outputpage
 \@outputpage
```

 - Should also use hook  `{cmd/@outputpage/after}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/uwthesis/uwthesis.cls

```
 \let\old@outputpage\@outputpage
 \def\@outputpage{%
```

 - Could be implemented with `{cmd/@outputpage/before}` and `{cmd/@outputpage/after}`.
 - Doubt that the group addedd is actually necessary.
 

#### /usr/local/texlive/2024/texmf-dist/tex/latex/lscapeenhanced/lscapeenhanced.sty

```
    \let\@lscapeenhanced@outputpage\@outputpage
    \def\@outputpage{%
```

 - Could be implemented with `{cmd/@outputpage/before}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/everypage/everypage-1x.sty

```
  \let\sc@op@saved\@outputpage
  \def\@outputpage{%
```

 - Could be implemented with `{cmd/@outputpage/before}` and `{cmd/@outputpage/after}`.
 - Is this offering anything not yet available?


#### /usr/local/texlive/2024/texmf-dist/tex/latex/handin/handin.sty

```
  \let\epage@op@saved\@outputpage
  \def\@outputpage{%
```
 - Could be implemented with `{cmd/@outputpage/before}` and `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/kotex-oblivoir/memhangul-x/xob-lwarp.sty

```
	    \edef\@outputpage{%
	      \unexpanded\expandafter{\@outputpage}}%
```

 - Could be implemented with `{cmd/@outputpage/before}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex/ltxgrid.sty

```
\prepdef\@outputpage{\@outputpage@head}%
\appdef\@outputpage{\@outputpage@tail}%
 \@outputpage
 \@outputpage
 \@outputpage
```
 - Could be implemented with `{cmd/@outputpage/before}` and `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex/revtex4-2.cls

```
\prepdef\@outputpage{\@outputpage@head}%
\appdef\@outputpage{\@outputpage@tail}%
 \@outputpage
 \@outputpage
 \@outputpage
```
 - Could be implemented with `{cmd/@outputpage/before}` and `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/media9/pdfbase.sty

```
\cs_set_eq:NN\pbs_outputpage_orig:\@outputpage
\cs_set_protected_nopar:Npn\@outputpage{
\cs_set_eq:NN\pbs_outputpage_orig:\@outputpage
\cs_set_protected_nopar:Npn\@outputpage{
```

 - Could be implemented with `{cmd/@outputpage/before}` and `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/jlreq/jlreq-trimmarks.sty

```
      \tl_put_left:Nx \@outputpage {%
```

 - Could be implemented with `{cmd/@outputpage/before}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/footnpag/footnpag.sty

```
%%% on some internals of \LaTeX{}: |\@outputpage| does the real ship out,
\let\fnpp_orig_outputpage=\@outputpage
\def\@outputpage{%
%%% \LaTeX{} internals. In particular, |\@outputpage| is now redefined,
```



#### /usr/local/texlive/2024/texmf-dist/tex/latex/floatrow/floatpagestyle.sty

```
  {\@ifdefinable\FBori@outputpage{\let\FBori@outputpage\@outputpage}
  \let\@outputpage\FB@outputpage}
```

 - Could be implemented with `{cmd/@outputpage/before}`.
 - is this package needed or should it be offered out of the box?


#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex4/revtex4.cls

```
  \@outputpage
\appdef\@outputpage{%
 \@outputpage
 \@outputpage
  \@outputpage
  \@outputpage
\appdef\@outputpage{%
\appdef\@outputpage{%
\prepdef\@outputpage{%
```

 - Could be implemented with `{cmd/@outputpage/before}` and `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/skeyval/skeyval.sty

```
  \let\skv@savedoutputpage\@outputpage
  \def\@outputpage{%
```

 - Could be implemented with `{cmd/@outputpage/before}` and `{cmd/@outputpage/after}`.
 - What exactly is the package offering?


-------------------------------


## Files ok but should use hook `{cmd/@outputpage/after}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/combine/combine.cls

```
  \g@addto@macro{\@outputpage}{\stepcounter{colpage}}  %% added
```

 - Could be implemented with `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/yafoot/pfnote.sty

```
\let\pfn@outputpage\@outputpage
\def\@outputpage{\pfn@outputpage \global\advance\pfn@page\@ne}
```

 - Could be implemented with `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/reledmac/reledmac.sty

```
  \apptocmd{\@outputpage}{%
```

 - Could be implemented with `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/grfpaste/grfpaste.sty

```
\let\GP@outputpage\@outputpage
\def\@outputpage{%
```

 - Could be implemented with `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/mparhack/mparhack.sty

```
\g@addto@macro{\@outputpage}{\mph@outputpage@hook}
```

 - Could be implemented with `{cmd/@outputpage/after}`.

#### /usr/local/texlive/2024/texmf-dist/tex/latex/memoir/memoir.cls

```
           \@whilesw\if@fcolmade \fi{\@outputpage
  %         \@whilesw\if@fcolmade \fi{\@outputpage
\g@addto@macro{\@outputpage}{\stepcounter{sheetsequence}}
```

 - Could be implemented with `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/marginnote/marginnote.sty

```
  \g@addto@macro\@outputpage{%
```

 - Could be implemented with `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/scrhack/lscape.hak

```
    \let\scrh@LT@outputpage\@outputpage
    \def\@outputpage{\scrh@LT@outputpage\global\@colht\scrh@LT@textheight}%
```

 - Could be implemented with `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/seminar/seminar.cls

```
  \expandafter\def\expandafter\@outputpage\expandafter{%
    \@outputpage\stepcounter{note}}
```

 - Could be implemented with `{cmd/@outputpage/after}`.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/seminar/seminar.sty

```
  \expandafter\def\expandafter\@outputpage\expandafter{%
    \@outputpage\stepcounter{note}}
```

 - Could be implemented with `{cmd/@outputpage/after}`.



-------------------------------


## Files ok but should use probably get hook support

#### /usr/local/texlive/2024/texmf-dist/tex/latex/pecha/pecha.cls

```
\def\@outputpage{\pecha@outputpage}
```

 - Implements its own OR, so not tagging compatible.
 - May continue to work as it overwrites


#### /usr/local/texlive/2024/texmf-dist/tex/latex/threadcol/threadcol.sty

```
\let\thrcl@orig@outputpage=\@outputpage
\let\thrcl@outputpage=\@outputpage
    {\@outputpage}%
    {\@outputpage}%
    \global\let\@outputpage=\thrcl@outputpage
```

 - Does patching that should probably be done with hooks instead
 - Are there any needed that aren't yet available?


-------------------------------



