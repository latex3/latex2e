# Packages that alter \@makefntext ...

Scan of TeXlive 2022  for checking ... may not be longer accurate and may contain a few false positives

```

% ./footmisc/footmisc.sty

% latex def (used with para option)



  \long\def\@makefntext#1{%
    \ifFN@hangfoot
      \bgroup
      \setbox\@tempboxa\hbox{%
        \ifdim\footnotemargin>0pt
          \hb@xt@\footnotemargin{\@makefnmark\hss}%
        \else
          \@makefnmark
        \fi
      }%
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      \footnotesize
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      \parskip\hangfootparskip\relax
      \parindent\hangfootparindent\relax
    \else
      \parindent1em
      \noindent
      \ifdim\footnotemargin>\z@
        \hb@xt@ \footnotemargin{\hss\@makefnmark}%
      \else
        \ifdim\footnotemargin=\z@
          \llap{\@makefnmark}%
        \else
          \llap{\hb@xt@ -\footnotemargin{\@makefnmark\hss}}%
        \fi
      \fi
    \fi
    \footnotelayout#1%
    \ifFN@hangfoot
      \par\egroup
    \fi
  }




---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/aastex/aastex631.cls
---------------------------------------------------------
\def\@makefntext#1{\hsize=\columnwidth\mbox{}\hspace*{3mm}\@makefnmark~#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/paper/paper.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
...
  \long\def\@makefntext#1{%
        \leftskip 2.0em%
        \noindent
        \hbox to 0em{\hss\@makefnmark\kern 0.25em}#1}
...
  \long\def\@makefntext#1{%
      \parindent 1em%
      \noindent
      \hbox to 1.8em{\hss\@makefnmark\kern 0.25em}#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex4-1/aip4-1.rtx
---------------------------------------------------------
\def\@makefntext#1{%
 \def\baselinestretch{1}%
 \leftskip1em%
 \parindent1em%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex4-1/aps4-1.rtx
---------------------------------------------------------
\long\def\@makefntext#1{%
 \def\baselinestretch{1}%
 \leftskip1em%
 \parindent1em%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex4-1/revtex4-1.cls
---------------------------------------------------------
\def\@makefntext#1{%
  \def\baselinestretch{1}%
  \parindent1em%
  \noindent
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/smflatex/smfart.cls
---------------------------------------------------------
\def\@makefntext{\parindent0pt\sloppy\indent\@makefnmark}
\hfuzz=1pt \vfuzz=\hfuzz
\def\sloppy{\tolerance9999 \emergencystretch 3em\relax}
\setcounter{topnumber}{4}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/smflatex/smfbook.cls
---------------------------------------------------------
\def\@makefntext{\parindent0pt\sloppy\indent\@makefnmark}
\hfuzz=1pt \vfuzz=\hfuzz
\def\sloppy{\tolerance9999 \emergencystretch 3em\relax}
\setcounter{topnumber}{4}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/koma-script/scrlttr2.cls
---------------------------------------------------------
    \long\def\@makefntext##1{%
      \raggedfootnote
      \leftskip #2
      \l@addto@macro\@trivlist{%
...
    \long\def\@makefntext##1{%
      \setlength{\@tempdimc}{#3}%
      \def\@tempa{#1}\ifx\@tempa\@empty
        \@setpar{\@@par
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/koma-script/scrextend.sty
---------------------------------------------------------
    \long\def\@makefntext##1{%
      \raggedfootnote
      \leftskip #2
      \l@addto@macro\@trivlist{%
...
    \long\def\@makefntext##1{%
      \setlength{\@tempdimc}{#3}%
      \def\@tempa{#1}\ifx\@tempa\@empty
        \@setpar{\@@par
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/koma-script/scrreprt.cls
---------------------------------------------------------
    \long\def\@makefntext##1{%
      \raggedfootnote
      \leftskip #2
      \l@addto@macro\@trivlist{%
...
    \long\def\@makefntext##1{%
      \setlength{\@tempdimc}{#3}%
      \def\@tempa{#1}\ifx\@tempa\@empty
        \@setpar{\@@par
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/koma-script/scrartcl.cls
---------------------------------------------------------
    \long\def\@makefntext##1{%
      \raggedfootnote
      \leftskip #2
      \l@addto@macro\@trivlist{%
...
    \long\def\@makefntext##1{%
      \setlength{\@tempdimc}{#3}%
      \def\@tempa{#1}\ifx\@tempa\@empty
        \@setpar{\@@par
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/koma-script/scrbook.cls
---------------------------------------------------------
    \long\def\@makefntext##1{%
      \raggedfootnote
      \leftskip #2
      \l@addto@macro\@trivlist{%
...
    \long\def\@makefntext##1{%
      \setlength{\@tempdimc}{#3}%
      \def\@tempa{#1}\ifx\@tempa\@empty
        \@setpar{\@@par
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/uafthesis/uafthesis.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
    \parindent 1em%
    \noindent
    \hbox to 1.8em{\hss\@makefnmark}#1}
...
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/uwthesis/uwthesis.cls
---------------------------------------------------------
\long\def\@makefntext#1{\parindent 1em\noindent \hangindent\parindent
 \def\baselinestretch{1.0}\normalfont
 \hb@xt@1.8em{\hss\@makefnmark}#1}
 
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/uwa-letterhead/uwa-letterhead.sty
---------------------------------------------------------
        \long\def\@makefntext##1{\parindent 1em\noindent
                \hb@xt@1.8em{%
                        \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
        \global\@topnum\z@
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/onrannual/onrannual.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/thuthesis/thuthesis.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
  \begingroup
    % 序号取消上标
    \def\@makefnmark{\hbox{\normalfont\@thefnmark}}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/gaceta/gaceta.cls
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/jpsj/jpsj2.cls
---------------------------------------------------------
    \long\def\@makefntext##1{%\vskip2\p@ 
	        \hangindent8\p@ \hangafter1 \noindent
            \hb@xt@1em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/gmutils/gmtypos.sty
---------------------------------------------------------
  \ampulexdef#1{\long\def\@makefntext}%
  \if@twocolumn{\gmu@ATfootnotes\if@twocolumn}% Ampulex redefinition
  % of \incs{maketitle} for \pk{mwcls}.
}
...
  \long\pdef\@makefntext##1{%
    \ifdefined\@parindent \parindent\@parindent
    \else \parindent 1em\relax
    \fi
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/resphilosophica/resphilosophica.cls
---------------------------------------------------------
\def\@makefntext{\noindent\@makefnmark
  \if@enddoc\else
    \immediate\write\@mainaux%
    {\string\xdef\string\lastfootnote@page{\the\c@page}}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/tools/ftnright.sty
---------------------------------------------------------
\long\def\@makefntext#1{\parindent 1em
   \noindent\hbox to 2em{}%
   \llap{\@thefnmark.\,\,}#1}
\setlength{\skip\footins}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/elegantnote/elegantnote.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
         \hb@xt@1.8em{%
           \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ntgclass/rapport1.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent\z@
         \def\labelitemi{\textendash}\@revlabeltrue
         \leavevmode\@textsuperscript{\@thefnmark}\kern1em\relax ##1}
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
...
    \long\def\@makefntext{\@xmakefntext{%
      \@textsuperscript{\normalfont\@thefnmark}}}%
    \if@twocolumn
      \ifnum \col@number=\@ne
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ntgclass/brief.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
  \noindent\hb@xt@\leftmargini{\normalfont\@thefnmark.\hfil}#1}
\newcommand*\dutchbrief{%
  \def\uwbrieftekst{Uw brief van}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ntgclass/boek.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent\z@
         \def\labelitemi{\textendash}\@revlabeltrue
         \leavevmode\@textsuperscript{\@thefnmark}\kern1em\relax ##1}
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ntgclass/rapport3.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent\z@
         \def\labelitemi{\textendash}\@revlabeltrue
         \leavevmode\@textsuperscript{\@thefnmark}\kern1em\relax ##1}
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
...
    \long\def\@makefntext{\@xmakefntext{%
      \@textsuperscript{\normalfont\@thefnmark}}}%
    \if@twocolumn
      \ifnum \col@number=\@ne
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ntgclass/boek3.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent\z@
         \def\labelitemi{\textendash}\@revlabeltrue
         \leavevmode\@textsuperscript{\@thefnmark}\kern1em\relax ##1}
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ntgclass/artikel2.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent\z@
         \def\labelitemi{\textendash}\@revlabeltrue
         \leavevmode\@textsuperscript{\@thefnmark}\kern1em\relax ##1}
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
...
    \long\def\@makefntext##1{\parindent\z@
      \def\labelitemi{\textendash}%
      \leavevmode\hb@xt@.5\unitindent{%
        \@textsuperscript{\normalfont\@thefnmark}\hfil}##1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ntgclass/artikel3.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent\z@
         \def\labelitemi{\textendash}\@revlabeltrue
         \leavevmode\@textsuperscript{\@thefnmark}\kern1em\relax ##1}
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
...
    \long\def\@makefntext{\@xmakefntext{%
      \@textsuperscript{\normalfont\@thefnmark}}}%
    \if@twocolumn
      \ifnum \col@number=\@ne
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ntgclass/artikel1.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent\z@
         \def\labelitemi{\textendash}\@revlabeltrue
         \leavevmode\@textsuperscript{\@thefnmark}\kern1em\relax ##1}
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
...
    \long\def\@makefntext{\@xmakefntext{%
      \@textsuperscript{\normalfont\@thefnmark}}}%
    \if@twocolumn
      \ifnum \col@number=\@ne
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/cdpbundl/letteracdp.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
    \noindent
    \hangindent 5\p@
    \hb@xt@5\p@{\hss\@makefnmark}#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/courseoutline/courseoutline.cls
---------------------------------------------------------
\setlength {\evensidemargin}{0.0in}	% right margin  1.0 inch\setlength {\textwidth}{6.5in}	 	% right margin  1.0 inch\setlength {\footnotesep}{14pt}	 	% baseline skip for fn's 1st line\setlength {\headheight}{0.2in}	 	% make room for header\setlength {\headsep}{0.2in}		 	% modest header separation\setlength {\parskip}{0.2in}		 	% set a paragraph skip\setlength {\parindent}{0.0in}	 	% no para indents%% redefine the titlematter%\renewcommand\maketitle{\par  \begingroup    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%    \long\def\@makefntext##1{\parindent 1em\noindent            \hb@xt@1.8em{%                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%      \newpage      \global\@topnum\z@   % Prevents figures from going at top of page.      \@maketitle    \thispagestyle{empty}\@thanks  \endgroup  \setcounter{footnote}{0}%  \global\let\thanks\relax  \global\let\maketitle\relax  \global\let\@maketitle\relax  \global\let\@thanks\@empty  %
  \global\let\university\@empty
  \global\let\department\@empty
  \global\let\coursename\@empty
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/stellenbosch/ustitle.sty
---------------------------------------------------------
        \long\def\@makefntext##1{\parindent 1em\noindent
                \hb@xt@1.8em{%
                    \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
        \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/chextras/chextras.sty
---------------------------------------------------------
 \long\def\@makefntext#1{\settowidth\@tempdima{.\kern\marginparsep}
 \parindent\z@
 \advance\parindent-\@tempdima
 \rule\z@\footnotesep
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/aiaa/aiaa-tc.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/oberdiek/enparen.sty
---------------------------------------------------------
    \long\def\@makefntext##1{%
      \enparen@org@makefntext{%
        \enparenBeginContext{footnote}%
        ##1%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/cleveref/cleveref.sty
---------------------------------------------------------
\long\def\@makefntext{%
  \cref@constructprefix{footnote}{\cref@result}%
  \protected@edef\cref@currentlabel{%
    [footnote][\arabic{footnote}][\cref@result]%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ametsoc/ametsoc.cls
---------------------------------------------------------
     \long\def\@makefntext##1{\parindent 1em\footnotesize\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1
     \vskip1sp
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/combine/combine.cls
---------------------------------------------------------
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hb@xt@1.8em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/active-conf/active-conf.cls
---------------------------------------------------------
      \long\def\@makefntext##1{\parindent 1em\noindent##1}%
      \@note
      \setcounter{footnote}{0}
      \global\def\note##1{%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/iso/isov2.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
    \parindent 1em%
    \noindent
    \hbox to 1.8em{\hss\@makefnmark}#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/elegantpaper/elegantpaper.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@0.1em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/fnpara/fnpara.sty
---------------------------------------------------------
\long\def\@makefntext#1{%
%    \parindent 1em%
%    \noindent
%    \hb@xt@1.8em{\hss\@makefnmark}#1
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/bxjscls/bxjsarticle.cls
---------------------------------------------------------
      \long\def\@makefntext##1{\advance\leftskip 3\jsZw
        \parindent 1\jsZw\noindent
        \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3\jsZw}##1}%
      \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/bxjscls/bxjsbook.cls
---------------------------------------------------------
      \long\def\@makefntext##1{\advance\leftskip 3\jsZw
        \parindent 1\jsZw\noindent
        \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3\jsZw}##1}%
      \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/bxjscls/bxjsslide.cls
---------------------------------------------------------
      \long\def\@makefntext##1{\advance\leftskip 3\jsZw
        \parindent 1\jsZw\noindent
        \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3\jsZw}##1}%
      \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/bxjscls/bxjsreport.cls
---------------------------------------------------------
      \long\def\@makefntext##1{\advance\leftskip 3\jsZw
        \parindent 1\jsZw\noindent
        \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3\jsZw}##1}%
      \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/lettre/lettre.cls
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/titlefoot/titlefoot.sty
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex/aip4-2.rtx
---------------------------------------------------------
\def\@makefntext#1{%
 \def\baselinestretch{1}%
 \leftskip1em%
 \parindent1em%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex/aps4-2.rtx
---------------------------------------------------------
\long\def\@makefntext#1{%
 \def\baselinestretch{1}%
 \leftskip1em%
 \parindent1em%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex/revtex4-2.cls
---------------------------------------------------------
\def\@makefntext#1{%
  \def\baselinestretch{1}%
  \parindent1em%
  \noindent
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex/sor4-2.rtx
---------------------------------------------------------
\def\@makefntext#1{%
 \def\baselinestretch{1}%
 \leftskip1em%
 \parindent1em%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex/aapm4-2.rtx
---------------------------------------------------------
\def\@makefntext#1{%
 \def\baselinestretch{1}%
 \leftskip1em%
 \parindent1em%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/lni/lni.cls
---------------------------------------------------------
 \long\def\@makefntext##1{%
 \@setpar{\@@par
 \@tempdima = \hsize
 \advance\@tempdima -1em
...
\long\def\@makefntext#1{%
    \parindent \fnindent%
    \leftskip \fnindent% Einrückung vor der footnotemark
    \noindent
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/arabtex/arabrep.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{\hss\@makefnmark}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/arabtex/arabrep1.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{\hss\@makefnmark}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/llncs/llncs.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
    \parindent \fnindent%
    \leftskip \fnindent%
    \noindent
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/frankenstein/blkcntrl.sty
---------------------------------------------------------
\defcommand\@makefntext [1] {%
  \setlength\parindent{\@ne em}%
  \noindent
  \hb@xt@ 1.8em{\hss\@makefnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/frankenstein/blkcntrl.stq
---------------------------------------------------------
\defcommand\@makefntext [1] {%
  \setlength\parindent{\@ne em}%
  \noindent
  \hb@xt@ 1.8em{\hss\@makefnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/cmpj/cmpj2.sty
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/cmpj/cmpj3.sty
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/cmpj/cmpj.sty
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/pracjourn/pracjourn.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
...
\def\@makefntext#1{%
  \parindent 0em\relax
  \makebox[1.5em][l]{\normalfont\footnotesize\@thefnmark.}#1}
\def\@ifx@empty#1{% Implicit #2#3
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/extsizes/extbook.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/extsizes/extletter.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
    \noindent
    \hangindent 5\p@
    \hb@xt@5\p@{\hss\@makefnmark}#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/extsizes/extarticle.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/extsizes/extproc.cls
---------------------------------------------------------
     \long\def\@makefntext##1{\parindent 1em\noindent
             \hb@xt@1.8em{%
                 \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
   \twocolumn[\@maketitle]%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/extsizes/extreport.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/h2020proposal/h2020proposal.cls
---------------------------------------------------------
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hb@xt@1.8em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \newpage
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/biblatex-gb7714-2015/gb7714-2015ms.bbx
---------------------------------------------------------
    \long\def\@makefntext##1{%增加了脚注标记与正文的间隔
    \parindent 1em\noindent \hb@xt@ 0em{\hss \@makefnmark\makebox[\footbiblabelsep]{}}##1}

    }
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/biblatex-gb7714-2015/gb7714-2015mx.bbx
---------------------------------------------------------
    \long\def\@makefntext##1{%增加了脚注标记与正文的间隔
    \parindent 1em\noindent \hb@xt@ 0em{\hss \@makefnmark\makebox[\footbiblabelsep]{}}##1}

    }
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/biblatex-gb7714-2015/gb7714-2015ay.bbx
---------------------------------------------------------
    \long\def\@makefntext##1{%增加了脚注标记与正文的间隔
    \parindent 1em\noindent \hb@xt@ 0em{\hss \@makefnmark\makebox[\footbiblabelsep]{}}##1}

    }
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/biblatex-gb7714-2015/gb7714-2015.bbx
---------------------------------------------------------
    \long\def\@makefntext##1{%增加了脚注标记与正文的间隔
    \parindent 1em\noindent \hb@xt@ 0em{\hss \@makefnmark\makebox[\footbiblabelsep]{}}##1}

    }
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/suftesi/suftesi.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
     \long\def\@makefntext##1{\parindent 1em\noindent
             \hb@xt@1.8em{%
                 \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
     \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/mwcls/mwrep.cls
---------------------------------------------------------
    \long\def\@makefntext##1{
        \parindent\@parindent
        \@textsuperscript{\normalfont\@thefnmark}\enspace##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/mwcls/mwart.cls
---------------------------------------------------------
    \long\def\@makefntext##1{
        \parindent\@parindent
        \@textsuperscript{\normalfont\@thefnmark}\enspace##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/mwcls/mwbk.cls
---------------------------------------------------------
    \long\def\@makefntext##1{
        \parindent\@parindent
        \@textsuperscript{\normalfont\@thefnmark}\enspace##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/tugboat/ltugboat.cls
---------------------------------------------------------
\long\def\@makefntext#1{\parindent 1em\noindent\hb@xt@2em{}%
  \llap{\@makefnmark}\null$\mskip5mu$#1}

%% \long\def\@makefntext#1{\parindent 1em
...
  \def\@makefntext##1{##1}%
  \footnotetext{\noindent #1#2}%
  \endgroup
}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ptptex/ptptex.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
\parindent 1.5em\noindent \footnotesize %
\hbox to 2.5em{\hss$^{\@thefnmark}$}\hskip3\p@#1}
\gdef\@thanks{}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/aguplus/aguplus.sty
---------------------------------------------------------
         \long\def\@makefntext##1{##1}
         \footnotetext{{\parindent=1em\indent
             \let\@elt=\par\@titlenote}}
       \fi
...
         \long\def\@makefntext##1{##1}
         \footnotetext{{\parindent=10pt\indent
             \parskip=6pt\let\@elt=\par\@titlenote}}
       \fi
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/aguplus/aguplus.cls
---------------------------------------------------------
         \long\def\@makefntext##1{##1}
         \footnotetext{{\parindent=1em\indent
             \let\@elt=\par\@titlenote}}
       \fi
...
         \long\def\@makefntext##1{##1}
         \footnotetext{{\parindent=10pt\indent
             \parskip=6pt\let\@elt=\par\@titlenote}}
       \fi
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/protocol/protocol.cls
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/cje/cje.cls
---------------------------------------------------------
    \long\def\@makefntext##1{%\parindent 1em
            \noindent
%            \hb@xt@1.8em{%
%                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
...
\long\def\@makefntext#1{\raggedright\@setpar{\@@par\@tempdima \hsize
 \advance\@tempdima-\@footindent
 \parshape \@ne \@footindent \@tempdima}\par
 \noindent \hbox to \z@{\hss\@thefnmark\enskip}#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/tufte-latex/tufte-common.def
---------------------------------------------------------
\long\def\@makefntext#1{\@textsuperscript{\@tufte@sidenote@font\tiny\@thefnmark}\,\footnotelayout#1}

% Set the in-text footnote mark in the same typeface as the body text itself.
\def\@makefnmark{\hbox{\@textsuperscript{\normalfont\footnotesize\@thefnmark}}}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/amscls/amsdtx.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/amscls/amsbook.cls
---------------------------------------------------------
\def\@makefntext{\indent\@makefnmark}
\long\def\@footnotetext#1{%
  \insert\footins{%
    \normalfont\footnotesize
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/amscls/amsproc.cls
---------------------------------------------------------
\def\@makefntext{\indent\@makefnmark}
\long\def\@footnotetext#1{%
  \insert\footins{%
    \normalfont\footnotesize
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/amscls/amsart.cls
---------------------------------------------------------
\def\@makefntext{\indent\@makefnmark}
\long\def\@footnotetext#1{%
  \insert\footins{%
    \normalfont\footnotesize
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/quantumarticle/quantumarticle.cls
---------------------------------------------------------
	\long\def\@makefntext##1{\parindent 1em\noindent
	\hb@xt@1.8em{%
	\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
	\ifbool{@twocolumn}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ltxmisc/iagproc.cls
---------------------------------------------------------
   \long\def\@makefntext##1{\parindent 1em\noindent
           \hb@xt@1.8em{%
               \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
 \twocolumn[\@maketitle]%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/acmart/acmart.cls
---------------------------------------------------------
\def\@makefntext{\noindent\@makefnmark}
\if@ACM@sigchiamode
\long\def\@footnotetext#1{\marginpar{%
    \reset@font\small
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/memoir/memoir.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\makethanksmark ##1}
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/footnotebackref/footnotebackref.sty
---------------------------------------------------------
% than redefine the \@makefntext and \@makefnmark
% The \@makefnmark macro is redefined in the space of
% the \@makefntext macro
% So the footnote numbers in the main text are not influenced
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/bangtex/barticle.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/bangtex/bletter.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
    \noindent
    \hangindent 5\p@
    \hb@xt@5\p@{\hss\@makefnmark}#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/bangtex/bbook.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\sbng\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/elbioimp/elbioimp.cls
---------------------------------------------------------
    \def \@makefntext ##1{\noindent
      \small \@thefnmark. \it ##1}
    \renewcommand{\thempfootnote}%
      {\arabic{mpfootnote}}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ebsthesis/ebsthesis.cls
---------------------------------------------------------
  \long\def\@makefntext#1{%
    \bgroup
      \setbox\@tempboxa\hbox{%
      \ifdim\footnotemargin>0pt
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/coursepaper/coursepaper.cls
---------------------------------------------------------
		\setlength {\evensidemargin}{0.5in}	 % right margin  1.5 inch        \setlength {\textwidth}{5.5in}	 % right margin  1.5 inch        \spacing{2}						 % double spacing for final        \renewenvironment{quote}			 % redef as single spaced			{\oldquote\spacing{1}}			{\oldendquote\spacing{2}}		\renewenvironment{quotation}		 % redef as single spaced			{\oldquotation\spacing{1}}			{\oldendquotation\spacing{2}} 		\renewenvironment{verse}		     % redef as single spaced			{\oldquotation\spacing{1}}			{\oldendquotation\spacing{2}} }\setlength {\footnotesep}{14pt}			  % baseline skip for fn's 1st line\setlength {\headheight}{0.2in}			  % make room for header\setlength {\headsep}{0.2in}				  % modest header separation\setlength {\parskip}{0.2in}				  % set a paragraph skip\setlength {\parindent}{0.2in}			  % I hate unindented first lines\renewenvironment{bibliography}[1]		  % automatically enter toc line	{\addcontentsline{toc}{chapter}{Bibliography}\oldbibliography {#1}}	{\oldendbibliography}%% Make footnotes single spaced%%			code shamelessly stolen from setspace.sty %				written by Geoffrey Tobin <G.Tobin@latrobe.edu.au>%\long\def\@footnotetext#1{%  \insert\footins{%    \def\baselinestretch {1}%    \reset@font\footnotesize    \interlinepenalty\interfootnotelinepenalty    \splittopskip\footnotesep    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM    \hsize\columnwidth    \@parboxrestore    \protected@edef\@currentlabel{%      \csname p@footnote\endcsname\@thefnmark    }%    \color@begingroup      \@makefntext{%        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%    \color@endgroup}}%% redefine the titlematter%\renewcommand\maketitle{\par  \begingroup    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%    \long\def\@makefntext##1{\parindent 1em\noindent            \hb@xt@1.8em{%                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%      \newpage      \global\@topnum\z@   % Prevents figures from going at top of page.      \@maketitle    \thispagestyle{empty}\@thanks  \endgroup  \setcounter{footnote}{0}%  \global\let\thanks\relax  \global\let\maketitle\relax  \global\let\@maketitle\relax  \global\let\@thanks\@empty  \global\let\@author\@empty  \global\let\@date\@empty  \global\let\@title\@empty  %  \global\let\@studentnumber\@empty  \global\let\@coursenumber\@empty  \global\let\@coursename\@empty  \global\let\@coursesection\@empty  \global\let\@instructor\@empty  \global\let\@college\@empty  %  \global\let\title\relax  \global\let\author\relax  \global\let\date\relax  \global\let\and\relax}%\def\@maketitle{%  \newpage  \null  \vskip 2em%  \begin{flushleft}%  	\begin{spacing}{1}%    {\sffamily \LARGE \@title \par}%    \vskip 2em%    {\sffamily \large\lineskip .75em\@author}\\%    \sffamily \@studentnumber%    \vskip 1em%    \sffamily \@date    \vskip 3em%    \sffamily \@college\\%    \sffamily \@coursenumber\hskip 6pt\@coursesection\hskip 6pt%
			\@coursename\\%    \sffamily For: \@instructor%    \par%    \end{spacing}%  \end{flushleft}\hrule\vskip 1em\par  \par  \vskip 1.5em}%% make section titles less obnoxious%\renewcommand\section{\@startsection {section}{1}{\z@}%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%                                   {2.3ex \@plus.2ex}%                                   {\normalfont\large\bfseries}}\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%                                     {1.5ex \@plus .2ex}%                                     {\normalfont\normalsize\bfseries}}\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%                                     {1.5ex \@plus .2ex}%                                     {\normalfont\normalsize\bfseries}}\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%                                    {3.25ex \@plus1ex \@minus.2ex}%                                    {-1em}%                                    {\normalfont\normalsize\bfseries}}\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%                                       {3.25ex \@plus1ex \@minus .2ex}%                                       {-1em}%                                      {\normalfont\normalsize\bfseries}}%% Set up headers%\def\ps@myheadings{%    \let\@oddfoot\@empty\let\@evenfoot\@empty    \def\@evenhead{\thepage -- \slshape\leftmark\hfil}%    \def\@oddhead{\hfil{\slshape\rightmark} -- \thepage}%    \let\@mkboth\@gobbletwo    \let\sectionmark\@gobble    \let\subsectionmark\@gobble    }%% Position the abstract depending on presence of titlepage%\if@titlepage  \renewenvironment{abstract}{%	  \titlepage      \null\vfil      \@beginparpenalty\@lowpenalty      \begin{center}%        \bfseries \abstractname        \@endparpenalty\@M      \end{center}}%     {\par\vfil\null\endtitlepage}\fi%% change some names%\renewcommand\contentsname{Table of Contents}\renewcommand\refname{Bibliography}%%	\epigraph{text}{byline}%\newcommand{\epigraph}[2]{\begin{flushright}\begin{minipage}{4in}%
			\spacing{1}#1\begin{flushright}#2\end{flushright}%
			\hrule\end{minipage}\vskip 12pt\end{flushright}}%%% End of file `coursepaper.cls'.
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/kotex-utf/contrib/dhucsfn.sty
---------------------------------------------------------
  \long\def\@makefntext#1{
    \settowidth{\foot@parindent}{\fn@markstyle}
    \@setpar{\@@par\@tempdima \hsize
      \advance\@tempdima-\foot@parindent
...
  \long\def\@makefntext#1{%
    \hbox{\fn@markstyle\hskip\footnumbersep #1}
  }%
}
...
  \long\def\@makefntext#1{%
    \fn@markstyle\ifdim\footnumbersep=\z@\else~\fi #1
  }%
}
...
  \long\def\@makefntext#1{
    \settowidth{\foot@parindent}{\reset@font 각주}
    \settowidth{\footnumbersep}{\reset@font 주}
    \divide\footnumbersep by2
...
  \long\def\@makefntext#1{
    \settowidth{\leftskip}{\reset@font 각주}
    \settowidth{\foot@parindent}{\fn@markstyle}
    \settowidth{\footnumbersep}{\reset@font 주}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ucthesis/ucthesis.cls
---------------------------------------------------------
%          \long\def\@makefntext#1{\@setpar{\@@par\@tempdima \hsize
%             \advance\@tempdima-10pt\parshape \@ne 10pt \@tempdima}\par
%             \parindent 1em\noindent
%             \hbox to \z@{\hss$\m@th^{\@thefnmark}$}#1}
...
\long\def\@makefntext#1{\parindent 1em\noindent
            \hbox to 1.8em{\hss$\m@th^{\@thefnmark}$}#1}

% \@makefnmark : A macro to generate the footnote marker that goes
...
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}
 
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/apa/apa.cls
---------------------------------------------------------
\long\def\@makefntext#1{\parindent 1em\noindent
           \hb@xt@1.8em{%
           \hss\@textsuperscript{\normalfont{\tiny\@thefnmark}\hspace{1.5pt}}}#1}%

...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/uestcthesis/uestcthesis.cls
---------------------------------------------------------
\def\@makefntext #1{\ifFN@hangfoot \bgroup \setbox \@tempboxa \hbox {\ifdim
\footnotemargin >0pt \hb@xt@ \footnotemargin {\hbox { \normalfont \@thefnmark}
\hss }\else \hbox { \normalfont \@thefnmark} \fi }\leftmargin \wd \@tempboxa
\rightmargin \z@ \linewidth \columnwidth \advance \linewidth -\leftmargin
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/gmdoc/gmdoc.sty
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
      \hb@xt@1.8em{%
        \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn \twocolumn [\@maketitle ]%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/titling/titling.sty
---------------------------------------------------------
      \long\def\@makefntext##1{\makethanksmark ##1}
    \null\vfil
    \vskip 60\p@
    \vspace*{\droptitle}
...
      \long\def\@makefntext##1{\makethanksmark ##1}
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/chletter/chletter.cls
---------------------------------------------------------
\long\def\@makefntext#1{\noindent\hb@xt@\z@{\hss\@makefnmark}#1}
\def\fromname{\@author}
\def\fromsig{\@author}
\let\fromlocation\@empty
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/jurarsp/jurarsp.sty
---------------------------------------------------------
\long\def\@makefntext#1{%
  \rsp@fntrue%
  \@setpar{\@@par
  \@tempdima = \hsize
...
/usr/local/texlive/2021/texmf-dist/tex/latex/kluwer/klunote.sty
---------------------------------------------------------
% \long\def\@makefntext#1{\parindent 1em\noindent
%  \hbox to 1.5em{\hss$^{\@thefnmark}$}\hskip0.5em\footnotesize#1}
% \def\@makefnmark{\hbox{$^{\@thefnmark}\m@th$}}
% SK: reimplemented with \textsuperscript, following LaTeX format
...
\long\def\@makefntext#1{\parindent 1em\noindent
 \hbox to 1.5em{\hss\textsuperscript{\@thefnmark}}%
   \hskip0.5em\footnotesize#1}
\def\@makefnmark{\hbox{\textsuperscript{\@thefnmark}}}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/kluwer/kluwer.cls
---------------------------------------------------------
\long\def\@makefntext#1{\parindent 1em\noindent
 \hbox to 1.5em{\hss\textsuperscript{\@thefnmark}}%
   \hskip0.5em\footnotesize#1}
\def\@makefnmark{\hbox{\textsuperscript{\@thefnmark}}}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/asaetr/asaesub.sty
---------------------------------------------------------
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/asaetr/asaetr.sty
---------------------------------------------------------
\long\def\@makefntext#1{\parindent 1em\noindent 
 \hbox to 1.8em{\hss$^{\@thefnmark}$}#1}


...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/refman/refrep.cls
---------------------------------------------------------
  \long\def\@makefntext##1{%
       \@setpar{\@@par
          \@tempdima = \hsize
          \advance\@tempdima -1em
...
      \long\def\@makefntext##1{%
         \@setpar{\@@par
            \@tempdima = \hsize
            \advance\@tempdima -1em
...
\long\def\@makefntext#1{%
   \@setpar{\@@par
      \@tempdima = \hsize
      \advance\@tempdima -1em
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/refman/refart.cls
---------------------------------------------------------
  \long\def\@makefntext##1{%
       \@setpar{\@@par
          \@tempdima = \hsize
          \advance\@tempdima -1em
...
      \long\def\@makefntext##1{%
         \@setpar{\@@par
            \@tempdima = \hsize
            \advance\@tempdima -1em
...
\long\def\@makefntext#1{%
   \@setpar{\@@par
      \@tempdima = \hsize
      \advance\@tempdima -1em
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/lwarp/lwarp-footnote.sty
---------------------------------------------------------
\long\def\@makefntext#1{\textsuperscript{\@thefnmark}~#1}

\LWR@ProvidesPackagePass{footnote}[1997/01/28]

...
\long\def\@makefntext#1{\textsuperscript{\@thefnmark}~{#1}}

\def\spewnotes{%
  \endgroup%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/lwarp/lwarp.sty
---------------------------------------------------------
\long\def\@makefntext#1{\textsuperscript{\@thefnmark}~{#1}}
\def\@makefnmark{%
    \textsuperscript{\@thefnmark}%
}
...
\long\def\@makefntext##1{%
\textsuperscript{\@thefnmark}~%
{##1}%
}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/lwarp/lwarp-titling.sty
---------------------------------------------------------
    \long\def\@makefntext##1{%
        \makethanksmark~%
        {##1}%
    }% \@makefntext
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/afthesis/afthesis.cls
---------------------------------------------------------
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ijmart/ijmart.cls
---------------------------------------------------------
  \long\def\@makefntext##1{\noindent\hangindent=2em\hangafter=1
    \hb@xt@2em{%
      \hss\@textsuperscript{\normalfont\footnotesize\@thefnmark\space}}##1}%
  \def\footnoterule{\kern-3pt\hrule width 2in\kern 2.6pt}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/oup-authoring-template/oup-authoring-template.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 3mm\noindent
        \if@traditional\if@small\@hangfrom{{\normalfont\@thefnmark}\enskip}\else\@textsuperscript{\normalfont\@thefnmark}\fi\else\@textsuperscript{\normalfont\@thefnmark}\fi
      ##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/akletter/akletter.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
    \noindent
    \hangindent 5\p@
    \hb@xt@5\p@{\hss\@makefnmark}#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex4/aps.rtx
---------------------------------------------------------
\def\@makefntext#1{%
 \def\baselinestretch{1}%
 \reset@font
 \footnotesize
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/revtex4/revtex4.cls
---------------------------------------------------------
\def\@makefntext#1{%
  \def\baselinestretch{1}%
  \reset@font\footnotesize
  \parindent 1em%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hitreport/hitreport.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
  \begingroup
    % 序号取消上标
    \def\@makefnmark{\hbox{\normalfont\@thefnmark}}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/footnotehyper/footnotehyper.sty
---------------------------------------------------------
      \def\FNH@prefntext{\@makefntext{}}%
      \iffootnotehyperwarn
        \PackageInfo{footnotehyper}%
        {Using the \string\@makefntext{} approach (see doc).\FNH@msgbk
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/basque-book/basque-book.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/dinbrief/dinbrief.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
  \noindent
  \hangindent 5pt%
  \hbox  to 5pt{\hss $^{\@thefnmark}$}#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/beamer/beamerbaseframecomponents.sty
---------------------------------------------------------
\def\@makefntext#1{%
  \def\insertfootnotetext{#1}%
  \def\insertfootnotemark{\@makefnmark}%
  \usebeamertemplate***{footnote}}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ucdavisthesis/ucdavisthesis.cls
---------------------------------------------------------
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}\renewcommand\baselinestretch{\@spacing}}}
\ps@plain                   % 'plain' page style
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/computational-complexity/cclayout.sty
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/footmisx/footmisx.sty
---------------------------------------------------------
  \long\def\@makefntext#1{\leavevmode
    \@makefnmark\nobreak
    \hskip.5em\relax#1%
  }
...
  \long\def\@makefntext#1{%
    \ifFN@hangfoot
      \bgroup
      \setbox\@tempboxa\hbox{%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/amsdtx.hyp
---------------------------------------------------------
    \long\def\@makefntext##1{%
      \hyper@currentfnmark%
      \bgroup%
        \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/slides.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \bgroup%
    \hyper@currentfnmark%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/book.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \bgroup%
    \hyper@currentfnmark%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
    \long\def\@makefntext##1{%
      \hyper@currentfnmark%
      \bgroup%
        \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/ltxguide.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \bgroup%
    \hyper@currentfnmark%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
    \long\def\@makefntext##1{%
      \hyper@currentfnmark%
      \bgroup%
        \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/ltnews.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \bgroup%
    \hyper@currentfnmark%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/doc.hyp
---------------------------------------------------------
      \long\def\@makefntext##1{%
        \hyper@currentfnmark%
        \bgroup
          \edef\@currenthyper{\hyper@current@fnmark}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/ftnright.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \hyper@currentfnmark%
  \bgroup%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/letter.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \bgroup%
    \hyper@currentfnmark%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/amsbook.hyp
---------------------------------------------------------
\long\def\@makefntext#1{\indent%
  \hyper@currentfnmark%
  \bgroup%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/ltxdoc.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \bgroup%
    \hyper@currentfnmark%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
    \long\def\@makefntext##1{%
      \hyper@currentfnmark%
      \bgroup%
        \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/proc.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \bgroup%
    \hyper@currentfnmark%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/amsart.hyp
---------------------------------------------------------
\long\def\@makefntext#1{\indent%
  \hyper@currentfnmark%
  \bgroup%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/amsproc.hyp
---------------------------------------------------------
\long\def\@makefntext#1{\indent%
  \hyper@currentfnmark%
  \bgroup%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/article.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \bgroup%
    \hyper@currentfnmark%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
    \long\def\@makefntext##1{%
      \hyper@currentfnmark%
      \bgroup%
        \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hyper/report.hyp
---------------------------------------------------------
\long\def\@makefntext#1{%
  \bgroup%
    \hyper@currentfnmark%
    \edef\@currenthyper{\hyper@current@fnmark}%
...
    \long\def\@makefntext##1{%
      \hyper@currentfnmark%
      \bgroup%
        \edef\@currenthyper{\hyper@current@fnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/hitec/hitec.cls
---------------------------------------------------------
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \newpage
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/emulateapj/emulateapj.cls
---------------------------------------------------------
\def\@makefntext#1{\mbox{}\hspace*{3mm}\@makefnmark~#1}

\def\notetoeditor#1{}%   % We do not need notes to editor in the preprint
\def\placetable#1{}%   % We do not need notes to editor in the preprint
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ledmac/afoot.sty
---------------------------------------------------------
  \long\def\@makefntext#1{{$^{\@thefnmark}$}#1\nobreak }
\fi

%%% Make the LaTeX \cs{footnote} catcode-safe, like in Plain TeX.
...
    \global\long\def \@makefntext ##1{{$^{\@thefnmark }$}##1\nobreak }%
    \setbox0=\hbox \bgroup % fnpara.sty is present
    \floatingpenalty=20000 \footnotesize
  \fi
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/footmisc/footmisc.sty
---------------------------------------------------------
  \long\def\@makefntext#1{\leavevmode
    \@makefnmark\nobreak
    \hskip.5em\relax#1%
  }
...
  \long\def\@makefntext#1{%
    \ifFN@hangfoot
      \bgroup
      \setbox\@tempboxa\hbox{%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/footmisc/footmisc-2011-06-06.sty
---------------------------------------------------------
  \long\def\@makefntext#1{\leavevmode
    \@makefnmark\nobreak
    \hskip.5em\relax#1%
  }
...
  \long\def\@makefntext#1{%
    \ifFN@hangfoot
      \bgroup
      \setbox\@tempboxa\hbox{%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/base/book.cls
---------------------------------------------------------
      \long\def\@makefntext##1{\parindent 1em\noindent
              \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/base/slides.cls
---------------------------------------------------------
\long\def\@makefntext#1{
    \noindent
    \hangindent 10\p@
    \hb@xt@10\p@{\hss\@makefnmark}#1}
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/base/doc.sty
---------------------------------------------------------
      \long\def\@makefntext##1{\parindent 1em\noindent
            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
      \if@twocolumn \twocolumn [\@maketitle ]%
      \else \newpage \global \@topnum \z@ \@maketitle \fi
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/base/proc.sty
---------------------------------------------------------
     \long\def\@makefntext##1{\parindent 1em\noindent
             \hb@xt@1.8em{%
                 \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
   \twocolumn[\@maketitle]%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/base/proc.cls
---------------------------------------------------------
     \long\def\@makefntext##1{\parindent 1em\noindent
             \hb@xt@1.8em{%
                 \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
   \twocolumn[\@maketitle]%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/base/doc-v3beta.sty
---------------------------------------------------------
      \long\def\@makefntext##1{\parindent 1em\noindent
            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
      \if@twocolumn \twocolumn [\@maketitle ]%
      \else \newpage \global \@topnum \z@ \@maketitle \fi
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/base/article.cls
---------------------------------------------------------
      \long\def\@makefntext##1{\parindent 1em\noindent
              \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/base/report.cls
---------------------------------------------------------
      \long\def\@makefntext##1{\parindent 1em\noindent
              \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \if@twocolumn
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/twoinone/2in1.sty
---------------------------------------------------------
\long\def\@makefntext##1{\parindent 1em\noindent
\hb@xt@1.8em{%
\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
\@maketitle
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/ltxtools/ltxtools-review.sty
---------------------------------------------------------
  \long\def\@makefntext##1{\rule\z@\footnotesep\parindent1em\noindent
    \hb@xt@2em{\hss\@textsuperscript
      {\normalfont\textcolor{#1}{\@thefnmark}}}%
    \hspace{2\p@}\ignorespaces\textcolor{#1}{##1}%
...
  \long\def\@makefntext##1{%
    \rule\z@\footnotesep\parindent1em\noindent
    \hb@xt@0em{\hss\@textsuperscript{\normalfont\color{#1}\@thefnmark}}%
    \hspace{2\p@}\color{#1}\ignorespaces##1%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/skeyval/skeyval-testclass.cls
---------------------------------------------------------
  \long\def\@makefntext##1{%
    \parindent1em\relax\noindent
    \hb@xt@1.8em{\hss\@textsuperscript{%
      \normalfont\skv@fnsymbol\@thefnmark}%
...
---------------------------------------------------------
/usr/local/texlive/2021/texmf-dist/tex/latex/newlfm/newlfm.cls
---------------------------------------------------------
\long\def\@makefntext#1{%
\noindent \hangindent 5\p@%
\hb@xt@5\p@{\hss\@makefnmark}#1}%
\renewcommand{\thefigure}{\@arabic\c@figure}%
...
---------------------------------------------------------

```
