# Packages that alter \@footnotemark ...

Scan of TeXlive 2022  for checking ... may not be longer accurate and may contain a few false positives

```
% bibarts

\let\ba@footnmark=\@footnotemark
\def\@footnotemark{\ifhmode{\nobreak \hskip 0.04em plus 0.01em}\else\leavevmode\fi\ba@footnmark}%


% ./bxjscls/bxjsja-minimal.def

\def\bxjs@cjk@loaded{%
  \def\@footnotemark{%
    \leavevmode
    \ifhmode
      \edef\@x@sf{\the\spacefactor}%
      \ifdim\lastkern>\z@\ifdim\lastkern<5sp\relax
         \unkern\unkern
         \ifdim\lastskip>\z@ \unskip \fi
      \fi\fi
      \nobreak
    \fi
    \@makefnmark
    \ifhmode \spacefactor\@x@sf \fi
    \relax}%
  \let\bxjs@cjk@loaded\relax
}

% ./arabtex/afoot.sty

\let \a@@footnotemark \@footnotemark

\def \a@footnotemark {% inside Arabic environment
\iftrans \unskip \unskip \nobreak \@makefnmark \fi 
\ifarab \a@spacefalse \putwordb@x \@makefnmark \a@spacetrue \fi }

% ./hyperref/hyperref.sty

  \def\@footnotemark{%
    \leavevmode
    \ifhmode\edef\@x@sf{\the\spacefactor}\nobreak\fi
    \stepcounter{Hfootnote}%
    \global\let\Hy@saved@currentHref\@currentHref
    \hyper@makecurrent{Hfootnote}%
    \global\let\Hy@footnote@currentHref\@currentHref
    \global\let\@currentHref\Hy@saved@currentHref
    \hyper@linkstart{link}{\Hy@footnote@currentHref}%
    \@makefnmark
    \hyper@linkend
    \ifhmode\spacefactor\@x@sf\fi
    \relax
  }%


% ./hypdvips/hypdvips.sty

  \def\@footnotemark{%
    \leavevmode
    \ifhmode\edef\@x@sf{\the\spacefactor}\nobreak\fi
    \stepcounter{Hfootnote}%
    \global\let\Hy@saved@currentHref\@currentHref
    \hyper@makecurrent{Hfootnote}%
    \global\let\Hy@footnote@currentHref\@currentHref
    \global\let\@currentHref\Hy@saved@currentHref
    \ifHy@draft%
      \@makefnmark%
    \else%
      \pp@hyperfootnote%
    \fi%
    \ifhmode\spacefactor\@x@sf\fi
    \relax
    }

  \newcommand{\pp@hyperfootnote}{%
    \ifx\pp@activerect\pp@true%
      \@makefnmark%
    \else%
      \ifpp@smallfootnotes%
        \let\pp@backup@@thefnmark\@thefnmark%
        \renewcommand{\@thefnmark}{\pdf@rect{\pp@backup@@thefnmark}}%
        \Hy@colorlink\@footnotecolor%
        \@makefnmark%
        \Hy@endcolorlink%
        \pdfmark{%
          pdfmark=/ANN,%
          linktype=footnote,%
          Subtype=/Link,%
          AcroHighlight=\@pdfhighlight,%
          Border=\@pdfborder,%
          BorderStyle=\@pdfborderstyle,%
          Color=\@footnotebordercolor,%
          Dest=\Hy@footnote@currentHref,%
          Raw=H.B%
          }%
      \let\@thefnmark\pp@backup@@thefnmark%
      \else%
        \pdfmark[\@makefnmark]{%
          pdfmark=/ANN,%
          linktype=footnote,%
          Subtype=/Link,%
          AcroHighlight=\@pdfhighlight,%
          Border=\@pdfborder,%
          BorderStyle=\@pdfborderstyle,%
          Color=\@footnotebordercolor,%
          Dest=\Hy@footnote@currentHref%
          }%
      \fi%
    \fi%
    }


% ./memoir/memhfixc.sty

\ifHy@hyperfootnotes
 \def\@footnotemark{%
    \leavevmode
    \ifhmode\edef\@x@sf{\the\spacefactor}%
      \m@mmf@check% <--- added
    \nobreak\fi
    \stepcounter{Hfootnote}%
    \global\let\Hy@saved@currentHref\@currentHref
    \hyper@makecurrent{Hfootnote}%
    \global\let\Hy@footnote@currentHref\@currentHref
    \global\let\@currentHref\Hy@saved@currentHref
    \hyper@linkstart{link}{\Hy@footnote@currentHref}%
    \@makefnmark
    \hyper@linkend
    \m@mmf@prepare% <--- added
    \ifhmode\spacefactor\@x@sf\fi
    \relax
  }%
\fi


% caption3.sty

% this is altering the top-level when inside a float


% ./koma-script/scrlttr2.cls

\newcommand*{\scr@footnotemark}{%
  \leavevmode
  \ifhmode\edef\@x@sf{\the\spacefactor}\FN@mf@check\nobreak\fi
  \@makefnmark
  \csname FN@mf@prepare\endcsname
  \ifhmode\spacefactor\@x@sf\fi
  \relax}

% tested against this ...

\newcommand*{\scr@saved@footnotemark}{%
  \leavevmode
  \ifhmode\edef\@x@sf{\the\spacefactor}\nobreak\fi
  \@makefnmark
  \ifhmode\spacefactor\@x@sf\fi
  \relax}


% ./chextras/chextras.sty

\ifstd@notes\else
 \let\std@footnotemark\@footnotemark
 \def\alt@footnotemark{\unskip\thinspace\std@footnotemark}
 \let\@footnotemark\alt@footnotemark

% footmisx.sty

  \newcommand*\@footmisxnotemark{%
    \leavevmode
    \ifhmode
      \edef\@x@sf{\the\spacefactor}%
      \FN@mf@check
      \nobreak
    \fi
    \@footmicx@makefnmark
    \ifFN@pp@towrite
      \FN@pp@writetemp
      \FN@pp@towritefalse
    \fi
    \FN@mf@prepare
    \ifhmode\spacefactor\@x@sf\fi
    \relax
  }
 

```
