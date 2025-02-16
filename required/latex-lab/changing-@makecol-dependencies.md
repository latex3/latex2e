
# Files containing `\@makecol`


## Files with no support

#### /usr/local/texlive/2024/texmf-dist/tex/latex/accessibility/accessibility.sty

```
           \if@twocolumn \let\@makecol\@AC@makecol \fi%
  \AtBeginDocument{\let\@AC@orig@makecol\@makecol} %
```

 - Broken for a number of reasons and not worth fixing imo.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/slides.def

```
\def\@makecol{\if@makingslides\ifnum\c@page>\z@ \@extraslide\fi\fi
```

 - May actually work with this hard overwrite, but certainly no support for tagging. And I think, the answer is, no-support.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/footmisx/footmisx.sty

```
    \CheckCommand*\@makecol{\ifvoid \footins
    \CheckCommand*\@makecol{\ifvoid \footins
      \CheckCommand*\@makecol{\ifvoid \footins
      \CheckCommand*\@makecol{\ifvoid \footins
  \edef\@makecol{\the\toks@}
```

 - Broken - doesn't even load and that since 2016 or so
 - Should be sunset

------------------------------------


## Files most certainly broken


#### /usr/local/texlive/2024/texmf-dist/tex/latex/footmisc/footmisc.sty

```
\def \@makecol {%
```

 - Not relevant will be updated as part of the change.



#### /usr/local/texlive/2024/texmf-dist/tex/latex/tools/ftnright.sty

```
  \@makecol
\def\@makecol{\if@firstcolumn
```

 - Patches also \@startcolumn and perhaps others.  Need to be reworked when the new OR is in place.




#### /usr/local/texlive/2024/texmf-dist/tex/latex/plautopatch/pxstfloats.sty

```
%% mostly based on \@makecol in latex.ltx, and
\def\fnbelowfloat{\global\let\@makecol\pxstfl@fnbelowfl@makecol}
\def\fnabovefloat{\global\let\@makecol\pxstfl@fnabovefl@makecol}
```

- Most likely broken, but should be easily fixable.

 - part of plautopatch
 - Hironobu Yamashita


#### /usr/local/texlive/2024/texmf-dist/tex/latex/flowfram/flowfram.sty

```
    \@makecol
    \@makecol\@opcol
\renewcommand{\@makecol}{%
```

 - Looks like all the redefinition does is adding `\@tempdima\dp\@cclv` but I don't see where this dimen is used. In any case the redefinition should not be necessary, as the new OR also stores the depth.

 - email: nicola.talbot@dickimaw-books.com   Nicola Talbot



#### /usr/local/texlive/2024/texmf-dist/tex/latex/platex-tools/pxftnright.sty

```
%   * \@makecol is redefined
  \@makecol
\def\@makecol{%
```

 - Reimplementation of ftnright for Japanese, should follow whatever is going to be done for that package and then should be ok.
 
#### /usr/local/texlive/2024/texmf-dist/tex/latex/footbib/footbib.sty

```
  \vbox{}\clearpage\fi\fi\else\setbox\@cclv\vbox{\box\@cclv\vfil}\@makecol
\@tempa\@makecol{\ifvoid\footins\setbox\@outputbox\box\@cclv\else\setbox
    \@makecol\@opcol
\def \@makecol {%
```

 - Patches the OR and also checks if the LaTeX OR is as expect. So will certainly break

 - Needs updating and preferably use hooks to avoid the patching

 - email: Eric.Domenjoud@loria.fr



------------------------------------


## Files incompatible with tagging but otherwise probably ok




#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex4-1/revtex4-1.cls

```
\let\@makecol\@undefined
```

 - Seems to bypass LaTex's OR, so might work but will fail tagging.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex/ltxgrid.sty

```
\let\@makecol\@undefined
```

 - Seems to bypass LaTex's OR, so might work but will fail tagging.



#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex/revtex4-2.cls

```
\let\@makecol\@undefined
```

 - Seems to bypass LaTex's OR, so might work but will fail tagging.



#### /usr/local/texlive/2024/texmf-dist/tex/latex/revtex4/revtex4.cls

```
  \@makecol\csname output@column@\thepagegrid\endcsname
\def\@makecol{%
 \@makecol
 \@makecol
\@makecol
```

 - Installs its own OR
 - Needs analysing if we should add another hook to support it of it it can be handled with the ones already provided.
 - As it is may work (as it overwrites) but clearly it will not work with tagging in this way.





#### /usr/local/texlive/2024/texmf-dist/tex/latex/easybook/easybase.sty

```
    \cs_set:Npn \@makecol
```

 - Definition of `\@makecol` already in the new style, so should not do that, but put any extra code in hooks.

 - email: toquyi@163.com
 - https://gitee.com/texno3/easybook



#### /usr/local/texlive/2024/texmf-dist/tex/latex/jpsj/jpsj2.cls

```
% Extra \@texttop somehow found its way into \@makecol.  Deleted
\def\@makecol{\if@firstcolumn
```

 - Installs its own OR (with code fom 1986 or earlier. So will definitely fail tagging, but probably ok with updates of LaTeX OR.

 - email: jpsj-online@jpsj.or.jp    (maybe, from authors doc)



#### /usr/local/texlive/2024/texmf-dist/tex/latex/fnpara/fnpara.sty

```
\def \@makecol {%
```

- Installs its own `\@makecol`. Could probably be fixed using the new one and extra code in hooks.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/memoir/memoir.cls

```
    \@makecol\@opcol
  %   \@makecol\@opcol
\newcommand{\feetabovefloat}{\gdef\@makecol{\mem@makecol}}
\newcommand{\feetbelowfloat}{\gdef\@makecol{\mem@makecolbf}}
```

 - This needs some analysing, not sure yet if it is difficult or hard to adjust.

 - Could most likely be rewritten using the new OR without a need to introduce extras

 - As it is now it just overwrite the OR so will work but no tagging



#### /usr/local/texlive/2024/texmf-dist/tex/latex/longfigure/longfigure.sty

```
          \@makecol
    \@makecol
```

 - No problem with `\@makecol` but most likely otherwise broken with respect to tagging



-------------------------------



## Files to check


#### /usr/local/texlive/2024/texmf-dist/tex/latex/eledmac/eledmac.sty

```
  \gdef\@makecol{\l@d@makecol}%
```

 - This needs some analysing, not sure yet if it is difficult or hard to adjust.



#### /usr/local/texlive/2024/texmf-dist/tex/latex/yafoot/fnpos.sty

```
\def\@makecol{\setbox\@outputbox\box\@cclv
```

 - Should be sunset.
 - There should be no problem to provide a replacement using the new OR





#### /usr/local/texlive/2024/texmf-dist/tex/latex/pdfcolfoot/pdfcolfoot.sty

```
    Missing e-TeX for patching \string\@makecol
      Patching \string\@makecol\space macros (#1)%
  \pdfcolfoot@patch\@makecol
```

 - Does some patching which may or may not work, but needs analysing (and probably replacing using hooks)








#### /usr/local/texlive/2024/texmf-dist/tex/latex/paracol/paracol.sty

```
    \@makecol
\def\pcol@@makecol#1{\@makecol
  \ifvoid\footins\else \pcol@Log\@makecol{put}\footins \fi
  \@makecol
    \setbox\@cclv\box\@holdpg \@makecol
    \@makecol
```

 - needs some analysis, might work but ...


#### /usr/local/texlive/2024/texmf-dist/tex/latex/beilstein/beilstein.cls

```
      \def\@makecol{%
```

 - overwrites OR in one case
 - significant difference is this:
```
  \color@begingroup
  \normalcolor
  \footnoterule
! \makefootnoteparagraph
  \color@endgroup
  }%
! \fi%
  \xdef\@freelist{\@freelist\@midlist}%
  \global\let\@midlist\@empty
  \@combinefloats
--- 9,19 ----
  \color@begingroup
  \normalcolor
  \footnoterule
! \unvbox \footins
  \color@endgroup
  }%
! \fi
! \let\@elt\relax
  \xdef\@freelist{\@freelist\@midlist}%
  \global \let \@midlist \@empty
  \@combinefloats
```
 - should be possible to handle with hooks



-------------------------------


## Files ok

#### /usr/local/texlive/2024/texmf-dist/tex/latex/fix2col/fix2col.sty

```
       \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/tools/longtable.sty

```
          \@makecol
    \@makecol
```




#### /usr/local/texlive/2024/texmf-dist/tex/latex/tools/multicol.sty

```
   \@makecol\@outputpage
```



#### /usr/local/texlive/2024/texmf-dist/tex/latex/arabi/fmultico.sty

```
   \@makecol\@outputpage
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/dblfloatfix/dblfloatfix.sty

```
    \@makecol\@opcol
```



#### /usr/local/texlive/2024/texmf-dist/tex/latex/nidanfloat/nidanfloat.sty

```
    \@makecol\@opcol
```

#### /usr/local/texlive/2024/texmf-dist/tex/latex/seminar/seminar.bg3

```
          \@makecol
    \@makecol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/seminar/seminar.bg2

```
          \@makecol
    \@makecol
```



#### /usr/local/texlive/2024/texmf-dist/tex/latex/footmisc/footmisc-2011-06-06.sty

```
    \CheckCommand*\@makecol{\ifvoid \footins
    \CheckCommand*\@makecol{\ifvoid \footins
      \CheckCommand*\@makecol{\ifvoid \footins
      \CheckCommand*\@makecol{\ifvoid \footins
  \edef\@makecol{\the\toks@}
```

Rollback version. Rollback probably only works if the format is rolled back as well.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/fixltx2e.sty

```
       \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/fltrace.sty

```
    \@makecol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/base/latexrelease.sty

```
       \@makecol\@opcol
       \@makecol\@opcol
```


#### /usr/local/texlive/2024/texmf-dist/tex/latex/tagpdf/tagpdf.sty

```
               \__tag_check_typeout_v:n {====>~In~\token_to_str:N \@makecol\c_space_tl\the\c@page}
               \__tag_check_typeout_v:n {====>~In~\token_to_str:N \@makecol\c_space_tl\the\c@page}
```


-------------------------------


## Files ok but should use hook `{build/column/before}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/fancyhdr/fancyhdr.sty

```
  \let\latex@makecol\@makecol
  \def\@makecol{\ifvoid\footins\f@nch@footnotefalse\else\f@nch@footnotetrue\fi
```

 - Ok, but should be handled by a hook `{build/column/before}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/widows-and-orphans/widows-and-orphans.sty

```
\tl_put_left:Nn \@makecol { \__fmwao_test_for_widows_etc: }
```

 - Ok, but should be handled by a hook `{build/column/before}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/ncctools/manyfoot.sty

```
  \let\MFL@makecol\@makecol
  \def\@makecol{\MFL@joinnotes\MFL@makecol}
```

 - Ok, but should be handled by a hook `{build/column/before}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/changebar/changebar.sty

```
\let\ltx@makecol\@makecol
\let\@makecol\cb@makecol
```

 - Ok, but should be handled by a hook `{build/column/before}` and `{build/column/after}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/pbalance/pbalance.sty

```
\pretocmd{\@makecol}{\@PBcollectPageInfo}
\apptocmd{\@makecol}{\@PBcollectColumnUsedHeight}
    \pretocmd{\@makecol}{\@PBcollectPageInfo}
    \apptocmd{\@makecol}{\@PBcollectColumnUsedHeight}
    \pretocmd{\@makecol}{\@PBcollectPageInfo}
    \apptocmd{\@makecol}{\@PBcollectColumnUsedHeight}
    \pretocmd{\@makecol}{\@PBcollectPageInfo}
    \apptocmd{\@makecol}{\@PBcollectColumnUsedHeight}
```

 - Ok, but should be handled by a hook `{build/column/before}` and `{build/column/after}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/yafoot/dblfnote.sty

```
        \let\dfn@latex@makecol\@makecol
        \let\@makecol\dfn@makecol}
        \let\@makecol\dfn@latex@makecol
        \let\@makecol\dfn@makecol
```

 - Probably ok, but should use `{build/column/before}` and `{build/column/after}`
 - Also need perhaps a bit of thoughts how to swap stuff in and out (in case `\twocolumn` is in force)


#### /usr/local/texlive/2024/texmf-dist/tex/latex/ncctools/nccfancyhdr.sty

```
  \let\NCC@fancymakecol\@makecol
  \def\@makecol{%
```

 - Ok, but should be handled by hook `{build/column/before}`
 - Also questionable if this is still necessary or helpful



-------------------------------


## Files ok but should use hook `{build/column/after}`

#### /usr/local/texlive/2024/texmf-dist/tex/latex/aastex/aastex631.cls

```
\let\LS@makecol=\@makecol
  \def\@makecol{\LS@makecol\LS@rot}%
```
 - Ok, but should be handled by a hook `{build/column/after}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/rotpages/rotpages.sty

```
\let\SC@makecol=\@makecol
  \def\@makecol{\SC@makecol\SC@processpage}%
```

 - Ok, but should be handled by a hook `{build/column/after}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/graphics/lscape.sty

```
  \let\LS@makecol=\@makecol
  \def\@makecol{\LS@makecol\LS@rot}%
```

 - Ok, but should be handled by a hook `{build/column/after}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/flexipage/flexipage.sty

```
  \let\flx@LS@makecol=\@makecol
  \def\@makecol{\flx@LS@makecol\flx@LS@rot}%
```

Ok, but should be handled by a hook `{build/column/after}`



#### /usr/local/texlive/2024/texmf-dist/tex/latex/marginfit/marginfit.sty

```
\let\marginfit@makecol\@makecol
\def\@makecol{%
```

 - Ok, but should be handled by a hook `{build/column/after}`

 - Tagging probably doesn't work without tagging the side nodes explicitly.


#### /usr/local/texlive/2024/texmf-dist/tex/latex/media9/pdfbase.sty

```
\cs_set_eq:NN\pbs_makecol_orig:\@makecol
\cs_set_protected_nopar:Npn\@makecol{
\cs_set_eq:NN\pbs_makecol_orig:\@makecol
\cs_set_protected_nopar:Npn\@makecol{
```

 - Ok, but should be handled by a hook `{build/column/after}`



#### /usr/local/texlive/2024/texmf-dist/tex/latex/hypdvips/hypdvips.sty

```
\global\let\pp@backup@@makecol\@makecol
\gdef\@makecol{%
```

 - Ok, but should be handled by a hook `{build/column/after}`


#### /usr/local/texlive/2024/texmf-dist/tex/latex/lineno/lineno.sty

```
    \if@twocolumn \let\@makecol\@LN@makecol \fi
  \let\@LN@orig@makecol\@makecol}
```

 - Swaps in its own OR
 - Could be (and eventually should be) easily handed with `{cmd/@makecol/after}` hook (but only assuming that classes like memoir or revtex do not install their own OR as well)




-------------------------------


## Files ok but should use probably get hook support


#### /usr/local/texlive/2024/texmf-dist/tex/latex/arydshln/arydshln.sty

```
                        \@makecol
            \@makecol
```

 - but redefines internals of longtable


#### /usr/local/texlive/2024/texmf-dist/tex/latex/glossaries/styles/glossary-longbooktabs.sty

```
           \@makecol
     \@makecol
```

 - Patches longtable




#### /usr/local/texlive/2024/texmf-dist/tex/latex/sttools/cuted.sty

```
        \@makecol
```

 - ok, but redefines `\output`





#### /usr/local/texlive/2024/texmf-dist/tex/latex/sttools/stfloats.sty

```
            \@makecol\@opcol
            \@makecol\@opcol
\global\let\org@makecol\@makecol
\def\fnbelowfloat{\global\let\@makecol\fn@makecol}
\def\fnunderfloat{\global\let\@makecol\org@makecol}
```

 - Probably ok, but patches other stuff which should be changed to hooks



#### /usr/local/texlive/2024/texmf-dist/tex/latex/updatemarks/updatemarks.sty

```
    \patchcmd \multi@column@out { \@makecol }
      { \@makecol\updatemarks@multicol@middlepage }
```

 - Does this need a hook in multicols?



#### /usr/local/texlive/2024/texmf-dist/tex/latex/reledmac/reledmac.sty

```
  \reledmac@error{Fail to patch \string\@makecol\space command}{\@ehc}%
      {\@makecol}%
```


 - Most likely ok, but uses some patch which should be done using hooks


#### /usr/local/texlive/2024/texmf-dist/tex/latex/ledmac/ledmac.sty

```
  \gdef\@makecol{\l@d@makecol}%
```

 - Probably same as reledmac

-------------------------------



