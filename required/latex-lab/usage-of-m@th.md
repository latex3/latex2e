## Usage of \m@th in the LaTeX core code.

Grabbed on 2023-11-11 in latex2e repo

```
base/doc/fntguide.tex:   \ProvideTextCommandDefault{\textonequarter}{$\m@th\frac14$}
base/doc.dtx:      \def\@makefnmark{\hbox to\z@{$\m@th^{\@thefnmark}$\hss}}%
base/doc.dtx:            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
base/fontdef.dtx:\DeclareRobustCommand\angle{{\vbox{\ialign{$\m@th\scriptstyle##$\crcr
base/fontdef.dtx:    \ialign{$\m@th#1\hfil##\hfil$\crcr#2\crcr=\crcr}}}
base/fontdef.dtx:  \notin{\mathrel{\m@th\mathpalette\c@ncel\in}}
base/fontdef.dtx:\def\c@ncel#1#2{\m@th\ooalign{$\hfil#1\mkern1mu/\hfil$\crcr$#1#2$}}
base/fontdef.dtx:\def\rlh@#1{\vcenter{\m@th\hbox{\ooalign{\raise2pt
base/fontdef.dtx:%          {\relax\ifmmode\@ldots\else\mbox{$\m@th\@ldots\,$}\fi}
base/fontdef.dtx:\DeclareRobustCommand\overrightarrow[1]{\vbox{\m@th\ialign{##\crcr
base/fontdef.dtx:\DeclareRobustCommand\overleftarrow[1]{\vbox{\m@th\ialign{##\crcr
base/fontdef.dtx:     {\mathop{\vbox{\m@th\ialign{##\crcr\noalign{\kern3\p@}%
base/fontdef.dtx:\DeclareRobustCommand\underbrace[1]{\mathop{\vtop{\m@th\ialign{##\crcr
base/fontdef.dtx:\DeclareRobustCommand\rightarrowfill{$\m@th\smash-\mkern-7mu%
base/fontdef.dtx:\DeclareRobustCommand\leftarrowfill{$\m@th\mathord\leftarrow\mkern-7mu%
base/fontdef.dtx:\DeclareRobustCommand\downbracefill{$\m@th \setbox\z@\hbox{$\braceld$}%
base/fontdef.dtx:\DeclareRobustCommand\upbracefill{$\m@th \setbox\z@\hbox{$\braceld$}%
base/fontdef.dtx:\def\n@space{\nulldelimiterspace\z@ \m@th}
base/ltboxes.dtx:    \if@pboxsw \m@th$\fi
base/ltboxes.dtx:  \else $\@@underline{\hbox{#1}}\m@th$\relax\fi}
base/ltfloat.dtx:  {\m@th\ensuremath{^{\mbox{\fontsize\sf@size\sf@size#1}}}}}
base/ltfloat.dtx:  {\m@th\ensuremath{_{\mbox{\fontsize\sf@size\sf@size#1}}}}}
base/ltlogos.dtx:\DeclareRobustCommand{\LaTeXe}{\mbox{\m@th
base/ltmath.dtx:  \setbox\rootbox\hbox{$\m@th\scriptscriptstyle{#1}$}%
base/ltmath.dtx:  \setbox\z@\hbox{$\m@th#1\sqrtsign{#2}$}%
base/ltmath.dtx:  \setbox\z@\hbox{$\m@th#1{#2}$}\finph@nt}
base/ltmath.dtx:  \setbox\z@\hbox{$\m@th#1{#2}$}%
base/ltmath.dtx:\DeclareRobustCommand*\cases[1]{\left\{\,\vcenter{\normalbaselines\m@th
base/ltmath.dtx:\DeclareRobustCommand*\matrix[1]{\null\,\vcenter{\normalbaselines\m@th
base/ltmath.dtx:\def\bordermatrix#1{\begingroup \m@th
base/ltmath.dtx:\def\displ@y{\global\dt@ptrue\openup\jot\m@th
base/ltmath.dtx:   \m@th
base/ltmath.dtx:                    \hb@xt@\linewidth\bgroup $\m@th\displaystyle %$
base/ltmath.dtx:                    \hb@xt@\linewidth\bgroup $\m@th\displaystyle %$
base/ltmath.dtx:       \hb@xt@\linewidth\bgroup $\m@th% $
base/ltmath.dtx:    \global\@eqnswtrue\m@th
base/ltplain.dtx:\def\m@th{\mathsurround\z@}
base/ltplain.dtx:\def\mathhexbox#1#2#3{\mbox{$\m@th \mathchar"#1#2#3$}}
base/ltsect.dtx:     \leaders\hbox{$\m@th
base/lttab.dtx:\def\@tabarray{\m@th\@ifnextchar[\@array{\@array[c]}}
base/slides.dtx:\newcommand\labelitemi{$\m@th\bullet$}
base/slides.dtx:\newcommand\labelitemiii{$\m@th\ast$}
base/slides.dtx:\newcommand\labelitemiv{$\m@th\cdot$}
base/slides.dtx:\def\@mathbox#1#2#3{\setbox#2\hbox{$\m@th#1{#3}$}}
base/slides.dtx:  \@xunderline{#1}\else $\m@th\@xunderline{\hbox{#1}}$\relax\fi}
base/slides.dtx:\def\r@@t#1#2{\setbox\z@\hbox{$\m@th#1\@xysqrt#1{#2}$}%
required/amsmath/ams-internal.txt:\m@th
required/amsmath/ams-internal.txt:\m@th$
required/amsmath/amsbsy.dtx:    {\hbox{$\m@th\displaystyle#1$}}%
required/amsmath/amsbsy.dtx:    {\hbox{$\m@th\textstyle#1$}}%
required/amsmath/amsbsy.dtx:    {\hbox{$\m@th\scriptstyle#1$}}%
required/amsmath/amsbsy.dtx:    {\hbox{$\m@th\scriptscriptstyle#1$}}}%
required/amsmath/amsbsy.dtx:\def\pmb@#1#2{\setbox8\hbox{$\m@th#1{#2}$}%
required/amsmath/amsbsy.dtx:  \setboxz@h{$\m@th#1\mkern.5mu$}\pmbraise@\wdz@
required/amsmath/amsbsy.dtx:    \setbox\tw@\hbox{$#1\m@th$}\kern-\wd\tw@
required/amsmath/amsbsy.dtx:    ${}#1{}\m@th$}%
required/amsmath/amscd.dtx:  \def\rightarrowfill@#1{\m@th\setboxz@h{$#1-$}\ht\z@\z@
required/amsmath/amscd.dtx:  \def\leftarrowfill@#1{\m@th\setboxz@h{$#1-$}\ht\z@\z@
required/amsmath/amscd.dtx:  \def\leftrightarrowfill@#1{\m@th\setboxz@h{$#1-$}\ht\z@\z@
required/amsmath/amscd.dtx:  &\hfill$\m@th##$\hfill\crcr
required/amsmath/amscd.dtx:  \setboxz@h{$\m@th\scriptstyle\;{#1}\;\;$}%
required/amsmath/amscd.dtx:  \@ifnotempty{#2}{\setbox\@ne\hbox{$\m@th\scriptstyle\;{#2}\;\;$}%
required/amsmath/amscd.dtx:  \setboxz@h{$\m@th\scriptstyle\;\;{#1}\;$}%
required/amsmath/amscd.dtx:  \@ifnotempty{#2}{\setbox\@ne\hbox{$\m@th\scriptstyle\;\;{#2}\;$}%
required/amsmath/amscd.dtx:\atdef@ A#1A#2A{\CD@check{A..A..A}{\llap{$\m@th\vcenter{\hbox
required/amsmath/amscd.dtx:  \rlap{$\m@th\vcenter{\hbox{$\scriptstyle#2$}}$}&&}}
required/amsmath/amscd.dtx:\atdef@ V#1V#2V{\CD@check{V..V..V}{\llap{$\m@th\vcenter{\hbox
required/amsmath/amscd.dtx:  \rlap{$\m@th\vcenter{\hbox{$\scriptstyle#2$}}$}&&}}
required/amsmath/amscd.dtx:%\def\pretend#1\haswidth#2{\setboxz@h{$\m@th\scriptstyle{#2}$}\hbox
required/amsmath/amscd.dtx:% to\wdz@{\hfill$\m@th\scriptstyle{#1}$\hfill}}
required/amsmath/amsldoc.tex:\renewcommand{\maketag@@@}[1]{\hbox{\m@th\normalsize\normalfont#1}}%
required/amsmath/amsmath.dtx:    \m@th$#2#3$}}
required/amsmath/amsmath.dtx:  \m@th$#2#3$}}
required/amsmath/amsmath.dtx: $\m@th\scriptscriptstyle{#1}$}%
required/amsmath/amsmath.dtx:\def\r@@t#1#2{\setboxz@h{$\m@th#1\sqrtsign{#2}$}%
required/amsmath/amsmath.dtx: \setbox\@ne\hbox{$\m@th#1\mskip\uproot@ mu$}%
required/amsmath/amsmath.dtx:\DeclareRobustCommand{\boxed}[1]{\fbox{\m@th$\displaystyle#1$}}
required/amsmath/amsmath.dtx: \DN@{$\m@th\@ldots\,
required/amsmath/amsmath.dtx:  $\m@th\thickmuskip0mu\medmuskip\thickmuskip\thinmuskip\thickmuskip
required/amsmath/amsmath.dtx: \noalign{\nointerlineskip}$\m@th\hfil#2#3\hfil$\crcr}}}
required/amsmath/amsmath.dtx: \vtop{\ialign{##\crcr$\m@th\hfil#2#3\hfil$\crcr
required/amsmath/amsmath.dtx:    \setbox\tw@\vbox{\m@th
required/amsmath/amsmath.dtx:    $\m@th\scriptstyle##$\hfil\crcr
required/amsmath/amsmath.dtx:    \m@th\scriptstyle##
required/amsmath/amsmath.dtx:  \ialign\bgroup\hfil$\m@th\scriptstyle##$\hfil&&\thickspace\hfil
required/amsmath/amsmath.dtx:  $\m@th\scriptstyle##$\hfil\crcr
required/amsmath/amsmath.dtx:  {\m@th\dotsspace@1.5mu\mkern-#1\dotsspace@
required/amsmath/amsmath.dtx:   \xleaders\hbox{$\m@th\mkern#1\dotsspace@.\mkern#1\dotsspace@$}%
required/amsmath/amsmath.dtx:\def\maketag@@@#1{\hbox{\m@th\normalfont#1}}
required/amsmath/amsmath.dtx:            $\m@th\displaystyle{##}$%
required/amsmath/amsmath.dtx:            $\m@th\displaystyle{{}##}$%
required/amsmath/amsmath.dtx:            \hfil\strut@$\m@th\displaystyle##$\hfil
required/amsmath/amsmath.dtx:        \setboxz@h{$\m@th\displaystyle{##}$}%
required/amsmath/amsmath.dtx:                \setboxz@h{$\m@th\displaystyle{##}$}%
required/amsmath/amsmath.dtx:%       &$\strut$\vrule\hfil$\m@th\displaystyle{\@lign#}$\vrule
required/amsmath/amsmath.dtx:%      \tabskip1pt&\vrule$\m@th\displaystyle{\@lign#}$\hfil\vrule
required/amsmath/amsmath.dtx:    \setboxz@h{\@lign$\m@th\displaystyle{##}$}%
required/amsmath/amsmath.dtx:   &\setboxz@h{\@lign$\m@th\displaystyle{{}##}$}%
required/amsmath/amsmath.dtx:      $\m@th\displaystyle{##}$%
required/amsmath/amsmath.dtx:     &$\m@th\displaystyle{{}##}$%
required/amsmath/amsmath.dtx:            $\m@th\displaystyle{}##\endmultline@math
required/amsmath/amsmath.dtx:                \setboxz@h{\@lign$\m@th\displaystyle{}##$}%
required/amsmath/amsmath.dtx:            \setboxz@h{$\m@th\displaystyle{}#1$}%
required/amsmath/amsmath.dtx:            \setbox\@ne\hbox{$\m@th\displaystyle#1$}%
required/amsmath/amsmath.dtx:            \setboxz@h{$\m@th\displaystyle{}#1$}%
required/amsmath/amsmath.dtx:            \setbox\@ne\hbox{$\m@th\displaystyle#1$}%
required/amsmath/amsmath.dtx:        \everymath\@emptytoks \m@th $\displaystyle
required/amsmath/amsopn.dtx:  \vtop{\m@th\ialign{##\cr
required/amsmath/amsopn.dtx:   \hbox{$#1\m@th\operator@font lim$}}}
required/amsmath/amsopn.dtx:\def\varlimsup@#1{\@@overline{\hbox{$#1\m@th\operator@font lim$}}}
required/amsmath/amstex.sty:  \m@th$#2#3$}}
required/amsmath/amstex.sty:\gdef\mathhexbox#1#2#3{\text{$\m@th\mathchar"#1#2#3$}}
required/amsmath/amstex.sty:    {\hbox{$\m@th\displaystyle#1$}}%
required/amsmath/amstex.sty:    {\hbox{$\m@th\textstyle#1$}}%
required/amsmath/amstex.sty:    {\hbox{$\m@th\scriptstyle#1$}}%
required/amsmath/amstex.sty:    {\hbox{$\m@th\scriptscriptstyle#1$}}}%
required/amsmath/amstex.sty:\def\pmb@#1#2{\setbox8\hbox{$\m@th#1{#2}$}%
required/amsmath/amstex.sty:  \setboxz@h{$\m@th#1\mkern.5mu$}\pmbraise@\wdz@
required/amsmath/amstex.sty:    \setbox\tw@\hbox{$#1\m@th$}\kern-\wd\tw@
required/amsmath/amstex.sty:    ${}#1{}\m@th$}%
required/amsmath/amstex.sty: \hfil$#1\m@th\operator@font lim$\hfil\crcr
required/amsmath/amstex.sty:   \hbox{$#1\m@th\operator@font lim$}}}}
required/amsmath/amstex.sty:  {\hbox{$#1\m@th\operator@font lim$}}}}
required/amsmath/amstex.sty:  \setbox\z@\hbox{$\displaystyle{\vphantom{#3}}#1{#3}\m@th$}%
required/amsmath/amstex.sty:  \setbox\tw@\hbox{$\displaystyle{#3}#2\m@th$}%
required/amsmath/amstex.sty:\def\rightarrowfill@#1{\m@th\setboxz@h{$#1\relbar$}\ht\z@\z@
required/amsmath/amstex.sty:\def\leftarrowfill@#1{\m@th\setboxz@h{$#1\relbar$}\ht\z@\z@
required/amsmath/amstex.sty:\def\leftrightarrowfill@#1{\m@th\setboxz@h{$#1\relbar$}\ht\z@\z@
required/amsmath/amstex.sty: \noalign{\kern-\ex@\nointerlineskip}$\m@th\hfil#2#3\hfil$\crcr}}}
required/amsmath/amstex.sty: \vtop{\ialign{##\crcr$\m@th\hfil#2#3\hfil$\crcr
required/amsmath/amstex.sty: \DN@{$\m@th\@ldots\,
required/amsmath/amstex.sty: \setboxz@h{\unbracefonts@$\m@th\mathgroup\thefam@\relax#2$}%
required/amsmath/amstex.sty:    $\m@th\mathgroup\thefam@\relax#2\theskewchar@$}
required/amsmath/amstex.sty:  \setbox\tw@\hbox{$\m@th\ifnum\skewcharcount@=\m@ne\else
required/amsmath/amstex.sty:\def\boxed#1{\fbox{\m@th$\displaystyle#1$}}
required/amsmath/amstex.sty:\def\maketag@@@#1{\hbox{\m@th\normalfont#1}}
required/amsmath/amstex.sty: \vbox\bgroup\ialign\bgroup\hfil$\m@th\scriptstyle{##}$\hfil\crcr}
required/amsmath/amstex.sty: \ialign\bgroup\hfil$\m@th\scriptstyle{##}$\hfil&&\thickspace\hfil
required/amsmath/amstex.sty: $\m@th\scriptstyle{##}$\hfil\crcr}
required/amsmath/amstex.sty:  {\m@th\dotsspace@1.5mu\mkern-#1\dotsspace@
required/amsmath/amstex.sty:   \xleaders\hbox{$\m@th\mkern#1\dotsspace@.\mkern#1\dotsspace@$}%
required/amsmath/amstex.sty:   \ialign\bgroup\hfil\strut@$\m@th\displaystyle{##}$&%
required/amsmath/amstex.sty:    $\m@th\displaystyle{{}##}$\hfil\crcr}
required/amsmath/amstex.sty:\def\doat@#1{\toks@{\hfil\strut@$\m@th
required/amsmath/amstex.sty:  \displaystyle{\the\hashtoks@}$&$\m@th\displaystyle
required/amsmath/amstex.sty: \loop\ifnum\atcount@>\z@\toks@\expandafter{\the\toks@&\hfil$\m@th
required/amsmath/amstex.sty:  \displaystyle{\the\hashtoks@}$&$\m@th
required/amsmath/amstex.sty:  \bgroup\hfil\strut@$\m@th\displaystyle##$\hfil\crcr
required/amsmath/amstex.sty:    \halign{\setboxz@h{$\m@th\displaystyle{\@lign##}$}%
required/amsmath/amstex.sty:     &\setboxz@h{$\m@th\displaystyle{{}\@lign##}$}%
required/amsmath/amstex.sty:\def\displ@y{\global\dt@ptrue\openup\jot\m@th
required/amsmath/amstex.sty:        \setboxz@h{\global\tag@false$\m@th\displaystyle{\@lign##}$}%
required/amsmath/amstex.sty:       &\setboxz@h{$\m@th\displaystyle{{}\@lign##}$}%
required/amsmath/amstex.sty:        \setboxz@h{\global\tag@false$\m@th\displaystyle{\@lign##}$}%
required/amsmath/amstex.sty:       &\setboxz@h{$\m@th\displaystyle{{}\@lign##}$}%
required/amsmath/amstex.sty:        $\m@th\displaystyle\Let@
required/amsmath/amstex.sty:        $\m@th\displaystyle\Let@
required/amsmath/amstex.sty: \toks@{\hfil\strut@$\m@th\displaystyle{\@lign\the\hashtoks@}$%
required/amsmath/amstex.sty:  &$\m@th\displaystyle{{}\@lign\the\hashtoks@}$\hfil
required/amsmath/amstex.sty: \toks@\expandafter{\the\toks@&\hfil$\m@th\displaystyle{\@lign
required/amsmath/amstex.sty:  &$\m@th\displaystyle{{}\@lign\the\hashtoks@}$\hfil\ifxat@
required/amsmath/amstex.sty: \displ@y\setbox\savealignat@\hbox{$\m@th\displaystyle\Let@
required/amsmath/amstex.sty: $\m@th\displaystyle{\the\hashtoks@}$&%
required/amsmath/amstex.sty: $\m@th\displaystyle{{}\the\hashtoks@}$\hfil\tabskip\@centering&}%
required/amsmath/amstex.sty:   {\the\toks@&\hfil$\m@th\displaystyle{\the\hashtoks@}$%
required/amsmath/amstex.sty:  \tabskip\z@skip&$\m@th\displaystyle{{}\the\hashtoks@}$\hfil
required/amsmath/amstex.sty: \halign{\setboxz@h{$\m@th\displaystyle{##}$}\global\gwidth@\wdz@
required/amsmath/amstex.sty:        \setboxz@h{\global\tag@false$\m@th\displaystyle{##}$}%
required/amsmath/amstex.sty:        \setboxz@h{\global\tag@false$\m@th\displaystyle{##}$}%
required/amsmath/amstex.sty:   $\m@th\displaystyle{##}$&$\m@th\displaystyle{{}##}$\hfill\crcr}
required/amsmath/amstex.sty:  {$\m@th\@lign\displaystyle{}##$}\global\mwidth@\wdz@
required/amsmath/amstex.sty:  {$\m@th\@lign\displaystyle{}##$}\ifonecr@\global\mwidth@\wdz@
required/amsmath/amstex.sty:                \setboxz@h{$\m@th\displaystyle{}##1$}%
required/amsmath/amstex.sty:                \setbox\@ne\hbox{$\m@th\displaystyle##1$}%
required/amsmath/amstex.sty:            \strut@$\m@th\displaystyle
required/amsmath/amstex.sty:            \setboxz@h{$\m@th\displaystyle{}##1$}%
required/amsmath/amstex.sty:            \setbox\@ne\hbox{$\m@th\displaystyle##1$}%
required/amsmath/amstex.sty:            \strut@$\m@th\displaystyle
required/amsmath/amstex.sty:  \setboxz@h{$\m@th\scriptstyle\;{#1}\;\;$}%
required/amsmath/amstex.sty:  \@ifnotempty{#2}{\setbox\@ne\hbox{$\m@th\scriptstyle\;{#2}\;\;$}%
required/amsmath/amstex.sty:  \setboxz@h{$\m@th\scriptstyle\;\;{#1}\;$}%
required/amsmath/amstex.sty:  \@ifnotempty{#2}{\setbox\@ne\hbox{$\m@th\scriptstyle\;\;{#2}\;$}%
required/amsmath/amstex.sty: $\m@th\scriptscriptstyle{#1}$}%
required/amsmath/amstex.sty:\def\r@@t#1#2{\setboxz@h{$\m@th#1\@@sqrt{#2}$}%
required/amsmath/amstex.sty: \setbox\@ne\hbox{$\m@th#1\mskip\uproot@ mu$}%
required/amsmath/amstex.sty: {\,\,\smash[b]{\hbox{\lower4\ex@\hbox{$\m@th\widehat{\null}$}}}}%
required/amsmath/amstex.sty: {\,\smash[b]{\hbox{\lower3\ex@\hbox{$\m@th\hat{\null}$}}}}}}
required/amsmath/amstex.sty:      \hbox{$\m@th#2$}%
required/amsmath/amstext.dtx:\gdef\mathhexbox#1#2#3{\text{$\m@th\mathchar"#1#2#3$}}
required/amsmath/amsxtra.dtx: {\,\,\smash[b]{\hbox{\lower4\ex@\hbox{$\m@th\widehat{\null}$}}}}%
required/amsmath/amsxtra.dtx: {\,\smash[b]{\hbox{\lower3\ex@\hbox{$\m@th\hat{\null}$}}}}}}
required/amsmath/amsxtra.dtx:      \hbox{$\m@th#2$}%
required/latex-lab/latex-lab-math.dtx:        \tl_if_in:nnF {#2} { \m@th }
required/latex-lab/latex-lab-math.dtx:            \tl_if_in:nnTF {#1} { \m@th }
required/latex-lab/latex-lab-math.dtx:% \begin{macro}{\@@_m@th:, \m@th}
required/latex-lab/latex-lab-math.dtx:\cs_new_eq:NN \@@_m@th: \m@th
required/latex-lab/latex-lab-math.dtx:\cs_gset_protected:Npn \m@th
required/latex-lab/latex-lab-math.dtx:      \hbox{\m@th\normalfont#1}%
required/latex-lab/latex-lab-math.dtx:      \hbox{\m@th\normalfont#1}%
required/latex-lab/latex-lab-minipage.dtx:    \if@pboxsw \m@th$\fi
required/latex-lab/latex-lab-table.dtx:  \m@th
required/latex-lab/latex-lab-table.dtx:  \m@th\let\par\@empty
required/latex-lab/latex-lab-toc-kernel-changes.dtx:       \leaders\hbox{$\m@th
required/tools/array.dtx:%    \PlainTeX--macro =\m@th= does this.
required/tools/array.dtx:  \m@th
required/tools/array.dtx:%    any =\mathsurround= so we cancel that with =\m@th=.
required/tools/array.dtx:\def\endtabular{\endarray\m@th $\egroup}
required/tools/bm.dtx:  \mathchoice{\hbox{#1$\displaystyle\m@th#2$}}%
required/tools/bm.dtx:             {\hbox{#1$\textstyle\m@th#3$}}%
required/tools/bm.dtx:             {\hbox{#1$\scriptstyle\m@th#4$}}%
required/tools/bm.dtx:             {\hbox{#1$\scriptscriptstyle\m@th#5$}}}
required/tools/bm.dtx:  \setbox\tw@\hbox{$\m@th\mkern.4mu$}%
required/tools/bm.dtx:  \setbox\z@\hbox{$\m@th#1#3$}%
required/tools/dcolumn.dtx:  \m@th
required/tools/longtable.dtx:  \m@th\let\par\@empty
required/tools/xspace.dtx:  \if b\expandafter\@car\f@series\@nil\boldmath\fi$\m@th
support/etex.sty:  $\m@th\varepsilon$-\TeX}
``` 