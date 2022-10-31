%%
%% This is file `koma-script-source-doc.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% koma-script-source-doc.dtx  (with options: `class')
%% scrlogo.dtx  (with options: `logo,forcedefine')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from koma-script-source-doc.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file koma-script-source-doc.dtx scrlogo.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
%%
\ProvidesClass{koma-script-source-doc}
[2022-03-10 v0.91 KOMA-Script source documentation]
\RequirePackage{l3keys2e}
\ExplSyntaxOn
\newif \ifkdoc@indexlatex \kdoc@indexlatexfalse
\keys_define:nn {kdoc}
  {
    indexlatex  .choice:,
    indexlatex / true  .code:n = { \legacy_if_set_true:n  { kdoc@indexlatex } },
    indexlatex / false .code:n = { \legacy_if_set_false:n { kdoc@indexlatex } },
    indexlatex .default:n = { true },
  }
\ExplSyntaxOff
\ProcessKeysOptions {kdoc}
\IfFileExists{scrartcl.cls}{%
  \declare@file@substitution{article.cls}{scrartcl.cls}
  \PassOptionsToClass{fontsize=10pt}{scrartcl}
}{%
  \ClassWarningNoLine{koma-script-source-doc}{%
    Usually this class should be used with KOMA-Script\MessageBreak
    scrartcl. But as that class is not available we use\MessageBreak
    standard class article as emergency fallback.\MessageBreak
    It is recommended to repeat this LaTeX run after\MessageBreak
    build/installation of a complete KOMA-Script%
  }%
}
\LoadClassWithOptions{ltxdoc}[2021/12/07]
\IfPackageAtLeastTF{doc}{2022/06/01}{}{%
  \ClassError{koma-script-source-doc}{old package `doc' detected}{%
    This class needs `doc' v3. It cannot be used with\MessageBreak
    `doc' v2. `doc' v3 is available at LaTeX developer\MessageBreak
    release from at least January 2022}%
  \csname fi\endcsname\csname @@end\endcsname\end\endinput
}
\SetupDoc{reportchangedates}
\CodelineIndex
\RecordChanges
\ifkdoc@indexlatex\else
  \DoNotIndex{\.,\\,\ ,\@,\@Alph,\@M}
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
  \DoNotIndex{\@Roman,\@roman}
  \DoNotIndex{\@tempa,\@tempcnta,\@tempdima,\@tempskipka}
  \DoNotIndex{\@tempswafalse,\@tempswatrue}
  \DoNotIndex{\@tempb,\@tempcntb,\@tempdimb,\@tempskipkb}
  \DoNotIndex{\@tempswbfalse,\@tempswbtrue}
  \DoNotIndex{\@tempc,\@tempcntc,\@tempdimc,\@tempskipkc}
  \DoNotIndex{\@tocrmarg,\@topnewpage,\@topnum,\@twocolumnfalse}
  \DoNotIndex{\@twocolumntrue,\@twosidefalse,\@twosidetrue}
  \DoNotIndex{\@whiledim,\@whilenum}
  \DoNotIndex{\addcontentsline,\addpenalty,\addtocontents,\addtolength}
  \DoNotIndex{\addvspace,\advance,\AtBeginDocument}
  \DoNotIndex{\begin,\begingroup,\bfseries,\box,\bullet}
  \DoNotIndex{\c@figure,\c@page,\c@secnumdepth,\c@table,\c@tocdepth}
  \DoNotIndex{\cdot,\centering,\changes,\cleardoublepage,\clearpage}
  \DoNotIndex{\cmd,\col@number,\CurrentOption,\CodelineIndex,\cs}
  \DoNotIndex{\day,\dblfloatpagefraction,\dbltopfraction}
  \DoNotIndex{\declare@file@substitution}
  \DoNotIndex{\DeclareOldFontCommand,\DeclareOption,\def,\DisableCrossrefs}
  \DoNotIndex{\divide,\DoNotIndex}
  \DoNotIndex{\ifdim,\else,\fi,\empty,\em,\EnableCrossrefs,\end}
  \DoNotIndex{\end@dblfloat}
  \DoNotIndex{\end@float,\endgroup,\endlist,\endquotation,\endtitlepage}
  \DoNotIndex{\everypar,\ExecuteOptions,\expandafter}
  \DoNotIndex{\fboxrule,\fboxsep}
  \DoNotIndex{\g@addto@macro,\gdef,\global}
  \DoNotIndex{\hangindent,\hbox,\hfil,\hrule,\hsize,\hskip,\hspace,\hss}
  \DoNotIndex{\if@tempswa,\ifcase,\or,\fi,\fi}
  \DoNotIndex{\ifnum,\ifodd,\ifx,\fi,\fi,\fi}
  \DoNotIndex{\include,\input,\InputIfFileExists,\item,\itshape}
  \DoNotIndex{\kern,\kernel@ifnextchar}
  \DoNotIndex{\leavevmode,\leftmark,\leftskip,\let,\lineskip}
  \DoNotIndex{\list,\long,\LoadClass,\LoadClassWithOptions}
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
  \DoNotIndex{\renewcommand,\RenewDocElement,\RequirePackage}
  \DoNotIndex{\reserved@a,\reserved@b,\reserved@c,\reset@font}
  \DoNotIndex{\rightmargin,\rightmark,\rightskip,\rmfamily}
  \DoNotIndex{\scshape,\secdef,\setbox,\setcounter,\setlength}
  \DoNotIndex{\settowidth,\sfcode,\sffamily,\skip,\sloppy,\slshape,\space}
  \DoNotIndex{\string}
  \DoNotIndex{\TeX,\textbf,\textit,\textrm,\textsf,\texttt,\textup}
  \DoNotIndex{\the,\thispagestyle,\triangleright,\ttfamily}
  \DoNotIndex{\twocolumn,\typeout}
  \DoNotIndex{\undefined,\usecounter}
  \DoNotIndex{\vfil,\vfill,\vspace}
  \DoNotIndex{\wd,\xdef,\year,\z@}
\fi
\ifdefined\AfterCalculatingTypearea
  \AfterCalculatingTypearea{%
    \addtolength{\oddsidemargin}
                {.5\dimexpr\oddsidemargin+1in\relax}%
    \setlength{\marginparwidth}
              {\dimexpr \oddsidemargin+1in-2\marginparsep\relax}%
    \setlength{\marginparpush}{0pt}%
  }
  \KOMAoption{DIV}{9}
\fi
\RequirePackage{auxhook}
\expandafter\def\expandafter\index@prologue\expandafter{%
  \expandafter\kssd@section@hack\index@prologue}
\expandafter\def\expandafter\glossary@prologue\expandafter{%
  \expandafter\kssd@section@hack\glossary@prologue}
\newcommand*{\kssd@section@hack}{%
  \let\ksdd@markboth\markboth
  \def\markboth##1##2{%
    \@ifundefined{addsectiontocentry}{%
      \@ifundefined{addxcontentsline}{%
        \addcontentsline{toc}{section}{\numberline{}##1}%
      }{%
        \addxcontentsline{toc}{section}{##1}%
      }%
    }{%
      \addsectiontocentry{}{##1}%
    }%
    \let\markboth\ksdd@markboth
    \markboth{##1}{##2}%
  }%
}
\newcommand*{\file}{\texttt}
\newcommand*{\cls}{\pkg}
\NewDocumentCommand{\pkg}{sO{https://www.ctan.org/pkg/#3}m}{%
  \IfBooleanTF{#1}{\@gobble}{%
    \csname tl_if_blank:nTF\endcsname{#2}{\@gobble}{\href}%
  }%
  {#2}{\textsf{#3}}%
}
\newcommand*{\opt}{\texttt}
\newcommand*{\optvalue}{\texttt}
\newcommand*{\env}{\texttt}
\newcommand*{\len}{\cs}
\newcommand*{\cnt}{\texttt}
\newcommand*{\fnt}{\texttt}
\newcommand*{\var}{\texttt}
\newcommand*{\plen}{\texttt}
\newcommand*{\pstyle}{\texttt}
\newcommand*{\dhook}{\texttt}
\RenewDocElement[%
  macrolike = true,
  toplevel  = false,
  idxtype   = ,
  idxgroup  = TeX macros (internal)\actualchar\TeX{} macros (internal),
  printtype = \textit{intern}
]{Macro}{macro}
\NewDocElement[%
  macrolike = true,
  toplevel  = true,
  idxtype   = ,
  idxgroup  = Commands,
  printtype = ,
]{Command}{command}
\RenewDocElement[%
  macrolike = false,
  toplevel  = true,
  idxtype   = \textit{env.} ,
  idxgroup  = Environments,
  printtype = \textit{env.}
]{Env}{environment}
\NewDocElement[%
  macrolike = false,
  toplevel  = true,
  idxtype   = \textit{opt.},
  idxgroup  = Options,
  printtype = \textit{opt.}
]{Option}{option}
\NewDocElement[%
  macrolike = true,
  toplevel  = false,
  idxtype   = ,
  idxgroup  = Lengths (internal),
  printtype = \textit{ilen.}
]{ILength}{ilength}
\NewDocElement[%
  macrolike = true,
  toplevel  = true,
  idxtype   = \textit{len.},
  idxgroup  = Lengths (user),
  printtype = \textit{len.},
]{Length}{length}
\NewDocElement[%
  macrolike = false,
  toplevel  = true,
  idxtype   = \textit{cnt.},
  idxgroup  = Counters,
  printtype = \textit{cnt.},
]{Counter}{counter}
\NewDocElement[%
  macrolike = false,
  toplevel  = true,
  idxtype   = \textit{font},
  idxgroup  = KOMA-Script font elements\actualchar\KOMAScript{} font elements,
  printtype = \textit{font},
]{KOMAfont}{fontelement}
\NewDocElement[%
  macrolike = false,
  toplevel  = true,
  idxtype   = \textit{var.},
  idxgroup  = KOMA-Script variables\actualchar\KOMAScript{} variables,
  printtype = \textit{var.},
]{KOMAvar}{variable}
\NewDocElement[%
  macrolike = false,
  toplevel  = true,
  idxtype   = \textit{plen.},
  idxgroup  = KOMA-Script pseudo-lengths\actualchar\KOMAScript{} pseudo-lengths,
  printtype = \textit{plen.},
]{PLength}{pseudolength}
\NewDocElement[%
  macrolike = false,
  toplevel  = true,
  idxtype   = \textit{pgstyle},
  idxgroup  = page styles,
  printtype = \textit{style}
]{PageStyle}{pgstyle}
\NewDocElement[%
  macrolike = false,
  toplevel  = true,
  idxtype   = \textit{do hook},
  idxgroup  = do hooks,
  printtype = \textit{dohook}
]{DoHook}{dohook}
%%% From File: $Id: scrlogo.dtx 3688 2022-02-10 08:26:37Z kohm $
\IfFileExists{scrlogo.sty}{%
\RequirePackage{scrlogo}
}{}%
\@ifundefined{KOMAScript}{%
  \DeclareRobustCommand*{\KOMAScript}{\textsf{K\kern.05em O\kern.05em%
      M\kern.05em A\kern.1em-\kern.1em Script}}%
  \@ifundefined{pdfstringdefPreHook}{%
    \def
  }{%
    \g@addto@macro
  }%
  \pdfstringdefPreHook{%
    \def\KOMAScript{KOMA-Script}%
    \expandafter\def\csname KOMAScript \endcsname{KOMA-Script}%
  }%
}{}
\endinput
%%
%% End of file `koma-script-source-doc.cls'.
