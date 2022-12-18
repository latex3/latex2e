% ======================================================================
% scrdoc.cls
% Copyright (c) Markus Kohm, 2002-2022
%
% This file is part of the LaTeX2e KOMA-Script bundle.
%
% This work may be distributed and/or modified under the conditions of
% the LaTeX Project Public License, version 1.3c of the license.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX 
% version 2005/12/01 or later and of this work.
%
% This work has the LPPL maintenance status "author-maintained".
%
% The Current Maintainer and author of this work is Markus Kohm.
%
% This work consists of all files listed in MANIFEST.md.
% ======================================================================
% Note: This class was made to shrink size of dtx files.
%       Do not use this class for anything because it may change
%       incompatible from distribution to distribution
% ======================================================================
% $Id: scrdoc.cls 3900 2022-06-24 08:00:42Z kohm $
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{scrdoc}[%
  2022/06/24 v0.1j KOMA-Script source documentation class (deprecated)]

\ClassWarningNoLine{scrdoc}{%
  This class is depreacted since KOMA-Script 3.36!\MessageBreak
  The internal KOMA-Script source documentation class\MessageBreak
  scrdoc is not used any longer for the implementation\MessageBreak
  documentation of KOMA-Script.\MessageBreak
  It is also not compatible with version 3 of the\MessageBreak
  doc package and currently only a workaround is used to\MessageBreak
  force using doc version 2 and to ignore ltxdoc.cfg.\MessageBreak
  You should replace this class urgently, because it will\MessageBreak
  be removed from KOMA-Script soon%
}
  
% scrdoc is incompatible with doc v3. Several changes would be needed
% to improve this. However, currently a kind of emergency workaround can be
% used.
\PassOptionsToClass{nocfg,doc2}{scrdoc}

% Replace article class by scrartcl class.  
\newcommand*{\sd@saved@LoadClass}{}
\let\sd@saved@LoadClass=\LoadClass
\renewcommand*{\LoadClass}[2][]{%
  \begingroup
    \edef\@tempc{#2}\def\@tempb{article}%
    \ifx\@tempc\@tempb
      \let\LoadClass\sd@saved@LoadClass
      \def\@tempc{scrartcl}%
    \fi
    \edef\@tempc{%
      \noexpand\endgroup\noexpand\sd@saved@LoadClass[{#1}]{\@tempc}}%
  \@tempc
}
\newcommand*{\sd@saved@PassOptionsToClass}{}
\let\sd@saved@PassOptionsToClass=\PassOptionsToClass
\renewcommand*{\PassOptionsToClass}[2]{%
  \begingroup
    \edef\@tempc{#2}\def\@tempb{article}%
    \ifx\@tempc\@tempb
      \def\@tempc{scrartcl}%
    \fi
    \edef\@tempc{%
      \noexpand\endgroup\noexpand\sd@saved@PassOptionsToClass{#1}{%
        \@tempc}}%
  \@tempc
}
\LoadClassWithOptions{ltxdoc}[2022/06/14]
\@ifundefined{cs}{\DeclareRobustCommand\cs[1]{\texttt{\bslash #1}}}{}

% Use two columns at index
\setcounter{IndexColumns}{2}

% If \EnableCrossrefs is used, we don't want following macros to be
% indexed:

\DoNotIndex{\.,\\,\ ,\@Alph,\@M}
\DoNotIndex{\@abstrtfalse,\@abstrttrue,\@addtoreset,\@afterheading}
\DoNotIndex{\@afterindentfalse,\@alph,\@arabic}
\DoNotIndex{\@beginparpenalty}
\DoNotIndex{\@car,\@cdr,\@centercr}
\DoNotIndex{\@dblfloat,\@dotsep}
\DoNotIndex{\@dottedtocline,\@empty,\@endparpenalty}
\DoNotIndex{\@float,\@fontswitch}
\DoNotIndex{\@gobbletwo}
\DoNotIndex{\@hangfrom,\@highpenalty}
\DoNotIndex{\@ifnextchar,\@ifundefined,\@itempenalty}
\DoNotIndex{\@latex@warning}
\DoNotIndex{\@m,\@medpenalty,\@minus,\@mkboth,\@mparswitchfalse}
\DoNotIndex{\@mparswitchtrue}
\DoNotIndex{\@ne,\@nil,\@nobreakfalse,\@nobreaktrue,\@nomath}
\DoNotIndex{\@plus}
\DoNotIndex{\@tempa,\@tempcnta,\@tempdima,\@tempskipka}
\DoNotIndex{\@tempswafalse,\@tempswatrue}
\DoNotIndex{\@tempb,\@tempcntb,\@tempdimb,\@tempskipkb}
\DoNotIndex{\@tempswbfalse,\@tempswbtrue}
\DoNotIndex{\@tempc,\@tempcntc,\@tempdimc,\@tempskipkc}
\DoNotIndex{\@tocrmarg,\@topnewpage,\@topnum,\@twocolumnfalse}
\DoNotIndex{\@twocolumntrue,\@twosidefalse,\@twosidetrue}
\DoNotIndex{\@whiledim,\@whilenum}
\DoNotIndex{\addcontentsline,\addpenalty,\addtocontents,\addtolength}
\DoNotIndex{\addvspace,\advance}
\DoNotIndex{\begin,\begingroup,\bfseries,\box,\bullet}
\DoNotIndex{\c@figure,\c@page,\c@secnumdepth,\c@table,\c@tocdepth}
\DoNotIndex{\cdot,\centering,\changes,\cleardoublepage,\clearpage}
\DoNotIndex{\cmd,\col@number,\CurrentOption,\CodelineIndex,\cs}
\DoNotIndex{\day,\dblfloatpagefraction,\dbltopfraction}
\DoNotIndex{\DeclareOldFontCommand,\DeclareOption,\def,\DisableCrossrefs}
\DoNotIndex{\divide,\DoNotIndex}
\DoNotIndex{\ifdim,\else,\fi,\empty,\em,\EnableCrossrefs,\end}
\DoNotIndex{\end@dblfloat}
\DoNotIndex{\end@float,\endgroup,\endlist,\endquotation,\endtitlepage}
\DoNotIndex{\everypar,\ExecuteOptions,\expandafter}
\DoNotIndex{\fboxrule,\fboxsep}
\DoNotIndex{\gdef,\global}
\DoNotIndex{\hangindent,\hbox,\hfil,\hrule,\hsize,\hskip,\hspace,\hss}
\DoNotIndex{\if@tempswa,\ifcase,\or,\fi,\fi}
\DoNotIndex{\ifnum,\ifodd,\ifx,\fi,\fi,\fi}
\DoNotIndex{\include,\input,\InputIfFileExists,\item,\itshape}
\DoNotIndex{\kern,\kernel@ifnextchar}
\DoNotIndex{\leavevmode,\leftmark,\leftskip,\let,\lineskip}
\DoNotIndex{\list,\long}
\DoNotIndex{\m@ne,\m@th,\marginpar,\markboth,\markright,\mathbf,\mathcal}
\DoNotIndex{\mathit,\mathnormal,\mathrm,\mathsf,\mathtt,\MessageBreak}
\DoNotIndex{\month}
\DoNotIndex{\newblock,\newcommand,\newcount,\newcounter,\newdimen}
\DoNotIndex{\newenvironment,\newlength,\newpage,\nobreak,\noindent}
\DoNotIndex{\normalfont,\normallineskip,\normalsize,\null,\number}
\DoNotIndex{\numberline,\normalcolor}
\DoNotIndex{\OldMakeindex,\OnlyDescription,\overfullrule}
\DoNotIndex{\p@,\PackageError,\PackageInfo,\PackageWarningNoLine}
\DoNotIndex{\pagenumbering,\pagestyle,\par,\paragraph,\parbox}
\DoNotIndex{\PassOptionsToPackage,\pcal,\penalty,\pmit,\PrintChanges}
\DoNotIndex{\PrintIndex,\ProcessOptions,\protect,\providecommand}
\DoNotIndex{\ProvidesClass}
\DoNotIndex{\raggedbottom,\raggedleft,\raggedright,\refstepcounter,\relax}
\DoNotIndex{\renewcommand,\RequirePackage,\reset@font}
\DoNotIndex{\rightmargin,\rightmark,\rightskip,\rmfamily,\@Roman,\@roman}
\DoNotIndex{\scshape,\secdef,\setbox,\setcounter,\setlength}
\DoNotIndex{\settowidth,\sfcode,\sffamily,\skip,\sloppy,\slshape,\space}
\DoNotIndex{\string}
\DoNotIndex{\the,\thispagestyle,\triangleright,\ttfamily}
\DoNotIndex{\twocolumn,\typeout}
\DoNotIndex{\undefined,\usecounter}
\DoNotIndex{\vfil,\vfill,\vspace}
\DoNotIndex{\wd,\xdef,\year,\z@}
% More may be set by the source files.

% Redefine some defaults to handle not only macros and environments
% but also options, Length, Counters, KOMAvars. Also define some new.
\def\macro{\begingroup
  \catcode`\\12
  \MakePrivateLetters \m@cro@{0}}
\def\environment{\begingroup
  \catcode`\\12
  \MakePrivateLetters \m@cro@{1}}
\def\option{\begingroup
  \catcode`\\12
  \MakePrivateLetters \m@cro@{2}}
\def\Length{\begingroup
  \catcode`\\12
  \MakePrivateLetters \m@cro@{3}}
\def\Counter{\begingroup
  \catcode`\\12
  \MakePrivateLetters \m@cro@{4}}
\def\KOMAvar{\begingroup
  \catcode`\\12
  \MakePrivateLetters \m@cro@{5}}
\def\KOMAfont{\begingroup
  \catcode`\\12
  \MakePrivateLetters \m@cro@{6}}
\long\def\m@cro@#1#2{\endgroup \topsep\MacroTopsep \trivlist
  \edef\saved@macroname{\string#2}%
  \ifcase #1
    \edef\saved@indexname{\expandafter\@gobble\string#2}%
  \else
    \let\saved@indexname\saved@macroname
  \fi
  \def\makelabel##1{\llap{##1}}%
  \if@inlabel
    \let\@tempa\@empty \count@\macro@cnt
    \loop \ifnum\count@>\z@
      \edef\@tempa{\@tempa\hbox{\strut}}\advance\count@\m@ne 
    \repeat
    \edef\makelabel##1{\llap{\vtop to\baselineskip
        {\@tempa\hbox{##1}\vss}}}%
    \advance \macro@cnt \@ne
  \else \macro@cnt\@ne \fi
  \edef\@tempa{\noexpand\item[%
    \ifcase #1
      \noexpand\PrintMacroName
    \or
      \noexpand\PrintEnvName
    \or
      \noexpand\PrintOptionName
    \or
      \noexpand\PrintLengthName
    \or
      \noexpand\PrintCounterName
    \or
      \noexpand\PrintKOMAvarName
    \or
      \noexpand\PrintKOMAfontName
    \fi
    {\string#2}]}%
  \@tempa
  \global\advance\c@CodelineNo\@ne
  \ifcase #1
    \SpecialMainIndex{#2}\nobreak
    \DoNotIndex{#2}%
  \or
    \SpecialMainEnvIndex{#2}\nobreak
  \or
    \SpecialMainOptionIndex{#2}\nobreak
  \or
    \SpecialMainLengthIndex{#2}\nobreak
    \DoNotIndex{#2}%
  \or
    \SpecialMainCounterIndex{#2}\nobreak
  \or
    \SpecialMainKOMAvarIndex{#2}\nobreak
  \or
    \SpecialMainKOMAfontIndex{#2}\nobreak
  \fi
  \global\advance\c@CodelineNo\m@ne
  \ignorespaces}
\let\endoption\endmacro
\let\endLength\endmacro
\let\endCounter\endmacro
\let\endKOMAvar\endmacro

% Some new command
\newcommand*{\File}[1]{\texttt{\mbox{#1}}}
\newcommand*{\Class}{\File}
\newcommand*{\Package}{\File}
\newcommand*{\Macro}{\cs}
\newcommand*{\Option}{\File}

% The new names we need
\providecommand*{\EnvName}{Umgebung}% This is german
\providecommand*{\EnvsName}{Umgebungen}% This is german
\providecommand*{\OptionName}{Option}% This is german
\providecommand*{\OptionsName}{Optionen}% This is german
\providecommand*{\PrintOptionName}[1]{\strut \MacroFont #1\ }
\providecommand*{\PrintDescribeOption}[1]{\strut \MacroFont #1\ }
\providecommand*{\LengthName}{L\"ange}% This is german
\providecommand*{\LengthsName}{L\"angen}% This is german
\providecommand*{\PrintLengthName}[1]{\strut \MacroFont \string #1\ }
\providecommand*{\PrintDescribeLength}[1]{\strut \MacroFont \string #1\ }
\providecommand*{\CounterName}{Z\"ahler}% This is german
\providecommand*{\CountersName}{Z\"ahler}% This is german
\providecommand*{\PrintCounterName}[1]{\strut \MacroFont #1\ }
\providecommand*{\PrintDescribeCounter}[1]{\strut \MacroFont #1\ }
\providecommand*{\KOMAvarName}{Variable}% This is german
\providecommand*{\KOMAvarsName}{Variablen}% This is german
\providecommand*{\PrintKOMAvarName}[1]{\strut \MacroFont #1\ }
\providecommand*{\PrintDescribeKOMAvar}[1]{\strut \MacroFont #1\ }
\providecommand*{\KOMAfontName}{Element mit Schrift}% This is german
\providecommand*{\KOMAfontsName}{Elemente mit Schrift}% This is german
\providecommand*{\PrintKOMAfontName}[1]{\strut \MacroFont #1\ }
\providecommand*{\PrintDescribeKOMAfont}[1]{\strut \MacroFont #1\ }

% Defining new main index commands
\newcommand*{\SpecialMainIndex@Type}[3]{%
  \@bsphack\special@index{%
    #1\actualchar
    {\string\ttfamily\space#1}
    (\string #2)%
    \encapchar main}%
  \special@index{%
    #3:\levelchar{%
      \string\ttfamily\space#1}\encapchar
    main}\@esphack}
\renewcommand*{\SpecialMainEnvIndex}[1]{%
  \SpecialMainIndex@Type{#1}{\EnvName}{\EnvsName}}
\newcommand*{\SpecialMainOptionIndex}[1]{%
  \SpecialMainIndex@Type{#1}{\OptionName}{\OptionsName}}
\newcommand*{\SpecialMainLengthIndex}[1]{%
  \@bsphack\SpecialIndex@{#1}{(\string\LengthName )\encapchar main}%
  \@esphack}
\newcommand*{\SpecialMainCounterIndex}[1]{%
  \SpecialMainIndex@Type{#1}{\CounterName}{\CountersName}}
\newcommand*{\SpecialMainKOMAvarIndex}[1]{%
  \SpecialMainIndex@Type{#1}{\KOMAvarName}{\KOMAvarsName}}
\newcommand*{\SpecialMainKOMAfontIndex}[1]{%
  \SpecialMainIndex@Type{#1}{\KOMAfontName}{\KOMAfontsName}}

% Defining new usage index commands
\newcommand*{\SpecialIndex@Type}[3]{%
  \@bsphack
  \index{#1\actualchar{\protect\ttfamily#1}
    (#2)\encapchar usage}%
  \index{#3:\levelchar{\protect\ttfamily#1}\encapchar
    usage}\@esphack}
\renewcommand{\SpecialEnvIndex}[1]{%
  \SpecialIndex@Type{#1}{\EnvName}{\EnvsName}}
\newcommand*{\SpecialOptionIndex}[1]{%
  \SpecialMainIndex@Type{#1}{\OptionName}{\OptionsName}}
\newcommand*{\SpecialLengthIndex}[1]{\@bsphack%
  {\let\special@index\index
    \SpecialIndex@{#1}{(\string\LengthName )\encapchar usage}}%
  \@esphack}
\newcommand*{\SpecialCounterIndex}[1]{%
  \SpecialMainIndex@Type{#1}{\CounterName}{\CountersName}}
\newcommand*{\SpecialKOMAvarIndex}[1]{%
  \SpecialMainIndex@Type{#1}{\KOMAvarName}{\KOMAvarsName}}

% Define new describe commands
\newcommand*{\newDescribe}[1]{%
  \expandafter\newcommand\expandafter*\csname Describe#1\endcsname{%
    \leavevmode\@bsphack\begingroup\MakePrivateLetters
    \csname Describe@#1\endcsname}%
  \expandafter\newcommand\expandafter*\csname Describe@#1\endcsname[1]{%
    \endgroup
    \marginpar{\raggedleft\csname PrintDescribe#1\endcsname{##1}}%
    \csname Special#1Index\endcsname{##1}\@esphack\ignorespaces}%
}
\newDescribe{Option}

% We use left margin very much, so shift everything to the right
\if@twoside
\else
\addtolength{\oddsidemargin}{1in}
\setlength{\oddsidemargin}{1.5\oddsidemargin}
\addtolength{\oddsidemargin}{-1in}
\fi

% We need some logos:
\providecommand*{\eTeX}{$\m@th\varepsilon$-\TeX}

% Terms for other languages:
\AtBeginDocument{%
  \begingroup\expandafter\expandafter\expandafter\endgroup
  \expandafter\ifx\csname addto\endcsname\relax
    \ClassWarning{scrdoc}{Package babel not loaded}%
  \else
    \addto\captionsenglish{%
      \def\partname{File}%
    }%
    \addto\captionsngerman{%
      \def\partname{Datei}%
    }%
    \ClassInfo{scrdoc}{Select language \languagename}%
    \expandafter\selectlanguage\expandafter{\languagename}%
  \fi
}

\endinput
% end of ``scrdoc.cls''
