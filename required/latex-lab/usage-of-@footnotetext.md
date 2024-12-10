# Packages that alter \@footnotetext ...

Scan of TeXlive 2022  for checking ... may not be longer accurate and may contain a few false positives

```

% ./bibarts/bibarts.sty

\let\ba@footnotetext=\@footnotetext
\long\def\@footnotetext#1{\ba@footnotetext{%
   \global\let\thisto@ba=-%
   \global\let\thisti@ba=-%
   \global\let\thisp@ba=-%
   \global\let\thisvol@ba=-%
   \global\let\thiss@ba=-%
   \global\let\thisn@ba=-%
   \global\let\pos@ba=0%
    \kern 0.1em\nulskip@ba{\@footnotetrue\ignorespaces
    #1\nulskip@ba\ba@textmode}\global\let\lastto@ba=\thisto@ba
   \global\let\lastti@ba=\thisti@ba
   \global\let\lastp@ba=\thisp@ba
   \global\let\lastvol@ba=\thisvol@ba
   \global\let\lasts@ba=\thiss@ba
   \global\let\lastn@ba=\thisn@ba}}%


% ./fnbreak/fnbreak.sty

  \let\fnb@orig@footnotetext\@footnotetext
  \long\def\@footnotetext#1{\fnb@orig@footnotetext{\fnb@fnstart#1\fnb@fnend}}%


% ./revtex4-1/revtex4-1.cls  ./revtex/ltxutil.sty ./revtex/revtex4-2.cls ...

\long\def\@footnotetext{%
 \insert\footins\bgroup
  \make@footnotetext
}%
\long\def\@mpfootnotetext{%
 \minipagefootnote@pick
  \make@footnotetext
}%
\long\def\make@footnotetext#1{%
  \set@footnotefont
  \set@footnotewidth
  \@parboxrestore
  \protected@edef\@currentlabel{%
   \csname p@\@mpfn\endcsname\@thefnmark
  }%
  \color@begingroup
   \@makefntext{%
    \rule\z@\footnotesep\ignorespaces#1%
    \@finalstrut\strutbox\vadjust{\vskip\z@skip}%
   }%
  \color@endgroup
 \minipagefootnote@drop
}%


% ./nrc/nrc1.cls  ./nrc/nrc2.cls

% this is missing the \par at the end and \@currentcounter

\long\def\@footnotetext#1{%
  \insert\footins{%
    \reset@font\smallt
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox
      }%
    \color@endgroup
  }%
}%

%-------------------------------------

% ./bigfoot/bigfoot.sty

  \def\@footnotetext{\Footnotetextdefault{}}%

%-------------------------------------


% ./uafthesis/uafthesis.cls

% this is missing the \par at the end and \@currentcounter

%% this little gem provides for single-spaced footnotes
\long\def\@footnotetext#1{\insert\footins{%
    \ssp
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

%-------------------------------------



% ./resphilosophica/resphilosophica.cls

% I wonder if this \, is really intended below ...

\long\def\@footnotetext#1{%
  \insert\footins{%
    \normalfont\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep \splitmaxdepth \dp\strutbox
    \floatingpenalty\@MM \hsize\columnwidth
    \@parboxrestore \parindent\normalparindent \sloppy
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark}%
    \@makefntext{%
      \,\rule\z@\footnotesep\ignorespaces#1\unskip\strut\par}}}

%-------------------------------------



% ./setspace/setspace.sty

% this is missing the \par at the end and \@currentcounter

\long\def\@footnotetext#1{%
  \insert\footins{%
% GT:  Next line added.  Hook desired here!
    \def\baselinestretch {\setspace@singlespace}%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth
    \@parboxrestore
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}

%-------------------------------------



% ./linguex/linguex.sty


\let\predefinedfootnotetext=\@footnotetext
\long\def\@footnotetext#1{\@noftnotefalse\predefinedfootnotetext{#1}%
         \@noftnotetrue}


%-------------------------------------


% ./fnpara/fnpara.sty

\long\def\@footnotetext#1{\insert\footins{%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
    \setbox0=\hbox{%
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox
        \penalty -10
        \hskip\footglue
      }%
    }%
    \dp0=0pt \ht0=\fudgefactor\wd0 \box0
    \color@endgroup}}

%-------------------------------------


% ./footmisc/footmisc.sty (para option)

% this is missing the \par at the end and \@currentcounter

  \long\def\FN@footnotetext#1{%
    \insert\footins{%
      \ifFN@setspace
        \let\baselinestretch\FN@baselinestretch
      \fi
      \reset@font\footnotesize
      \interlinepenalty\interfootnotelinepenalty
      \splittopskip\footnotesep
      \splitmaxdepth \dp\strutbox
      \floatingpenalty\@MM
      \hsize\columnwidth
      \@parboxrestore
      \protected@edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}%
      \color@begingroup
        \setbox\FN@tempboxa\hbox{%
          \@makefntext{\ignorespaces#1\strut
            \penalty-10\relax
            \hskip\footglue
          }% end of \@makefntext parameter
        }% end of \hbox
        \dp\FN@tempboxa\z@
        \ht\FN@tempboxa\dimexpr\wd\FN@tempboxa *%
                        \footnotebaselineskip / \columnwidth\relax
        \box\FN@tempboxa
      \color@endgroup
    }%
    \FN@mf@prepare
  }

%-------------------------------------


% ./footmisc/footmisc.sty (normal)

% this is missing the \par at the end and \@currentcounter

    \long\def\FN@footnotetext#1{%
      \insert\footins{%
        \ifFN@setspace
          \let\baselinestretch\FN@baselinestretch
        \fi
        \reset@font\footnotesize
        \interlinepenalty\interfootnotelinepenalty
        \splittopskip\footnotesep
        \splitmaxdepth \dp\strutbox
        \floatingpenalty\@MM
        \hsize\columnwidth
        \@parboxrestore
        \protected@edef\@currentlabel{%
          \csname p@footnote\endcsname\@thefnmark
        }%
        \color@begingroup
          \@makefntext{%
            \rule\z@\footnotesep
            \ignorespaces#1\@finalstrut\strutbox
          }%
        \color@endgroup
      }%
      \FN@mf@prepare
    }%



%-------------------------------------


% ./footmisc/footmisc.sty (side option)

    \long\def\FN@footnotetext#1{%
      \marginpar{%
        \ifFN@setspace
          \let\baselinestretch\FN@baselinestretch
        \fi
        \reset@font\footnotesize
        \protected@edef\@currentlabel{%
          \csname p@footnote\endcsname\@thefnmark
        }%
        \color@begingroup
          \@makefntext{%
            \ignorespaces#1%
          }%
        \color@endgroup
      }%
      \FN@mf@prepare
    }%



%-------------------------------------



% ./bxjscls/bxjsarticle.cls ./bxjscls/bxjsbook.cls ...

\long\def\@footnotetext{%
  \insert\footins\bgroup
    \normalfont\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces}%
      \futurelet\jsc@next\jsc@fo@t}
\def\jsc@fo@t{\ifcat\bgroup\noexpand\jsc@next \let\jsc@next\jsc@f@@t
                                \else \let\jsc@next\jsc@f@t\fi \jsc@next}
\def\jsc@f@@t{\bgroup\aftergroup\jsc@@foot\let\jsc@next}
\def\jsc@f@t#1{#1\jsc@@foot}
\def\jsc@@foot{\@finalstrut\strutbox\color@endgroup\egroup
  \ifx\pltx@foot@penalty\@undefined\else
    \ifhmode\null\fi
    \ifnum\pltx@foot@penalty=\z@\else
      \penalty\pltx@foot@penalty
      \pltx@foot@penalty\z@
    \fi
  \fi}


not covered so far supports \footnote{ catcode changes ...} but also
\foonote A  --- the latter is questionable I would say


%-------------------------------------


% ./fn2end/fn2end.sty

obsolete I guess, ignored in evaluation


%-------------------------------------


% ./hyperref/hyperref.sty

  \long\def\@footnotetext#1{%
    \H@@footnotetext{%
      \ifHy@nesting
        \expandafter\ltx@firstoftwo
      \else
        \expandafter\ltx@secondoftwo
      \fi
      {%
        \expandafter\hyper@@anchor\expandafter{%
          \Hy@footnote@currentHref
        }{\ignorespaces #1}%
      }{%
        \Hy@raisedlink{%
          \expandafter\hyper@@anchor\expandafter{%
            \Hy@footnote@currentHref
          }{\relax}%
        }%
        \let\@currentHref\Hy@footnote@currentHref
        \let\@currentlabelname\@empty
        \ignorespaces #1%
      }%
    }%
  }%


Handling of anchors (in nested context) I guess. This needs to be
married with the anchor setting that the tagging currently does and
the latter improved/adjusted


%-------------------------------------

% ./biblatex-gb7714-2015/gb7714-2015ms.bbx ./biblatex-gb7714-2015/gb7714-2015mx.bbx ...

    \long\def\@footnotetext##1{\insert\footins{%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
    \leftskip \footbibmargin%增加的左侧缩进
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces##1\@finalstrut\strutbox%
        }%
    \color@endgroup}}%

fits the structure
%-------------------------------------


% ./amscls/amsbook.cls ./amscls/amsproc.cls ./amscls/amsart.cls ...

\long\def\@footnotetext#1{%
  \insert\footins{%
    \normalfont\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep \splitmaxdepth \dp\strutbox
    \floatingpenalty\@MM \hsize\columnwidth
    \@parboxrestore \parindent\normalparindent \sloppy
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark}%
    \@makefntext{%
      \rule\z@\footnotesep\ignorespaces#1\unskip\strut\par}}}

fits the structure
%-------------------------------------


% ./umich-thesis/umich-thesis.cls

% change LaTeX's footnotes to get vertical spacing correct
\skip\footins \baselinestretch2\skip\footins
\long\def\@footnotetext#1{%
  \insert\footins{%
    \def\baselinestretch {\setspace@singlespace}%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth
    \@parboxrestore
    \vskip 1.2\baselineskip
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}

fits the structure
%-------------------------------------


% ./nostarch/nostarch.cls

\long\def\@footnotetext#1{\insert\footins{%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@{13.5pt}\ignorespaces#1}%
    \color@endgroup}}%

fixed \footsep, probably very old
fits the structure
%-------------------------------------



% ./coursepaper/coursepaper.cls

\long\def\@footnotetext#1{%
  \insert\footins{%
    \def\baselinestretch {1}%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth
    \@parboxrestore
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}

fits the structure
%-------------------------------------



% ./ucthesis/ucthesis.cls

% Single-space footnotes.
\long\def\@footnotetext#1{\insert\footins{\ssp\reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

fits the structure
%-------------------------------------



% ./jura/jura.cls

\long\def\@footnotetext#1{\insert\footins{%
    \linespread{\J@FootnoteSpread}\reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}%

fits the structure
%-------------------------------------


% ./asaetr/asaesub.sty

2.09

%-------------------------------------


% ./lineno/fnlineno.sty

%% |\FNLN@@text| stores the `\@footnotetext' found, 
%% we might check if it is `\FNLN@ltx@fntext' ... %% TODO
\let\FNLN@@text\@footnotetext
\def\@footnotetext{%
    \ifLineNumbers  \expandafter \FNLN@text
    \else           \expandafter \FNLN@@text
    \fi}


\def \FNLN@text {%                      %% 2010/12/31 arg read later
    \vadjust{\penalty-\FNLN@M@swap@codepen}%
%% Standard \LaTeX's `\@footnotetext' expands `\@thefnmark' 
%% to produce the footnote mark at the page bottom, 
%% right after it has been determined for the mark 
%% in the main text. \emph{Here} the footnote text 
%% will be typeset only when \emph{other} footnote marks
%% may have been formed for typesetting the main text 
%% paragraph before. 
%% %%% (TODO clearer wording)
%% In the \strong{footnote list} 
%% macro |\FNLN@list|, the (\dqtd{`&\protect'ed})
%% \emph{current} expansion <mark> of `\@thefnmark' 
%% is stored as an item preceding the footnote text 
%% <text>. One footnote entry in `\FNLN@list' 
%% thus has the form \lq`<mark>\@lt<text>\@lt'\rq.
%% \LaTeX's internal `\g@addto@macro' is used to \emph{append} 
%% an entry to the list (at the right). The OTR will later 
%% take the entries from the left of the list. 
%% 
%% The argument of the auxiliary/temporary `\@tempa' 
%% will contain the footnote text and thus must be able to 
%% carry `\par' tokens. We therefore need a `\long' version of 
%% `\protected@edef':
   \let\@@protect\protect
   \let\protect\@unexpandable@protect
   \afterassignment\restore@protect
   \long \edef \@tempa ##1{%
        \noexpand\g@addto@macro \noexpand\FNLN@list {%
            \@thefnmark \noexpand\@lt ##1\noexpand \@lt}}%
%% ... issuing 
%%     \lq`\g@addto@macro\FNLN@list{<mark>\elt<text>\@lt}'\rq\ ...
   \@tempa                              %% reads arg
}
%% Here we initialize |\FNLN@list|:
\let\FNLN@list\@empty



probably continues working but needs separate checking

%-------------------------------------



% ./jurabib/jurabib.sty

      \long\def\@footnotetext#1{%
           \Orig@tabularx@footnotetext{%
              \jb@fntrue
              #1%
              \setcounter{jb@cites@in@footnote}{0}%
           }%
      }%

      \let\jbsaved@footnotetext\@footnotetext
      \long\def\@footnotetext#1{%
         \begingroup
          \jb@fntrue
          \jbsaved@footnotetext{#1}%
          \setcounter{jb@cites@in@footnote}{0}%
         \endgroup
      }%


first is table notes, second
fits the structure
%-------------------------------------



% ./york-thesis/york-thesis.cls

\long\def\@footnotetext#1{%
 \insert\footins{%
  \def\baselinestretch {1}%
  \reset@font\footnotesize
  \interlinepenalty\interfootnotelinepenalty
  \splittopskip\footnotesep
  \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
  \hsize\columnwidth
  \@parboxrestore
  \protected@edef\@currentlabel{%
    \csname p@footnote\endcsname\@thefnmark}%
  \color@begingroup
    \@makefntext{%
      \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
  \color@endgroup}}

fits the structure
%-------------------------------------


% ./ucdavisthesis/ucdavisthesis.cls

\long\def\@footnotetext#1{\insert\footins{\renewcommand\baselinestretch{1}
    \footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}\renewcommand\baselinestretch{\@spacing}}}

looks old ...
fits the structure
%-------------------------------------


% ./ledmac/afoot.sty

fairly old and buggy in some aspects

%%% Make the LaTeX \cs{footnote} catcode-safe, like in Plain TeX.

\def \@footnotetext {%        new, do not yet read footnote text
  \insert \footins \bgroup
  \ifx \footglue \undefined %  prepare normal footnote
    \interlinepenalty \interfootnotelinepenalty \floatingpenalty \@MM
    \splittopskip \footnotesep \splitmaxdepth \dp \strutbox
  \else
    \global\long\def \@makefntext ##1{{$^{\@thefnmark }$}##1\nobreak }%
    \setbox0=\hbox \bgroup % fnpara.sty is present
    \floatingpenalty=20000 \footnotesize
  \fi
  \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}%
  \a@fntext }


%-------------------------------------


% ./toptesi/toptesi.sty


\long\def\@footnotetext#1{\insert\footins{\linespread{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}%
   \@makefntext{\rule{\z@}{\footnotesep}\ignorespaces#1\strut}}}


fits the structure
%-------------------------------------


% ./gb4e/gb4e.sty

\let\@gbsaved@footnotetext=\@footnotetext
\long\def\@footnotetext#1{%
    \@noftnotefalse\setcounter{fnx}{0}%
    \@gbsaved@footnotetext{#1}%
    \@noftnotetrue}

fits the structure
%-------------------------------------



% ./koma-script/scrlttr2.cls ./koma-script/scrextend.sty ./koma-script/scrreprt.cls ...

same bug as footmisc: the @prepare is in the wrong place

fits the structure
%-------------------------------------



% ./tabu/tabu.sty

not checked what that does


%-------------------------------------


% ./uwthesis/uwthesis.cls

does chapter notes -- ignore for now

%-------------------------------------


% ./tools/multicol.sty

\long\def\mult@footnotetext#1{\begingroup
         \columnwidth\textwidth
         \orig@footnotetext{#1}\endgroup}


fits the structure, but need to think what makes sense here as this a
temporary redefinition for the environment only

%-------------------------------------


% ./fancyvrb/fancyvrb.sty

\long\def\V@footnotetext{%
  \afterassignment\V@@footnotetext
  \let\@tempa}
\def\V@@footnotetext{%
  \insert\footins\bgroup
  \csname reset@font\endcsname
  \footnotesize
  \interlinepenalty\interfootnotelinepenalty
  \splittopskip\footnotesep
  \splitmaxdepth\dp\strutbox
  \floatingpenalty \@MM
  \hsize\columnwidth
  \@parboxrestore
  \def\@currentcounter{footnote}%
  \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}%
  \@makefntext{}%
  \rule{\z@}{\footnotesep}%
  \bgroup
  \aftergroup\V@@@footnotetext
  \ignorespaces}
\def\V@@@footnotetext{\strut\egroup}


another one of the footnote commands that do not read they argument as an argument

%-------------------------------------


% ./savefnmark/savefnmark.sty

obsolete

%-------------------------------------


% ./changebar/changebar.sty

\let\ltx@footnotetext\@footnotetext
\long\def\cb@footnotetext#1{%
  \cb@trace@stack{end footnote on page \the\c@page}%
  \cb@pop\cb@currentstack
  \ifnum\cb@topleft=\cb@nil
    \ltx@footnotetext{#1}%
  \else
    \cb@push\cb@currentstack
    \edef\cb@temp{\the\cb@curbarwd}%
    \ltx@footnotetext{\cb@start[\cb@temp]#1\cb@end}%
  \fi}
\let\@footnotetext\cb@footnotetext


% ./eledmac/eledmac.sty

\apptocmd{\@footnotetext}{\m@mmf@prepare}{}{}
\pretocmd{\@footnotetext}{%
  \ifnumberedpar@
    \edtext{}{\l@dbfnote{#1}}%
  \else
  }{}{}
\apptocmd{\@footnotetext}{\fi}{}{}%


% ./yafoot/dblfnote.sty

\long\def\dfn@footnotetext#1{{\setbox\dfn@boxa\vbox{
        \let\insert\dfn@gobble
        \columnwidth\DFNcolumnwidth \hbadness\c@DFNsloppiness
        \def\@makefnmark{\smash{\dfn@makefnmark}}
        \dfn@latex@footnotetext{#1}\par \boxmaxdepth\dfn@fnmaxdp}%
        \dfn@dima\ht\dfn@boxa \advance\dfn@dima\dp\dfn@boxa
        \ifdim\dfn@dima>\z@\else
                \dfn@dima1sp\relax
                \setbox\dfn@boxa\vbox{\vbox to1sp{\unvbox\dfn@boxa\vfil}}\fi
        \global\setbox\dfn@ins\vbox{\boxmaxdepth\dfn@fnmaxdp
                \ifvoid\dfn@ins\else
                        \unvbox\dfn@ins \allowbreak \nointerlineskip \fi
                \ifdfn@allowcbreak \unvbox \else \box \fi \dfn@boxa}%
        \setbox\dfn@boxa\copy\dfn@ins
        \dfn@split{.5\ht\dfn@boxa}\dfn@boxa\dfn@boxb\dfn@fnmaxdp\footnotesep
        \advance\@tempdima\@tempdimb \@tempdimb\@tempdima
        \advance\@tempdima-\dfn@fnht \global\dfn@fnht\@tempdimb
        \insert\footins{\floatingpenalty\@MM \vbox to\@tempdima{}}%
        \xdef\dfn@list{\dfn@list\@elt{\number\dfn@dima}{\number\@tempdima}}}}
\let\dfn@latex@footnotetext\@footnotetext
\let\@footnotetext\dfn@footnotetext


% ./ftnxtra/ftnxtra.sty

not checked what this does


% ./acmart/acmart.cls

\if@ACM@sigchiamode
\long\def\@footnotetext#1{\marginpar{%
    \reset@font\small
    \interlinepenalty\interfootnotelinepenalty
    \protected@edef\@currentlabel{%
       \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}%
\fi


% ./memoir/memoir.cls

 this needs some further analysis

```
