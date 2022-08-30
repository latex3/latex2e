%%
%% This is file `scrreprt.cls',
%% generated with the docstrip utility, extended by scrdocstrip.
%%
%% The original source files were:
%%
%% scrkernel-version.dtx  (with options: `class,report')
%% scrkernel-basics.dtx  (with options: `class,load')
%% scrkernel-listsof.dtx  (with options: `class,report,prepare')
%% scrkernel-tocstyle.dtx  (with options: `class,report,prepare')
%% scrkernel-sections.dtx  (with options: `class,report,prepare')
%% scrkernel-compatibility.dtx  (with options: `class,report,init')
%% scrkernel-typearea.dtx  (with options: `class,report,init')
%% scrkernel-compatibility.dtx  (with options: `class,report,option')
%% scrkernel-miscellaneous.dtx  (with options: `class,report,option')
%% scrkernel-language.dtx  (with options: `class,report,option')
%% scrkernel-fonts.dtx  (with options: `class,report,option')
%% scrkernel-typearea.dtx  (with options: `class,report,options')
%% scrkernel-paragraphs.dtx  (with options: `class,report,option')
%% scrkernel-title.dtx  (with options: `class,report,option')
%% scrkernel-tocstyle.dtx  (with options: `class,report,option')
%% scrkernel-sections.dtx  (with options: `class,report,option')
%% scrkernel-pagestyles.dtx  (with options: `class,report,option')
%% scrkernel-floats.dtx  (with options: `class,report,option')
%% scrkernel-footnotes.dtx  (with options: `class,report,option')
%% scrkernel-listsof.dtx  (with options: `class,report,option')
%% scrkernel-bibliography.dtx  (with options: `class,report,option')
%% scrkernel-index.dtx  (with options: `class,report,option')
%% scrkernel-listsandtabulars.dtx  (with options: `class,report,option')
%% scrkernel-sections.dtx  (with options: `class,report,execoption')
%% scrkernel-miscellaneous.dtx  (with options: `class,report,execoption')
%% scrkernel-compatibility.dtx  (with options: `class,report,body')
%% scrkernel-fonts.dtx  (with options: `class,report,body')
%% scrkernel-language.dtx  (with options: `class,report,body')
%% scrkernel-typearea.dtx  (with options: `class,report,body')
%% scrkernel-paragraphs.dtx  (with options: `class,report,body')
%% scrkernel-title.dtx  (with options: `class,report,body')
%% scrkernel-tocstyle.dtx  (with options: `class,report,body')
%% scrkernel-tocstyle.dtx  (with options: `class,report,style,part')
%% scrkernel-tocstyle.dtx  (with options: `class,report,style,chapter')
%% scrkernel-tocstyle.dtx  (with options: `class,report,style,section')
%% scrkernel-tocstyle.dtx  (with options: `class,report,style,default')
%% scrkernel-sections.dtx  (with options: `class,report,body')
%% scrkernel-miscellaneous.dtx  (with options: `class,report,body')
%% scrkernel-pagestyles.dtx  (with options: `class,report,body')
%% scrlayer.dtx  (with options: `class,report,body')
%% scrkernel-floats.dtx  (with options: `class,report,body')
%% scrkernel-footnotes.dtx  (with options: `class,report,body')
%% scrkernel-listsof.dtx  (with options: `class,report,body')
%% scrkernel-bibliography.dtx  (with options: `class,report,body')
%% scrkernel-index.dtx  (with options: `class,report,body')
%% scrkernel-listsandtabulars.dtx  (with options: `class,report,body')
%% scrlogo.dtx  (with options: `logo')
%% 
%% Copyright (c) 1994-2021 Markus Kohm [komascript at gmx info]
%% 
%% This file was generated from file(s) of the KOMA-Script bundle.
%% ---------------------------------------------------------------
%% 
%% It may be distributed under the conditions of the
%% LaTeX Project Public License in the version distributed together
%% with KOMA-Script, see file `lppl.txt' or `lppl-de.txt'.
%% 
%% This file may only be distributed together with a copy of the
%% KOMA-Script bundle.  You may however distribute the
%% KOMA-Script bundle without all such generated files.  See also
%% `lppl.txt' or `lppl-de.txt' for additional information.
%% 
%% The list of files belonging to KOMA-Script distribution is given in
%% the file `MANIFEST.md'.  See also `lppl.txt' or `lppl-de.txt' for
%% additional information.
%% 
%% If this file is a beta version, you may not be allowed to distribute
%% it.  Look at the comments below to see if this is the case.
%% 
%% English and German manuals are part of KOMA-Script bundle.
%% ----------------------------------------------------------
%% 
%% See `README'.
%% 
%% The KOMA-Script bundle (but maybe not this file) was based upon the
%% LaTeX 2.09 Script family created by Frank Neukam 1993 and the LaTeX2e
%% standard classes created by The LaTeX3 Project 1994-1996.  You can
%% find a complete unmodified copy of LaTeX2e at
%% <http://mirror.ctan.org/tex-archive/macros/latex/base/>.
%% 
%%% From File: $Id: scrkernel-version.dtx 3920 2022-07-04 08:01:38Z kohm $
\begingroup
  \catcode`\@11\relax
  \ifx\KOMAScriptVersion\undefined
    \newcommand*{\@CheckKOMAScriptVersion}[1]{%
      \gdef\KOMAScriptVersion{#1}%
    }%
  \else
    \newcommand*{\@CheckKOMAScriptVersion}[1]{%
      \def\@tempa{#1}%
      \ifx\KOMAScriptVersion\@tempa\else
        \@latex@warning@no@line{%
          \noexpand\KOMAScriptVersion\space is
          `\KOMAScriptVersion',\MessageBreak
          but `#1' was expected!\MessageBreak
          You should not use classes, packages or files
          from\MessageBreak
          different KOMA-Script versions%
        }%
      \fi
    }
  \fi
  \@CheckKOMAScriptVersion{2022/07/04 v3.37 KOMA-Script}%
\endgroup
\providecommand*{\scr@clsextension}{\@clsextension}
\AtBeginDocument{%
  \let\scr@clsextension\@clsextension
}
\newcommand*{\KOMAClassName}{%
  scrreprt%
}
\newcommand*{\KOMAClassFileName}{\KOMAClassName.\@clsextension}
\edef\KOMAClassFileName{\KOMAClassFileName}
\newcommand*{\ClassName}{%
  report%
}
\ProvidesClass{\KOMAClassName}[%
  2022/07/04 v3.37 KOMA-Script
  document class (\ClassName)%
]
%%% From File: $Id: scrkernel-basics.dtx 3913 2022-06-28 07:45:49Z kohm $
%%%            (run: load)
\RequirePackage{scrkbase}[\KOMAScriptVersion]
%%% From File: $Id: scrkernel-listsof.dtx 3892 2022-06-17 16:26:06Z kohm $
%%%            (run: prepare)
\RequirePackage{tocbasic}[%
  2022/07/04 v3.37 KOMA-Script
]
\AtAddToTocList[\@currname.\@currext]{\setuptoc{\@currext}{onecolumn}}%
\AtAddToTocList[ToC]{\setuptoc{\@currext}{onecolumn}}%
\addtotoclist[ToC]{toc}
\Ifstr{\ext@toc}{toc}{}{%
  \expandafter\addtotoclist
  \expandafter[\expandafter T\expandafter o\expandafter C\expandafter ]%
  \expandafter{\ext@toc}%
}
\AtAddToTocList[float]{\setuptoc{\@currext}{onecolumn}}%
%%% From File: $Id: scrkernel-tocstyle.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: prepare)
%%% From File: $Id: scrkernel-sections.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: prepare)
\newif\if@openright
\@openrightfalse
\newcommand*{\scr@dotchangeatdocument}[1]{%
  \ClassError{\KOMAClassName}{%
    change of end dot feature after \string\begin{document}%
  }{%
    You've tried to set `numbers=#1' after \string\begin{document},\MessageBreak
    but this option is only allowed at the document preamble.\MessageBreak
    See KOMA-Script manual for more information about.%
  }%
}
\newif\if@altsecnumformat\@altsecnumformatfalse
\newif\if@autodot
\renewcommand*{\@autodottrue}{\global\let\if@autodot\iftrue}
\renewcommand*{\@autodotfalse}{\global\let\if@autodot\iffalse}
\@autodotfalse
\newcommand*{\scr@altsecnumhook}{}
\AtBeginDocument{\scr@altsecnumhook}
\newcommand*{\scr@altsecnumhooktrue}{%
  \@altsecnumformattrue\global\let\@altsecnumformatfalse\@altsecnumformattrue
}
\newcommand*{\scr@altsecnumhookfalse}{%
  \@altsecnumformatfalse\global\let\@altsecnumformattrue\@altsecnumformatfalse
}
\newcommand*{\scr@osectarg}{0}
\newcommand*{\scr@activate@xsection}[1]{%
  \renewcommand*{\scr@osectarg}{#1}%
}
\IfLTXAtLeastTF{2020/10/01}{\NewHook{\KOMAClassName/appendix}}{}
\newcommand*{\size@part}{}
\newcommand*{\scr@fnt@part}{\size@part}
\newcommand*{\size@partnumber}{}
\newcommand*{\scr@fnt@partnumber}{\size@partnumber}
\aliaskomafont{partprefix}{partnumber}
\newcommand*{\scr@part@beforeskip}{%
  \z@ \@plus 1fil + \baselineskip
}
\newcommand*{\scr@part@innerskip}{20\p@}
\newcommand*{\scr@part@afterskip}{%
  \z@ \@plus 1fil
}
\newcommand*{\scr@part@style}{part}
\newcommand*{\partheadstartvskip}{%
  \null\vskip-\baselineskip\vskip\@tempskipa
}
\newcommand*{\partheadmidvskip}{%
  \par\nobreak
  \vskip\@tempskipa
}
\newcommand*{\partheadendvskip}{%
  \vskip\@tempskipa\newpage
}
\newcommand*{\partheademptypage}{%
  \if@twoside\if@openright
      \null%
      \thispagestyle{empty}%
      \newpage
  \fi\fi
}
\newif\if@chapterprefix
\newcommand*{\size@chapter}{}
\newcommand*{\scr@fnt@chapter}{\size@chapter}
\newcommand*{\size@chapterprefix}{\size@chapter}
\newcommand*{\scr@fnt@chapterprefix}{\size@chapterprefix}
\newcommand*{\scr@chapter@beforeskip}{\z@}
\let\scr@chapter@beforeskip\z@
\newcommand*{\scr@chapter@afterskip}{\z@}
\let\scr@chapter@afterskip\z@
\newcommand*{\scr@chapter@innerskip}{\z@}
\let\scr@chapter@innerskip\z@
\newcommand*{\scr@chapter@style}{chapter}
\newcommand*{\chapterheadstartvskip}{\vspace{\@tempskipa}}
\newcommand*{\chapterheadendvskip}{\vskip\@tempskipa}
\newcommand*{\chapterheadmidvskip}{\par\nobreak\vskip\@tempskipa}
\newcommand*{\size@section}{}
\newcommand*{\scr@fnt@section}{\size@section}
\newcommand*{\size@subsection}{}
\newcommand*{\scr@fnt@subsection}{\size@subsection}
\newcommand*{\size@subsubsection}{}
\newcommand*{\scr@fnt@subsubsection}{\size@subsubsection}
\newcommand*{\size@paragraph}{}
\newcommand*{\scr@fnt@paragraph}{\size@paragraph}
\newcommand*{\size@subparagraph}{}
\newcommand*{\scr@fnt@subparagraph}{\size@subparagraph}
\newcommand*{\sectfont}{\normalcolor\@gr@gsffamily\bfseries}
%%% From File: $Id: scrkernel-compatibility.dtx 3896 2022-06-21 09:06:07Z kohm $
%%%            (run: init)
\newcommand*
  {\scr@compatibility}{\scr@v@last}
\@namedef{scr@v@first}{0}
\@namedef{scr@v@2.9}{0}
\@namedef{scr@v@2.9t}{0}
\@namedef{scr@v@2.9u}{1}
\@namedef{scr@v@2.95}{2}
\@namedef{scr@v@2.95a}{2}
\@namedef{scr@v@2.95b}{2}
\@namedef{scr@v@2.96}{2}
\@namedef{scr@v@2.96a}{3}
\@namedef{scr@v@2.97}{3}
\@namedef{scr@v@2.97a}{3}
\@namedef{scr@v@2.97b}{3}
\@namedef{scr@v@2.97c}{4}
\@namedef{scr@v@2.97d}{5}
\@namedef{scr@v@2.97e}{6}
\@namedef{scr@v@2.98}{6}
\@namedef{scr@v@2.98a}{6}
\@namedef{scr@v@2.98b}{6}
\@namedef{scr@v@2.98c}{7}
\@namedef{scr@v@3.00}{8}
\@namedef{scr@v@3.01}{8}
\@namedef{scr@v@3.01a}{8}
\@namedef{scr@v@3.01b}{9}
\@namedef{scr@v@3.01c}{9}
\@namedef{scr@v@3.02}{9}
\@namedef{scr@v@3.02b}{9}
\@namedef{scr@v@3.02c}{10}
\@namedef{scr@v@3.03}{10}
\@namedef{scr@v@3.03a}{10}
\@namedef{scr@v@3.03b}{10}
\@namedef{scr@v@3.04}{10}
\@namedef{scr@v@3.04a}{10}
\@namedef{scr@v@3.05}{10}
\@namedef{scr@v@3.05a}{10}
\@namedef{scr@v@3.06}{10}
\@namedef{scr@v@3.07}{10}
\@namedef{scr@v@3.08}{10}
\@namedef{scr@v@3.08a}{10}
\@namedef{scr@v@3.08b}{10}
\@namedef{scr@v@3.09}{10}
\@namedef{scr@v@3.09a}{10}
\@namedef{scr@v@3.10}{10}
\@namedef{scr@v@3.10a}{10}
\@namedef{scr@v@3.10b}{10}
\@namedef{scr@v@3.11}{10}
\@namedef{scr@v@3.11a}{10}
\@namedef{scr@v@3.11b}{10}
\@namedef{scr@v@3.12}{11}
\@namedef{scr@v@3.13}{12}
\@namedef{scr@v@3.13a}{13}
\@namedef{scr@v@3.14}{13}
\@namedef{scr@v@3.15}{14}
\@namedef{scr@v@3.16}{14}
\@namedef{scr@v@3.17}{15}
\@namedef{scr@v@3.17a}{15}
\@namedef{scr@v@3.17c}{15}
\@namedef{scr@v@3.18}{15}
\@namedef{scr@v@3.18a}{15}
\@namedef{scr@v@3.19}{15}
\@namedef{scr@v@3.19a}{15}
\@namedef{scr@v@3.20}{15}
\@namedef{scr@v@3.21}{15}
\@namedef{scr@v@3.22}{16}
\@namedef{scr@v@3.23}{16}
\@namedef{scr@v@3.24}{16}
\@namedef{scr@v@3.25}{17}
\@namedef{scr@v@3.26}{17}
\@namedef{scr@v@3.26a}{17}
\@namedef{scr@v@3.26b}{17}
\@namedef{scr@v@3.27}{17}
\@namedef{scr@v@3.27a}{17}
\@namedef{scr@v@3.28}{17}
\@namedef{scr@v@3.29}{17}
\@namedef{scr@v@3.30}{17}
\@namedef{scr@v@3.31}{18}
\@namedef{scr@v@3.32}{18}
\@namedef{scr@v@3.33}{18}
\@namedef{scr@v@3.34}{18}
\@namedef{scr@v@3.35}{19}
\@namedef{scr@v@3.36}{20}
\@namedef{scr@v@3.37 BETA}{20}
\@namedef{scr@v@last}{20}
%%% From File: $Id: scrkernel-typearea.dtx 3889 2022-06-09 12:11:14Z kohm $
%%%            (run: init)
%%% From File: $Id: scrkernel-compatibility.dtx 3896 2022-06-21 09:06:07Z kohm $
%%%            (run: option)
\newif\if@scr@emulatestandardclasses
\let\scr@emulatestandardclassestrue\relax
\let\scr@emulatestandardclassesfalse\relax
\DeclareOption{emulatestandardclasses}{%
  \let\if@scr@emulatestandardclasses\iftrue
  \KOMAExecuteOptions{%
    fontsize=10pt,%
    headings=standardclasses,%
    cleardoublepage=current
  }%
  \newcommand*{\defaultpapersize}{letter}%
  \AtEndOfClass{%
    \setkomafont{descriptionlabel}{\bfseries}%
    \setkomafont{dictum}{\normalfont\small}%
    \setkomafont{caption}{}%
    \setkomafont{captionlabel}{}%
    \setcapindent{0pt}%
    \RequirePackage[pagestyleset=standard,markcase=upper]{scrlayer-scrpage}%
    \PreventPackageFromLoading{scrpage2}%
    \setkomafont{pagenumber}{\normalfont}%
    \setkomafont{pageheadfoot}{\normalfont}%
    \cfoot[\pagemark]{}%
    \pagestyle{plain}%
  }%
}
\KOMA@key{version}[last]{%
  \scr@ifundefinedorrelax{scr@v@#1}{%
    \def\scr@compatibility{0}%
    \ClassWarningNoLine{\KOMAClassName}{%
      You have set option `version' to value `#1', but\MessageBreak
      this value of version is not supported.\MessageBreak
      Because of this, version was set to `first'%
    }%
    \FamilyKeyStateProcessed
    \KOMA@kav@replacevalue{.%
      \KOMAClassFileName
    }{version}{first}%
  }{%
    \ClassInfoNoLine{\KOMAClassName}{%
      Switching compatibility level to `#1'%
    }%
 \edef\scr@compatibility{\@nameuse{scr@v@#1}}%
    \FamilyKeyStateProcessed
    \KOMA@kav@xreplacevalue{.%
      \KOMAClassFileName
    }{version}{#1}%
    \ifnum\scr@compatibility<\scr@v@last
      \ClassWarningNoLine{\KOMAClassName}{%
        Switching back to an old KOMA-Script release does\MessageBreak
        not mean, that KOMA-Script is fully compatible with\MessageBreak
        the old release. If you need full compatibility\MessageBreak
        to an old KOMA-Script release, you should use that\MessageBreak
        old KOMA-Script release. However, in that case you\MessageBreak
        could also need old releases of other packages and\MessageBreak
        even of the LaTeX kernel.\MessageBreak
        You should also note, that the KOMA-Script developers\MessageBreak
        refuse support for documents using `version=#1'.\MessageBreak
        We recommend to eliminate all deprecated options\MessageBreak
        and commands. We also recommend to not use option\MessageBreak
        `version', i.e., with other values than `last'%
      }%
    \fi
  }%
}
\KOMA@kav@add{.\KOMAClassFileName}{version}{last}
\AtEndOfClass{%
  \KOMA@key{version}[]{%
    \ClassError{\KOMAClassName}{%
      Option `version' too late%
    }{%
      Option `version' may be set only while loading the
      class.\MessageBreak
      But you've tried to set it up later.%
    }%
    \FamilyKeyStateProcessed
  }%
}
\newcommand*{\scr@v@is@lt}[1]{%
  \scr@compatibility<\@nameuse{scr@v@#1}
}
\newcommand*{\scr@v@is@gt}[1]{%
  \scr@compatibility>\@nameuse{scr@v@#1}
}
\newcommand*{\scr@v@is@le}[1]{%
  \numexpr\scr@compatibility-\@ne\relax<\@nameuse{scr@v@#1}
}
\newcommand*{\scr@v@is@ge}[1]{%
  \numexpr\scr@compatibility+\@ne\relax>\@nameuse{scr@v@#1}
}
%%% From File: $Id: scrkernel-miscellaneous.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\KOMA@key{draft}[true]{%
  \KOMA@set@ifkey{draft}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \if@tempswa
      \KOMA@kav@replacebool{.%
        \KOMAClassFileName
      }{draft}{@tempswa}%
      \KOMA@kav@replacebool{.%
        \KOMAClassFileName
      }{overfullrule}{@tempswa}%
      \setlength{\overfullrule}{5pt}%
    \else
      \KOMA@kav@replacebool{.%
        \KOMAClassFileName
      }{draft}{@tempswa}%
      \KOMA@kav@replacebool{.%
        \KOMAClassFileName
      }{overfullrule}{@tempswa}%
      \setlength{\overfullrule}{\z@}%
    \fi
  \fi
}
\KOMA@kav@add{.\KOMAClassFileName}{draft}{false}
\KOMA@DeclareStandardOption
{final}{draft=false}
\KOMA@key{overfullrule}[true]{%
  \KOMA@set@ifkey{overfullrule}{@tempswa}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \if@tempswa
      \KOMA@kav@replacebool{.%
        \KOMAClassFileName
      }{draft}{@tempswa}%
      \KOMA@kav@replacebool{.%
        \KOMAClassFileName
      }{overfullrule}{@tempswa}%
      \setlength{\overfullrule}{5pt}%
    \else
      \KOMA@kav@replacebool{.%
        \KOMAClassFileName
      }{draft}{@tempswa}%
      \KOMA@kav@replacebool{.%
        \KOMAClassFileName
      }{overfullrule}{@tempswa}%
      \setlength{\overfullrule}{\z@}%
    \fi
  \fi
}
\KOMA@kav@add{.\KOMAClassFileName}{overfullrule}{false}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\KOMA@ifkey{egregdoesnotlikesansseriftitles}{@egregdoesnotlikesansseriftitles}
\newcommand*{\@gr@gsffamily}{%
  \if@egregdoesnotlikesansseriftitles\else\sffamily\fi
}
%%% From File: $Id: scrkernel-language.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
%%% From File: $Id: scrkernel-fonts.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\providecommand*\@ptsize{%
  11%
}
\newcommand*{\@pt@scan}{%
  \expandafter\@pt@@scan\CurrentOption pt\@pt@@scan%
}
\newcommand*{\@pt@@scan}{}
\def\@pt@@scan #1pt#2\@pt@@scan{%
  \Ifstr{#2}{pt}{%
    \Ifnumber{#1}{%
      \Ifstr{#1}{10}{%
        \KOMA@UseStandardOption{\PackageInfoNoLine{\KOMAClassName}}%
                               {#1#2}{fontsize=#1#2}%
      }{%
        \Ifstr{#1}{11}{%
          \KOMA@UseStandardOption{\PackageInfoNoLine{\KOMAClassName}}%
                                 {#1#2}{fontsize=#1#2}%
        }{%
          \Ifstr{#1}{12}{%
            \KOMA@UseStandardOption{\PackageInfoNoLine{\KOMAClassName}}%
                                   {#1#2}{fontsize=#1#2}%
          }{%
            \KOMA@UseDeprecatedOption{\PackageWarningNoLine{\KOMAClassName}}%
                                     {#1#2}{fontsize=#1#2}%
          }%
        }%
      }
    }{\@headlines}%
  }{\@headlines}%
}
\providecommand*{\@fontsizefilebase}{scrsize}
\KOMA@key{fontsize}{%
  \scr@ifundefinedorrelax{changefontsizes}{%
    \@defaultunits\@tempdima#1pt\relax\@nnil
    \edef\@ptsize{#1}%
  }{%
    \expandafter\@defaultunits\expandafter\@tempdima#1 pt\relax\@nnil
    \edef\@tempa{#1}%
    \setlength{\@tempdimb}{\@tempdima}%
    \edef\@tempb{\strip@pt\@tempdimb}%
    \addtolength{\@tempdimb}{-10\p@}%
    \edef\@ptsize{\strip@pt\@tempdimb}%
    \edef\@tempa{%
      \noexpand\makeatletter
      \noexpand\InputIfFileExists{\@fontsizefilebase\@tempa.clo}{%
        \noexpand\ClassInfo{\KOMAClassName}{%
          File `\@fontsizefilebase\@tempa.clo' used to setup font sizes}%
      }{%
        \noexpand\InputIfFileExists{\@fontsizefilebase\@tempb pt.clo}{%
          \noexpand\ClassInfo{\KOMAClassName}{%
            File `\@fontsizefilebase\@tempb pt.clo' used instead of%
            \noexpand\MessageBreak
            file `\@fontsizefilebase\@tempa.clo' to setup font sizes}%
        }{%
          \noexpand\changefontsizes{#1}%
        }%
      }%
      \noexpand\catcode`\noexpand\@=\the\catcode`\@
    }%
    \@tempa
  }%
  \FamilyKeyStateProcessed
  \KOMA@kav@xreplacevalue{.%
    \KOMAClassFileName
  }{fontsize}{#1}%
}
\DeclareOption{enabledeprecatedfontcommands}{%
  \ClassWarningNoLine{\KOMAClassName}{%
    deprecated option `enabledeprecatedfontcommands'.\MessageBreak
    Note, that this option was already depreacted when\MessageBreak
    it has been defined. Support for old font commands\MessageBreak
    has been removed from KOMA-Script more than one\MessageBreak
    decade ago. It is not recommended to use them any\MessageBreak
    longer. Therefore usage of this class option also\MessageBreak
    is not recommended%
  }%
  \let\scr@defineobsoletefonts\@ne
}
\scr@ifundefinedorrelax{scr@defineobsoletefonts}{%
  \let\scr@defineobsoletefonts\z@
}{}
\BeforePackage{tex4ht}{%
  \let\scr@defineobsoletefonts\thr@@
}
%%% From File: $Id: scrkernel-typearea.dtx 3889 2022-06-09 12:11:14Z kohm $
%%%            (run: options)
\KOMA@key{twoside}[true]{%
  \if@atdocument\else\PassOptionsToPackage{twoside=#1}{typearea}\fi%
  \Ifstr{#1}{semi}{%
    \@twosidetrue
    \FamilyKeyStateProcessed
  }{%
    \def\FamilyElseValue{, `semi'}%
    \KOMA@set@ifkey{twoside}{%
      @twoside%
    }{#1}%
  }%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \expandafter\ifnum\scr@v@is@ge{3.17}%
      \if@twoside\flushbottom
      \else
        \if@twocolumn\sloppy\flushbottom\else\raggedbottom\fi
      \fi
    \fi
    \KOMA@kav@xreplacevalue{.%
      \KOMAClassFileName
    }{twoside}{#1}%
  \fi
}
\KOMAExecuteOptions{twoside=false}
\KOMA@DeclareStandardOption%
  {oneside}{twoside=false}
\KOMA@key{twocolumn}[true]{%
  \if@atdocument\else\PassOptionsToPackage{twocolumn=#1}{typearea}\fi%
  \KOMA@set@ifkey{twocolumn}{@twocolumn}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \KOMA@kav@replacebool{.%
      \KOMAClassFileName
    }{twocolumn}{@twocolumn}%
    \if@atdocument\expandafter\@firstofone
    \else\@ifpackageloaded{typearea}{\expandafter\@firstofone}
                                    {\expandafter\AtEndOfClass}\fi
    {\expandafter\ifnum\scr@v@is@ge{3.17}%
      \if@twocolumn\twocolumn\sloppy\flushbottom
      \else
        \onecolumn
        \if@twoside\flushbottom\else
          \raggedbottom
        \fi
      \fi
    \fi}%
  \fi
}
\AtEndOfClass{%
  \expandafter\ifnum\scr@v@is@lt{3.17}%
    \if@twocolumn\twocolumn\sloppy\flushbottom
    \else\onecolumn\if@twoside\flushbottom\else\raggedbottom\fi\fi
  \fi
}
\KOMAExecuteOptions{twocolumn=false}
\KOMA@DeclareStandardOption%
  {onecolumn}{twocolumn=false}
\newcommand*{\@BCOR}{\expandafter\@@BCOR\CurrentOption BCORBCOR\@@BCOR}
\newcommand*{\@@BCOR}{}
\def\@@BCOR #1BCOR#2BCOR#3\@@BCOR{%
  \Ifstr{#1}{}{%
    \Ifstr{#3}{BCOR}{%
      \Ifstrstart{#2}{=}{%
        \edef\reserved@a{\noexpand\Ifdimen{\@gobble#2}}%
        \reserved@a{\PassOptionsToPackage{BCOR#2}{typearea}}{\OptionNotUsed}%
      }{%
        \Ifdimen{#2}{\PassOptionsToPackage{BCOR#2}{typearea}}{\OptionNotUsed}%
      }%
    }{\scr@pti@nerr@r}%
  }{\scr@pti@nerr@r}%
}
\newcommand*{\@DIV}{\expandafter\@@DIV\CurrentOption DIVDIV\@@DIV}
\newcommand*{\@@DIV}{}
\def\@@DIV #1DIV#2DIV#3\@@DIV{%
  \edef\@tempa{#1}\ifx\@tempa\@empty
    \edef\@tempa{#3}\def\@tempb{DIV}\ifx\@tempa\@tempb
      \Ifstrstart{#2}{=}{%
        \edef\reserved@a{\noexpand\Ifnumber{\@gobble#2}}%
        \reserved@a{\PassOptionsToPackage{DIV#2}{typearea}}{\OptionNotUsed}%
      }{%
        \Ifnumber{#2}{\PassOptionsToPackage{DIV#2}{typearea}}{\OptionNotUsed}%
      }%
    \else\scr@pti@nerr@r\fi
  \else\@BCOR\fi
}
\newcommand{\@headlines}{%
  \expandafter\@@headlines\CurrentOption headlines\@@headlines%
}
\newcommand*{\@@headlines}{}
\def\@@headlines #1headlines#2\@@headlines{
  \edef\@tempa{#2}\edef\@tempb{headlines}\ifx\@tempa\@tempb
    \PassOptionsToPackage{#1headlines}{typearea}
  \else\@DIV\fi
}
\newcommand*{\x@paper}{%
  \expandafter\x@@paper\CurrentOption paper\x@@paper%
}
\newcommand*{\x@@paper}{}
\def\x@@paper #1#2paper#3\x@@paper{%
  \Ifstr{#3}{paper}{%
    \Ifnumber{#2}{%
      \Ifstr{#1}{a}{%
        \PassOptionsToPackage{#3=#1#2}{typearea}%
      }{%
        \Ifstr{#1}{b}{%
          \PassOptionsToPackage{#3=#1#2}{typearea}%
        }{%
          \Ifstr{#1}{c}{%
            \PassOptionsToPackage{#3=#1#2}{typearea}%
          }{%
            \Ifstr{#1}{d}{%
              \PassOptionsToPackage{#3=#1#2}{typearea}%
            }{\scr@pti@nerr@r}%
          }%
        }%
      }%
    }{\scr@pti@nerr@r}%
  }{%
    \@pt@scan
  }%
}
\newcommand*{\scr@pti@nerr@r}{
  \OptionNotUsed
}
\DeclareOption*{%
  \x@paper}
%%% From File: $Id: scrkernel-paragraphs.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\newcommand*{\setparsizes}[3]{%
  \edef\f@parindent{\the\parindent}%
  \edef\f@parskip{\the\parskip}%
  \edef\f@parfillskip{\the\parfillskip}%
  \def\scr@parindent{#1}%
  \def\scr@parskip{#2}%
  \def\scr@parfillskip{#3}%
  \def\par@update{%
    \if@atdocument\let\par@update\default@par@update\fi
    \par@updaterelative
  }%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{false}%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{never}%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{full}%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{full-}%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{full+}%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{full*}%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{half}%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{half-}%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{half+}%
  \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{half*}%
}
\newcommand*{\f@parindent}{\the\parindent}
\newcommand*{\f@parskip}{\the\parskip}
\newcommand*{\f@parfillskip}{\the\parfillskip}
\newcommand*{\scr@parindent}{1em}
\newcommand*{\scr@parskip}{\z@}
\newcommand*{\scr@parfillskip}{\z@ \@plus 1fil}
\AtEndOfClass{%
  \edef\f@parindent{\the\parindent}%
  \edef\f@parskip{\the\parskip}%
  \edef\f@parfillskip{\the\parfillskip}%
}
\newcommand*{\par@update}{}
\let\par@update\relax
\newcommand*{\default@par@update}{}
\let\default@par@update\relax
\AtBeginDocument{\par@update}
\KOMA@key{parskip}[true]{%
  \begingroup
    \KOMA@set@ncmdkey{parskip}{@tempa}{%
      {never}{0},%
      {false}{1},{off}{1},{no}{1},%
      {full-}{2},%
      {half-}{3},%
      {full}{4},{true}{4},{on}{4},{yes}{4},%
      {half}{5},%
      {full+}{6},%
      {half+}{7},%
      {full*}{8},%
      {half*}{9},%
      {relative}{10},%
      {absolute}{11}%
    }{#1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \aftergroup\FamilyKeyStateProcessed
      \ifcase\number\@tempa% 0
        \endgroup
        \setparsizes{1em}{\z@}{\z@ \@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{never}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 1
        \endgroup
        \setparsizes{1em}{\z@ \@plus \p@}{\z@ \@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{false}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 2
        \endgroup
        \setparsizes{\z@}{1\baselineskip \@plus .1\baselineskip}{%
          \z@ \@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{full-}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 3
        \endgroup
        \setparsizes{\z@}{.5\baselineskip \@plus .5\baselineskip}{%
          \z@ \@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{half-}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 4
        \endgroup
        \setparsizes{\z@}{1\baselineskip \@plus .1\baselineskip}{%
          1em \@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{full}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 5
        \endgroup
        \setparsizes{\z@}{.5\baselineskip \@plus .5\baselineskip}{%
          1em \@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{half}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 6
        \endgroup
        \setparsizes{\z@}{1\baselineskip \@plus .1\baselineskip}{%
          .3333\linewidth\@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{full+}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 7
        \endgroup
        \setparsizes{\z@}{.5\baselineskip \@plus .5\baselineskip}{%
          .3333\linewidth \@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{half+}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 8
        \endgroup
        \setparsizes{\z@}{1\baselineskip \@plus .1\baselineskip}{%
          .25\linewidth \@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{full*}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 9
        \endgroup
        \setparsizes{\z@}{.5\baselineskip \@plus .5\baselineskip}{%
          .25\linewidth \@plus 1fil}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{half*}%
        \if@atdocument\AfterKOMAoptions{\selectfont}\fi
      \or% 10
        \endgroup
        \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{absolute}%
        \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{relative}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{relative}%
        \ifx\par@updaterelative\undefined
          \expandafter\AtEndOfClass
        \else
          \expandafter\@firstofone
        \fi
        {%
          \ifx\par@update\default@par@update
            \let\par@update\par@updaterelative
          \fi
          \let\default@par@update=\par@updaterelative
        }%
      \or%11
        \endgroup
        \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{absolute}%
        \KOMA@kav@remove{.\KOMAClassFileName}{parskip}{relative}%
        \KOMA@kav@add{.\KOMAClassFileName}{parskip}{absolute}%
        \ifx\par@updaterelative\undefined
          \expandafter\AtEndOfClass
        \else
          \expandafter\@firstofone
        \fi
        {%
          \ifx\par@update\default@par@update
            \let\par@update\relax
          \fi
          \let\default@par@update=\relax
        }%
      \else% should never be
        \endgroup
    \fi
  \else
    \endgroup
    \FamilyKeyStateUnknownValue
  \fi
}
\KOMA@DeclareDeprecatedOption{parskip-}{parskip=full-}
\KOMA@DeclareDeprecatedOption{parskip+}{parskip=full+}
\KOMA@DeclareDeprecatedOption{parskip*}{parskip=full*}
\KOMA@DeclareDeprecatedOption{halfparskip}{parskip=half}
\KOMA@DeclareDeprecatedOption{halfparskip-}{parskip=half-}
\KOMA@DeclareDeprecatedOption{halfparskip+}{parskip=half+}
\KOMA@DeclareDeprecatedOption{halfparskip*}{parskip=half*}
\KOMA@DeclareDeprecatedOption{parindent}{parskip=false}
\KOMA@kav@add{.\KOMAClassFileName}{parskip}{false}
\KOMA@kav@add{.\KOMAClassFileName}{parskip}{absolute}
%%% From File: $Id: scrkernel-title.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\newif\if@titlepage
\@titlepagetrue
\newif\if@titlepageiscoverpage
\KOMA@key{titlepage}[true]{%
  \Ifstr{#1}{firstiscover}{%
    \@titlepagetrue
    \@titlepageiscoverpagetrue
    \FamilyKeyStateProcessed
    \KOMA@kav@replacevalue{.%
      \KOMAClassFileName
    }{titlepage}{firstiscover}%
  }{%
    \def\FamilyElseValue{, `firstiscover'}%
     \KOMA@set@ifkey{titlepage}{@titlepage}{#1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \KOMA@kav@remove{.%
      \KOMAClassFileName
      }{titlepage}{firstiscover}%
      \KOMA@kav@replacebool{.%
      \KOMAClassFileName
      }{titlepage}{@titlepage}%
      \@titlepageiscoverpagefalse
    \fi
  }%
}
\KOMA@kav@xadd{.%
  \KOMAClassFileName
}{titlepage}{\if@titlepage true\else false\fi}
\KOMA@DeclareStandardOption%
  {notitlepage}{titlepage=false}
\KOMA@ifkey{abstract}{@abstrt}
\KOMA@DeclareDeprecatedOption{abstracton}{abstract=true}
\KOMA@DeclareDeprecatedOption{abstractoff}{abstract=false}
%%% From File: $Id: scrkernel-tocstyle.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
%%% From File: $Id: scrkernel-sections.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\KOMA@key{open}{%
  \KOMA@set@ncmdkey{open}{@tempa}{%
    {any}{0},%
    {right}{1},%
    {left}{2}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \KOMA@kav@xreplacevalue{.\KOMAClassFileName}{open}{#1}%
    \KOMA@kav@remove{.\KOMAClassFileName}{headings}{openany}%
    \KOMA@kav@remove{.\KOMAClassFileName}{headings}{openright}%
    \KOMA@kav@remove{.\KOMAClassFileName}{headings}{openleft}%
    \ifcase \@tempa\relax
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{openany}%
      \@openrightfalse
      \renewcommand*{\cleardoublestandardpage}{\cleardoubleoddstandardpage}%
    \or
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{openright}%
      \@openrighttrue
      \renewcommand*{\cleardoublestandardpage}{\cleardoubleoddstandardpage}%
    \or
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{openleft}%
      \@openrighttrue
      \renewcommand*{\cleardoublestandardpage}{\cleardoubleevenstandardpage}%
    \fi
  \fi
}
\KOMA@DeclareStandardOption{openright}{open=right}
\KOMA@DeclareStandardOption{openany}{open=any}
\KOMA@key{numbers}{%
  \KOMA@set@ncmdkey{numbers}{@tempa}{%
    {autoendperiod}{0},{autoenddot}{0},{auto}{0},%
    {endperiod}{1},{withendperiod}{1},{periodatend}{1},%
    {enddot}{1},{withenddot}{1},{dotatend}{1},%
    {noendperiod}{2},{noperiodatend}{2},%
    {noenddot}{2},{nodotatend}{2}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \KOMA@kav@xreplacevalue{.\KOMAClassFileName}{numbers}{#1}%
    \ifcase \@tempa\relax
      \if@atdocument\scr@dotchangeatdocument{#1}\else
        \let\scr@altsecnumhook\@empty
      \fi
    \or
      \if@atdocument\scr@dotchangeatdocument{#1}\else
        \let\scr@altsecnumhook\scr@altsecnumhooktrue
      \fi
    \or
      \if@atdocument\scr@dotchangeatdocument{#1}\else
        \let\scr@altsecnumhook\scr@altsecnumhookfalse
      \fi
    \fi
  \fi
}
\KOMA@DeclareDeprecatedOption{pointednumbers}{numbers=enddot}
\KOMA@DeclareDeprecatedOption{pointlessnumbers}{numbers=noenddot}
\KOMA@ifkey{bookmarkpackage}{@scr@autoloadbookmarkpackage}
\@scr@autoloadbookmarkpackagetrue
\KOMA@kav@add{.\KOMAClassFileName}{bookmarkpackage}{true}
\AfterAtEndOfPackage{hyperref}{%
  \AtBeginDocument{%
    \@ifpackageloaded{bookmark}{}{%
      \if@scr@autoloadbookmarkpackage
        \scr@ifundefinedorrelax{Hy@driver}{%
          \ClassWarning{\KOMAClassName}{%
            `hyperref' loaded but `\string\Hy@driver' undefined.\MessageBreak
            This should not happen!\MessageBreak
            Maybe `hyperref' not loaded or unknown version?%
          }%
        }{%
          \Ifstr{\Hy@driver}{hdvips}{%
            \providecommand*{\BookmarkDriverDefault}{dvips}%
          }{%
            \Ifstr{\Hy@driver}{hdvipdfm}{%
              \providecommand*{\BookmarkDriverDefault}{dvipdfm}%
            }{%
              \Ifstr{\Hy@driver}{hdvipson}{%
                \providecommand*{\BookmarkDriverDefault}{dvipsone}%
              }{%
                \Ifstr{\Hy@driver}{htexture}{%
                  \providecommand*{\BookmarkDriverDefault}{textures}%
                }{%
                }%
              }%
            }%
          }%
        }%
        \ClassInfo{\KOMAClassName}{%
          loading recommended package `bookmark'.\MessageBreak
          Using `bookmark' together with `hyperref' is
          recommended,\MessageBreak
          because of handling of possible bookmark level gaps.\MessageBreak
          You can avoid loading `bookmark' with KOMA-Script
          option\MessageBreak
          `bookmarkpackage=false' before \string\begin{document}
          and\MessageBreak
          you can avoid this message adding:\MessageBreak
          \space\space\string\usepackage
          \scr@ifundefinedorrelax{BookmarkDriverDefault}{}{%
            [\BookmarkDriverDefault]%
          }{bookmark}\MessageBreak
          before \string\begin{document}%
        }%
        \@ifundefined{es@quoting}{%
          \RequirePackage{bookmark}%
        }{%
          \ifx\es@quoting\activatequoting
            \ClassInfo{\KOMAClassName}{%
              temporary deactivation of babel-spanish quoting
            }%
            \deactivatequoting
            \RequirePackage{bookmark}%
            \ClassInfo{\KOMAClassName}{%
              reactivation of babel-spanish quoting
            }%
            \activatequoting
          \else
            \RequirePackage{bookmark}%
          \fi
        }%
        \ifx\@beginmainauxhook\relax
        \else
          \if@filesw
            \ClassWarning{\KOMAClassName}{%
              seems someone has broken package `auxhook'.\MessageBreak
              Usually this happens, if `auxhook' is loaded or used\MessageBreak
              implicitly or explicitly by patching
              \string\document%
              \scr@ifundefinedorrelax{AtEndPreamble}{}{%
                \MessageBreak
                or via etoolbox command \string\AtEndPreamble%
              }.\MessageBreak
              Trying an emergency workaround.\MessageBreak
              You can avoid this warning adding:\MessageBreak
              \space\space\string\usepackage{auxhook}\MessageBreak
              before \string\begin{document}%
            }%
            \@beginmainauxhook
          \fi
        \fi
      \fi
    }%
  }%
}
\KOMA@key{chapterprefix}[true]{%
  \KOMA@set@ifkey{chapterprefix}{@chapterprefix}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \KOMA@kav@replacebool{.\KOMAClassFileName}%
                         {chapterprefix}{@chapterprefix}%
    \KOMA@kav@remove{.\KOMAClassFileName}%
                    {headings}{twolinechapter}%
    \KOMA@kav@remove{.\KOMAClassFileName}%
                    {headings}{onelinechapter}%
    \KOMA@kav@xadd{.\KOMAClassFileName}%
                  {headings}{%
                    \if@chapterprefix twolinechapter\else onelinechapter\fi
                  }%
  \fi
}
\KOMA@kav@add{.\KOMAClassFileName}{headings}{onelinechapter}%
\KOMA@DeclareDeprecatedOption{nochapterprefix}{chapterprefix=false}
\IfLTXAtLeastTF{2020/10/01}{%
  \KOMA@key{appendixprefix}[true]{%
    \Ifstr{#1}{default}{%
      \KOMA@kav@removekey{.\KOMAClassFileName}{appendixprefix}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{twolineappendix}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{onelineappendix}%
      \IfHookEmptyTF{\KOMAClassName/appendix}{}{%
        \RemoveFromHook{\KOMAClassName/appendix}[appendixprefix]%
      }%
      \FamilyKeyStateProcessed
    }{%
      \KOMA@set@ifkey{appendixprefix}{@tempswa}{#1}%
      \ifx\FamilyKeyState\FamilyKeyStateProcessed
        \KOMA@kav@xreplacevalue{.\KOMAClassFileName}{appendixprefix}{#1}%
        \KOMA@kav@remove{.\KOMAClassFileName}{headings}{twolineappendix}%
        \KOMA@kav@remove{.\KOMAClassFileName}{headings}{onelineappendix}%
        \IfHookEmptyTF{\KOMAClassName/appendix}{}{%
          \RemoveFromHook{\KOMAClassName/appendix}[appendixprefix]%
        }%
        \if@tempswa
          \KOMA@kav@add{.\KOMAClassFileName}{headings}{twolineappendix}%
          \AddToHook{\KOMAClassName/appendix}[appendixprefix]%
                    {\@chapterprefixtrue}%
        \else
          \KOMA@kav@add{.\KOMAClassFileName}{headings}{onelineappendix}%
          \AddToHook{\KOMAClassName/appendix}[appendixprefix]%
                    {\@chapterprefixfalse}%
        \fi
      \fi
    }%
  }%
}{%
  \KOMA@key{appendixprefix}[true]{%
    \KOMA@set@ifkey{appendixprefix}{@tempswa}{#1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \KOMA@kav@xreplacevalue{.\KOMAClassFileName}{appendixprefix}{#1}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{twolineappendix}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{onelineappendix}%
      \if@tempswa
        \KOMA@kav@add{.\KOMAClassFileName}{headings}{twolineappendix}%
        \@ifundefined{appendixmore}{%
          \def\appendixmore{\@chapterprefixtrue}%
        }{%
          \l@addto@macro\appendixmore{\@chapterprefixtrue}%
        }%
      \else
        \KOMA@kav@add{.\KOMAClassFileName}{headings}{onelineappendix}%
        \@ifundefined{appendixmore}{%
          \def\appendixmore{\@chapterprefixfalse}%
        }{%
          \l@addto@macro\appendixmore{\@chapterprefixfalse}%
        }%
      \fi
    \fi
  }%
}
\KOMA@DeclareDeprecatedOption{noappendixprefix}{appendixprefix=false}
\KOMA@ifkey{chapterentrydots}{@chapterentrywithdots}
\KOMA@key{headings}{%
  \KOMA@set@ncmdkey{headings}{@tempa}{%
    {big}{0},%
    {normal}{1},%
    {small}{2},%
    {openany}{3},%
    {openright}{4},%
    {openleft}{5},%
    {twolinechapter}{6},{chapterprefix}{6},{chapterwithprefix}{6},%
    {chapterwithprefixline}{6},%
    {onelinechapter}{7},{nochapterprefix}{7},{chapterwithoutprefix}{7},%
    {chapterwithoutprefixline}{7},%
    {twolineappendix}{8},{appendixprefix}{8},{appendixwithprefix}{8},%
    {appendixwithprefixline}{8},%
    {onelineappendix}{9},{noappendixprefix}{9},{appendixwithoutprefix}{9},%
    {appendixwithoutprefixline}{9},%
    {optiontotocandhead}{10},{optiontoheadandtoc}{10},%
    {optiontotoc}{11},%
    {optiontohead}{12},%
    {standardclasses}{13}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \ifcase \@tempa\relax% big
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{big}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{normal}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{small}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{standardclasses}%
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{big}%
      \renewcommand*{\scr@chapter@beforeskip}{-3.3\baselineskip-\parskip}%
      \renewcommand*{\scr@chapter@afterskip}{%
        1.725\baselineskip \@plus .115\baselineskip \@minus .192\baselineskip
      }%
      \renewcommand*{\scr@chapter@innerskip}{.5\baselineskip}%
      \renewcommand*{\chapterheadstartvskip}{\vspace{\@tempskipa}}%
      \renewcommand*{\chapterheadendvskip}{%
        \expandafter\ifnum\scr@v@is@lt{3.15}\vspace\@tempskipa
        \else\vskip\@tempskipa\fi
      }%
      \renewcommand*{\chapterheadmidvskip}{\par\nobreak\vskip\@tempskipa}%
      \setkomafont{part}{\Huge}%
      \setkomafont{partnumber}{\huge}%
      \setkomafont{chapter}{\huge}%
      \setkomafont{chapterprefix}{\size@chapter}%
      \setkomafont{section}{\Large}%
      \setkomafont{subsection}{\large}%
      \setkomafont{subsubsection}{\normalsize}%
      \setkomafont{paragraph}{\normalsize}%
      \setkomafont{subparagraph}{\normalsize}%
    \or % normal
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{big}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{normal}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{small}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{standardclasses}%
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{normal}%
      \renewcommand*{\scr@chapter@beforeskip}{-3\baselineskip-\parskip}%
      \renewcommand*{\scr@chapter@afterskip}{%
        1.5\baselineskip \@plus .1\baselineskip \@minus .167\baselineskip
      }%
      \renewcommand*{\scr@chapter@innerskip}{.5\baselineskip}%
      \renewcommand*{\chapterheadstartvskip}{\vspace{\@tempskipa}}%
      \renewcommand*{\chapterheadendvskip}{%
        \expandafter\ifnum\scr@v@is@lt{3.15}\vspace\@tempskipa
        \else\vskip\@tempskipa\fi
      }%
      \renewcommand*{\chapterheadmidvskip}{\par\nobreak\vskip\@tempskipa}%
      \setkomafont{part}{\huge}%
      \setkomafont{partnumber}{\huge}%
      \setkomafont{chapter}{\LARGE}%
      \setkomafont{chapterprefix}{\size@chapter}%
      \setkomafont{section}{\Large}%
      \setkomafont{subsection}{\large}%
      \setkomafont{subsubsection}{\normalsize}%
      \setkomafont{paragraph}{\normalsize}%
      \setkomafont{subparagraph}{\normalsize}%
    \or % small
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{big}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{normal}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{small}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{standardclasses}%
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{small}%
      \renewcommand*{\scr@chapter@beforeskip}{-2.8\baselineskip-\parskip}%
      \renewcommand*{\scr@chapter@afterskip}{%
        1.35\baselineskip \@plus 0.09\baselineskip \@minus .15\baselineskip
      }%
      \renewcommand*{\scr@chapter@innerskip}{.5\baselineskip}%
      \renewcommand*{\chapterheadstartvskip}{\vspace{\@tempskipa}}%
      \renewcommand*{\chapterheadendvskip}{%
        \expandafter\ifnum\scr@v@is@lt{3.15}\vspace\@tempskipa
        \else\vskip\@tempskipa\fi
      }%
      \renewcommand*{\chapterheadmidvskip}{\par\nobreak\vskip\@tempskipa}%
      \setkomafont{part}{\LARGE}%
      \setkomafont{partnumber}{\LARGE}%
      \setkomafont{chapter}{\Large}%
      \setkomafont{chapterprefix}{\size@chapter}%
      \setkomafont{section}{\large}%
      \setkomafont{subsection}{\normalsize}%
      \setkomafont{subsubsection}{\normalsize}%
      \setkomafont{paragraph}{\normalsize}%
      \setkomafont{subparagraph}{\normalsize}%
    \or % openany
      \KOMAoptions{open=any}%
    \or % openright
      \KOMAoptions{open=right}%
    \or % openleft
      \KOMAoptions{open=left}%
    \or % twolinechapter
      \KOMAoptions{chapterprefix=true}%
    \or % onelinechapter
      \KOMAoptions{chapterprefix=false}%
    \or % twolineappendix
      \KOMAoptions{appendixprefix=true}%
    \or % onelineappendix
      \KOMAoptions{appendixprefix=false}%
    \or % optiontotocandhead
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{optiontotocandhead}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{optiontotoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{optiontohead}%
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{optiontotocandhead}%
      \scr@activate@xsection{3}%
    \or % optiontotoc
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{optiontotocandhead}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{optiontotoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{optiontohead}%
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{optiontotoc}%
      \scr@activate@xsection{2}%
    \or % optiontohead
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{optiontotocandhead}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{optiontotoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{optiontohead}%
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{optiontohead}%
      \scr@activate@xsection{1}%
    \or % standardclasses
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{big}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{normal}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{small}%
      \KOMA@kav@remove{.\KOMAClassFileName}{headings}{standardclasses}%
      \KOMA@kav@add{.\KOMAClassFileName}{headings}{standardclasses}%
      \renewcommand*{\scr@chapter@beforeskip}{-50\p@}%
      \renewcommand*{\scr@chapter@afterskip}{40\p@}%
      \renewcommand*{\scr@chapter@innerskip}{20\p@}%
      \renewcommand*{\chapterheadstartvskip}{\vspace{\@tempskipa}}%
      \renewcommand*{\chapterheadendvskip}{\vskip\@tempskipa}%
      \renewcommand*{\chapterheadmidvskip}{\par\nobreak\vskip\@tempskipa}%
      \setkomafont{part}{\Huge}%
      \setkomafont{partnumber}{\huge}%
      \setkomafont{chapter}{\Huge}%
      \setkomafont{chapterprefix}{\huge}%
      \setkomafont{section}{\Large}%
      \setkomafont{subsection}{\large}%
      \setkomafont{subsubsection}{\normalsize}%
      \setkomafont{paragraph}{\normalsize}%
      \setkomafont{subparagraph}{\normalsize}%
      \renewcommand*{\sectfont}{\bfseries}%
    \KOMAoptions{open=right,chapterprefix=true}%
    \fi
  \fi
}
\KOMA@kav@add{.\KOMAClassFileName}{headings}{big}
\KOMA@kav@add{.\KOMAClassFileName}{headings}{onelinechapter}
\KOMA@DeclareDeprecatedOption{bigheadings}{headings=big}
\KOMA@DeclareDeprecatedOption{normalheadings}{headings=normal}
\KOMA@DeclareDeprecatedOption{smallheadings}{headings=small}
%%% From File: $Id: scrkernel-pagestyles.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\KOMA@ifkey{headsepline}{@hsl}%
\KOMA@kav@add{.\KOMAClassFileName}{headsepline}{false}
\KOMA@DeclareDeprecatedOption{headnosepline}{headsepline=false}
\KOMA@ifkey{footsepline}{@fsl}%
\KOMA@kav@add{.\KOMAClassFileName}{footsepline}{false}
\KOMA@DeclareDeprecatedOption{footnosepline}{footsepline=false}
\KOMA@key{cleardoublepage}{%
  \begingroup
    \def\@tempc{%
      \endgroup
      \KOMA@unknown@keyval{cleardoublepage}{#1}{%
        'current' or any defined pagestyle e.g. 'empty','plain', 'headings'}%
    }%
    \Ifstr{#1}{current}{%
      \def\@tempc{\endgroup
        \def\cleardoublepage{\cleardoublestandardpage}%
        \def\cleardoubleoddpage{\cleardoubleoddstandardpage}%
        \def\cleardoubleevenpage{\cleardoubleevenstandardpage}%
        \FamilyKeyStateProcessed
        \KOMA@kav@replacevalue{.%
          \KOMAClassFileName
        }{cleardoublepage}{current}%
      }%
    }{%
      \Ifnotundefined{ps@#1}{%
        \def\@tempc{\endgroup
          \def\cleardoublepage{\cleardoublepageusingstyle{#1}}%
          \def\cleardoubleoddpage{\cleardoubleoddpageusingstyle{#1}}%
          \def\cleardoubleevenpage{\cleardoubleevenpageusingstyle{#1}}%
          \FamilyKeyStateProcessed
          \KOMA@kav@xreplacevalue{.%
            \KOMAClassFileName
          }{cleardoublepage}{#1}%
        }%
      }{%
        \ifx\@currname\KOMAClassName
          \ifx\@currext\@clsextension
            \Ifstr{#1}{headings}{%
              \def\@tempc{\endgroup
                \def\cleardoublepage{\cleardoublepageusingstyle{#1}}%
                \def\cleardoubleoddpage{\cleardoubleoddpageusingstyle{#1}}%
                \def\cleardoubleevenpage{\cleardoubleevenpageusingstyle{#1}}%
                \FamilyKeyStateProcessed
                \KOMA@kav@xreplacevalue{.\KOMAClassFileName}%
                                       {cleardoublepage}{#1}%
              }%
            }{}%
          \fi
        \fi
      }%
    }%
  \@tempc
}
\newcommand*{\cleardoubleoddstandardpage}{}
\let\cleardoubleoddstandardpage=\cleardoublepage
\newcommand*{\cleardoubleoddpageusingstyle}[1]{\clearpage
  {\pagestyle{#1}\cleardoubleoddstandardpage}}
\newcommand*{\cleardoubleoddemptypage}{\cleardoubleoddpageusingstyle{empty}}
\newcommand*{\cleardoubleoddplainpage}{\cleardoubleoddpageusingstyle{plain}}
\newcommand*{\cleardoubleevenstandardpage}{%
  \clearpage
  \if@twoside\ifodd\c@page
      \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi
  \fi\fi
}
\newcommand*{\cleardoubleevenpageusingstyle}[1]{\clearpage
  {\pagestyle{#1}\cleardoubleevenstandardpage}}
\newcommand*{\cleardoubleevenemptypage}{\cleardoubleevenpageusingstyle{empty}}
\newcommand*{\cleardoubleevenplainpage}{\cleardoubleevenpageusingstyle{plain}}
\newcommand*{\cleardoublestandardpage}{\cleardoubleoddstandardpage}
\renewcommand*{\cleardoublepage}{%
  \expandafter\ifnum \@nameuse{scr@v@2.98c}<\scr@compatibility\relax
    \cleardoubleemptypage
  \else
    \cleardoublestandardpage
  \fi
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{cleardoublepage}{%
  \expandafter\ifnum \scr@v@is@gt{2.98c}empty\else current\fi
}
\AtEndOfClass{%
  \KOMAoptionOf[\expandafter\edef\expandafter\@tempa\@firstofone]%
               {%
                 \KOMAClassFileName
               }{cleardoublepage}%
  \KOMA@kav@removekey{.%
    \KOMAClassFileName
  }{cleardoublepage}%
  \KOMA@kav@xadd{.%
    \KOMAClassFileName
  }{cleardoublepage}{\@tempa}%
}
\newcommand*{\cleardoubleoddpage}{\cleardoubleoddemptypage}
\newcommand*{\cleardoubleevenpage}{\cleardoubleevenemptypage}
\newcommand*{\cleardoublepageusingstyle}[1]{\clearpage
  {\pagestyle{#1}\cleardoublestandardpage}}
\newcommand*{\cleardoubleemptypage}{\cleardoublepageusingstyle{empty}}
\newcommand*{\cleardoubleplainpage}{\cleardoublepageusingstyle{plain}}
\KOMA@DeclareDeprecatedOption{cleardoubleempty}{cleardoublepage=empty}
\KOMA@DeclareDeprecatedOption{cleardoubleplain}{cleardoublepage=plain}
\KOMA@DeclareDeprecatedOption{cleardoublestandard}{cleardoublepage=current}
%%% From File: $Id: scrkernel-floats.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\newif\if@captionabove\@captionabovefalse
\newif\if@tablecaptionabove\@tablecaptionabovefalse
\newif\if@figurecaptionabove\@figurecaptionabovefalse
\newif\ifonelinecaptions\onelinecaptionstrue
\newcommand*{\scap@pos}{r}
\newcommand*{\scap@valign}{b}
\KOMA@key{captions}{%
  \KOMA@set@ncmdkey{captions}{@tempa}{%
    {heading}{0},{above}{0},{top}{0},%
    {signature}{1},{below}{1},{bot}{1},{bottom}{1},%
    {tableheading}{2},%
    {tableabove}{2},{abovetable}{2},{abovetabular}{2},{topattable}{2},%
    {tablesignature}{3},%
    {tablebelow}{3},{belowtable}{3},{belowtabular}{3},{bottomattable}{3},%
    {figureheading}{4},{figureabove}{4},{abovefigure}{4},{topatfigure}{4},%
    {figuresignature}{5},{figurebelow}{5},{belowfigure}{5},{bottomatfigure}{5},%
    {oneline}{6},%
    {nooneline}{7},%
    {rightbeside}{8},{besideright}{8},%
    {leftbeside}{9},{besideleft}{9},%
    {innerbeside}{10},{besideinner}{10},%
    {outerbeside}{11},{besideouter}{11},%
    {topbeside}{12},{besidetop}{12},%
    {centeredbeside}{13},{besidecentered}{13},%
    {middlebeside}{13},{besidemiddle}{13},%
    {bottombeside}{14},{besidebottom}{14}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \ifcase \@tempa\relax % heading
      \@tablecaptionabovetrue
      \@figurecaptionabovetrue
      \@captionabovetrue
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{heading}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{signature}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{heading}%
   \or % signature
      \@tablecaptionabovefalse
      \@figurecaptionabovefalse
      \@captionabovefalse
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{heading}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{signature}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{signature}%
    \or % tableheading
      \@tablecaptionabovetrue
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{tableheading}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{tablesignature}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{tableheading}%
    \or % tablesignature
      \@tablecaptionabovefalse
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{tableheading}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{tablesignature}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{tablesignature}%
    \or % figureheading
      \@figurecaptionabovetrue
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{figureheading}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{figuresignature}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{figureheading}%
    \or % figuresignature
      \@figurecaptionabovefalse
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{figureheading}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{figuresignature}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{figuresignature}%
    \or % oneline
      \onelinecaptionstrue
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{oneline}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{nooneline}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{oneline}%
    \or % nooneline
      \onelinecaptionsfalse
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{oneline}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{nooneline}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{nooneline}%
    \or % rightbeside
      \renewcommand*{\scap@pos}{r}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{rightbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{leftbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{innerbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{outerbeside}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{rightbeside}%
    \or % leftbeside
      \renewcommand*{\scap@pos}{l}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{rightbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{leftbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{innerbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{outerbeside}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{leftbeside}%
    \or % innerbeside
      \renewcommand*{\scap@pos}{i}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{rightbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{leftbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{innerbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{outerbeside}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{innerbeside}%
    \or % outerbeside
      \renewcommand*{\scap@pos}{o}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{rightbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{leftbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{innerbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{outerbeside}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{outerbeside}%
    \or % topbeside
      \renewcommand*{\scap@valign}{t}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{topbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{centeredbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{bottombeside}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{topbeside}%
    \or % centeredbeside
      \renewcommand*{\scap@valign}{c}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{topbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{centeredbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{bottombeside}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{centeredbeside}%
    \or % bottombeside
      \renewcommand*{\scap@valign}{b}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{topbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{centeredbeside}%
      \KOMA@kav@remove{.\KOMAClassFileName}{captions}{bottombeside}%
      \KOMA@kav@add{.\KOMAClassFileName}{captions}{bottombeside}%
    \fi
  \fi
}
\KOMA@kav@add{.\KOMAClassFileName}{captions}{signature}
\KOMA@kav@add{.\KOMAClassFileName}{captions}{tablesignature}
\KOMA@kav@add{.\KOMAClassFileName}{captions}{figuresignature}
\KOMA@kav@add{.\KOMAClassFileName}{captions}{oneline}
\KOMA@kav@add{.\KOMAClassFileName}{captions}{rightbeside}
\KOMA@kav@add{.\KOMAClassFileName}{captions}{bottombeside}
\KOMA@DeclareDeprecatedOption{tablecaptionabove}{captions=tableheading}
\KOMA@DeclareDeprecatedOption{tablecaptionbelow}{captions=tablesignature}
\newif\if@komalongtable\@komalongtabletrue
\DeclareOption{origlongtable}{\@komalongtablefalse}
\KOMA@DeclareDeprecatedOption{onelinecaption}{captions=oneline}
\KOMA@DeclareDeprecatedOption{noonelinecaption}{captions=nooneline}
%%% From File: $Id: scrkernel-footnotes.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\KOMA@key{footnotes}{%
  \ifx\@footnotemark\scr@saved@footnotemark
  \else
    \ifx\@footnotemark\scr@footnotemark
    \else
      \ClassWarning{\KOMAClassName}{%
        Change of `\string\@footnotemark' detected!\MessageBreak
        Use of `footnotes=#1' may break\MessageBreak
        another package!\MessageBreak
        Maybe you should remove the usage of\MessageBreak
        option `footnotes=#1'}%
    \fi
  \fi
  \Ifstr{#1}{multiple}{%
    \let\@footnotemark\scr@footnotemark
    \def\FN@mf@prepare{\scr@mf@prepare}%
    \def\scr@footmisc@options{multiple}%
    \FamilyKeyStateProcessed
    \KOMA@kav@replacevalue{.%
      \KOMAClassFileName
    }{footnotes}{multiple}%
  }{%
    \Ifstr{#1}{nomultiple}{%
      \let\@footnotemark\scr@saved@footnotemark
      \let\FN@mf@prepare\relax
      \let\scr@footmisc@options\@empty
      \FamilyKeyStateProcessed
      \KOMA@kav@replacevalue{.%
      \KOMAClassFileName
      }{footnotes}{nomultiple}%
    }{%
      \KOMA@unknown@keyval{footnotes}{#1}{`multiple' and `nomultiple'}%
    }%
  }%
}
\AtBeginDocument{%
  \ifx\@footnotemark\scr@saved@footnotemark
    \KOMA@kav@removekey{.%
      \KOMAClassFileName
    }{footnotes}%
    \KOMA@kav@add{.%
    \KOMAClassFileName
    }{footnotes}{nomultiple}%
  \else\ifx\@footnotemark\scr@footnotemark
    \KOMA@kav@removekey{.%
      \KOMAClassFileName
    }{footnotes}%
    \KOMA@kav@add{.%
      \KOMAClassFileName
    }{footnotes}{multiple}%
  \fi\fi
}
\newcommand*{\scr@footmisc@options}{}
\PassOptionsToPackage{\noexpand\scr@footmisc@options}{footmisc}
\newcommand*{\scr@saved@footnotemark}{%
  \leavevmode
  \ifhmode\edef\@x@sf{\the\spacefactor}\nobreak\fi
  \@makefnmark
  \ifhmode\spacefactor\@x@sf\fi
  \relax}
\expandafter\CheckCommand\expandafter*\expandafter\@footnotemark
\expandafter{\scr@saved@footnotemark}
\newcommand*{\scr@footnotemark}{%
  \leavevmode
  \ifhmode\edef\@x@sf{\the\spacefactor}\FN@mf@check\nobreak\fi
  \@makefnmark
  \csname FN@mf@prepare\endcsname
  \ifhmode\spacefactor\@x@sf\fi
  \relax}
%%% From File: $Id: scrkernel-listsof.dtx 3892 2022-06-17 16:26:06Z kohm $
%%%            (run: option)
\newif\if@tocleft
\KOMA@key{toc}{%
  \KOMA@set@ncmdkey{toc}{@tempa}{%
    {noindex}{0},{noidx}{0},%
    {index}{1},{idx}{1},%
    {indexnumbered}{2},{idxnumbered}{2},{numberedindex}{2},{numberedidx}{2},%
    {nolistof}{3},{nolistsof}{3},%
    {listof}{4},{listsof}{4},%
    {listofnumbered}{5},{numberedlistof}{5},%
    {listsofnumbered}{5},{numberedlistsof}{5},%
    {nobibliography}{6},{nobib}{6},%
    {bibliography}{7},{bib}{7},%
    {bibliographynumbered}{8},{bibnumbered}{8},{numberedbibliography}{8},%
    {numberedbib}{8},%
    {flat}{9},{left}{9},%
    {graduated}{10},{indent}{10},{indented}{10},%
    {indenttextentries}{11},{indentunnumbered}{11},{numberline}{11},%
    {leftaligntextentries}{12},{leftalignunnumbered}{12},{nonumberline}{12},%
    {chapterentrywithdots}{13},{chapterentrydotfill}{13},
    {chapterentrywithoutdots}{14},{chapterentryfill}{14}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \ifcase \@tempa\relax % noindex
      \KOMAoptions{index=notoc}%
    \or % index
      \KOMAoptions{index=totoc}%
    \or % indexnumbered
      \KOMAoptions{index=numbered}%
    \or % listof
      \KOMAoptions{listof=notoc}%
    \or % nolistof
      \KOMAoptions{listof=totoc}%
    \or % listofnumbered
      \KOMAoptions{listof=numbered}%
    \or % nobibliography
      \KOMAoptions{bibliography=nottotoc}%
    \or % bibliography
      \KOMAoptions{bibliography=totoc}%
    \or % bibliographynumbered
      \KOMAoptions{bibliography=totocnumbered}%
    \or % flat
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{flat}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{graduated}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{flat}%
      \@toclefttrue
    \or % graduated
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{flat}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{graduated}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{graduated}%
      \@tocleftfalse
    \or % indenttextentries
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{indenttextentries}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{leftaligntextentries}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{indenttextentries}%
      \expandafter\setuptoc\expandafter{\ext@toc}{numberline}%
    \or % leftaligntextentries
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{indenttextentries}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{leftaligntextentries}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{leftaligntextentries}%
      \expandafter\unsettoc\expandafter{\ext@toc}{numberline}%
    \or % chapterentrywithdots/sectionentrywithdots
      \KOMAoptions{chapterentrydots=true}%
    \or % chapterentrywithoutdots/sectionentrywithoutdots
      \KOMAoptions{chapterentrydots=false}%
    \fi
  \fi
}
\KOMA@DeclareDeprecatedOption{tocleft}{toc=flat}
\KOMA@DeclareDeprecatedOption{tocindent}{toc=graduated}
\newcommand*{\float@@listhead}{%
  \chapter*
}
\newif\if@dynlist
\KOMA@key{listof}{%
  \KOMA@set@ncmdkey{listof}{@tempa}{%
    {notoc}{0},{nottotoc}{0},{plainheading}{0},%
    {totoc}{1},{toc}{1},{notnumbered}{1},%
    {numbered}{2},{totocnumbered}{2},{tocnumbered}{2},{numberedtotoc}{2},%
    {numberedtoc}{2},%
    {flat}{3},{left}{3},%
    {graduated}{4},{indent}{4},{indented}{4},%
    {leveldown}{5},
    {standardlevel}{6},
    {entryprefix}{7},
    {indenttextentries}{8},{indentunnumbered}{8},{numberline}{8},%
    {leftaligntextentries}{9},{leftalignunnumbered}{9},{nonumberline}{9}%
    ,{chapterentry}{10},{withchapterentry}{10},%
    {nochaptergap}{11},{ignorechapter}{11},%
    {chaptergapsmall}{12},{smallchaptergap}{12},%
    {chaptergapline}{13},{onelinechaptergap}{13}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \ifcase \@tempa\relax % notoc
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{nolistof}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{listof}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{listofnumbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{nolistof}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{notoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{totoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{numbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{notoc}%
      \renewcommand*{\float@@listhead}{%
      \chapter*
      }%
      \doforeachtocfile[float]{%
        \unsettoc{\@currext}{numbered}%
        \unsettoc{\@currext}{totoc}%
      }%
      \AtAddToTocList[float]{%
        \unsettoc{\@currext}{numbered}%
        \unsettoc{\@currext}{totoc}%
      }%
    \or% totoc
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{nolistof}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{listof}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{listofnumbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{listof}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{notoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{totoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{numbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{totoc}%
      \renewcommand*{\float@@listhead}{%
      \addchap
      }%
      \doforeachtocfile[float]{%
        \unsettoc{\@currext}{numbered}%
        \setuptoc{\@currext}{totoc}%
      }%
      \AtAddToTocList[float]{%
        \unsettoc{\@currext}{numbered}%
        \setuptoc{\@currext}{totoc}%
      }%
    \or% numbered
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{nolistof}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{listof}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{listofnumbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{listofnumbered}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{notoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{totoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{numbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{numbered}%
      \renewcommand*{\float@@listhead}{%
      \chapter
      }%
      \doforeachtocfile[float]{%
        \setuptoc{\@currext}{numbered}%
        \setuptoc{\@currext}{totoc}%
      }%
      \AtAddToTocList[float]{%
        \setuptoc{\@currext}{numbered}%
        \setuptoc{\@currext}{totoc}%
      }%
    \or% flat
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{flat}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{graduated}%
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{flat}%
      \@dynlisttrue
    \or% graduated
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{flat}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{graduated}%
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{graduated}%
      \@dynlistfalse
    \or% leveldown
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{standardlevel}%
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{leveldown}%
      \doforeachtocfile[float]{%
        \setuptoc{\@currext}{leveldown}%
      }%
      \AtAddToTocList[float]{%
        \setuptoc{\@currext}{leveldown}%
      }%
    \or% standardlevel
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{leveldown}%
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{standardlevel}%
      \doforeachtocfile[float]{%
        \unsettoc{\@currext}{leveldown}%
      }%
      \AtAddToTocList[float]{%
        \unsettoc{\@currext}{leveldown}%
      }%
    \or% entryprefix
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{entryprefix}%
      \@dynlisttrue
      \doforeachtocfile[float]{%
        \BeforeStartingTOC[\@currext]{%
          \scr@ifundefinedorrelax{listof\@currext entryname}{}{%
            \expandafter\def\expandafter\numberline@prefix
            \expandafter{\csname listof\@currext entryname\endcsname
              \nobreakspace}%
          }%
        }%
      }%
      \AtAddToTocList[float]{%
        \BeforeStartingTOC[\@currext]{%
          \scr@ifundefinedorrelax{listof\@currext entryname}{}{%
            \expandafter\def\expandafter\numberline@prefix
            \expandafter{\csname listof\@currext entryname\endcsname
              \nobreakspace}%
          }%
        }%
      }%
    \or% indenttextentries
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{indenttextentries}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{leftaligntextentries}%
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{indenttextentries}%
      \doforeachtocfile[float]{%
        \setuptoc{\@currext}{numberline}%
      }%
      \AtAddToTocList[float]{%
        \setuptoc{\@currext}{numberline}%
      }
    \or% leftaligntextentries
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{indenttextentries}%
      \KOMA@kav@remove{.\KOMAClassFileName}{listof}{leftaligntextentries}%
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{leftaligntextentries}%
      \doforeachtocfile[float]{%
        \unsettoc{\@currext}{numberline}%
      }%
      \AtAddToTocList[float]{%
        \unsettoc{\@currext}{numberline}%
      }
    \or% chapterentry
      \KOMAoptions{chapteratlists=entry}%
    \or% chaptergap
      \KOMAoptions{chapteratlists=\z@}%
    \or% chaptergapsmall
      \KOMAoptions{chapteratlists=10\p@}%
    \or% chaptergapline
      \KOMAoptions{chapteratlists=\baselineskip}%
    \fi
  \fi
}
\KOMA@kav@add{.\KOMAClassFileName}{toc}{nolistof}
\KOMA@kav@add{.\KOMAClassFileName}{listof}{notoc}
\KOMA@kav@add{.\KOMAClassFileName}{listof}{graduated}
\KOMA@kav@add{.\KOMAClassFileName}{listof}{leftaligntextentries}
\KOMA@DeclareDeprecatedOption{liststotoc}{listof=totoc}
\KOMA@DeclareDeprecatedOption{liststotocnumbered}{listof=numbered}
\KOMA@DeclareDeprecatedOption{listsleft}{listof=flat}
\KOMA@DeclareDeprecatedOption{listsindent}{listof=graduated}
\newcommand*{\@chapterlistsgap}{10\p@}
\newif\if@chaptertolists\@chaptertolistsfalse
\KOMA@key{chapteratlists}[entry]{%
  \FamilyKeyStateProcessed
  \KOMA@kav@remove{.\KOMAClassFileName}{listof}{chapterentry}%
  \KOMA@kav@remove{.\KOMAClassFileName}{listof}{chaptergap}%
  \KOMA@kav@remove{.\KOMAClassFileName}{listof}{chaptergapsmall}%
  \KOMA@kav@remove{.\KOMAClassFileName}{listof}{chaptergapline}%
  \Ifstr{#1}{entry}{%
    \@chaptertoliststrue\renewcommand*{\@chapterlistsgap}{\z@}%
    \KOMA@kav@replacevalue{.\KOMAClassFileName}{chapteratlists}{entry}%
    \KOMA@kav@add{.\KOMAClassFileName}{listof}{chapterentry}%
  }{%
    \@chaptertolistsfalse\renewcommand*{\@chapterlistsgap}{#1}%
    \KOMA@kav@replacevalue{.\KOMAClassFileName}{chapteratlists}%
                                               {\@chapterlistsgap}%
    \def\reserved@a{\z@}%
    \ifx\@chapterlistsgap\reserved@a
      \KOMA@kav@add{.\KOMAClassFileName}{listof}{chaptergap}%
    \else
      \def\reserved@a{10\p@}%
      \ifx\@chapterlistsgap\reserved@a
        \KOMA@kav@add{.\KOMAClassFileName}{listof}{chaptergapsmall}%
      \else
        \def\reserved@a{\baselineskip}%
        \ifx\@chapterlistsgap\reserved@a
          \KOMA@kav@add{.\KOMAClassFileName}{listof}{chaptergapline}%
        \fi
      \fi
    \fi
  }%
}
\BeforeTOCHead{\@chaptertolistsfalse}
\KOMA@kav@add{.\KOMAClassFileName}{chapteratlists}{10\p@}%
\KOMA@kav@add{.\KOMAClassFileName}{listof}{chaptergapsmall}%
%%% From File: $Id: scrkernel-bibliography.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\newcommand{\newbibstyle}[3][]{%
  \scr@ifundefinedorrelax{scr@bibstyle@#2}{%
    \scr@ifundefinedorrelax{scr@bibstyle@#1}{%
      \ClassError{\KOMAClassName}{%
        parent bibliography style `#1' does not exist}{%
        You've told me to define the new bibliography style `#2'\MessageBreak
        to be a child of bibliography style `#1', but bibliography
        style\MessageBreak
        `#1' does not exist.\MessageBreak
        You have to remove the parent declaration or use an existing parent!
        See the KOMA-Script manual for more information.%
      }%
    }{%
      \@namedef{scr@bibstyle@#2}{%
        \let\@openbib@code\@empty
        \let\newblock\@empty
        \let\bib@beginhook\@empty
        \let\bib@endhook\@empty
        \@ifundefined{scr@current@bibstyle}{}{%
          \Ifstr{\scr@current@bibstyle}{}{}{%
            \edef\reserved@a{%
              \noexpand\KOMA@kav@remove{.\KOMAClassFileName}{bibliography}%
                                       {\scr@current@bibstyle}%
            }\reserved@a
          }%
        }%
        \def\scr@current@bibstyle{#2}%
        \KOMA@kav@xadd{.\KOMAClassFileName}{bibliography}{#2}%
        \csname scr@bibstyle@#1\endcsname
        #3%
      }%
      \ifx\scr@bibstylelist\@empty
        \edef\scr@bibstylelist{`#2'}%
      \else
        \edef\scr@bibstylelist{\scr@bibstylelist, `#2'}%
      \fi
    }%
  }{%
    \ClassError{\KOMAClassName}{bibliography style `#2' already exists}{%
      You've told me to define the new bibliography style `#2',\MessageBreak
      but this style already exists.\MessageBreak
      You have to use another bibliography style name.\MessageBreak
      See the KOMA-Script manual for more information.%
    }%
  }%
}
\newcommand*{\scr@bibstyle@}{}
\newcommand*{\bib@beginhook}{}
\newcommand*{\bib@endhook}{}
\newcommand*{\scr@bibstylelist}{}
\newcommand*{\@openbib@code}{}
\newcommand*{\newblock}{}
\newbibstyle{openstyle}{%
  \renewcommand*{\@openbib@code}{%
    \advance\leftmargin\bibindent
    \itemindent -\bibindent
    \listparindent \itemindent
    \parsep \z@
  }%
  \renewcommand*{\newblock}{\par}%
}
\newbibstyle{oldstyle}{%
  \renewcommand*{\newblock}{\hskip .11em\@plus.33em\@minus.07em}%
}
\scr@bibstyle@oldstyle
\newcommand*{\bib@heading}{%
  \bibliography@heading{\bibname}%
}
\newcommand*{\bibliography@heading}[1]{%
  \ifbib@leveldown
    \section*{#1}%
    \addsecmark{#1}%
  \else
    \chapter*{#1}%
    \@mkdouble{\MakeMarkcase{#1}}%
  \fi
}%
\newif\ifbib@leveldown
\KOMA@key{bibliography}{%
  \scr@ifundefinedorrelax{scr@bibstyle@#1}{%
    \KOMA@set@ncmdkey{bibliography}{@tempa}{%
      {notoc}{0},{nottotoc}{0},{plainheading}{0},%
      {totoc}{1},{toc}{1},{notnumbered}{1},%
      {numbered}{2},{totocnumbered}{2},{tocnumbered}{2},{numberedtotoc}{2},%
      {numberedtoc}{2},%
      {leveldown}{3},%
      {standardlevel}{4}%
    }{#1}%
    \ifcase \@tempa\relax % notoc
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{nobibliography}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{bibliography}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{bibliographynumbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{nobibliography}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{notoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{totoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{numbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{bibliography}{notoc}%
      \renewcommand*{\bibliography@heading}[1]{%
        \ifbib@leveldown
          \section*{##1}%
          \@mkright{\MakeMarkcase{##1}}%
        \else
          \chapter*{##1}%
          \@mkdouble{\MakeMarkcase{##1}}%
        \fi
      }%
    \or% totoc
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{nobibliography}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{bibliography}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{bibliographynumbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{bibliography}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{notoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{totoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{numbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{bibliography}{totoc}%
      \renewcommand*{\bibliography@heading}[1]{%
        \ifbib@leveldown
          \addsec{##1}%
        \else
          \if@chaptertolists
            \@chaptertolistsfalse\addchap{##1}\@chaptertoliststrue
          \else
            \addchap{##1}%
          \fi
          \@mkdouble{\MakeMarkcase{##1}}%
        \fi
      }%
    \or% numbered
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{nobibliography}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{bibliography}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{bibliographynumbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{bibliographynumbered}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{notoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{totoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{numbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{bibliography}{numbered}%
      \renewcommand*{\bibliography@heading}[1]{%
        \ifbib@leveldown
          \section{##1}%
        \else
          \if@chaptertolists
            \@chaptertolistsfalse\chapter{##1}\@chaptertoliststrue
          \else
            \chapter{##1}
          \fi
          \@mkdouble{\MakeMarkcase{\chaptermarkformat ##1}}%
        \fi
      }
    \or% leveldown
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{leveldown}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{standardlevel}%
      \KOMA@kav@add{.\KOMAClassFileName}{bibliography}{leveldown}%
      \bib@leveldowntrue
    \or% standardlevel
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{leveldown}%
      \KOMA@kav@remove{.\KOMAClassFileName}{bibliography}{standardlevel}%
      \KOMA@kav@add{.\KOMAClassFileName}{bibliography}{standardlevel}%
      \bib@leveldownfalse
    \fi
  }{%
    \FamilyKeyStateProcessed
    \edef\reserved@a{%
      \noexpand\KOMA@kav@remove{.\KOMAClassFileName}{bibliography}%
                               {\scr@current@bibstyle}%
    }\reserved@a
    \csname scr@bibstyle@#1\endcsname
  }%
}
\KOMA@DeclareStandardOption{openbib}{bibliography=openstyle}
\KOMA@DeclareDeprecatedOption{bibtotoc}{bibliography=totoc}
\KOMA@DeclareDeprecatedOption{bibtotocnumbered}{bibliography=totocnumbered}
%%% From File: $Id: scrkernel-index.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\newcommand*{\idx@@heading}{%
  \ifidx@leveldown
    \expandafter\section
  \else
    \expandafter\chapter
  \fi*%
}
\newif\ifidx@leveldown
\KOMA@key{index}{%
  \KOMA@set@ncmdkey{index}{@tempa}{%
    {notoc}{0},{nottotoc}{0},{default}{0},{plainheading}{0},%
    {totoc}{1},{toc}{1},{notnumbered}{1},%
    {numbered}{2},{totocnumbered}{2},{numberedtotoc}{2},{tocnumbered}{2},%
    {numberedtoc}{2},%
    {leveldown}{3},%
    {standardlevel}{4}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \ifcase \@tempa\relax
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{noindex}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{indexnumbered}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{index}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{notoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{numbered}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{toc}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{noindex}%
      \KOMA@kav@add{.\KOMAClassFileName}{index}{notoc}%
      \renewcommand*{\idx@@heading}{%
        \ifidx@leveldown
        \expandafter\section
        \else
        \expandafter\chapter
        \fi*%
      }%
    \or
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{noindex}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{indexnumbered}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{index}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{notoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{numbered}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{toc}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{index}%
      \KOMA@kav@add{.\KOMAClassFileName}{index}{toc}%
      \renewcommand*{\idx@@heading}{%
        \ifidx@leveldown
        \expandafter\addsec
        \else
        \expandafter\addchap
        \fi
      }%
    \or
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{noindex}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{indexnumbered}%
      \KOMA@kav@remove{.\KOMAClassFileName}{toc}{index}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{notoc}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{numbered}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{toc}%
      \KOMA@kav@add{.\KOMAClassFileName}{toc}{indexnumbered}%
      \KOMA@kav@add{.\KOMAClassFileName}{index}{numbered}%
      \renewcommand*{\idx@@heading}{%
        \ifidx@leveldown
        \expandafter\section
        \else
        \expandafter\chapter
        \fi
      }%
    \or
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{leveldown}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{standardlevel}%
      \KOMA@kav@add{.\KOMAClassFileName}{index}{leveldown}%
      \idx@leveldowntrue
    \or
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{leveldown}%
      \KOMA@kav@remove{.\KOMAClassFileName}{index}{standardlevel}%
      \KOMA@kav@add{.\KOMAClassFileName}{index}{standardlevel}%
      \idx@leveldownfalse
    \fi
  \fi
}
\KOMA@kav@add{.\KOMAClassFileName}{toc}{noindex}
\KOMA@kav@add{.\KOMAClassFileName}{index}{notoc}
\KOMA@kav@add{.\KOMAClassFileName}{index}{standardlevel}
\KOMA@DeclareDeprecatedOption{idxtotoc}{index=totoc}
%%% From File: $Id: scrkernel-listsandtabulars.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
%%% From File: $Id: scrkernel-sections.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: execoption)
\KOMAExecuteOptions{headings=openany}
\KOMAExecuteOptions{numbers=autoendperiod}
%%% From File: $Id: scrkernel-miscellaneous.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: execoption)
\KOMAExecuteOptions{%
  parskip=false,%
  headings=big%
}
\KOMAProcessOptions\relax
%%% From File: $Id: scrkernel-compatibility.dtx 3896 2022-06-21 09:06:07Z kohm $
%%%            (run: body)
\AtBeginDocument{%
  \begingroup
    \def\reserved@a#1/#2/#3 #4\@nil{\@tempcnta=#1\relax\@tempcntb=#2\relax}%
    \expandafter\reserved@a\KOMAScriptVersion\@nil
    \edef\reserved@a{\the\numexpr\@tempcnta+2\relax/%
      \ifnum\@tempcntb<10 0\fi\the\@tempcntb/01}%
    \expandafter\IfLTXAtLeastTF\expandafter{\reserved@a}{%
      \ClassWarningNoLine{\KOMAClassName}{%
        Your are using a KOMA-Script version, that has not\MessageBreak
        been tested with your more than one year newer\MessageBreak
        LaTeX release `\fmtversion'.\MessageBreak
        Because of the high speed of LaTeX kernel development,\MessageBreak
        this could result in a lot of issues.\MessageBreak
        Please have a look at\MessageBreak
        <http://www.ctan.org/pkg/koma-script> and if this\MessageBreak
        shows a newer KOMA-Script version than\MessageBreak
        `\KOMAScriptVersion', we suggest to do\MessageBreak
        an update of KOMA-Script or maybe even the whole\MessageBreak
        TeX distribution%
      }%
    }{%
      \edef\reserved@a{\the\numexpr\@tempcnta-4\relax/%
        \ifnum\@tempcntb<10 0\fi\the\@tempcntb/01}%
      \expandafter\IfLTXAtLeastTF\expandafter{\reserved@a}{}{%
        \ClassWarningNoLine{\KOMAClassName}{%
          You are using a KOMA-Script version, that has not been\MessageBreak
          tested with your more than four years older LaTeX\MessageBreak
          release `\fmtversion'.\MessageBreak
          Because of the high speed of LaTeX kernel development,\MessageBreak
          KOMA-Script releases cannot be tested with all past\MessageBreak
          LaTeX releases.\MessageBreak
          \ifnum\scr@compatibility<\scr@v@last
            So even if you are using option `version' implicitly\MessageBreak
            or explicitly, this
          \else
            So this
          \fi
          could result in a lot of issues.\MessageBreak
          We recommend, to update the whole TeX distribution.\MessageBreak
          If this could not be done, we suggest to use at\MessageBreak
          least an older KOMA-Script release, e.g., from\MessageBreak
          <https://komascript.de/current>%
        }%
      }%
    }%
  \endgroup
}
%%% From File: $Id: scrkernel-fonts.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*\scr@setlength[4]{%
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{#1}{#2 \@plus#3 \@minus#4}%
  \else
    \ifdim #2<\ifdim #2=\z@ \z@ \else \p@\fi
      \ifdim #3<\ifdim #3=\z@ \z@ \else \p@\fi
        \ifdim #4<\ifdim #4=\z@ \z@ \else \p@\fi
          \setlength{#1}{\p@ \@plus\p@ \@minus\p@}%
        \else
          \setlength{#1}{\p@ \@plus\p@ \@minus#4}%
        \fi
      \else
        \ifdim #4<\ifdim #4=\z@ \z@ \else \p@\fi
          \setlength{#1}{\p@ \@plus#3 \@minus\p@}%
        \else
          \setlength{#1}{\p@ \@plus#3 \@minus#4}%
        \fi
      \fi
    \else
      \ifdim #3<\ifdim #3=\z@ \z@ \else \p@\fi
        \ifdim #4<\ifdim #4=\z@ \z@ \else \p@\fi
          \setlength{#1}{#2 \@plus\p@ \@minus\p@}%
        \else
          \setlength{#1}{#2 \@plus\p@ \@minus#4}%
        \fi
      \else
        \ifdim #4<\ifdim #4=\z@ \z@ \else \p@\fi
          \setlength{#1}{#2 \@plus#3 \@minus\p@}%
        \else
          \setlength{#1}{#2 \@plus#3 \@minus#4}%
        \fi
      \fi
    \fi
  \fi
}
\providecommand*{\simple@changefontsizes}[2][1.2\@tempdima]{%
  \KOMA@kav@removekey{.%
    \KOMAClassFileName
  }{fontsize}%
  \@defaultunits\@tempdima#2pt\relax\@nnil
  \setlength{\@tempdimc}{\@tempdima}%
  \addtolength{\@tempdimc}{-10\p@}%
  \edef\@ptsize{\strip@pt\@tempdimc}%
  \@defaultunits\@tempdimb#1pt\relax\@nnil
  \setlength{\@tempdimc}{\dimexpr (100\@tempdimb / \@tempdima * \p@)}%
  \edef\@tempb{\the\@tempdimc}%
  \setlength{\@tempdimc}{\@tempdima}%
  \def\@tempa##1##2##3##4##5\@nnil{\def##1{##2.##3##4}}%
  \expandafter\@tempa\expandafter\@tempb\@tempb\@nnil%
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\abovedisplayskip}{%
      \@tempdima \@plus .25\@tempdima \@minus .58\@tempdima}%
    \setlength{\abovedisplayshortskip}{\z@ \@plus .25\@tempdima}%
    \setlength{\belowdisplayshortskip}{%
      .55\@tempdima \@plus .3\@tempdima \@minus .25\@tempdima}%
  \else
    \scr@setlength{\abovedisplayskip}%
                  {.8333\@tempdimb}{.1667\@tempdimb}{.5\@tempdimb}%
    \scr@setlength{\abovedisplayshortskip}{\z@}{.25\@tempdimb}{\z@}%
    \scr@setlength{\belowdisplayshortskip}%
                  {.5\@tempdimb}{.25\@tempdimb}{.25\@tempdimb}%
  \fi
  \setlength{\belowdisplayskip}{\abovedisplayskip}%
  \edef\normalsize{%
    \noexpand\@setfontsize\noexpand\normalsize
    {\the\@tempdima}{\the\@tempdimb}%
    \abovedisplayskip \the\abovedisplayskip
    \abovedisplayshortskip \the\abovedisplayshortskip
    \belowdisplayskip \the\belowdisplayskip
    \belowdisplayshortskip \the\belowdisplayshortskip
    \let\noexpand\@listi\noexpand\@listI
  }%
  \setlength{\@tempdima}{0.9125\@tempdimc}%
  \setlength{\@tempdimb}{\@tempb\@tempdima}%
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\abovedisplayskip}{%
      \@tempdima \@plus .25\@tempdima \@minus .58\@tempdima}%
    \setlength{\abovedisplayshortskip}{\z@ \@plus .25\@tempdima}%
    \setlength{\belowdisplayshortskip}{%
      .55\@tempdima \@plus .3\@tempdima \@minus .25\@tempdima}%
  \else
    \scr@setlength{\abovedisplayskip}%
                  {.8333\@tempdimb}{.1667\@tempdimb}{.5\@tempdimb}%
    \scr@setlength{\abovedisplayshortskip}{\z@}{.25\@tempdimb}{\z@}%
    \scr@setlength{\belowdisplayshortskip}%
                  {.5\@tempdimb}{.25\@tempdimb}{.25\@tempdimb}%
  \fi
  \setlength{\belowdisplayskip}{\abovedisplayskip}%
  \edef\small{%
    \noexpand\@setfontsize\noexpand\small
    {\the\@tempdima}{\the\@tempdimb}%
    \abovedisplayskip \the\abovedisplayskip
    \abovedisplayshortskip \the\abovedisplayshortskip
    \belowdisplayskip \the\belowdisplayskip
    \belowdisplayshortskip \the\belowdisplayshortskip
    \let\noexpand\@listi\noexpand\@listi@small
  }%
  \setlength{\@tempdima}{.83334\@tempdimc}%
  \setlength{\@tempdimb}{\@tempb\@tempdima}%
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\abovedisplayskip}{%
      \@tempdima \@plus .25\@tempdima \@minus .58\@tempdima}%
    \setlength{\abovedisplayshortskip}{\z@ \@plus .25\@tempdima}%
    \setlength{\belowdisplayshortskip}{%
      .55\@tempdima \@plus .3\@tempdima \@minus .25\@tempdima}%
  \else
    \scr@setlength{\abovedisplayskip}%
                  {.8333\@tempdimb}{.1667\@tempdimb}{.5\@tempdimb}%
    \scr@setlength{\abovedisplayshortskip}{\z@}{.25\@tempdimb}{\z@}%
    \scr@setlength{\belowdisplayshortskip}%
                  {.5\@tempdimb}{.25\@tempdimb}{.25\@tempdimb}%
  \fi
  \setlength{\belowdisplayskip}{\abovedisplayskip}%
  \edef\footnotesize{%
    \noexpand\@setfontsize\noexpand\footnotesize
    {\the\@tempdima}{\the\@tempdimb}%
    \abovedisplayskip \the\abovedisplayskip
    \abovedisplayshortskip \the\abovedisplayshortskip
    \belowdisplayskip \the\belowdisplayskip
    \belowdisplayshortskip \the\belowdisplayshortskip
    \let\noexpand\@listi\noexpand\@listi@footnotesize
  }%
  \setlength{\@tempdima}{.66667\@tempdimc}%
  \setlength{\@tempdimb}{\@tempb\@tempdima}%
  \edef\scriptsize{%
    \noexpand\@setfontsize\noexpand\scriptsize
    {\the\@tempdima}{\the\@tempdimb}%
  }%
  \setlength{\@tempdima}{.5\@tempdimc}%
  \setlength{\@tempdimb}{\@tempb\@tempdima}%
  \edef\tiny{%
    \noexpand\@setfontsize\noexpand\tiny
    {\the\@tempdima}{\the\@tempdimb}%
  }%
  \setlength{\@tempdima}{1.2\@tempdimc}%
  \setlength{\@tempdimb}{\@tempb\@tempdima}%
  \edef\large{%
    \noexpand\@setfontsize\noexpand\large
    {\the\@tempdima}{\the\@tempdimb}%
  }%
  \setlength{\@tempdima}{1.44\@tempdimc}%
  \setlength{\@tempdimb}{\@tempb\@tempdima}%
  \edef\Large{%
    \noexpand\@setfontsize\noexpand\Large
    {\the\@tempdima}{\the\@tempdimb}%
  }%
  \setlength{\@tempdima}{1.728\@tempdimc}%
  \setlength{\@tempdimb}{\@tempb\@tempdima}%
  \edef\LARGE{%
    \noexpand\@setfontsize\noexpand\LARGE
    {\the\@tempdima}{\the\@tempdimb}%
  }%
  \setlength{\@tempdima}{2.074\@tempdimc}%
  \setlength{\@tempdimb}{\@tempb\@tempdima}%
  \edef\huge{%
    \noexpand\@setfontsize\noexpand\huge
    {\the\@tempdima}{\the\@tempdimb}%
  }%
  \setlength{\@tempdima}{2.488\@tempdimc}%
  \setlength{\@tempdimb}{\@tempb\@tempdima}%
  \edef\Huge{%
    \noexpand\@setfontsize\noexpand\Huge
    {\the\@tempdima}{\the\@tempdimb}%
  }%
  \normalsize
  \expandafter\ifnum\scr@v@is@ge{3.17}\@nameuse{par@updaterelative}\fi
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\footnotesep}{.7\@tempdimc}%
    \setlength{\skip\footins}{.9\@tempdimc \@plus .3333\@tempdimc \@minus
      .6\@tempdimc}%
    \setlength{\floatsep}{\@tempdimc \@plus .1667\@tempdimc \@minus
      .3333\@tempdimc}%
    \setlength{\textfloatsep}{1.6667\@tempdimc \@plus .1667\@tempdimc \@minus
      .3333\@tempdimc}%
    \setlength{\intextsep}{\@tempb\@tempdimc \@plus .3333\@tempdimc \@minus
      .3333\@tempdimc}%
    \setlength{\dblfloatsep}{\@tempb\@tempdimc \@plus .1667\@tempdimc \@minus
      .3333\@tempdimc}%
    \setlength{\dbltextfloatsep}{\textfloatsep}%
    \setlength{\@fptop}{0\p@ \@plus 1fil}%
    \setlength{\@fpsep}{.8333\@tempdimc \@plus 2fil}%
    \setlength{\@fpbot}{\@fptop}%
    \setlength{\@dblfptop}{0\p@ \@plus 1fil}%
    \setlength{\@dblfpsep}{.8333\@tempdimc \@plus 2fil}%
    \setlength{\@dblfpbot}{\@fptop}%
  \fi
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\topsep}{.8333\@tempdimc \@plus .3333\@tempdimc \@minus
      .5\@tempdimc}%
    \setlength{\parsep}{.4167\@tempdimc \@plus .2083\@tempdimc \@minus \p@}%
  \else
    \setlength{\@tempdimb}{\f@baselineskip}%
    \scr@setlength{\parsep}%
                  {.3333\@tempdimb}{.1667\@tempdimb}{.0833\@tempdimb}%
    \scr@setlength{\topsep}%
                  {.6667\@tempdimb}{.1667\@tempdimb}{.3333\@tempdimb}%
  \fi
  \@tempswafalse
  \begingroup
    \def\@list@extra{\aftergroup\@tempswatrue}%
    \csname @listi\endcsname
  \endgroup
  \edef\@listi{\leftmargin\leftmargini
    \topsep \the\topsep
    \parsep \the\parsep
    \itemsep \parsep
    \if@tempswa\noexpand\@list@extra\fi
  }%
  \let\@listI\@listi
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\topsep}{.75\@tempdimc \@plus .25\@tempdimc \@minus
      .41667\@tempdimc}%
    \setlength{\parsep}{.375\@tempdimc \@plus .16667\@tempdimc \@minus \p@}%
  \else
    \scr@setlength{\parsep}%
                  {.1667\@tempdimb}{.0833\@tempdimb}{.0833\@tempdimb}%
    \scr@setlength{\topsep}%
                  {.3333\@tempdimb}{.1667\@tempdimb}{.1667\@tempdimb}%
  \fi
  \@tempswafalse
  \begingroup
    \def\@list@extra{\aftergroup\@tempswatrue}%
    \csname @listi\endcsname
  \endgroup
  \edef\@listi@small{\leftmargin\leftmargini
    \topsep \the\topsep
    \parsep \the\parsep
    \itemsep \parsep
    \if@tempswa\noexpand\@list@extra\fi
  }%
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\topsep}{.5\@tempdimc \@plus .16667\@tempdimc \@minus
      .16667\@tempdimc}%
    \setlength{\parsep}{.25\@tempdimc \@plus .16667\@tempdimc \@minus \p@}%
  \else
    \scr@setlength{\parsep}%
                  {.125\@tempdimb}{.0625\@tempdimb}{.0625\@tempdimb}%
    \scr@setlength{\topsep}%
                  {.25\@tempdimb}{.125\@tempdimb}{.125\@tempdimb}%
  \fi
  \@tempswafalse
  \begingroup
    \def\@list@extra{\aftergroup\@tempswatrue}%
    \csname @listi\endcsname
  \endgroup
  \edef\@listi@footnotesize{\leftmargin\leftmargini
    \topsep \the\topsep
    \parsep \the\parsep
    \itemsep \parsep
    \if@tempswa\noexpand\@list@extra\fi
  }%
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\topsep}{.4167\@tempdimc \@plus .2083\@tempdimc \@minus \p@}%
    \setlength{\parsep}{.2083\@tempdimc \@plus \p@ \@minus \p@}%
  \else
    \scr@setlength{\parsep}%
                  {.1667\@tempdimb}{.0833\@tempdimb}{.0833\@tempdimb}%
    \scr@setlength{\topsep}%
                  {.3333\@tempdimb}{.1667\@tempdimb}{.0833\@tempdimb}%
  \fi
  \@tempswafalse
  \begingroup
    \def\@list@extra{\aftergroup\@tempswatrue}%
    \csname @listii\endcsname
  \endgroup
  \edef\@listii{\leftmargin\leftmarginii
    \labelwidth=\dimexpr \leftmargin-\labelsep
    \topsep \the\topsep
    \parsep \the\parsep
    \itemsep \parsep
    \if@tempswa\noexpand\@list@extra\fi
  }%
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\topsep}{.2083\@tempdimc \@plus \p@ \@minus \p@}%
  \else
    \scr@setlength{\topsep}%
                  {.1667\@tempdimb}{.0833\@tempdimb}{.0833\@tempdimb}%
  \fi
  \setlength{\partopsep}{\z@ \@plus\z@ \@minus\p@}%
  \@tempswafalse
  \begingroup
    \def\@list@extra{\aftergroup\@tempswatrue}%
    \csname @listiii\endcsname
  \endgroup
  \edef\@listiii{\leftmargin\leftmarginiii
    \labelwidth=\dimexpr \leftmargin-\labelsep
    \topsep \the\topsep
    \parsep \z@
    \partopsep \the\partopsep
    \itemsep \topsep
    \if@tempswa\noexpand\@list@extra\fi
  }%
  \@tempswafalse
  \begingroup
    \def\@list@extra{\aftergroup\@tempswatrue}%
    \csname @listiv\endcsname
  \endgroup
  \edef\@listiv{\leftmargin\leftmarginiv
    \labelwidth=\dimexpr \leftmargin-\labelsep\relax
    \if@tempswa\noexpand\@list@extra\fi
  }%
  \@tempswafalse
  \begingroup
    \def\@list@extra{\aftergroup\@tempswatrue}%
    \csname @listv\endcsname
  \endgroup
  \edef\@listv{\leftmargin\leftmarginv
    \labelwidth=\dimexpr \leftmargin-\labelsep\relax
    \if@tempswa\noexpand\@list@extra\fi
  }%
  \@tempswafalse
  \begingroup
    \def\@list@extra{\aftergroup\@tempswatrue}%
    \csname @listvi\endcsname
  \endgroup
  \edef\@listvi{\leftmargin\leftmarginvi
    \labelwidth=\dimexpr \leftmargin-\labelsep\relax
    \if@tempswa\noexpand\@list@extra\fi
  }%
  \@listi
  \expandafter\ifnum\scr@v@is@lt{3.12}\relax
    \setlength{\@tempdimb}{\@tempb\@tempdima}%
    \setlength{\@tempdima}{\dimexpr \@tempdimb-\@tempdimc}%
    \setlength\intextsep{\@tempdimb \@plus.2\@tempdima \@minus.2\@tempdima}%
    \setlength\dblfloatsep\intextsep
    \setlength\partopsep{.2\@tempdimc \@plus.1\@tempdimc \@minus.1\@tempdimc}%
  \else
    \setlength{\@tempdimb}{\f@baselineskip}%
    \setlength{\footnotesep}{.555\@tempdimb}%
    \scr@setlength{\skip\footins}%
                  {.75\@tempdimb}{.3333\@tempdimb}{.1667\@tempdimb}%
    \scr@setlength{\floatsep}%
                  {\@tempdimb}{.1667\@tempdimb}{.1667\@tempdimb}%
    \scr@setlength{\textfloatsep}%
                  {1.6667\@tempdimb}{.1667\@tempdimb}{.3333\@tempdimb}%
    \setlength{\intextsep}{\floatsep}%
    \setlength{\dblfloatsep}{\floatsep}%
    \setlength{\dbltextfloatsep}{\textfloatsep}%
    \setlength{\@fptop}{\z@ \@plus 1fil}%
    \setlength{\@fpsep}{.6667\@tempdimb \@plus 2fil}%
    \setlength{\@fpbot}{\@fptop}%
    \setlength{\@dblfptop}{\@fptop}%
    \setlength{\@dblfpsep}{\@fpsep}%
    \setlength{\@dblfpbot}{\@fptop}%
    \scr@setlength{\partopsep}{.2\@tempdimb}{.1\@tempdimb}{.1\@tempdimb}%
  \fi
}
\scr@ifundefinedorrelax{changefontsizes}{%
  \let\changefontsizes\simple@changefontsizes
}{%
  \ClassWarning{\KOMAClassName}{%
    \string\changefontsizes\space already defined.\MessageBreak
    I hope, the definition is compatible,\MessageBreak
    because I do not change it%
  }%
}
\expandafter\@defaultunits\expandafter\@tempdima\@ptsize pt\relax\@nnil
\edef\@tempa{\@ptsize}%
\setlength{\@tempdimb}{\@tempdima}%
\edef\@tempb{\strip@pt\@tempdimb}%
\addtolength{\@tempdimb}{-10\p@}%
\edef\@ptsize{\strip@pt\@tempdimb}%
\InputIfFileExists{\@fontsizefilebase\@tempa.clo}{%
  \ClassInfo{\KOMAClassName}{%
    File `\@fontsizefilebase\@tempa.clo' used to setup font sizes}%
  \KOMA@kav@removekey{.\KOMAClassFileName}{fontsize}%
  \KOMA@kav@xadd{.\KOMAClassFileName}{fontsize}{\@tempa}%
}{%
  \InputIfFileExists{\@fontsizefilebase\@tempb pt.clo}{%
    \ClassInfo{\KOMAClassName}{%
      File `\@fontsizefilebase\@tempb pt.clo' used instead of\MessageBreak
      file `\@fontsizefilebase\@tempa.clo' to setup font sizes}%
    \KOMA@kav@removekey{.\KOMAClassFileName}{fontsize}%
    \KOMA@kav@xadd{.\KOMAClassFileName}{fontsize}{\@tempb pt}%
  }{%
      \InputIfFileExists{size\@tempb.clo}{%
        \ClassInfo{\KOMAClassName}{%
          File `size\@tempb.clo' used to setup font sizes}%
        \KOMA@kav@removekey{.\KOMAClassFileName}{fontsize}%
        \KOMA@kav@xadd{.\KOMAClassFileName}{fontsize}{\@tempb}%
      }{%
        \edef\@tempa{%
          \noexpand\changefontsizes{\@tempa}%
          \noexpand\KOMA@kav@xadd{.\KOMAClassFileName}{fontsize}{\@tempa}%
        }\@tempa
      }%
  }%
}
\newcommand*{\scr@DeclareOldFontCommand}[3]{%
  \ifnum\scr@defineobsoletefonts<\z@\else
    \ifnum\scr@defineobsoletefonts>\tw@
      \DeclareOldFontCommand{#1}{#2}{#3}%
    \else
      \DeclareOldFontCommand{#1}{%
        \scr@ErrorWarningInfo{#1}{#2}#2%
      }{%
        \scr@ErrorWarningInfo{#1}{#3}#3%
      }%
    \fi
  \fi
}
\DeclareRobustCommand*{\scr@ErrorWarningInfo}[2]{%
  \ifnum \scr@defineobsoletefonts=\z@
    \ClassError{\KOMAClassName}{undefined old font command `\string#1'}{%
      You should note that since 1994 LaTeX2e provides a new font selection
      scheme\MessageBreak
      called NFSS2 with several new, combinable font commands.
      KOMA-Script\MessageBreak
      classes had defined the old font commands like `\string#1'
      only for compatibility\MessageBreak
      with old LaTeX 2.09 document styles of Script 2.0. Nevertheless,
      these\MessageBreak
      commands are deprecated and undocumented at least since 2003. Since
      2013\MessageBreak
      KOMA-Script classes warned about soon removement of these deprecated
      commands.\MessageBreak
      Now, after two decades of LaTeX2e and NFSS2, these commands will not
      work any\MessageBreak
      more. If loading a package results in this error message, you should
      contact\MessageBreak
      the author of that package and ask him to replace the deprecated font
      command\MessageBreak
      `\string#1', e.g., by `\detokenize{#2}`. Otherwise you should
      reconfigure\MessageBreak
      or replace the package. If you have used the old font command
      `\string#1' yourself,\MessageBreak
      you should replace it, e.g., by `\detokenize{#2}'.\MessageBreak
      To make it work for now, you can use the already also deprecated class
      option\MessageBreak
      `enabledeprecatedfontcommands'.%
    }%
  \else
    \ifcase \scr@defineobsoletefonts
    \or
      \expandafter\ClassWarning
    \or
      \expandafter\ClassInfo
    \else
      \expandafter\@gobbletwo
    \fi
    {\KOMAClassName}{deprecated old font command `\string#1' used.\MessageBreak
      You should note, that since 1994 LaTeX2e provides a\MessageBreak
      new font selection scheme called NFSS2 with several\MessageBreak
      new, combinable font commands. New KOMA-Script classes\MessageBreak
      defined the old font commands like `\string#1' only for\MessageBreak
      compatibility with LaTeX 2.09 document styles of\MessageBreak
      Script 2.0. These commands are deprecated and\MessageBreak
      undocumented at least since 2003. Since 2013,\MessageBreak
      KOMA-Script classes warned about soon removement of\MessageBreak
      these deprecated commands. Now, after two decades of\MessageBreak
      LaTeX2e, NFSS2, and KOMA-Script these commands will\MessageBreak
      not work any longer. If loading a package results in\MessageBreak
      this message you should contact the author of that\MessageBreak
      package and ask him to replace the depracted font\MessageBreak
      command `\string#1', e.g., by `\detokenize{#2}'.\MessageBreak
      Otherwise you should reconfigure or replace the\MessageBreak
      package. If you have used the old font command\MessageBreak
      `\string #1' yourself you should replace it, e.g., by\MessageBreak
      `\detokenize{#2}'%
    }%
  \fi
}
\scr@DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\scr@DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\scr@DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\scr@DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\scr@DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\scr@DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\scr@DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\scr@DeclareOldFontCommand{\sfb}{\normalfont\sffamily\bfseries}{%
  \@nomath\sfb}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}
%%% From File: $Id: scrkernel-language.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
      \def\today{\ifcase\month\or
        January\or February\or March\or April\or May\or June\or
        July\or August\or September\or October\or November\or December\fi
        \space\number\day, \number\year}%
%%% From File: $Id: scrkernel-typearea.dtx 3889 2022-06-09 12:11:14Z kohm $
%%%            (run: body)
\let\@BCOR                =\relax
\let\@@BCOR               =\relax
\let\@DIV                 =\relax
\let\@@DIV                =\relax
\let\@headlines           =\relax
\let\@@headlines          =\relax
\let\x@paper              =\relax
\let\x@@paper             =\relax
\let\scr@pti@nerr@r       =\relax
\RequirePackage{typearea}[\KOMAScriptVersion]
\if@scr@emulatestandardclasses
  \Ifstr{\@lastdiv}{areaset}{}{%
    \ifnum\@lastdiv=\z@
      \setlength{\textwidth}{\dimexpr \paperwidth-2in\relax}
      \ifdim \f@size\p@<10.5\p@
          \setlength{\@tempdimb}{345\p@}
      \else\ifdim \f@size\p@<11.5\p@
          \setlength{\@tempdimb}{360\p@}
        \else
          \setlength{\@tempdimb}{390\p@}
        \fi
      \fi
      \if@twocolumn
        \ifdim\@textwidth>2\@tempdimb\relax
          \setlength{\textwidth}{2\@tempdimb}
        \fi
      \else
        \ifdim\textwidth>\@tempdimb
          \setlength{\textwidth}{\@tempdimb}
        \fi
      \fi
      \@settopoint\textwidth
      \setlength{\@tempdima}{\dimexpr \paperheight-3.5in\relax}
      \divide\@tempdima\baselineskip
      \@tempcnta=\@tempdima
      \setlength{\textheight}{\@tempcnta\baselineskip}
      \addtolength{\textheight}{\topskip}
      \edef\reserved@a{%
        \noexpand\@areasetadvancedtrue
        \noexpand\areaset[current]{\noexpand\textwidth}{\noexpand\textheight}%
        \if@areasetadvanced\else\noexpand\@areasetadvancedfalse\fi
      }\reserved@a
    \fi
  }%
\fi
%%% From File: $Id: scrkernel-paragraphs.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*{\par@updaterelative}{%
  \begingroup
    \edef\reserved@a{\the\parindent}\ifx\reserved@a\f@parindent
      \aftergroup\parindent@update
    \fi
    \edef\reserved@a{\the\parskip}\ifx\reserved@a\f@parskip
      \aftergroup\parskip@update
    \fi
    \edef\reserved@a{\the\parfillskip}\ifx\reserved@a\f@parfillskip
      \aftergroup\parfillskip@update
    \fi
  \endgroup
}
\newcommand*{\parindent@update}{%
  \scr@defaultunits\parindent\scr@parindent
  \begingroup
    \let\reserved@b\endgroup
    \edef\reserved@a{\the\parindent}\ifx\reserved@a\f@parindent\else
      \def\reserved@b{\endgroup\edef\f@parindent{\the\parindent}}%
    \fi
  \reserved@b
}
\newcommand*{\parskip@update}{%
  \scr@defaultunits\parskip\scr@parskip
  \begingroup
    \let\reserved@b\endgroup
    \edef\reserved@a{\the\parskip}\ifx\reserved@a\f@parskip\else
      \def\reserved@b{\endgroup\edef\f@parskip{\the\parskip}}%
    \fi
  \reserved@b
}
\newcommand*{\parfillskip@update}{%
  \scr@defaultunits\parfillskip\scr@parfillskip
  \begingroup
    \let\reserved@b\endgroup
    \edef\reserved@a{\the\parfillskip}\ifx\reserved@a\f@parfillskip\else
      \def\reserved@b{\endgroup\edef\f@parfillskip{\the\parfillskip}}%
    \fi
  \reserved@b
}
\setlength{\lineskip}{\p@}
\setlength{\normallineskip}{\p@}
\IfLTXAtLeastTF{2021/05/01}{%
  \AddToHook{selectfont}{\par@update}%
  \AfterPackage{everysel}{%
    \IfPackageAtLeastTF{everysel}{2021/01/18}{}{%
      \ClassError{\KOMAClassName}{%
        incompatible `everysel' detected
      }{%
        You are using an old version of `everysel' in combination with a
        LaTeX\MessageBreak
        version >= 2021/06/01 and KOMA-Script >= 3.33. This combination
        is\MessageBreak
        not supported.\MessageBreak
        You could switch back to an older LaTeX using package
        `latexrelease'.\MessageBreak
        But I recommend to update `everysel'%
      }%
    }%
  }%
  \AfterPackage{tracefnt}{%
    \IfPackageAtLeastTF{tracefnt}{2020/12/22}{}{%
      \ClassError{\KOMAClassName}{%
        incompatible `tracefnt' detected
      }{%
        `tracefnt' is a LaTeX base package and therefore should be updated
        together\MessageBreak
        with LaTeX kernel. So this should never happen! Please check
        your\MessageBreak
        LaTeX installation%
      }%
    }%
  }%
}{%
  \newcommand*{\scr@selectfont}{}
  \expandafter\let\expandafter\scr@selectfont\csname selectfont \endcsname
  \BeforePackage{everysel}{%
    \AtBeginDocument{%
      \expandafter\ifx\csname selectfont \endcsname\scr@new@selectfont\else
        \ClassWarningNoLine{\KOMAClassName}{%
          discard change of \string\selectfont}%
      \fi
      \expandafter\let\csname selectfont \endcsname\scr@selectfont
    }%
  }%
  \AfterPackage{everysel}{%
    \scr@ifundefinedorrelax{@EverySelectfont@Init}{%
      \expandafter\ifx\csname selectfont \endcsname\scr@new@selectfont
        \ClassWarningNoLine{\KOMAClassName}{%
          \string\selectfont\space already changed}%
      \else
        \expandafter\g@addto@macro\csname selectfont \endcsname{\par@update}%
        \expandafter\let\expandafter\scr@new@selectfont
          \csname selectfont \endcsname
      \fi
    }{%
      \g@addto@macro\@EverySelectfont@Init{%
        \expandafter\g@addto@macro\csname selectfont \endcsname{\par@update}%
        \expandafter\let\expandafter\scr@new@selectfont
          \csname selectfont \endcsname
      }%
    }%
  }%
  \AfterPackage{tracefnt}{%
    \expandafter\let\expandafter\scr@selectfont\csname selectfont \endcsname
    \expandafter\g@addto@macro\csname selectfont \endcsname{\par@update}%
    \expandafter\let\expandafter\scr@new@selectfont\csname selectfont \endcsname
  }%
  \expandafter\g@addto@macro\csname selectfont \endcsname{\par@update}
  \newcommand*{\scr@new@selectfont}{}
  \expandafter\let\expandafter\scr@new@selectfont\csname selectfont \endcsname
}
\newcommand*{\scr@defaultunits}[2]{%
  \begingroup
    \edef\@tempa{#2}%
    \expandafter\scr@@defaultunits\expandafter#1\@tempa plusplus\@nnil
    \edef\@tempa{\noexpand\endgroup\noexpand#1\the\glueexpr #1\relax}%
  \@tempa
}
\newcommand*{\scr@@defaultunits}{}
\def\scr@@defaultunits#1#2plus#3plus#4\@nnil{%
  \ifx\relax#3\relax
    \scr@@@defaultunits#1{}#2minusminus\@nnil
  \else
    \scr@@@defaultunits#1{#2}#3minusminus\@nnil
  \fi
}
\newcommand*{\scr@@@defaultunits}{}
\def\scr@@@defaultunits#1#2#3minus#4minus#5\@nnil{%
  \ifx\relax#2\relax
    \@defaultunits\@tempskipa#3pt\relax\@nnil
    #1\@tempskipa
  \else
    \@defaultunits\@tempskipa\z@\@plus#3pt\relax\@nnil
    #1\@tempskipa
    \@defaultunits\@tempskipa#2pt\relax\@nnil
    \advance#1\@tempskipa
  \fi
  \ifx\relax#4\relax\else
    \@defaultunits\@tempskipa\z@\@minus #4pt\relax\@nnil
    \advance#1\@tempskipa
  \fi
}
\newcommand*{\@list@extra}{%
  \ifdim\parskip>\z@\topsep\z@\parsep\parskip\itemsep\z@\fi
}
\newcommand*{\add@extra@listi}[1]{%
  \expandafter\let\csname #1@listi\endcsname=\@listi
  \def\@listi{\csname #1@listi\endcsname\@list@extra}%
}
\AfterPackage{amsthm}{%
  \RequirePackage{xpatch}%
  \xpatchcmd{\deferred@thm@head}{\addvspace{-\parskip}}{}{%
    \ClassInfoNoLine{\KOMAClassName}{%
      amsthm's \string\deferred@thm@head\space patched}%
  }{%
    \ClassWarningNoLine{\KOMAClassName}{%
      cannot patch amsthm's \string\deferred@thm@head.\MessageBreak
      This could result in wrong spacing before theorem\MessageBreak
      environments defined by package `amsthm'%
    }%
  }%
}
  \l@addto@macro{\@listi}{\@list@extra}%
  \let\@listI=\@listi
  \l@addto@macro{\@listii}{\@list@extra}%
  \l@addto@macro{\@listiii}{\@list@extra}%
  \l@addto@macro{\footnotesize}{\protect\add@extra@listi{ftns}}%
  \l@addto@macro{\small}{\protect\add@extra@listi{sml}}%
\setlength{\columnsep}{10\p@}
\setlength{\columnseprule}{\z@}
\@lowpenalty  = 51
\@medpenalty  =151
\@highpenalty =301
%%% From File: $Id: scrkernel-title.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*{\@extratitle}{}%
\newcommand{\extratitle}[1]{\gdef\@extratitle{%
    #1%
}}%
\newcommand*{\@frontispiece}{}%
\newcommand{\frontispiece}[1]{\gdef\@frontispiece{%
    #1%
}}%
\newcommand*{\@titlehead}{}%
\newcommand{\titlehead}[1]{\gdef\@titlehead{%
    #1%
}}%
\newcommand*{\@subject}{}%
\newcommand*{\subject}[1]{\gdef\@subject{%
    #1%
}}%
\newcommand*{\subtitle}[1]{\gdef\@subtitle{%
    #1%
}}%
\newcommand*{\@subtitle}{}%
\newcommand*{\@publishers}{}%
\newcommand{\publishers}[1]{\gdef\@publishers{%
    #1%
}}%
\newcommand*{\@uppertitleback}{}%
\newcommand{\uppertitleback}[1]{\gdef\@uppertitleback{%
    #1%
}}%
\newcommand*{\@lowertitleback}{}%
\newcommand{\lowertitleback}[1]{\gdef\@lowertitleback{%
    #1%
}}%
\newcommand*{\@dedication}{}%
\newcommand{\dedication}[1]{\gdef\@dedication{%
    #1%
}}%
\newcommand*{\next@tpage}{%
  \@thanks\global\let\@thanks\@empty
  \clearpage
  \csname titlepage@restore\endcsname
      \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
  \thispagestyle{empty}%
  \let\footnote\thanks
  \setcounter{footnote}{0}%
}
\newcommand*{\next@tdpage}{%
  \next@tpage\if@twoside \ifodd\value{page}\else\null\next@tpage\fi\fi
}
\newcommand*\maketitle[1][1]{%
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
  \else
    \def\and{%
      \end{tabular}%
      \hskip 1em \@plus.17fil%
      \begin{tabular}[t]{c}%
    }%
  \fi
  \if@titlepage
    \begin{titlepage}
      \setcounter{page}{%
        #1%
      }%
      \if@titlepageiscoverpage
        \edef\titlepage@restore{%
          \noexpand\endgroup
          \noexpand\global\noexpand\@colht\the\@colht
          \noexpand\global\noexpand\@colroom\the\@colroom
          \noexpand\global\vsize\the\vsize
          \noexpand\global\noexpand\@titlepageiscoverpagefalse
          \noexpand\let\noexpand\titlepage@restore\noexpand\relax
        }%
        \begingroup
        \topmargin=\dimexpr \coverpagetopmargin-1in\relax
        \oddsidemargin=\dimexpr \coverpageleftmargin-1in\relax
        \evensidemargin=\dimexpr \coverpageleftmargin-1in\relax
        \textwidth=\dimexpr
        \paperwidth-\coverpageleftmargin-\coverpagerightmargin\relax
        \textheight=\dimexpr
        \paperheight-\coverpagetopmargin-\coverpagebottommargin\relax
        \headheight=0pt
        \headsep=0pt
        \footskip=\baselineskip
        \@colht=\textheight
        \@colroom=\textheight
        \vsize=\textheight
        \columnwidth=\textwidth
        \hsize=\columnwidth
        \linewidth=\hsize
      \else
        \let\titlepage@restore\relax
      \fi
      \let\footnotesize\small
      \let\footnoterule\relax
      \let\footnote\thanks
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
      \ifx\@extratitle\@empty
        \ifx\@frontispiece\@empty
        \else
          \if@twoside\mbox{}\next@tpage\fi
          \noindent\@frontispiece\next@tdpage
        \fi
      \else
        \noindent\@extratitle
        \ifx\@frontispiece\@empty
        \else
          \next@tpage
          \noindent\@frontispiece
        \fi
        \next@tdpage
      \fi
      \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
      \ifx\@titlehead\@empty \else
        \begin{minipage}[t]{\textwidth}%
          \usekomafont{titlehead}{\@titlehead\par}%
        \end{minipage}\par
      \fi
      \null\vfill
      \begin{center}
        \ifx\@subject\@empty \else
          {\usekomafont{subject}{\@subject\par}}%
          \vskip 3em
        \fi
        {\usekomafont{title}{\huge \@title\par}}%
        \vskip 1em
        {\ifx\@subtitle\@empty\else\usekomafont{subtitle}{\@subtitle\par}\fi}%
        \vskip 2em
        {%
          \usekomafont{author}{%
            \lineskip 0.75em
            \begin{tabular}[t]{c}
              \@author
            \end{tabular}\par
          }%
        }%
        \vskip 1.5em
        {\usekomafont{date}{\@date \par}}%
        \vskip \z@ \@plus3fill
        {\usekomafont{publishers}{\@publishers \par}}%
        \vskip 3em
      \end{center}\par
      \@thanks\global\let\@thanks\@empty
      \vfill\null
      \if@twoside
        \@tempswatrue
        \expandafter\ifnum \@nameuse{scr@v@3.12}>\scr@compatibility\relax
        \else
          \ifx\@uppertitleback\@empty\ifx\@lowertitleback\@empty
            \@tempswafalse
          \fi\fi
        \fi
        \if@tempswa
          \next@tpage
          \begin{minipage}[t]{\textwidth}
            \@uppertitleback
          \end{minipage}\par
          \vfill
          \begin{minipage}[b]{\textwidth}
            \@lowertitleback
          \end{minipage}\par
          \@thanks\global\let\@thanks\@empty
        \fi
      \else
        \ifx\@uppertitleback\@empty\else
          \ClassWarning{\KOMAClassName}{%
            non empty \string\uppertitleback\space ignored
            by \string\maketitle\MessageBreak
            in `twoside=false' mode%
          }%
        \fi
        \ifx\@lowertitleback\@empty\else
          \ClassWarning{\KOMAClassName}{%
            non empty \string\lowertitleback\space ignored
            by \string\maketitle\MessageBreak
            in `twoside=false' mode%
          }%
        \fi
      \fi
      \ifx\@dedication\@empty
      \else
        \next@tdpage\null\vfill
        {\centering\usekomafont{dedication}{\@dedication \par}}%
        \vskip \z@ \@plus3fill
        \@thanks\global\let\@thanks\@empty
        \cleardoubleemptypage
      \fi
      \ifx\titlepage@restore\relax\else\clearpage\titlepage@restore\fi
    \end{titlepage}
  \else
    \par
    \@tempcnta=%
    #1%
    \relax\ifnum\@tempcnta=1\else
      \ClassWarning{\KOMAClassName}{%
        Optional argument of \string\maketitle\space ignored\MessageBreak
        in `titlepage=false' mode%
      }%
    \fi
    \ifx\@uppertitleback\@empty\else
      \ClassWarning{\KOMAClassName}{%
        non empty \string\uppertitleback\space ignored
        by \string\maketitle\MessageBreak
        in `titlepage=false' mode%
      }%
    \fi
    \ifx\@lowertitleback\@empty\else
      \ClassWarning{\KOMAClassName}{%
        non empty \string\lowertitleback\space ignored
        by \string\maketitle\MessageBreak
        in `titlepage=false' mode%
      }%
    \fi
    \begingroup
      \let\titlepage@restore\relax
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
      \next@tdpage
      \if@twocolumn
        \ifnum \col@number=\@ne
          \ifx\@extratitle\@empty
            \ifx\@frontispiece\@empty\else\if@twoside\mbox{}\fi\fi
          \else
            \@makeextratitle
          \fi
          \ifx\@frontispiece\@empty
            \ifx\@extratitle\@empty\else\next@tdpage\fi
          \else
            \next@tpage
            \@makefrontispiece
            \next@tdpage
          \fi
          \@maketitle
        \else
          \ifx\@extratitle\@empty
            \ifx\@frontispiece\@empty\else\if@twoside\mbox{}\fi\fi
          \else
            \twocolumn[\@makeextratitle]%
          \fi
          \ifx\@frontispiece\@empty
            \ifx\@extratitle\@empty\else\next@tdpage\fi
          \else
            \next@tpage
            \twocolumn[\@makefrontispiece]%
            \next@tdpage
          \fi
          \twocolumn[\@maketitle]%
        \fi
      \else
        \ifx\@extratitle\@empty
          \ifx\@frontispiece\@empty\else \mbox{}\fi
        \else
          \@makeextratitle
        \fi
        \ifx\@frontispiece\@empty
          \ifx\@extratitle\@empty\else\next@tdpage\fi
        \else
          \next@tpage
          \@makefrontispiece
          \next@tdpage
        \fi
        \@maketitle
      \fi
      \ifx\titlepagestyle\@empty\else\thispagestyle{\titlepagestyle}\fi
      \@thanks\global\let\@thanks\@empty
    \endgroup
  \fi
  \setcounter{footnote}{0}%
  \expandafter\ifnum \csname scr@v@3.12\endcsname>\scr@compatibility\relax
    \let\thanks\relax
    \let\maketitle\relax
    \let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@subtitle\@empty
    \global\let\@extratitle\@empty
    \global\let\@frontispiece\@empty
    \global\let\@titlehead\@empty
    \global\let\@subject\@empty
    \global\let\@publishers\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
  \fi
  \global\let\and\relax
}%
\newcommand*{\@makeextratitle}{%
  \ifx\@extratitle\@empty \else
    \noindent\@extratitle\par
  \fi
}
\newcommand*{\@makefrontispiece}{%
  \ifx\@frontispiece\@empty \else
    \noindent\@frontispiece\par
  \fi
}
\newcommand*{\@maketitle}{%
  \global\@topnum=\z@
  \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
  \ifx\@titlehead\@empty \else
    \begin{minipage}[t]{\textwidth}
      \usekomafont{titlehead}{\@titlehead\par}%
    \end{minipage}\par
  \fi
  \null
  \vskip 2em%
  \begin{center}%
    \ifx\@subject\@empty \else
      {\usekomafont{subject}{\@subject \par}}%
      \vskip 1.5em
    \fi
    {\usekomafont{title}{\huge \@title \par}}%
    \vskip .5em
    {\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\fi}%
    \vskip 1em
    {%
      \usekomafont{author}{%
        \lineskip .5em%
        \begin{tabular}[t]{c}
          \@author
        \end{tabular}\par
      }%
    }%
    \vskip 1em%
    {\usekomafont{date}{\@date \par}}%
    \vskip \z@ \@plus 1em
    {\usekomafont{publishers}{\@publishers \par}}%
    \ifx\@dedication\@empty \else
      \vskip 2em
      {\usekomafont{dedication}{\@dedication \par}}%
    \fi
  \end{center}%
  \par
  \vskip 2em
}%
\newcommand*{\coverpagetopmargin}{%
  \dimexpr \topmargin+1in\relax
}
\newcommand*{\coverpagebottommargin}{%
  2\dimexpr\coverpagetopmargin\relax
}
\newcommand*{\coverpageleftmargin}{%
  \dimexpr \evensidemargin+1in\relax
}
\newcommand*{\coverpagerightmargin}{\coverpageleftmargin}
\newenvironment{titlepage}{%
  \cleardoublepage
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse\newpage
  \fi
  \thispagestyle{empty}%
  \if@compatibility
    \setcounter{page}{0}%
  \fi
}{%
  \if@restonecol\twocolumn \else \newpage \fi
}%
\newkomafont{subtitle}{\usekomafont{title}\large}%
\newkomafont{titlehead}{}%
\newkomafont{author}{\Large}
\newkomafont{date}{\Large}
\newkomafont{publishers}{\Large}
\newkomafont{dedication}{\Large}
\newcommand*\titlefont{\sectfont}%
\newcommand*{\scr@fnt@title}{\titlefont}%
\newcommand*{\subject@font}{\normalfont\normalcolor\bfseries\Large}%
\newcommand*{\scr@fnt@subject}{\subject@font}%
\newenvironment{abstract}{%
  \if@titlepage
    \titlepage
    \null\vfil
    \@beginparpenalty\@lowpenalty
    \if@abstrt
      \begin{center}
        \normalfont\sectfont\nobreak\abstractname
        \@endparpenalty\@M
      \end{center}
    \fi
  \else
    \if@twocolumn\if@abstrt
        \addsec*{\abstractname}
      \fi
    \else
      \if@abstrt
        \small
        \begin{center}
          {\normalfont\sectfont\nobreak\abstractname
            \vspace{-.5em}\vspace{\z@}}%
        \end{center}
      \fi
      \quotation
    \fi
  \fi
}{%
  \if@titlepage
    \par\vfil\null\endtitlepage
  \else
    \if@twocolumn\else\endquotation\fi
  \fi
}
\newcommand*\abstractname{Abstract}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\abstractname{Abstract}
%%% From File: $Id: scrkernel-tocstyle.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\let\numberline\scr@numberline
%%% From File: $Id: scrkernel-tocstyle.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: class,style,part)
\CloneTOCEntryStyle{tocline}{part}
\TOCEntryStyleStartInitCode{part}{%
  \expandafter\providecommand%
  \csname scr@tso@#1@linefill\endcsname{\hfill}%
  \expandafter\providecommand%
  \csname scr@tso@#1@entryformat\endcsname[1]{\usekomafont{partentry}{##1}}%
  \expandafter\providecommand%
  \csname scr@tso@#1@pagenumberformat\endcsname[1]{%
    \usekomafont{partentry}{\usekomafont{partentrypagenumber}{##1}}}%
  \expandafter\providecommand\expandafter*%
  \csname scr@tso@#1@beforeskip\endcsname{2.25em \@plus\p@}%
}
%%% From File: $Id: scrkernel-tocstyle.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: class,style,chapter)
\CloneTOCEntryStyle{tocline}{chapter}
\TOCEntryStyleStartInitCode{chapter}{%
  \expandafter\providecommand%
  \csname scr@tso@#1@linefill\endcsname{%
    \if@chapterentrywithdots
      {\usekomafont{chapterentrydots}{\TOCLineLeaderFill}}\relax
    \else
      \hfill
    \fi
  }%
  \expandafter\providecommand%
  \csname scr@tso@#1@entryformat\endcsname{\usekomafont{chapterentry}}%
  \expandafter\providecommand%
  \csname scr@tso@#1@pagenumberformat\endcsname[1]{%
    \usekomafont{chapterentry}{\usekomafont{chapterentrypagenumber}{##1}}}%
  \expandafter\providecommand\expandafter*%
  \csname scr@tso@#1@beforeskip\endcsname{1.0em \@plus\p@}%
}
%%% From File: $Id: scrkernel-tocstyle.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: class,style,section)
\CloneTOCEntryStyle{tocline}{section}
\TOCEntryStyleStartInitCode{section}{%
  \expandafter\providecommand%
  \csname scr@tso@#1@linefill\endcsname{\TOCLineLeaderFill\relax}%
}
%%% From File: $Id: scrkernel-tocstyle.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: class,style,default)
\CloneTOCEntryStyle{section}{default}
%%% From File: $Id: scrkernel-sections.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\BeforeClosingMainAux{%
  \if@autodot\if@filesw\immediate\write\@mainaux{%
      \string\global\string\csname\space @altsecnumformattrue\string\endcsname}%
  \fi\fi}
\newcommand{\@maybeautodot}[1]{\if@autodot\else\begingroup%
  \expandafter\@@maybeautodot #1\@stop\endgroup\fi
}
\newcommand*{\@@maybeautodot}[1]{%
  \ifx #1\@stop\let\@@maybeautodot\relax
  \else
    \ifx #1\Alph \@autodottrue\fi
    \ifx #1\alph \@autodottrue\fi
    \ifx #1\Roman \@autodottrue\fi
    \ifx #1\roman \@autodottrue\fi
    \ifx #1\@Alph \@autodottrue\fi
    \ifx #1\@alph \@autodottrue\fi
    \ifx #1\@Roman \@autodottrue\fi
    \ifx #1\@roman \@autodottrue\fi
    \ifx #1\romannumeral \@autodottrue\fi
  \fi
  \@@maybeautodot
}
\newcommand*\autodot{\if@altsecnumformat.\fi}
\setcounter{secnumdepth}{2}
\providecommand*{\ifnumbered}{%
  \ClassWarning{\KOMAClassName}{Usage of deprecated command
    `\string\ifnumbered'.\MessageBreak
    The command has been renamed because of a\MessageBreak
    recommendation of The LaTeX Project Team.\MessageBreak
    Please replace `\string\ifnumbered' by `\string\Ifnumbered'%
  }%
  \Ifnumbered
}
\newcommand*{\Ifnumbered}[1]{%
  \if@currentusenumber
    \scr@ifundefinedorrelax{#1numdepth}{%
      \expandafter\@secondoftwo
    }{%
      \expandafter\ifnum \@nameuse{#1numdepth}>\c@secnumdepth
        \expandafter\expandafter\expandafter\@secondoftwo
      \else
        \expandafter\expandafter\expandafter\@firstoftwo
      \fi
    }%
  \else
    \expandafter\@secondoftwo
  \fi
}
\providecommand*{\ifunnumbered}{%
  \ClassWarning{\KOMAClassName}{Usage of deprecated command
    `\string\ifunnumbered'.\MessageBreak
    The command has been renamed because of a\MessageBreak
    recommendation of The LaTeX Project Team.\MessageBreak
    Please replace `\string\ifunnumbered' by `\string\Ifunnumbered'%
  }%
  \Ifunnumbered
}
\newcommand*{\Ifunnumbered}[1]{%
  \Ifnumbered{#1}{\@secondoftwo}{\@firstoftwo}%
}
\newcommand*{\scr@saved@startsection}[6]{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \kernel@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}
\def\reserved@a#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}
\ifcase \ifx\@startsection\scr@saved@startsection 0
        \else
          \ifx\@startsection\reserved@a 0
          \else 1
          \fi
        \fi
  \newcommand*{\scr@startsection}[6]{%
    \ExecuteDoHook{heading/preinit/#1}%
    \if@noskipsec \leavevmode \fi
    \par
    \@tempskipa \glueexpr #4\relax
    \@ifundefined{scr@#1@afterindent}{%
      \def\startsection@afterindent##1##2##3{##3}%
    }{%
      \expandafter\let\expandafter\startsection@afterindent
      \csname scr@#1@afterindent\endcsname
    }%
    \startsection@afterindent{\@afterindenttrue}{\@afterindentfalse}{%
      \@afterindenttrue
      \ifdim \@tempskipa <\z@
        \@tempskipa -\@tempskipa \@afterindentfalse
      \fi
    }%
    \def\startsection@sectionname{#1}%
    \def\startsection@secnumdepth{\numexpr #2\relax}%
    \def\startsection@indent{\glueexpr #3\relax}%
    \let\startsection@beforeskip\@tempskipa
    \@ifundefined{scr@#1@runin}{%
      \def\scr@sect@runin##1##2##3{##3}%
    }{%
      \expandafter\let\expandafter\scr@sect@runin
      \csname scr@#1@runin\endcsname
    }%
    \scr@sect@runin{%
      \def\startsection@afterskip{\glueexpr #3\relax}%
      \expandafter\let\csname if@startsection@runin\expandafter\endcsname
      \csname iftrue\endcsname
    }{%
      \def\startsection@afterskip{\glueexpr #3\relax}%
      \expandafter\let\csname if@startsection@runin\expandafter\endcsname
      \csname iffalse\endcsname
    }{%
      \ifdim \glueexpr #5\relax <\z@
        \def\startsection@afterskip{\glueexpr (#3)*\m@ne\relax}%
        \expandafter\let\csname if@startsection@runin\expandafter\endcsname
        \csname iftrue\endcsname
      \else
        \def\startsection@afterskip{\glueexpr #3\relax}%
        \expandafter\let\csname if@startsection@runin\expandafter\endcsname
        \csname iffalse\endcsname
      \fi
    }%
    \ExecuteDoHook{heading/postinit/#1}%
    \if@nobreak
      \everypar{}%
    \else
      \addpenalty\@secpenalty\addvspace\@tempskipa
    \fi
    \kernel@ifstar {%
      \ExecuteDoHook{heading/branch/star/#1}%
      \def\scr@s@ct@@nn@m@{#1}%
      \@ssect{\glueexpr #3\relax}{\glueexpr #4\relax}{\glueexpr #5\relax}{#6}%
    }{%
      \ExecuteDoHook{heading/branch/nostar/#1}%
      \scr@section@dblarg{%
        \@sect{#1}{\numexpr #2\relax}{\glueexpr #3\relax}{\glueexpr #4\relax}%
        {\glueexpr #5\relax}{#6}%
      }%
    }%
  }
\else
  \ClassWarningNoLine{\KOMAClassName}{`\string\@startsection' has been
    changed.\MessageBreak
    \KOMAClassName\space needs it's own definition of
    `\string\@startsection'\MessageBreak
    to provide extended features for the optional argument\MessageBreak
    of `\string\section' etc.\MessageBreak
    Generally it defines `\string\@startsection' completely new\MessageBreak
    to achieve this. Because of the unexpected definition\MessageBreak
    an alternative approach will be used.\MessageBreak
    If this fails and if there isn't a new release of\MessageBreak
    KOMA-Script that fixes the problem, please\MessageBreak
    send a report to the KOMA-Script author.\MessageBreak
    Note, that this alternative approach does not\MessageBreak
    execute the elements of do-hooks:\MessageBreak
    \space\space- `heading/postinit',\MessageBreak
    \space\space- `heading/branch/star',\MessageBreak
    \space\space- `heading/branch/nostar',\MessageBreak
    and does always use `runin=bysign' and\MessageBreak
    `afterindent=bysign'%
  }%
  \let\scr@saved@startsection\@startsection
  \newcommand*{\scr@startsection}[6]{%
    \ExecuteDoHook{heading/preinit/#1}%
    \kernel@ifstar {%
      \scr@saved@startsection{#1}{\numexpr #2\relax}{\glueexpr #3\relax}%
      {\glueexpr #4\relax}{\glueexpr #5\relax}{#6}*%
    }{%
      \scr@section@dblarg{%
        \scr@saved@startsection{#1}{\numexpr #2\relax}{\glueexpr #3\relax}%
        {\glueexpr #4\relax}{\glueexpr #5\relax}{#6}}%
    }%
  }
\fi
\newcommand*{\scr@sect@runin}[3]{#3}
\newcommand*{\scr@startsection@ulm@error}[1]{%
  \ClassError{\KOMAClassName}{%
    \string#1 undefined outside of \string\scr@startsection
  }{%
    A KOMA-Script macro for package authors have been used outside
    the\MessageBreak
    specified definition scope.\MessageBreak
    See `scrkernel-sections.dtx' for more information.%
  }%
}
\newcommand*\startsection@sectionname{%
  \scr@startsection@ulm@error\startsection@sectionname}
\newcommand*\startsection@secnumdepth{%
  \scr@startsection@ulm@error\startsection@secnumdepth}
\newcommand*\startsection@indent{%
  \scr@startsection@ulm@error\startsection@indent}
\newcommand*\startsection@beforeskip{%
  \scr@startsection@ulm@error\startsection@beforeskip}
\newcommand*\startsection@afterskip{%
  \scr@startsection@ulm@error\startsection@afterskip}
\newcommand*{\if@startsection@runin}{%
  \scr@startsection@ulm@error\if@startsection@runin}
\newif\if@startsection@runin
\newcommand*\startsection@afterindent{%
  \scr@startsection@ulm@error\startsection@afterindent}
\newcommand*{\At@startsection}[1]{%
  \ClassInfo{\KOMAClassName}{%
    Usage of deprecated command `\string\At@startsection'
    mapped to\MessageBreak
    `\string\AddtoDoHook{heading/postinit}
                        {...\string\@gobble}'%
  }%
  \AddtoDoHook{heading/postinit}{\scr@doonlyifstyleofargis{#1}{section}}%
}
\newcommand*{\scr@doonlyifstyleofargis}[3]{%
  \IfSectionCommandStyleIs{#3}{#2}{#1}{}%
}
\newcommand*{\Before@ssect}[1]{%
  \ClassWarning{\KOMAClassName}{%
    Usage of deprecated command `\string\Before@ssect'
    mapped to\MessageBreak
    `\string\AddtoDoHook{heading/branch/star}%
                        {...\string\@gobble}'%
  }%
  \AddtoDoHook{heading/branch/star}{\scr@doonlyifstyleofargis{#1}{section}}%
}
\newcommand*{\Before@sect}[1]{%
  \ClassWarning{\KOMAClassName}{%
    Usage of deprecated command `\string\Before@sect'
    mapped to\MessageBreak
    `\string\AddtoDoHook{heading/branch/nostar}%
                        {...\string\@gobble}'%
  }%
  \AddtoDoHook{heading/branch/nostar}{\scr@doonlyifstyleofargis{#1}{section}}%
}
\newcommand{\scr@section@dblarg}[1]{%
  \kernel@ifnextchar[%]
    {#1}%
    {\scr@section@xdblarg{#1}}%
}
\newcommand{\scr@section@xdblarg}[2]{%
  \begingroup
    \edef\reserved@a{%
      \unexpanded{\endgroup\let\scr@osectarg\z@#1[{#2}]{#2}\def\scr@osectarg}%
      {\scr@osectarg}}%
  \reserved@a
}
\renewcommand*{\@startsection}{%
  \ifnum \scr@osectarg=\z@
    \expandafter\scr@saved@startsection
  \else
    \expandafter\scr@startsection
  \fi
}
\newcommand*{\UseNumberUsageError}[2]{%
  \ClassError{\KOMAClassName}{%
    \string\IfUseNumber\space not allowed%
  }{%
    You cannot use \string\IfUseNumber\space outside a heading.\MessageBreak
    If you'd continue, I'll ignore both arguments, because I do not
    know\MessageBreak
    whether to use the first or the second argument.%
  }%
}
\newcommand*{\IfUseNumber}[2]{}%
\let\IfUseNumber\UseNumberUsageError
\newcommand*{\SecDef}[2]{\kernel@ifstar{#2}{\scr@section@dblarg{#1}}}
\CheckCommand*{\secdef}[2]{\@ifstar{#2}{\@dblarg{#1}}}
\let\secdef\SecDef
\def\scr@latex@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\ifx\@sect\scr@latex@sect\else
  \let\scr@latex@sect\@sect
  \ClassWarning{\KOMAClassName}{%
    Unexpected definition of \string\@sect!\MessageBreak
    Please send information about this to\MessageBreak
    the KOMA-Script maintainer!\MessageBreak
    Maybe LaTeX will be broken by the redefinition\MessageBreak
    of \string\@sect}%
\fi
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum \scr@osectarg=\z@
    \@scr@tempswafalse
  \else
    \scr@istest#7=\@nil
  \fi
  \@currentusenumbertrue
  \if@scr@tempswa
    \setkeys{KOMAarg.section}{tocentry={#8},head={#8},reference={#8},#7}%
  \else
    \ifcase \scr@osectarg\relax
      \setkeys{KOMAarg.section}{tocentry={#7},head={#7},reference={#7}}%
    \or
      \setkeys{KOMAarg.section}{tocentry={#8},head={#7},reference={#8}}%
    \or
      \setkeys{KOMAarg.section}{tocentry={#7},head={#8},reference={#7}}%
    \or
      \setkeys{KOMAarg.section}{tocentry={#7},head={#7},reference={#7}}%
    \fi
  \fi
  \scr@ifundefinedorrelax{scr@mt@saved@sect}{}{%
    \expandafter\ifx\csname #1\endcsname\section
      \addcontentsline{\ext@figure}{xsect}{\@currenttocentry}%
      \addcontentsline{\ext@table}{xsect}{\@currenttocentry}%
    \fi
    \expandafter\ifx\csname #1\endcsname\starsection\relax
      \addcontentsline{\ext@figure}{xsect}{\@currenttocentry}%
      \addcontentsline{\ext@table}{xsect}{\@currenttocentry}%
    \fi
  }%
  \let\IfUsePrefixLine\@secondoftwo
  \ifcase
    \if@currentusenumber
      \ifnum \numexpr #2\relax>\c@secnumdepth \z@\else \@ne\fi
    \else
      \z@
    \fi
    \let\@svsec\@empty
    \expandafter\ifnum\scr@v@is@lt{3.31}\relax\else
      \begingroup
        \let\@elt\@stpelt
        \csname cl@#1\endcsname
      \endgroup
    \fi
    \hy@insteadofrefstepcounter{#1}%
  \else
    \refstepcounter{#1}%
    \expandafter\@maybeautodot\csname the#1\endcsname
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \ifdim
    \scr@sect@runin{\z@}{\p@}{\glueexpr #5\relax}>\z@
    \begingroup
      \ifx\@svsec\@empty
        \let\IfUseNumber\@secondoftwo
      \else
        \let\IfUseNumber\@firstoftwo
      \fi
      \ExecuteDoHook{heading/begingroup/#1}%
      #6{\nobreak\interlinepenalty \@M
        \sectionlinesformat{#1}{\glueexpr #3\relax}\@svsec{#8}\@@par}%
      \ExecuteDoHook{heading/endgroup/#1}%
    \endgroup
    \expandafter\csname #1mark\expandafter\endcsname\expandafter{\@currentheadentry}%
    \ifx\@currenttocentry\@empty\else
      \scr@ifundefinedorrelax{add#1tocentry}{%
        \expandafter\gdef\csname add#1tocentry\endcsname##1##2{%
          \addtocentrydefault{#1}{##1}{##2}%
        }%
      }{}%
      \ifcase
        \if@currentusenumber
          \ifnum \numexpr #2\relax>\c@secnumdepth \z@\else \@ne\fi
        \else
          \z@
        \fi
        \csname add#1tocentry\endcsname{}{\@currenttocentry}%
      \else
        \@ifundefined{#1tocformat}{%
          \expandafter\gdef\csname #1tocformat\endcsname
          {\csname the#1\endcsname}%
        }{}%
        \csname add#1tocentry\endcsname{\csname #1tocformat\endcsname}{%
          \@currenttocentry}%
      \fi
    \fi
  \else
    \def\@svsechd{%
      \ifx\@svsec\@empty
        \let\IfUseNumber\@secondoftwo
      \else
        \let\IfUseNumber\@firstoftwo
      \fi
      \ExecuteDoHook{heading/begingroup/#1}%
      #6{\nobreak\sectioncatchphraseformat{#1}{\glueexpr #3\relax}\@svsec{#8}}%
      \expandafter\csname #1mark\expandafter\endcsname
      \expandafter{\@currentheadentry}%
      \ifx\@currenttocentry\@empty\else
        \scr@ifundefinedorrelax{add#1tocentry}{%
          \expandafter\gdef\csname add#1tocentry\endcsname####1####2{%
            \addtocentrydefault{#1}{####1}{####2}%
          }%
        }{}%
        \ifcase
          \if@currentusenumber
            \ifnum \numexpr #2\relax>\c@secnumdepth \z@\else \@ne\fi
          \else
            \z@
          \fi
          \csname add#1tocentry\endcsname{}{\@currenttocentry}%
        \else
        \@ifundefined{#1tocformat}{%
          \expandafter\gdef\csname #1tocformat\endcsname
          {\csname the#1\endcsname}%
        }{}%
        \csname add#1tocentry\endcsname{\csname #1tocformat\endcsname}{%
          \@currenttocentry}%
        \fi
      \fi
      \ExecuteDoHook{heading/endgroup/#1}%
    }%
  \fi
  \let\IfUsePrefixLine\scr@IfUsePrefixLineWarning
  \@xsect{\glueexpr #5\relax}%
}
\DefineFamily{KOMAarg}
\DefineFamilyMember[.section]{KOMAarg}
\providecommand*\@currenttocentry{}
\providecommand*\@currentheadentry{}
\providecommand*\@currentlabelname{}
\FamilyStringKey[.section]{KOMAarg}{tocentry}{\@currenttocentry}
\FamilyStringKey[.section]{KOMAarg}{head}{\@currentheadentry}
\DefineFamilyKey[.section]{KOMAarg}{reference}{%
  \scr@ifundefinedorrelax{NR@gettitle}{%
    \scr@ifundefinedorrelax{GetTitleString}{%
      \def\@currentlabelname{#1}%
    }{%
      \GetTitleString{#1}%
      \let\@currentlabelname\GetTitleStringResult
    }%
  }{%
    \NR@gettitle{#1}%
  }%
  \scr@ifundefinedorrelax{TR@gettitle}{}{%
    \expandafter\TR@gettitle\expandafter{\@currentlabelname}%
  }%
  \scr@ifundefinedorrelax{ztitlerefsetup}{}{%
    \ztitlerefsetup{title=\@currentlabelname}%
  }%
  \FamilyKeyStateProcessed
}
\FamilyInverseBoolKey[.section]{KOMAarg}{nonumber}{@currentusenumber}
\newcommand*{\scr@istest}{}
\def\scr@istest#1=#2\@nil{%
  \ifx\relax#2\relax\@scr@tempswafalse\else\@scr@tempswatrue\fi
}
\newif\if@scr@tempswa
\newcommand{\sectionlinesformat}[4]{%
  \@hangfrom{\hskip #2#3}{#4}%
}
\newcommand{\sectioncatchphraseformat}[4]{%
  \hskip #2#3#4%
}
\def\scr@latex@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}
\ifx\@ssect\scr@latex@ssect
\else
  \let\scr@latex@ssect\@ssect
  \ClassWarning{\KOMAClassName}{%
    Unexpected definition of \string\@ssect!\MessageBreak
    Please send information about this to\MessageBreak
    the KOMA-Script maintainer!\MessageBreak
    Maybe LaTeX will be broken by the redefinition\MessageBreak
    of \string\@ssect}%
\fi
\def\@ssect#1#2#3#4#5{%
  \scr@ifundefinedorrelax{scr@s@ct@@nn@m@}{%
    \ClassWarning{\KOMAClassName}{Incompatible usage of
      \string\@ssect\space detected.\MessageBreak
      You've used the KOMA-Script implementation of
      \string\@ssect\MessageBreak
      from within a non compatible caller, that does not\MessageBreak
      \string\scr@s@ct@@nn@m@\space locally.\MessageBreak
      This could result in several error messages}%
    \def\scr@s@ct@@nn@m@{\string\scr@s@ct@@nn@m@}%
  }{%
    \expandafter\ifnum\scr@v@is@lt{3.31}\relax\else
      \begingroup
        \let\@elt\@stpelt
        \csname cl@\scr@s@ct@@nn@m@\endcsname
      \endgroup
    \fi
  }%
  \ifdim
    \scr@sect@runin{\z@}{\p@}{\glueexpr #3\relax}>\z@
    \begingroup
      \let\IfUseNumber\@secondoftwo
      \edef\reserved@a{%
        \noexpand\ExecuteDoHook{heading/begingroup/\scr@s@ct@@nn@m@}%
      }\reserved@a
      #4{\nobreak\interlinepenalty \@M
        \expandafter\sectionlinesformat\expandafter{\scr@s@ct@@nn@m@}%
        {\glueexpr #1\relax}\@empty{#5}\@@par}%
      \edef\reserved@a{%
        \noexpand\ExecuteDoHook{heading/endgroup/\scr@s@ct@@nn@m@}%
      }\reserved@a
    \endgroup
  \else
    \edef\@svsechd{%
      \unexpanded{\let\IfUseNumber\@secondoftwo}%
      \noexpand\ExecuteDoHook{heading/begingroup/\scr@s@ct@@nn@m@}%
      \unexpanded{#4}{%
        \noexpand\nobreak
        \noexpand\sectioncatchphraseformat{\scr@s@ct@@nn@m@}%
        \unexpanded{{\glueexpr #1\relax}\@empty{#5}}%
      }%
      \noexpand\ExecuteDoHook{heading/endgroup/\scr@s@ct@@nn@m@}%
    }%
  \fi
  \let\scr@s@ct@@nn@m@\relax
  \@xsect{\glueexpr #3\relax}%
}
\def\scr@latex@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces
}
\ifx\@xsect\scr@latex@xsect\else
  \let\scr@latex@xsect\@xsect
  \ClassWarning{\KOMAClassName}{%
    Unexpected definition of \string\@xsect!\MessageBreak
    Please send information about this to\MessageBreak
    the KOMA-Script maintainer!\MessageBreak
    Maybe LaTeX will be broken by the redefinition\MessageBreak
    of \string\@xsect}%
\fi
\def\@xsect#1{%
  \@ifundefined{scr@sect@runin}{%
    \def\scr@sect@runin##1##2##3{##3}%
  }%
  \@tempskipa #1\relax
  \ifdim \scr@sect@runin{\z@}{\p@}{\@tempskipa}>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \ifdim \@tempskipa<\z@
          \hskip -\@tempskipa
        \else
          \hskip \@tempskipa
        \fi
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \def\scr@sect@runin##1##2##3{##3}%
  \ignorespaces
}
\newcommand*{\scr@IfUsePrefixLineWarning}[2]{%
  \ClassWarning{\KOMAClassName}{%
    Usage of \string\IfUsePrefixLine\space outside
    section command\MessageBreak
    style makes no sense, because the behaviour not only\MessageBreak
    depends on class options but also on the run-time\MessageBreak
    section command style.\MessageBreak
    Neither the then-code nor the else-code will be\MessageBreak
    executed.\MessageBreak
    You may change this and avoid the warning by LOCALLY\MessageBreak
    setting \string\IfUsePrefixLine\space to either
    \string\@firstoftwo\space or\MessageBreak
    \string\@secondoftwo\space before using it%
  }%
}
\newcommand*{\IfUsePrefixLine}[2]{}
\let\IfUsePrefixLine\scr@IfUsePrefixLineWarning
\newcommand*{\raggedsection}{}
\let\raggedsection\raggedright
\DefineFamily{KOMAarg}
\DefineFamilyMember[.dsc]{KOMAarg}
\newcommand*{\DeclareSectionCommandStyleOption}[3]{%
  \AddToSectionCommandOptionsDoList{#2}%
  \expandafter\g@addto@macro\csname scr@dsc@style@#1@options\endcsname{%
    \DefineFamilyKey[.dsc]{KOMAarg}{#2}{#3}%
  }%
}
\newcommand*{\AddToSectionCommandOptionsDoList}[1]{%
  \kernel@ifnextchar [%]
    {\@AddToSectionCommandOptionListWithDefault{#1}}%
    {\l@addto@macro\scr@dsc@doopts{\do{#1}}}%
}
\newcommand*{\@AddToSectionCommandOptionListWithDefault}{}
\def\@AddToSectionCommandOptionListWithDefault#1[#2]{%
  \l@addto@macro\scr@dsc@doopts{\do[{#2}]{#1}}
}%
\newcommand*{\scr@dsc@doopts}{}
\newcommand*{\RelaxSectionCommandOptions}{%
  \begingroup
    \def\do@endgroup{\endgroup}%
    \def\do{%
      \kernel@ifnextchar [%]
        {\@do}%
        {\@do[]}%
    }%
    \def\@do[##1]##2{%
      \l@addto@macro\do@endgroup{\RelaxFamilyKey[.dsc]{KOMAarg}{##2}}%
    }%
    \scr@dsc@doopts
  \do@endgroup
}
\newcommand*{\DeclareSectionCommandStyleLengthOption}[4]{%
  \DeclareSectionCommandStyleOption{#1}{#2}{%
    \protected@edef\reserved@a{%
      \noexpand\FamilySetLength{KOMAarg}{#2}{\noexpand\@tempskipa}{##1}%
    }\reserved@a
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \ifscr@dsc@expandtopt
        \expandafter\edef\csname #3\scr@dsc@current#4\endcsname{%
          \the\@tempskipa}%
      \else
        \expandafter\edef\csname #3\scr@dsc@current#4\endcsname{##1}%
      \fi
    \fi
  }%
}
\newcommand*{\DeclareSectionCommandStyleNumberOption}[4]{%
  \DeclareSectionCommandStyleOption{#1}{#2}{%
    \protected@edef\reserved@a{%
      \noexpand\FamilySetCounterMacro{KOMAarg}{#2}{\noexpand\reserved@a}{##1}
    }\reserved@a
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \expandafter\let\csname #3\scr@dsc@current#4\endcsname\reserved@a
    \fi
  }%
}
\newcommand*{\DeclareSectionCommandStyleFontOption}[4]{%
  \DeclareSectionCommandStyleOption{#1}{#2}{%
    \IfExistskomafont{#3\scr@dsc@current#4}{%
      \setkomafont
    }{%
      \newkomafont
    }{#3\scr@dsc@current#4}{##1}%
    \FamilyKeyStateProcessed
  }%
}
\newcommand*{\DeclareSectionCommandStyleFuzzyOption}[5]{%
  \DeclareSectionCommandStyleOption{#1}{#2}{%
    \FamilySetBool{KOMAarg}{#2}{@tempswa}{##1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \if@tempswa
        \expandafter\def\csname #3\scr@dsc@current#4\endcsname
        ####1####2####3{####1}%
      \else
        \expandafter\def\csname #3\scr@dsc@current#4\endcsname
        ####1####2####3{####2}%
      \fi
    \else
      \Ifstr{##1}{#5}{%
        \expandafter\def\csname #3\scr@dsc@current#4\endcsname
        ####1####2####3{####3}%
        \FamilyKeyStateProcessed
      }{}%
    \fi
  }%
}
\newcommand*{\scr@dsc@style@section@options}{}
\DeclareSectionCommandStyleLengthOption{section}
                                       {indent}{scr@}{@sectionindent}
\DeclareSectionCommandStyleFuzzyOption{section}
                                      {afterindent}{scr@}{@afterindent}
                                      {bysign}
\DeclareSectionCommandStyleLengthOption{section}
                                       {beforeskip}{scr@}{@beforeskip}
\DeclareSectionCommandStyleFuzzyOption{section}
                                      {runin}{scr@}{@runin}
                                      {bysign}
\DeclareSectionCommandStyleLengthOption{section}
                                       {afterskip}{scr@}{@afterskip}
\DeclareSectionCommandStyleFontOption{section}{font}{}{}
\newcommand*{\scr@dsc@def@style@section@command}[1]{%
  \@namedef{#1}{%
    \scr@startsection{#1}%
    {\csname #1numdepth\endcsname}%
    {\csname scr@#1@sectionindent\endcsname}%
    {\csname scr@#1@beforeskip\endcsname}%
    {\csname scr@#1@afterskip\endcsname}%
    {%
      \ifdim\glueexpr\csname scr@#1@afterskip\endcsname >\z@
        \expandafter\ifnum\scr@v@is@gt{2.96}\relax
          \setlength{\parfillskip}{\z@ plus 1fil}%
        \fi
      \fi
      \raggedsection\normalfont\sectfont\nobreak
      \usekomafont{#1}%
    }%
  }%
}
\newcommand*{\scr@dsc@style@chapter@options}{}
\DeclareSectionCommandStyleOption{chapter}{pagestyle}{%
  \@namedef{\scr@dsc@current pagestyle}{#1}%
  \FamilyKeyStateProcessed
}%
\DeclareSectionCommandStyleFuzzyOption{chapter}
                                      {afterindent}{scr@}{@afterindent}
                                      {bysign}
\DeclareSectionCommandStyleLengthOption{chapter}
                                       {beforeskip}{scr@}{@beforeskip}
\DeclareSectionCommandStyleLengthOption{chapter}
                                       {innerskip}{scr@}{@innerskip}
\DeclareSectionCommandStyleLengthOption{chapter}
                                       {afterskip}{scr@}{@afterskip}
\DeclareSectionCommandStyleFontOption{chapter}{font}{}{}
\DeclareSectionCommandStyleFontOption{chapter}{prefixfont}{}{prefix}
\newcommand*{\scr@dsc@def@style@chapter@command}[1]{%
  \@namedef{#1}{\scr@startchapter{#1}}%
  \@namedef{@#1}{\scr@@startchapter{#1}}%
  \@namedef{@s#1}{\scr@@startschapter{#1}}%
  \@namedef{@make#1head}{\scr@makechapterhead{#1}}%
  \@namedef{@makes#1head}{\scr@makeschapterhead{#1}}%
  \@namedef{@@make#1head}{\scr@@makechapterhead{#1}}%
  \@namedef{@@makes#1head}{\scr@@makeschapterhead{#1}}%
  \@namedef{set#1preamble}{\set@preamble{#1}}%
}
\newcommand*{\scr@dsc@style@chapter@subcommands}[1]{%
  @#1,@s#1,@make#1head,@makes#1head,@@make#1head,@@makes#1head,set#1preamble%
}
\newcommand*{\scr@dsc@style@part@options}{}
\DeclareSectionCommandStyleOption{part}{pagestyle}{%
  \@namedef{\scr@dsc@current pagestyle}{#1}%
  \FamilyKeyStateProcessed
}%
\DeclareSectionCommandStyleFuzzyOption{part}
                                      {afterindent}{scr@}{@afterindent}
                                      {bysign}
\DeclareSectionCommandStyleLengthOption{part}
                                       {beforeskip}{scr@}{@beforeskip}
\DeclareSectionCommandStyleLengthOption{part}
                                       {innerskip}{scr@}{@innerskip}
\DeclareSectionCommandStyleLengthOption{part}
                                       {afterskip}{scr@}{@afterskip}
\DeclareSectionCommandStyleFontOption{part}{font}{}{}
\DeclareSectionCommandStyleFontOption{part}{prefixfont}{}{prefix}
\newcommand*{\scr@dsc@def@style@part@command}[1]{%
  \@namedef{#1}{\scr@startpart{#1}}%
  \@namedef{@#1}{\scr@@startpart{#1}}%
  \@namedef{@s#1}{\scr@@startspart{#1}}%
  \@namedef{@end#1}{\scr@@endpart{#1}}%
  \@namedef{set#1preamble}{\set@preamble{#1}}%
}
\newcommand*{\scr@dsc@style@part@subcommands}[1]{%
  @#1,@s#1,@end#1,set#1preamble%
}
\newcommand*{\scr@dsc@style@section@neededoptionstest}{%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @sectionindent}{%
    \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                     {section indent}{indent}{0pt}%
    {\@namedef{scr@\scr@dsc@current @sectionindent}{0pt}}%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @beforeskip}{%
    \scr@declaresectioncommanderror{\scr@dsc@current}%
                                   {before section skip}{beforeskip}%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @afterskip}{%
    \scr@declaresectioncommanderror{\scr@dsc@current}%
                                   {after section skip}{afterskip}%
  }{}%
  \IfExistskomafont{\scr@dsc@current}{}{%
    \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                     {font}{font}{\normalsize}%
    {\newkomafont{\scr@dsc@current}{\normalsize}}%
  }%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @runin}{%
    \l@addto@macro\local@endgroup{%
      \ClassInfo{\KOMAClassName}
                {using compatibility default `runin=bysign'\MessageBreak
                  for `\expandafter\string\csname \scr@dsc@current\endcsname}%
      \expandafter\gdef\csname scr@\scr@dsc@current @runin\endcsname
      ##1##2##3{##3}%
    }%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @afterindent}{%
    \l@addto@macro\local@endgroup{%
      \ClassInfo{\KOMAClassName}
                {using compatibility default `afterindent=bysign'\MessageBreak
                  for `\expandafter\string\csname \scr@dsc@current\endcsname}%
      \expandafter\gdef\csname scr@\scr@dsc@current @afterindent\endcsname
      ##1##2##3{##3}%
    }%
  }{}%
}
\newcommand*{\scr@dsc@style@chapter@neededoptionstest}{%
  \scr@ifundefinedorrelax{\scr@dsc@current pagestyle}{%
    \Ifstr{\scr@dsc@current}{chapter}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {initial page style}{pagestyle}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {initial page style}{pagestyle}%
                                       {\chapterpagestyle}%
      {\@namedef{\scr@dsc@current pagestyle}{\chapterpagestyle}}%
    }%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @innerskip}{%
    \Ifstr{\scr@dsc@current}{chapter}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {inner chapter skip}{innerskip}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {inner chapter skip}{innerskip}%
                                       {\scr@chapter@innerskip}%
      {\@namedef{scr@\scr@dsc@current @innerskip}{\scr@chapter@innerskip}}%
    }%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @beforeskip}{%
    \Ifstr{\scr@dsc@current}{chapter}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {before chapter skip}{beforeskip}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {before chapter skip}{beforeskip}%
                                       {\scr@chapter@beforeskip}%
      {\@namedef{scr@\scr@dsc@current @beforeskip}{\scr@chapter@beforeskip}}%
    }%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @afterskip}{%
    \Ifstr{\scr@dsc@current}{chapter}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {after chaper skip}{afterskip}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {after chaper skip}{afterskip}%
                                       {\scr@chapter@afterskip}%
      {\@namedef{scr@\scr@dsc@current @afterskip}{\scr@chapter@afterskip}}%
    }%
  }{}%
  \IfExistskomafont{\scr@dsc@current}{}{%
    \Ifstr{\scr@dsc@current}{chapter}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}{font}{font}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {font}{font}%
                                       {\usekomafont{chapter}}%
      {\newkomafont{\scr@dsc@current}{\usekomafont{chapter}}}%
    }%
  }%
  \IfExistskomafont{\scr@dsc@current prefix}{}{%
    \Ifstr{\scr@dsc@current}{chapter}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {prefix line font}{prefixfont}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {prefix line font}{prefixfont}%
                                       {\usekomafont{chapterprefix}}%
      {\newkomafont{\scr@dsc@current prefix}{\usekomafont{chapterprefix}}}%
    }%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @afterindent}{%
    \l@addto@macro\local@endgroup{%
      \ClassInfo{\KOMAClassName}
                {using compatibility default `afterindent=bysign'\MessageBreak
                  for `\expandafter\string\csname \scr@dsc@current\endcsname}%
      \expandafter\gdef\csname scr@\scr@dsc@current @afterindent\endcsname
      ##1##2##3{##3}%
    }%
  }{}%
}
\newcommand*{\scr@dsc@style@part@neededoptionstest}{%
  \scr@ifundefinedorrelax{\scr@dsc@current pagestyle}{%
    \Ifstr{\scr@dsc@current}{part}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {initial page style}{pagestyle}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {initial page style}{pagestyle}%
                                       {\partpagestyle}%
      {\@namedef{\scr@dsc@current pagestyle}{\partpagestyle}}%
    }%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @innerskip}{%
    \Ifstr{\scr@dsc@current}{part}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {inner part skip}{innerskip}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {inner part skip}{innerskip}%
                                       {\scr@part@innerskip}%
      {\@namedef{scr@\scr@dsc@current @innerskip}{\scr@part@innerskip}}%
    }%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @beforeskip}{%
    \Ifstr{\scr@dsc@current}{part}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {before part skip}{beforeskip}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {before part skip}{beforeskip}%
                                       {\scr@part@beforeskip}%
      {\@namedef{scr@\scr@dsc@current @beforeskip}{\scr@part@beforeskip}}%
    }%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @afterskip}{%
    \Ifstr{\scr@dsc@current}{part}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {after part skip}{afterskip}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {after part skip}{afterskip}%
                                       {\scr@part@afterskip}%
      {\@namedef{scr@\scr@dsc@current @afterskip}{\scr@part@afterskip}}%
    }%
  }{}%
  \IfExistskomafont{\scr@dsc@current}{}{%
    \Ifstr{\scr@dsc@current}{part}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}{font}{font}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}{font}{font}%
                                       {\usekomafont{part}}%
      {\newkomafont{\scr@dsc@current}{\usekomafont{part}}}%
    }%
  }{}%
  \IfExistskomafont{\scr@dsc@current prefix}{}{%
    \Ifstr{\scr@dsc@current}{part}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}%
                                     {number font}{prefixfont}%
    }{%
      \scr@declaresectioncommandwarning{\scr@dsc@current}%
                                       {number font}{prefixfont}%
                                       {\usekomafont{partprefix}}%
      {\newkomafont{\scr@dsc@current prefix}{\usekomafont{partprefix}}}%
    }%
  }{}%
  \scr@ifundefinedorrelax{scr@\scr@dsc@current @afterindent}{%
    \l@addto@macro\local@endgroup{%
      \ClassInfo{\KOMAClassName}{%
        using compatibility default
        `afterindent=true'\MessageBreak
        for `\expandafter\string\csname \scr@dsc@current\endcsname}%
      \expandafter\gdef\csname scr@\scr@dsc@current @afterindent\endcsname
      ##1##2##3%
      {##1}%
    }%
  }{}%
}
\newif\ifscr@dsc@parametersonly
\newcommand*{\DeclareSectionCommand}[2][]{%
  \edef\scr@dsc@current{#2}%
  \scr@dsc@parametersonlyfalse
  \DefineFamilyKey[.dsc]{KOMAarg}{style}{%
    \IfArgIsEmpty{##1}{%
      \scr@dsc@parametersonlytrue
      \FamilyKeyStateProcessed
    }{%
      \scr@ifundefinedorrelax{scr@dsc@def@style@##1@command}{%
        \FamilyKeyStateUnknownValue
      }{%
        \@namedef{scr@\scr@dsc@current @style}{##1}%
        \FamilyKeyStateProcessed
      }%
    }%
  }%
  \DefineFamilyKey[.dsc]{KOMAarg}{tocstyle}{%
    \IfArgIsEmpty{##1}{%
      \@ifundefined{scr@dte@\scr@dsc@current @style}{}{%
        \expandafter\let\csname scr@dte@\scr@dsc@current @style\endcsname
        \relax
      }%
      \expandafter\let\csname scr@tso@\scr@dsc@current @style\endcsname
      \relax
      \FamilyKeyStateProcessed
    }{%
      \scr@ifundefinedorrelax{scr@dte@def@l@##1}{%
        \FamilyKeyStateUnknownValue
      }{%
        \@namedef{scr@dte@\scr@dsc@current @style}{##1}%
        \@namedef{scr@tso@\scr@dsc@current @style}{##1}%
        \FamilyKeyStateProcessed
      }%
    }%
  }%
  \DefineFamilyKey[.dsc]{KOMAarg}{@else@}{%
    \FamilyKeyStateProcessed
  }%
  \FamilyExecuteOptions[.dsc]{KOMAarg}{#1}%
  \RelaxFamilyKey[.dsc]{KOMAarg}{@else@}%
  \RelaxFamilyKey[.dsc]{KOMAarg}{tocstyle}%
  \RelaxFamilyKey[.dsc]{KOMAarg}{style}%
  \begingroup
    \scr@ifundefinedorrelax{scr@\scr@dsc@current @style}{%
      \scr@declaresectioncommanderror{\scr@dsc@current}
                                     {section command style}{style}%
    }{}%
  \endgroup
  \@firstofone{%
    \@nameuse{scr@dsc@style@\@nameuse{scr@\scr@dsc@current @style}@options}%
    \scr@ifundefinedorrelax{scr@tso@\scr@dsc@current @style}{%
      \scr@ifundefinedorrelax{l@\scr@dsc@current}{%
        \@namedef{scr@tso@\scr@dsc@current @style}{default}%
      }{}%
    }{}%
    \let\scr@dsc@tocstyle@options\@empty
    \let\scr@dsc@extra@relax@opts\@empty
    \scr@ifundefinedorrelax{scr@tso@\scr@dsc@current @style}{%
      \expandafter\let
      \csname scr@tso@\scr@dsc@current @style\expandafter\endcsname
      \csname scr@dte@\scr@dsc@current @style\endcsname
    }{}%
    \scr@ifundefinedorrelax{scr@tso@\scr@dsc@current @style}{}{%
      \begingroup
        \def\scr@dte@current{#2}%
        \edef\reserved@a{%
          \noexpand\@ExecuteTOCEntryStyleInitCode{%
            \@nameuse{scr@tso@\scr@dsc@current @style}%
          }{\scr@dsc@current}%
        }\reserved@a
        \def\do@endgroup{\endgroup}%
        \def\do##1{%
          \l@addto@macro\do@endgroup{%
            \l@addto@macro\scr@dsc@extra@relax@opts{%
              \RelaxFamilyKey[.dsc]{KOMAarg}{toc##1}%
              \RelaxFamilyKey[.dsc]{KOMAarg}{tocentry##1}%
            }%
          }%
          \kernel@ifnextchar[%]
            {\@dodefault{##1}}%
            {\@donodefault{##1}}%
        }%
        \def\@donodefault##1{%
          \l@addto@macro\do@endgroup{%
            \DefineFamilyKey[.dsc]{KOMAarg}{toc##1}{%
              \l@addto@macro{\scr@dsc@tocstyle@options}{##1={####1},}%
              \FamilyKeyStateProcessed
            }%
            \DefineFamilyKey[.dsc]{KOMAarg}{tocentry##1}{%
              \l@addto@macro{\scr@dsc@tocstyle@options}{##1={####1},}%
              \FamilyKeyStateProcessed
            }%
          }%
        }%
        \def\@dodefault##1[##2]{%
          \l@addto@macro\do@endgroup{%
            \DefineFamilyKey[.dsc]{KOMAarg}{toc##1}[##2]{%
              \l@addto@macro{\scr@dsc@tocstyle@options}{##1={####1},}%
              \FamilyKeyStateProcessed
            }%
            \DefineFamilyKey[.dsc]{KOMAarg}{tocentry##1}[##2]{%
              \l@addto@macro{\scr@dsc@tocstyle@options}{##1={####1},}%
              \FamilyKeyStateProcessed
            }%
          }%
        }%
        \scr@dte@doopts
      \do@endgroup
    }%
    \DefineFamilyKey[.dsc]{KOMAarg}{style}{\FamilyKeyStateProcessed}%
    \DefineFamilyKey[.dsc]{KOMAarg}{tocstyle}{\FamilyKeyStateProcessed}%
    \FamilyBoolKey[.dsc]{KOMAarg}{expandtopt}{scr@dsc@expandtopt}%
    \scr@dsc@expandtoptfalse
    \scr@ifundefinedorrelax{scr@local@levelincrease}{%
      \RelaxFamilyKey[.dsc]{KOMAarg}{increaselevel}%
    }{%
      \FamilyCounterMacroKey[.dsc]{KOMAarg}{increaselevel}[1]%
                            {\scr@local@levelincrease}%
    }%
    \scr@ifundefinedorrelax{scr@local@leveloffset}{%
      \edef\reserved@a{%
        \noexpand\FamilyCounterMacroKey[.dsc]{KOMAarg}{level}{%
          \expandafter\noexpand\csname \scr@dsc@current numdepth\endcsname}%
      }\reserved@a
    }{%
      \edef\reserved@a{%
        \noexpand\DefineFamilyKey[.dsc]{KOMAarg}{level}{%
          \noexpand\FamilySetCounterMacro{KOMAarg}{level}{%
            \expandafter\noexpand\csname \scr@dsc@current numdepth\endcsname
          }%
          \unexpanded{%
            {\numexpr ##1+\scr@local@leveloffset\relax}%
            \edef\scr@local@leveloffset{%
              \the\numexpr\scr@local@leveloffset+\scr@local@levelincrease\relax
            }%
          }%
        }%
      }\reserved@a
    }%
    \FamilyStringKey[.dsc]{KOMAarg}{counterwithout}{\scr@local@counterwithout}%
    \let\scr@local@counterwithout\relax
    \FamilyStringKey[.dsc]{KOMAarg}{counterwithin}{\scr@local@counterwithin}%
    \let\scr@local@counterwithin\relax
    \scr@ifundefinedorrelax{scr@local@tocleveloffset}{}{%
      \scr@ifundefinedorrelax{KV@KOMAarg.dsc@toclevel}{%
      }{%
        \DefineFamilyKey[.dsc]{KOMAarg}{toclevel}{%
          \edef\reserved@a{%
            \noexpand\l@addto@macro{\noexpand\scr@dsc@tocstyle@options}{%
              level=\the\numexpr ##1+\scr@local@tocleveloffset\relax,%
            }%
          }\reserved@a
          \edef\scr@local@tocleveloffset{%
            \the\numexpr\scr@local@tocleveloffset+\scr@local@levelincrease\relax
          }%
          \FamilyKeyStateProcessed
        }%
      }%
    }%
    \FamilyExecuteOptions[.dsc]{KOMAarg}{#1}%
    \scr@dsc@extra@relax@opts
    \let\scr@dsc@extra@relax@opts\relax
    \RelaxSectionCommandOptions
    \RelaxFamilyKey[.dsc]{KOMAarg}{style}%
    \RelaxFamilyKey[.dsc]{KOMAarg}{tocstyle}%
    \RelaxFamilyKey[.dsc]{KOMAarg}{expandtopt}%
    \scr@ifundefinedorrelax{scr@local@levelincrease}{}{%
      \RelaxFamilyKey[.dsc]{KOMAarg}{increaselevel}%
    }%
    \RelaxFamilyKey[.dsc]{KOMAarg}{level}%
    \RelaxFamilyKey[.dsc]{KOMAarg}{counterwithin}%
    \begingroup
      \def\local@endgroup{\endgroup}%
      \scr@ifundefinedorrelax{\scr@dsc@current numdepth}{%
        \scr@declaresectioncommanderror{\scr@dsc@current}{section level}{level}%
      }{%
        \expandafter\ifnum \csname #2numdepth\endcsname>-\maxdimen
          \@nameuse{scr@dsc@style@%
            \@nameuse{scr@\scr@dsc@current @style}%
            @neededoptionstest}%
        \else
          \ClassError{\KOMAClassName}{%
            `level' must be > -\the\numexpr\maxdimen\relax
          }{%
            KOMA-Script internally sets `secnumdepth' to
            -\the\numexpr\maxdimen\relax\space
            to locally switch of\MessageBreak
            the numbering, i.e., inside running heads.\MessageBreak
            Because of this, you can define section commands with\MessageBreak
            `level' greater than -\the\numexpr\maxdimen\relax\space only.%
          }%
          \let\local@endgroup\endgroup
          \aftergroup\@gobbletwo
        \fi
      }%
    \local@endgroup
    \@firstofone{%
      \@ifundefined{c@#2}{\newcounter{#2}}{}%
      \ifx\scr@local@counterwithout\relax
      \else\ifx\scr@local@counterwithout\@empty
        \else
          \@removefromreset{#2}{\scr@local@counterwithout}%
        \fi
        \@namedef{the#2}{\arabic{#2}}%
      \fi
      \ifx\scr@local@counterwithin\relax
      \else\ifx\scr@local@counterwithin\@empty
          \@namedef{the#2}{\arabic{#2}}%
        \else
          \@removefromreset{#2}{\scr@local@counterwithin}%
          \@addtoreset{#2}{\scr@local@counterwithin}%
          \expandafter\def\csname the#2\expandafter\endcsname\expandafter{%
            \csname the\scr@local@counterwithin\endcsname.\arabic{#2}}%
        \fi
      \fi
      \@ifundefined{#2format}{%
        \@namedef{#2format}{\csname the#2\endcsname\autodot\enskip}%
      }{}%
      \ifscr@dsc@parametersonly
        \ClassInfo{\KOMAClassName}{%
          not defining `\expandafter\string\csname #2\endcsname' due
          to\MessageBreak
          empty section style option%
        }%
      \else
        \scr@ifundefinedorrelax{%
          scr@dsc@def@style@\@nameuse{scr@#2@style}@command%
        }{%
          \ClassWarning{\KOMAClassName}{%
            not defining `\expandafter\string\csname #2\endcsname'
            due\MessageBreak
            to not yet defined section style\MessageBreak
            `\@nameuse{scr@#2@style}'%
          }%
        }{%
          \@nameuse{scr@dsc@def@style@\@nameuse{scr@#2@style}@command}{#2}%
        }%
      \fi
      \@ifundefined{DeclareSectionNumberDepth}{%
        \@ifundefined{#2markformat}{%
          \@namedef{#2markformat}{\csname the#2\endcsname\autodot\enskip}%
        }{}%
        \@ifundefined{#2mark}{%
          \expandafter\let\csname #2mark\endcsname\@gobble
        }{}%
      }{%
        \DeclareSectionNumberDepth{#2}{\csname #2numdepth\endcsname}%
      }%
      \expandafter\providecommand\expandafter*%
      \csname add#2tocentry\endcsname[2]{%
        \addtocentrydefault{#2}{##1}{##2}%
      }%
      \scr@ifundefinedorrelax{scr@tso@#2@style}{%
        \expandafter\let\csname scr@tso@#2@style\expandafter\endcsname
        \csname scr@dte@#2@style\endcsname
      }{}%
      \scr@ifundefinedorrelax{scr@tso@#2@style}{%
      }{%
        \DeclareTOCStyleEntry[\scr@dsc@tocstyle@options]{%
          \@nameuse{scr@tso@#2@style}%
        }{#2}%
      }%
      \scr@ifundefinedorrelax{l@#2}{%
        \DeclareTOCStyleEntry[\scr@dsc@tocstyle@options]{default}{#2}%
      }{}%
      \if@atdocument
        \let\reserved@a\@firstofone
      \else
        \@ifpackageloaded{hyperref}{%
          \let\reserved@a\@firstofone
        }{%
          \def\reserved@a##1{%
            \AfterAtEndOfPackage{hyperref}{\AtBeginDocument{##1}}%
          }%
        }%
      \fi
      \reserved@a{%
        \expandafter\let\csname toclevel@#2\expandafter\endcsname
        \csname #2tocdepth\endcsname
        \scr@ifundefinedorrelax{bookmarksetup}{%
          \scr@ifundefinedorrelax{scr@min@toclevel}{%
            \expandafter\let\expandafter\scr@min@toclevel
            \csname toclevel@#2\endcsname
          }{%
            \expandafter\ifnum \csname toclevel@#2\endcsname
            < \numexpr \scr@min@toclevel-1\relax
              \ClassWarning{\KOMAClassName}{%
                Trying emergency fix for bookmark level gap,\MessageBreak
                because toclevel of `#2'
                (\csname toclevel@#2\endcsname)\MessageBreak
                is more than 1 lower than currently lowest\MessageBreak
                known level (\scr@min@toclevel).\MessageBreak
                Note: This fix can fail and you should load\MessageBreak
                package `bookmark' to avoid usage of this\MessageBreak
                fix%
              }%
              \expandafter\edef\csname toclevel@#2\endcsname{%
                \the\numexpr \scr@min@toclevel-1\relax
              }%
            \fi
            \expandafter\ifnum \csname toclevel@#2\endcsname
            < \scr@min@toclevel\relax
              \expandafter\let\expandafter\scr@min@toclevel
              \csname toclevel@#2\endcsname
            \fi
          }%
          \scr@ifundefinedorrelax{scr@max@toclevel}{%
            \expandafter\let\expandafter\scr@max@toclevel
            \csname toclevel@#2\endcsname
          }{%
            \expandafter\ifnum \csname toclevel@#2\endcsname
            > \numexpr \scr@max@toclevel+1\relax
              \ClassWarning{\KOMAClassName}{%
                Trying emergency fix for bookmark level gap,\MessageBreak
                because toclevel of `#2'
                (\csname toclevel@#2\endcsname)\MessageBreak
                is more than 1 greater than currently highest\MessageBreak
                known level (\scr@max@toclevel).\MessageBreak
                Note: This fix can fail and you should load\MessageBreak
                package `bookmark' to avoid usage of this\MessageBreak
                fix%
              }%
              \expandafter\edef\csname toclevel@#2\endcsname{%
                \the\numexpr \scr@max@toclevel+1\relax
              }%
            \fi
            \expandafter\ifnum \csname toclevel@#2\endcsname
            > \scr@max@toclevel\relax
              \expandafter\let\expandafter\scr@max@toclevel
              \csname toclevel@#2\endcsname
            \fi
          }%
        }{}%
      }%
    }%
  }%
  \let\scr@dsc@current\relax
}
\newcommand*{\scr@declaresectioncommanderror}[3]{%
  \ClassError{\KOMAClassName}{%
    #2 of \expandafter\string\csname #1\endcsname\space unknown%
  }{%
    Please use option `#3' to declare the #2.\MessageBreak
    If you'll continue, declaration will be ignored%
  }%
  \let\local@endgroup\endgroup
  \aftergroup\@gobbletwo
}
\newcommand*{\scr@declaresectioncommandwarning}[5]{%
  \ClassInfo{\KOMAClassName}{%
    #2 of \expandafter\string\csname #1\endcsname\space unknown.\MessageBreak
    You should use option `#3' if you\MessageBreak
    do not want to use the default value\MessageBreak
    `\detokenize{#4}'%
  }%
  \l@addto@macro\local@endgroup{#5}%
}
\newcommand*{\DeclareNewSectionCommand}[2][]{%
  \@ifundefined{#2}{%
    \@tempswatrue
    \let\reserved@b\@empty
    \@for \reserved@a:=the#2,#2mark,#2format,#2markformat\do{%
      \expandafter\scr@ifundefinedorrelax\expandafter{\reserved@a}{}{%
        \@tempswafalse
        \edef\reserved@b{\expandafter\string\csname \reserved@a\endcsname}%
      }%
    }%
    \if@tempswa
      \expandafter\let\expandafter\scr@dsc@current
      \csname scr@tso@##2@style\endcsname
      \DefineFamilyKey[.dsc]{KOMAarg}{style}{%
        \edef\scr@dsc@current{##1}%
        \FamilyKeyStateProcessed
      }%
      \DefineFamilyKey[.dsc]{KOMAarg}{@else@}{\FamilyKeyStateProcessed}%
      \FamilyExecuteOptions[.dsc]{KOMAarg}{#1}%
      \RelaxFamilyKey[.dsc]{KOMAarg}{@else@}%
      \RelaxFamilyKey[.dsc]{KOMAarg}{style}%
      \@tempswatrue
      \@ifundefined{scr@dsc@current}{}{%
        \scr@ifundefinedorrelax{scr@dsc@style@\scr@dsc@current @subcommands}{%
        }{%
          \edef\reserved@b{%
            \csname scr@dsc@style@\scr@dsc@current @subcommands\endcsname{#2}%
          }%
          \expandafter\@for\expandafter\reserved@a\expandafter:\expandafter=%
          \reserved@b\do{%
            \expandafter\scr@ifundefinedorrelax\expandafter{\reserved@a}{}{%
              \@tempswafalse
              \edef\reserved@b{%
                \expandafter\string\csname \reserved@a\endcsname}%
            }%
          }%
        }
      }%
      \let\scr@dsc@current\relax
    \fi
    \if@tempswa
      \DeclareSectionCommand[{#1}]{#2}%
    \else
      \ClassError{\KOMAClassName}{%
        command `\reserved@b' already defined%
      }{%
        You've tried to define the section command `\expandafter\string\csname
        #2\endcsname' newly.\MessageBreak
        Such a section command needs an additional new command
        `\reserved@b',\MessageBreak
        but this already exists. So you cannot define
        `\expandafter\string\csname #2\endcsname' newly.\MessageBreak
        Maybe you should use one of \string\DeclareSectionCommand,
        \string\RedeclareSectionCommand,\MessageBreak
        or \string\ProvideSectionCommand.\MessageBreak
        If you'll continue, the command will be ignored.%
      }%
    \fi
  }{%
    \ClassError{\KOMAClassName}{%
      command `\expandafter\string\csname #2\endcsname' already defined%
    }{%
      You've tried to define the section command `\expandafter\string\csname
      #2\endcsname' newly,\MessageBreak
      but a command or something else with this name already
      exists.\MessageBreak
      Maybe you should use one of \string\DeclareSectionCommand,
      \string\RedeclareSectionCommand,\MessageBreak
      or \string\ProvideSectionCommand.\MessageBreak
      If you'll continue, the command will be ignored.%
    }%
  }%
}
\newcommand*{\RedeclareSectionCommand}[2][]{%
  \@ifundefined{#2}{%
    \ClassError{\KOMAClassName}{%
      command `\expandafter\string\csname #2\endcsname' not defined%
    }{%
      You've tried to re-define the section command `\expandafter\string\csname
      #2\endcsname',\MessageBreak
      but a command with this name does not exists.\MessageBreak
      Maybe you should use one of \string\DeclareSectionCommand,
      \string\DeclareNewSectionCommand,\MessageBreak
      or \string\ProvideSectionCommand.\MessageBreak
      If you'll continue, the command will be irgnored.%
    }%
  }{%
    \DeclareSectionCommand[{#1}]{#2}%
  }%
}
\newcommand*{\ProvideSectionCommand}[2][]{%
  \@ifundefined{#2}{%
    \DeclareSectionCommand[{#1}]{#2}%
  }{%
    \ClassInfo{\KOMAClassName}{%
      \string\ProvideSectionCommand{#1} ignored%
    }%
  }%
}
\newcommand*{\DeclareSectionCommands}[2][]{%
  \edef\reserved@a{#2}%
  \def\scr@local@levelincrease{\z@}%
  \def\scr@local@leveloffset{\z@}%
  \def\scr@local@tocleveloffset{\z@}%
  \@for\reserved@a:=\reserved@a\do{%
    \scr@trim@spaces\reserved@a
    \edef\reserved@a{%
      \unexpanded{\DeclareSectionCommand[{#1}]}{\reserved@a}%
    }%
    \reserved@a
  }%
  \let\scr@local@levelincrease\relax
  \let\scr@local@leveloffset\relax
  \let\scr@local@tocleveloffset\relax
}
\newcommand*{\DeclareNewSectionCommands}[2][]{%
  \edef\reserved@a{#2}%
  \def\scr@local@levelincrease{\z@}%
  \def\scr@local@leveloffset{\z@}%
  \def\scr@local@tocleveloffset{\z@}%
  \@for\reserved@a:=\reserved@a\do{%
    \scr@trim@spaces\reserved@a
    \@ifundefined{\reserved@a}{}{%
      \ClassError{\KOMAClassName}{%
        command `\expandafter\string\csname\reserved@a\endcsname' already
        defined%
      }{%
        You've tried to define the section command
        `\expandafter\string\csname\reserved@a\endcsname' newly,\MessageBreak
        but a command, token, box or length with this name already
        exists.\MessageBreak
        Maybe you should use one of \string\DeclareSectionCommand,
        \string\RedeclareSectionCommand,\MessageBreak
        or \string\ProvideSectionCommand.\MessageBreak
        Nevertheless, if you'll continue, the command will be defined.%
      }%
    }%
    \edef\reserved@a{%
      \unexpanded{\DeclareSectionCommand[{#1}]}{\reserved@a}%
    }%
    \reserved@a
  }%
  \let\scr@local@levelincrease\relax
  \let\scr@local@leveloffset\relax
  \let\scr@local@tocleveloffset\relax
}
\newcommand*{\RedeclareSectionCommands}[2][]{%
  \edef\reserved@a{#2}%
  \def\scr@local@levelincrease{\z@}%
  \def\scr@local@leveloffset{\z@}%
  \def\scr@local@tocleveloffset{\z@}%
  \@for\reserved@a:=\reserved@a\do{%
    \scr@trim@spaces\reserved@a
    \@ifundefined{\reserved@a}{%
      \ClassError{\KOMAClassName}{%
        command `\expandafter\string\csname\reserved@a\endcsname' not defined%
      }{%
        You've tried to re-define the section command
        `\expandafter\string\csname\reserved@a\endcsname',\MessageBreak
        but a command with this name does not exists.\MessageBreak
        Maybe you should use one of \string\DeclareSectionCommand,
        \string\DeclareNewSectionCommand,\MessageBreak
        or \string\ProvideSectionCommand.\MessageBreak
        Nevertheless, if you'll continue, the command will be defined.%
      }%
    }{}%
    \edef\reserved@a{%
      \unexpanded{\DeclareSectionCommand[{#1}]}{\reserved@a}%
    }%
    \reserved@a
  }%
  \let\scr@local@levelincrease\relax
  \let\scr@local@leveloffset\relax
  \let\scr@local@tocleveloffset\relax
}
\newcommand*{\ProvideSectionCommands}[2][]{%
  \edef\reserved@a{#2}%
  \def\scr@local@levelincrease{\z@}%
  \def\scr@local@leveloffset{\z@}%
  \def\scr@local@tocleveloffset{\z@}%
  \@for\reserved@a:=\reserved@a\do{%
    \scr@trim@spaces\reserved@a
    \@ifundefined{\reserved@a}{%
      \edef\reserved@a{%
        \unexpanded{\DeclareSectionCommand[{#1}]}{\reserved@a}%
      }%
      \reserved@a
    }{%
      \DefineFamilyKey[.dsc]{KOMAarg}{@else@}{\FamilyKeyStateProcessed}%
      \FamilyCounterMacroKey[.dsc]{KOMAarg}{increaselevel}[1]%
        {\scr@local@levelincrease}%
      \DefineFamilyKey[.dsc]{KOMAarg}{level}{%
        \FamilySetCounterMacro{KOMAarg}{level}{\reserved@b}{##1}%
        \edef\scr@local@leveloffset{%
          \the\numexpr\scr@local@leveloffset+\scr@local@levelincrease\relax
        }%
      }%
      \DefineFamilyKey[.dsc]{KOMAarg}{toclevel}{%
        \FamilySetCounterMacro{KOMAarg}{toclevel}{\reserved@b}{##1}%
        \edef\scr@local@tocleveloffset{%
          \the\numexpr\scr@local@tocleveloffset+\scr@local@levelincrease\relax
        }%
      }%
      \FamilyExecuteOptions[.dsc]{KOMAarg}{#1}%
      \RelaxFamilyKey[.dsc]{KOMAarg}{toclevel}%
      \RelaxFamilyKey[.dsc]{KOMAarg}{level}%
      \RelaxFamilyKey[.dsc]{KOMAarg}{increaselevel}%
      \RelaxFamilyKey[.dsc]{KOMAarg}{@else@}%
    }%
  }%
  \let\scr@local@levelincrease\relax
  \let\scr@local@leveloffset\relax
  \let\scr@local@tocleveloffset\relax
}
\newcommand*{\IfSectionCommandStyleIs}[2]{%
  \scr@ifundefinedorrelax{#1}{%
    \ClassError{\KOMAClassName}{%
      \expandafter\string\csname #1\endcsname\space not defined}{%
      You cannot compare the section command style of an undefined command.}%
  }{%
    \scr@ifundefinedorrelax{scr@#1@style}{%
      \ClassError{\KOMAClassName}{%
        \expandafter\string\csname #1\endcsname\space not a valid section
        command%
      }{%
        You cannot detect the section command style of a command, that
        has\MessageBreak
        never been defined as a section command by KOMA-Script.%
      }%
    }%
  }%
  \scr@ifundefinedorrelax{scr@dsc@def@style@#2@command}{%
    \ClassError{\KOMAClassName}{%
      unknown section command style `#2'%
    }{}%
  }%
  \Ifstr{\@nameuse{scr@#1@style}}{#2}%
}
\newcommand*{\use@preamble}[1]{%
  \@ifundefined{#1@preamble}{}{%
    \@nameuse{#1@preamble}%
    \global\expandafter\let\csname#1@preamble\endcsname=\relax
  }%
}
\newcommand*{\set@preamble}[1]{%
  \kernel@ifnextchar [%]
  {\set@@preamble{#1}}{\set@@@preamble{#1}[][\hsize]}%
}
\newcommand*{\set@@preamble}{}
\def\set@@preamble#1[#2]{%
  \kernel@ifnextchar [%]
  {\set@@@preamble{#1}[{#2}]}{\set@@@preamble{#1}[{#2}][\hsize]}%
}
\newcommand{\set@@@preamble}{}
\long\def\set@@@preamble#1[#2][#3]#4{%
  \begingroup
    \def\prmbl@pos{#2}\let\prmbl@hpos\relax\let\prmbl@vpos\relax
    \expandafter \@tfor \expandafter \@tempa
      \expandafter :\expandafter =\prmbl@pos
    \do{%
      \if \@tempa l%
        \set@preamble@hpos{0}{#2}%
      \fi%
      \if \@tempa c%
        \set@preamble@hpos{1}{#2}%
      \fi%
      \if \@tempa r%
        \set@preamble@hpos{2}{#2}%
      \fi%
      \if \@tempa u%
        \set@preamble@vpos{0}{#2}%
      \fi%
      \if \@tempa b%
        \set@preamble@vpos{0}{#2}%
      \fi
      \if \@tempa o%
        \set@preamble@vpos{1}{#2}%
      \fi%
      \if \@tempa t%
        \set@preamble@vpos{1}{#2}%
      \fi
    }%
    \@ifundefined{prmbl@hpos}{\def\prmbl@hpos{0}}{}%
    \@ifundefined{prmbl@vpos}{\def\prmbl@vpos{0}}{}%
    \ifcase\prmbl@hpos
      \ifcase\prmbl@vpos
        \set@@@@preamble{#1@u}{t}{#3}{}{\hfil}{#4}%
      \else
        \set@@@@preamble{#1@o}{b}{#3}{}{\hfil}{#4}%
      \fi
    \or
      \ifcase\prmbl@vpos
        \set@@@@preamble{#1@u}{t}{#3}{\hfil}{\hfil}{#4}%
      \else
        \set@@@@preamble{#1@o}{b}{#3}{\hfil}{\hfil}{#4}%
      \fi
    \else
      \ifcase\prmbl@vpos
        \set@@@@preamble{#1@u}{t}{#3}{\hfil}{}{#4}%
      \else
        \set@@@@preamble{#1@o}{b}{#3}{\hfil}{}{#4}%
      \fi
    \fi
  \endgroup
}
\newcommand{\set@@@@preamble}[6]{%
  \expandafter\gdef\csname #1@preamble\endcsname{%
    \hbox to\hsize{#4\parbox[{#2}]{#3}{#6\par}#5\par}%
  }%
}
\newcommand*{\set@preamble@hpos}[2]{%
  \@ifundefined{prbml@hpos}{%
    \def\prmbl@hpos{#1}%
  }{%
    \ifnum \prmbl@hpos=0\relax\else%
      \ClassError{\KOMAClassName}{%
        inconsistent hpos options%
      }{%
        You've said `#2' as position option. But you have
        to\MessageBreak
        use only one of `l', `r', or `c' not two of
        these.\MessageBreak
        If you'll continue only first hpos option will be
        used%
      }%
    \fi
  }%
}
\newcommand*{\set@preamble@vpos}[2]{%
  \@ifundefined{prbml@vpos}{%
    \def\prmbl@vpos{#1}%
  }{%
    \ifnum \prmbl@vpos=0\relax\else%
      \ClassError{\KOMAClassName}{%
        inconsistent vpos options%
      }{%
        You've said `#2' as position option. But you have
        to\MessageBreak
        use only one of `t', `o', `b', or `u' not two of
        these.\MessageBreak
        If you'll continue only first vpos option will be
        used%
      }%
    \fi
  }%
}
\newcommand*\appendix{%
  \Ifstr{\@currenvir}{appendix}{%
    \ClassWarning{\KOMAClassName}{%
      You are using
      `\string\begin{appendix}...\string\end{appendix}'.\MessageBreak
      You should note, that `\string\appendix' is a mostly
      globally\MessageBreak
      working command not an enviroment with only local\MessageBreak
      effects. Therefore `\string\end{appendix}' will neither\MessageBreak
      switch back to normal section numbering nor finish\MessageBreak
      every other effect of `\string\begin{appendix}'.\MessageBreak
      Nevertheless, some effects may end with\MessageBreak
      `\string\end{appendix}' and the document may become\MessageBreak
      inconsistent.\MessageBreak
      Because of this, you should remove `\string\end{appendix}'\MessageBreak
      and replace `\string\begin{appendix}' by command\MessageBreak
      `\string\appendix'%
    }%
  }{}%
  \par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}%
}
\IfLTXAtLeastTF{2020/10/01}{%
  \g@addto@macro{\appendix}{\UseOneTimeHook{\KOMAClassName/appendix}}%
}{}
\g@addto@macro{\appendix}{\csname appendixmore\endcsname}
\newcommand*{\scr@startpart}[1]{%
  \ExecuteDoHook{heading/preinit/#1}%
  \if@openright\cleardoublepage\else\clearpage\fi
  \scr@ifundefinedorrelax{#1pagestyle}{}{%
    \Ifstr{#1pagestyle}{}{}{%
      \thispagestyle{\@nameuse{#1pagestyle}}%
    }%
  }%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \@tempskipa=\glueexpr\@nameuse{scr@#1@beforeskip}\relax
  \@ifundefined{scr@#1@afterindent}{\@afterindentfalse}{%
    \csname scr@#1@afterindent\endcsname
    {\@afterindenttrue}{\@afterindentfalse}{%
      \@afterindenttrue
      \ifdim\@tempskipa<\z@
        \@tempskipa=-\@tempskipa
        \@afterindentfalse
      \fi
    }%
  }%
  \ExecuteDoHook{heading/postinit/#1}%
  \partheadstartvskip
  \vbox to\z@{\vss\use@preamble{#1@o}\strut\par}%
  \vskip-\baselineskip\nobreak
  \expandafter\SecDef\csname @#1\expandafter\endcsname\csname @s#1\endcsname
}
\newcommand{\scr@@startpart}{}
\long\def\scr@@startpart#1[#2]#3{%
  \ExecuteDoHook{heading/branch/nostar/#1}%
  \ifnum \scr@osectarg=\z@
    \@scr@tempswafalse
  \else
    \scr@istest#2=\@nil
  \fi
  \@currentusenumbertrue
  \if@scr@tempswa
    \setkeys{KOMAarg.section}{tocentry={#3},head={#3},reference={#3},#2}%
  \else
    \ifcase \scr@osectarg\relax
      \setkeys{KOMAarg.section}{tocentry={#2},head={#2},reference={#2}}%
    \or
      \setkeys{KOMAarg.section}{tocentry={#3},head={#2},reference={#3}}%
    \or
      \setkeys{KOMAarg.section}{tocentry={#2},head={#3},reference={#2}}%
    \or
      \setkeys{KOMAarg.section}{tocentry={#2},head={#2},reference={#2}}%
    \fi
  \fi
  \Ifnumbered{#1}{%
    \refstepcounter{#1}%
    \expandafter\@maybeautodot\csname the#1\endcsname
    \typeout{#1 \csname the#1\endcsname.}%
    \ifx\@currenttocentry\@empty\else
      \@ifundefined{#1tocformat}{%
        \expandafter\gdef\csname #1tocformat\endcsname
        {\csname the#1\endcsname}%
      }{}%
      \scr@ifundefinedorrelax{add#1tocentry}{%
        \addtocentrydefault{#1}%
      }{%
        \@nameuse{add#1tocentry}%
      }{\csname\@ifundefined{#1tocformat}{the#1}{#1tocformat}\endcsname}%
      {\@currenttocentry}%
    \fi
  }{%
    \expandafter\ifnum\scr@v@is@lt{3.18}\relax\else
      \begingroup
        \let\@elt\@stpelt
        \csname cl@#1\endcsname
      \endgroup
    \fi
    \typeout{#1 without number}%
    \ifx\@currenttocentry\@empty\else
      \hy@insteadofrefstepcounter{#1}%
      \scr@ifundefinedorrelax{add#1tocentry}{%
        \addtocentrydefault{#1}%
      }{%
        \@nameuse{add#1tocentry}%
      }{}{\@currenttocentry}%
    \fi
  }%
  \begingroup
    \def\IfUseNumber{\Ifnumbered{#1}}%
    \ExecuteDoHook{heading/begingroup/#1}%
    \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
    \raggedpart
    \normalfont\usekomafont{disposition}{\nobreak
      \IfUseNumber{%
        \partlineswithprefixformat{#1}{%
          \usekomafont{#1prefix}{\nobreak\@nameuse{#1format}}%
        \setlength{\@tempskipa}{\@nameuse{scr@#1@innerskip}}%
          \partheadmidvskip
        }{%
          \usekomafont{#1}{\nobreak\interlinepenalty \@M#3\strut\@@par}%
        }%
      }{%
        \partlineswithprefixformat{#1}{}{%
          \usekomafont{#1}{\nobreak\interlinepenalty \@M#3\strut\@@par}%
        }
      }%
      \expandafter\ifx\csname #1mark\endcsname\@gobble
        \@mkboth{}{}%
      \else
        \csname #1mark\expandafter\endcsname\expandafter{\@currentheadentry}%
      \fi
    }%
    \ExecuteDoHook{heading/endgroup/#1}%
  \endgroup
  \@nameuse{@end#1}%
  \@afterheading
}
\newcommand{\scr@@startspart}[2]{%
  \ExecuteDoHook{heading/branch/star/#1}%
  \begingroup
    \let\@mkboth\@gobbletwo
    \hy@insteadofrefstepcounter{#1}%
  \endgroup
  \begingroup
    \let\IfUseNumber\@secondoftwo
    \ExecuteDoHook{heading/begingroup/#1}%
    \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
    \raggedpart
    \normalfont\usekomafont{disposition}{%
      \nobreak
      \partlineswithprefixformat{#1}{}{%
        \usekomafont{#1}{\nobreak\interlinepenalty \@M#2\strut\@@par}%
      }%
      \@mkboth{}{}%
    }%
    \ExecuteDoHook{heading/endgroup/#1}%
  \endgroup
  \@nameuse{@end#1}%
}
\newcommand{\partlineswithprefixformat}[3]{%
  #2#3%
}
\newcommand*{\scr@@endpart}[1]{%
  \vbox to\z@{\use@preamble{#1@u}\vss}%
  \@tempskipa=\glueexpr\csname scr@#1@afterskip\endcsname\relax\relax
  \ifdim\@tempskipa<\z@\@tempskipa-\@tempskipa\fi
  \partheadendvskip
  \partheademptypage
  \if@tempswa
    \twocolumn
  \fi
}
\newcommand*{\hy@insteadofrefstepcounter}[1]{}
\let\hy@insteadofrefstepcounter\@gobble
\newcommand*{\scr@chapter@before@hyperref@patch}{%
  \let\scr@orig@chapter\@chapter
  \let\scr@orig@schapter\@schapter
  \let\scr@orig@addchap\@addchap
}
\BeforePackage{hyperref}{\scr@chapter@before@hyperref@patch}
\newcommand*{\scr@chapter@after@hyperref@patch}{%
  \let\@chapter\scr@orig@chapter
  \let\@schapter\scr@orig@schapter
  \let\@addchap\scr@orig@addchap
  \ifx\hy@insteadofrefstepcounter\@gobble
    \renewcommand*{\hy@insteadofrefstepcounter}[1]{%
      \Hy@MakeCurrentHrefAuto{##1*}%
      \Hy@raisedlink{%
        \hyper@anchorstart{\@currentHref}\hyper@anchorend
      }%
    }%
  \fi
}
\AfterAtEndOfPackage{hyperref}{\scr@chapter@after@hyperref@patch}
\newcommand*{\addparttocentry}[2]{%
  \addtocentrydefault{part}{#1}{#2}%
}
\newcommand\addpart{%
  \SecDef\@addpart\@saddpart
}
\newcommand*{\@addpart}{}
\long\def\@addpart[#1]#2{%
  \edef\reserved@a{%
    \unexpanded{%
      \part[{#1}]{#2}%
      \c@secnumdepth=
    }\the\c@secnumdepth\relax
  }%
  \c@secnumdepth=\numexpr \partnumdepth-1\relax
  \reserved@a
}
\newcommand{\@saddpart}[1]{%
  \part*{#1}%
  \addpartmark{}%
}
\newcounter{part}
\renewcommand*{\thepart}{\@Roman\c@part}
\newcommand*{\partformat}{\partname~\thepart\autodot}
\newcommand*\partname{Part}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\partname{Part}
\newcommand*{\partmark}[1]{\@mkboth{}{}}
\newcommand*\addpartmark[1]{%
  \begingroup
    \expandafter\let\csname if@mainmatter\expandafter\endcsname
    \csname iffalse\endcsname
    \c@secnumdepth=\numexpr \partnumdepth-1\relax
    \partmark{#1}%
  \endgroup
}
\newcommand*{\raggedpart}{}
\let\raggedpart\centering
\newkomafont{partentry}{\usekomafont{disposition}\large}
\newkomafont{partentrypagenumber}{}
\newcommand*{\scr@startchapter}[1]{%
  \ExecuteDoHook{heading/preinit/#1}%
  \if@openright\cleardoublepage\else\clearpage\fi
  \scr@ifundefinedorrelax{#1pagestyle}{}{%
    \Ifstr{#1pagestyle}{}{}{%
      \thispagestyle{\@nameuse{#1pagestyle}}%
    }%
  }%
  \global\@topnum\z@
  \@ifundefined{scr@#1@afterindent}{\@afterindentfalse}{%
    \csname scr@#1@afterindent\endcsname
    {\@afterindenttrue}{\@afterindentfalse}{%
      \@afterindenttrue
      \@ifundefined{scr@#1@beforeskip}{\@afterindentfalse}{%
        \ifdim\glueexpr\@nameuse{scr@#1@beforeskip}\relax<\z@
          \@afterindentfalse
        \fi
      }%
    }%
  }%
  \ExecuteDoHook{heading/postinit/#1}%
  \expandafter\SecDef\csname @#1\expandafter\endcsname\csname @s#1\endcsname
}
\newcommand*{\scr@@startchapter}{}
\def\scr@@startchapter#1[#2]#3{%
  \ExecuteDoHook{heading/branch/nostar/#1}%
  \ifnum \scr@osectarg=\z@
    \@scr@tempswafalse
  \else
    \scr@istest#2=\@nil
  \fi
  \@currentusenumbertrue
  \if@scr@tempswa
    \setkeys{KOMAarg.section}{tocentry={#3},head={#3},reference={#3},#2}%
  \else
    \ifcase \scr@osectarg\relax
      \setkeys{KOMAarg.section}{tocentry={#2},head={#2},reference={#2}}%
    \or
      \setkeys{KOMAarg.section}{tocentry={#3},head={#2},reference={#3}}%
    \or
      \setkeys{KOMAarg.section}{tocentry={#2},head={#3},reference={#2}}%
    \or
      \setkeys{KOMAarg.section}{tocentry={#2},head={#2},reference={#2}}%
    \fi
  \fi
  \Ifnumbered{#1}{%
      \@tempswatrue
  }{\@tempswafalse}%
  \if@tempswa
    \refstepcounter{#1}%
    \expandafter\@maybeautodot\csname the#1\endcsname
    \typeout{#1 \csname the#1\endcsname.}%
    \ifx\@currenttocentry\@empty\else
      \@ifundefined{#1tocformat}{%
        \expandafter\gdef\csname #1tocformat\endcsname
        {\csname the#1\endcsname}%
      }{}%
      \scr@ifundefinedorrelax{add#1tocentry}{%
        \addtocentrydefault{#1}%
      }{%
        \@nameuse{add#1tocentry}%
      }{\csname\@ifundefined{#1tocformat}{the#1}{#1tocformat}\endcsname}%
      {\@currenttocentry}%
    \fi
  \else
    \expandafter\ifnum\scr@v@is@lt{3.15}\relax\else
      \begingroup
        \let\@elt\@stpelt
        \csname cl@#1\endcsname
      \endgroup
    \fi
    \typeout{#1 without number}%
    \ifx\@currenttocentry\@empty\else
      \hy@insteadofrefstepcounter{#1}%
      \scr@ifundefinedorrelax{add#1tocentry}{%
        \addtocentrydefault{#1}%
      }{%
        \@nameuse{add#1tocentry}%
      }{}{\@currenttocentry}%
    \fi
  \fi
  \csname #1mark\expandafter\endcsname\expandafter{\@currentheadentry}%
  \ifdim \@chapterlistsgap>\z@
    \doforeachtocfile{%
      \Iftocfeature{\@currext}{chapteratlist}{%
        \addtocontents{\@currext}{\protect\addvspace{\@chapterlistsgap}}%
      }{}%
    }%
    \@ifundefined{float@addtolists}{}{%
      \scr@float@addtolists@warning
      \float@addtolists{\protect\addvspace{\@chapterlistsgap}}%
    }%
  \fi
  \scr@t@st@nd@w@rn@m@k@ch@pt@rh@@d{#1}%
  \if@twocolumn
    \if@at@twocolumn
      \@nameuse{@make#1head}{#3}%
    \else
      \@topnewpage[\@nameuse{@make#1head}{#3}]%
    \fi
  \else
    \@nameuse{@make#1head}{#3}%
  \fi
  \@afterheading
}
\expandafter\ifnum\scr@v@is@ge{3.36}%
  \newcommand*{\scr@t@st@nd@w@rn@m@k@ch@pt@rh@@d}[1]{%
    \Ifstr{#1}{chapter}{%
      \begingroup
        \def\reserved@a{\scr@makechapterhead{chapter}}%
        \ifx\@makechapterhead\reserved@a\else
          \ClassWarningNoLine{\KOMAClassName}{%
            Redefinition of \string\@makechapterhead\space detected.\MessageBreak
            Note: KOMA-Script does use styles for commands like\MessageBreak
            \string\chapter. Currently it internally still provides and\MessageBreak
            uses \string\@makechapterhead, but a completely different\MessageBreak
            definition compared to the standard classes.\MessageBreak
            So redefining or using internal \string\@makechapterhead\MessageBreak
            by users or package authors may already break\MessageBreak
            KOMA-Script and will not work with a coming version,\MessageBreak
            that will remove this deprecated code}%
          \let\scr@t@st@nd@w@rn@m@k@ch@pt@rh@@d\@gobbble
        \fi
      \endgroup
    }{}%
  }
\else
  \let\scr@t@st@nd@w@rn@m@k@ch@pt@rh@@d\@gobble
\fi
\newcommand*{\scr@@startschapter}[2]{%
  \ExecuteDoHook{heading/branch/star/#1}%
  \begingroup
    \let\@mkboth\@gobbletwo
    \hy@insteadofrefstepcounter{#1}%
  \endgroup
  \scr@t@st@nd@w@rn@m@ks@ch@pt@rh@@d{#1}%
  \if@twocolumn
    \if@at@twocolumn
      \@nameuse{@makes#1head}{#2}%
    \else
      \@topnewpage[\@nameuse{@makes#1head}{#2}]%
    \fi
  \else
    \@nameuse{@makes#1head}{#2}%
  \fi
  \@afterheading
}
\expandafter\ifnum\scr@v@is@ge{3.36}%
  \newcommand*{\scr@t@st@nd@w@rn@m@ks@ch@pt@rh@@d}[1]{%
    \Ifstr{#1}{chapter}{%
      \begingroup
        \def\reserved@a{\scr@makeschapterhead{chapter}}%
        \ifx\@makeschapterhead\reserved@a\else
          \ClassWarningNoLine{\KOMAClassName}{%
            Redefinition of \string\@makeschapterhead\space detected.\MessageBreak
            Note: KOMA-Script does use styles for commands like\MessageBreak
            \string\chapter. Currently it internally still provides and\MessageBreak
            uses \string\@makeschapterhead, but a completely different\MessageBreak
            definition compared to the standard classes.\MessageBreak
            So redefining or using internal \string\@makeschapterhead\MessageBreak
            by users or package authors may already break\MessageBreak
            KOMA-Script and will not work with a coming version,\MessageBreak
            that will remove this deprecated code}%
          \let\scr@t@st@nd@w@rn@m@ks@ch@pt@rh@@d\@gobble
        \fi
      \endgroup
    }{}%
  }
\else
  \let\scr@t@st@nd@w@rn@m@ks@ch@pt@rh@@d\@gobble
\fi
%% \begin{macro}{\@at@twocolumntrue,\@at@twocolumnfalse,\if@at@twocolumn}
\newif\if@at@twocolumn
\newcommand*\scr@topnewpage{}
\let\scr@topnewpage\@topnewpage
\long\def\@topnewpage[#1]{%
  \@at@twocolumntrue\scr@topnewpage[{#1}]\@at@twocolumnfalse
}
\newcommand*{\scr@makechapterhead}[2]{%
  \use@chapter@o@preamble{#1}%
  \@nameuse{@@make#1head}{#2}%
  \use@preamble{#1@u}%
}
\newcommand*{\scr@@makechapterhead}[2]{%
  \@tempskipa=\glueexpr \csname scr@#1@beforeskip\endcsname\relax\relax
  \csname scr@#1@afterindent\endcsname
  {\@afterindenttrue}{\@afterindentfalse}{%
    \ifdim\@tempskipa<\z@\@tempskipa-\@tempskipa\else
      \expandafter\ifnum\scr@v@is@ge{3.22}\@afterindenttrue\fi
    \fi
  }%
  \chapterheadstartvskip
  {%
    \def\IfUseNumber{\Ifnumbered{#1}}%
    \ExecuteDoHook{heading/begingroup/#1}%
    \if@chapterprefix
      \let\IfUsePrefixLine\@firstoftwo
    \else
      \let\IfUsePrefixLine\@secondoftwo
    \fi
    \setlength{\parindent}{\z@}\setlength{\parfillskip}{\z@ plus 1fil}%
    \normalfont\usekomafont{disposition}{%
      \usekomafont{#1}{%
        \settoheight{\@tempskipa}{%
          {\usekomafont{#1prefix}{%
              \vrule \@width\z@ \@height\csname scr@#1@innerskip\endcsname}}%
        }%
        \raggedchapter
        \IfUseNumber{%
          \IfUsePrefixLine{%
            \chapterlineswithprefixformat{#1}%
            {{\usekomafont{#1prefix}{\csname #1format\endcsname%
                  \setlength{\@tempskipa}{\csname scr@#1@innerskip\endcsname}%
                  \chapterheadmidvskip}}}%
            {\interlinepenalty \@M#2\@@par}%
          }{%
            \chapterlinesformat{#1}%
            {\csname #1format\endcsname}%
            {\interlinepenalty \@M#2\@@par}%
          }%
        }{%
          \IfUsePrefixLine{%
            \chapterlineswithprefixformat{#1}%
            {}%
            {\interlinepenalty \@M#2\@@par}%
          }{%
            \chapterlinesformat{#1}%
            {}%
            {\interlinepenalty \@M#2\@@par}%
          }%
        }%
      }%
    }%
    \ExecuteDoHook{heading/endgroup/#1}%
  }%
  \nobreak\par\nobreak
  \@tempskipa=\glueexpr \csname scr@#1@afterskip\endcsname\relax\relax
  \chapterheadendvskip
}
\newcommand*{\scr@makeschapterhead}[2]{%
  \use@chapter@o@preamble{#1}%
  \@nameuse{@@makes#1head}{#2}%
  \use@preamble{#1@u}%
}
\newcommand*{\scr@@makeschapterhead}[2]{%
  \@tempskipa=\glueexpr \csname scr@#1@beforeskip\endcsname\relax\relax
  \csname scr@#1@afterindent\endcsname
  {\@afterindenttrue}{\@afterindentfalse}{%
    \ifdim\@tempskipa<\z@\@tempskipa-\@tempskipa\else
      \expandafter\ifnum\scr@v@is@ge{3.22}\@afterindenttrue\fi
    \fi
  }%
  \chapterheadstartvskip
  {%
    \let\IfUseNumber\@secondoftwo
    \ExecuteDoHook{heading/begingroup/#1}%
    \if@chapterprefix
      \let\IfUsePrefixLine\@firstoftwo
    \else
      \let\IfUsePrefixLine\@secondoftwo
    \fi
    \setlength{\parindent}{\z@}\setlength{\parfillskip}{\z@ plus 1fil}%
    \normalfont\usekomafont{disposition}{%
      \usekomafont{#1}{%
        \raggedchapter
        \IfUsePrefixLine{%
          \chapterlineswithprefixformat{#1}%
          {}%
          {\interlinepenalty \@M#2\@@par}%
        }{%
          \chapterlinesformat{#1}%
          {}%
          {\interlinepenalty \@M#2\@@par}%
        }%
      }%
    }%
    \ExecuteDoHook{heading/endgroup/#1}%
  }%
  \nobreak\par\nobreak
  \@tempskipa=\glueexpr \csname scr@#1@afterskip\endcsname\relax\relax
  \chapterheadendvskip
}
\newcommand{\chapterlinesformat}[3]{%
  \@hangfrom{#2}{#3}%
}
\newcommand{\chapterlineswithprefixformat}[3]{%
  #2#3%
}
\newcommand*{\use@chapter@o@preamble}[1]{%
  {%
    \settoheight{\@tempdima}{%
      \@tempskipa=\glueexpr \csname scr@#1@beforeskip\endcsname\relax\relax
      \ifdim\@tempskipa<\z@\@tempskipa-\@tempskipa\fi
      \vbox{\chapterheadstartvskip}%
    }%
    \settodepth{\@tempdimb}{%
      \@tempskipa=\glueexpr \csname scr@#1@beforeskip\endcsname\relax\relax
      \ifdim\@tempskipa<\z@\@tempskipa-\@tempskipa\fi
      \vbox{\chapterheadstartvskip}%
    }%
    \addtolength{\@tempdima}{\@tempdimb}%
    \setbox\z@\vbox{%
      \use@preamble{#1@o}%
    }%
    \setlength{\@tempdimb}{\ht0}%
    \addtolength{\@tempdimb}{\dp0}%
    \vbox to \z@{%
      \vskip-\baselineskip
      \vbox to \@tempdima{%
        \vfill
        \box\z@
      }%
      \vss
    }\vskip-\parskip\vskip-\baselineskip
    \ifdim \@tempdimb>\@tempdima%
      \addtolength{\@tempdimb}{-\@tempdima}%
      \ifdim\@tempdimb<\vfuzz
        \ClassInfo{\KOMAClassName}{%
          preamble before #1 is \the\@tempdimb\space to high.\MessageBreak
          Tolerated without warning because of\MessageBreak
          \string\vfuzz\space = \the\vfuzz\space >= \the\@tempdimb
        }%
      \else
      \ClassWarning{\KOMAClassName}{%
        preamble before #1 is \the\@tempdimb\space to high.\MessageBreak
        To avoid the overfull \string\vbox\space you may
        change\MessageBreak
        the `beforeskip' value using
        \string\RedeclareSectionCommand\MessageBreak
        at the preamble of your document.\MessageBreak
        You may also change \string\setchapterpreamble\MessageBreak
        before the command, which generates the message
        about\MessageBreak
        an overfull \string\vbox
      }%
      \fi
    \fi%
  }%
}
\newcommand*{\addchaptertocentry}[2]{%
  \addtocentrydefault{chapter}{#1}{#2}%
  \if@chaptertolists
    \doforeachtocfile{%
      \Iftocfeature{\@currext}{chapteratlist}{%
        \addxcontentsline{\@currext}{chapteratlist}[{#1}]{#2}%
      }{}%
    }%
    \@ifundefined{float@addtolists}{}{\scr@float@addtolists@warning}%
  \fi
}
\newcommand\addchap{%
  \SecDef\@addchap\@saddchap
}%
\newcommand*{\@addchap}{}%
\long\def\@addchap[#1]#2{%
  \edef\reserved@a{%
    \unexpanded{%
      \chapter[{#1}]{#2}%
      \c@secnumdepth=
    }\the\c@secnumdepth\relax
  }%
  \c@secnumdepth=\numexpr \chapternumdepth-1\relax
  \reserved@a
}
\newcommand{\@saddchap}[1]{%
  \chapter*{#1}%
  \addchapmark{}%
}%
\newcommand*{\raggedchapterentry}{}
\newcommand*{\l@chapteratlist}{\l@chapter}
\newcounter{chapter}
\renewcommand*{\thechapter}{\@arabic\c@chapter}
\newcommand*{\chapterformat}{%
  \mbox{\chapappifchapterprefix{\nobreakspace}\thechapter\autodot
    \IfUsePrefixLine{}{\enskip}}%
}
\newcommand*\chaptermarkformat{\chapappifchapterprefix{\ }%
  \thechapter\autodot\enskip}
\newcommand*\chaptername{Chapter}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\chaptername{Chapter}
\newcommand*\appendixname{Appendix}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\appendixname{Appendix}
\newcommand*{\chapappifchapterprefix}[1]{%
  \IfChapterUsesPrefixLine{\chapapp#1}{}%
}
\newcommand*{\IfChapterUsesPrefixLine}{%
  \if@chapterprefix\expandafter\@firstoftwo\else\expandafter\@secondoftwo\fi
}
\newcommand*{\chapapp}{\@chapapp}
\newcommand*\@chapapp{\chaptername}
\newcommand*\chaptermark[1]{}
\newcommand*\addchapmark[1]{%
  \begingroup
    \expandafter\let\csname if@mainmatter\expandafter\endcsname
    \csname iffalse\endcsname
    \c@secnumdepth=\numexpr \chapternumdepth-1\relax
    \chaptermark{#1}%
  \endgroup
}
\newcommand*{\raggedchapter}{\raggedsection}
\newkomafont{chapterentry}{\usekomafont{disposition}}
\newkomafont{chapterentrypagenumber}{}
\newkomafont{chapterentrydots}{}
\newcommand\addsec{\SecDef\@addsec\@saddsec}
\newcommand*{\@addsec}{}
\def\@addsec[#1]#2{%
  \edef\reserved@a{%
    \unexpanded{%
      \section[{#1}]{#2}%
      \c@secnumdepth=
    }\the\c@secnumdepth\relax
  }%
  \c@secnumdepth=\numexpr \sectionnumdepth-1\relax
  \reserved@a
}
\newcommand*{\@saddsec}[1]{%
  \section*{#1}\addsecmark{}%
}
\newkomafont{minisec}{}
\newcommand\minisec[1]{%
  \expandafter\ifnum\scr@v@is@lt{3.13a}\relax
    \@afterindentfalse \vskip 1.5ex
  \else
    \if@noskipsec \leavevmode \fi
    \par
    \@afterindentfalse
    \if@nobreak
      \everypar{}%
    \else
      \addpenalty\@secpenalty\addvspace{1.5ex}%
    \fi
  \fi
  {\parindent \z@
    \expandafter\ifnum\scr@v@is@gt{2.96}\relax
      \setlength{\parfillskip}{\z@ plus 1fil}\fi
    \raggedsection\normalfont\sectfont\nobreak
    \usekomafont{minisec}{\nobreak\interlinepenalty \@M #1\par\nobreak}%
  }\nobreak
  \@afterheading
}
\newcommand*{\addsectiontocentry}[2]{%
  \addtocentrydefault{section}{#1}{#2}%
}
\newcommand*{\addsubsectiontocentry}[2]{%
  \addtocentrydefault{subsection}{#1}{#2}%
}
\newcommand*{\addparagraphtocentry}[2]{%
  \addtocentrydefault{paragraph}{#1}{#2}%
}
\newcommand*{\addsubparagraphtocentry}[2]{%
  \addtocentrydefault{subparagraph}{#1}{#2}%
}
\newcounter{section}[chapter]
\renewcommand*\thesection{%
  \thechapter.%
  \@arabic\c@section
}
\newcommand*\sectionmarkformat{\thesection\autodot\enskip}
\newcounter{subsection}[section]
\renewcommand*{\thesubsection}{\thesection.\@arabic\c@subsection}
\newcounter{subsubsection}[subsection]
\renewcommand*{\thesubsubsection}{%
  \thesubsection.\@arabic\c@subsubsection
}
\newcounter{paragraph}[subsubsection]
\renewcommand*{\theparagraph}{\thesubsubsection.\@arabic\c@paragraph}
\newcounter{subparagraph}[paragraph]
\renewcommand*{\thesubparagraph}{%
  \theparagraph.\@arabic\c@subparagraph
}
\newcommand*{\othersectionlevelsformat}[3]{#3\autodot\enskip}
\renewcommand*{\@seccntformat}[1]{%
  \expandafter\ifnum\scr@v@is@lt{3.17}\relax
    \protect\othersectionlevelsformat{#1}{%
      \expandafter\aftergroup\noexpand\@gobble}{\csname the#1\endcsname}%
  \else
    \scr@ifundefinedorrelax{#1format}{%
      \protect\othersectionlevelsformat{#1}{%
        \expandafter\aftergroup\noexpand\@gobble}{\csname the#1\endcsname}%
    }{\expandafter\protect\csname #1format\endcsname}%
  \fi
}
\newcommand*\addsecmark[1]{%
  \begingroup
    \c@secnumdepth=\numexpr \sectionnumdepth-1\relax
    \sectionmark{#1}%
  \endgroup
}
\DeclareSectionCommand[%
  style=chapter,%
  level=\z@,%
  pagestyle=plain,%
  tocstyle=chapter,%
  tocindent=\z@,%
  tocnumwidth=1.5em%
]{chapter}
\DeclareSectionCommand[%
  style=section,%
  level=1,%
  indent=\z@,%
  beforeskip=-3.5ex \@plus -1ex \@minus -.2ex,%
  afterskip=2.3ex \@plus.2ex,%
  tocstyle=section,%
  tocindentfollows=chapter,%
  tocindent=1.5em,%
  tocnumwidth=2.3em%
]{section}
\DeclareSectionCommand[%
  style=part,%
  level=\m@ne,%
  pagestyle=plain,%
  tocstyle=part,%
  toclevel=\m@ne,%
  tocindent=\z@,%
  tocnumwidth=2em%
]{part}
\DeclareSectionCommand[%
  style=section,%
  level=2,%
  indent=\z@,%
  beforeskip=-3.25ex\@plus -1ex \@minus -.2ex,%
  afterskip=1.5ex \@plus .2ex,%
  tocstyle=section,%
  tocindent=3.8em,%
  tocnumwidth=3.2em%
]{subsection}
\DeclareSectionCommand[%
  style=section,%
  level=3,%
  indent=\z@,%
  beforeskip=-3.25ex\@plus -1ex \@minus -.2ex,%
  afterskip=1.5ex \@plus .2ex,%
  tocstyle=section,%
  tocindent=7.0em,%
  tocnumwidth=4.1em%
]{subsubsection}
\DeclareSectionCommand[%
  style=section,%
  level=4,%
  indent=\z@,%
  beforeskip=3.25ex \@plus1ex \@minus.2ex,%
  afterskip=-1em,%
  tocindentfollows=subsubsection,%
  tocstyle=section,%
  tocindent=10em,%
  tocnumwidth=5em%
]{paragraph}
\DeclareSectionCommand[%
  style=section,%
  level=5,%
  indent=\scr@parindent,%
  beforeskip=3.25ex \@plus1ex \@minus .2ex,%
  afterskip=-1em,%
  tocstyle=section,%
  tocindent=12em,%
  tocnumwidth=6em%
]{subparagraph}
\expandafter\ifnum\scr@v@is@lt{3.15}\relax
  \let\scr@subparagraph@sectionindent\parindent
\else
  \def\scr@subparagraph@sectionindent{\scr@parindent}%
\fi
\newcommand*{\scr@fnt@disposition}{\sectfont}
\aliaskomafont{sectioning}{disposition}
%%% From File: $Id: scrkernel-miscellaneous.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\@addtoreset{equation}{chapter}
\renewcommand*{\theequation}{%
    \thechapter.%
  \@arabic\c@equation
}

\newif\if@restonecol
\newcommand{\dictum}[2][]{\par%
  \begingroup
    \raggeddictum\parbox{\dictumwidth}{%
      {\@dictumfont{\raggeddictumtext #2\strut\par}%
        \def\@tempa{#1}\ifx\@tempa\@empty\else%
          {\raggeddictumtext\dictumrule}%
          \raggeddictumauthor\@dictumauthorfont\dictumauthorformat{#1}%
          \strut\par%
        \fi%
      }%
    }\par%
  \endgroup
}
\newcommand*{\dictumrule}{\vskip-1ex\hrulefill\par}%
\newcommand*{\dictumwidth}{.3333\textwidth}
\newcommand*{\raggeddictum}{\raggedleft}
\newcommand*{\dictumauthorformat}[1]{(#1)}
\newcommand*{\raggeddictumtext}{\raggedright}
\newcommand*{\raggeddictumauthor}{\raggedleft}
\newkomafont{dictum}{\normalfont\normalcolor\@gr@gsffamily\small}
\newkomafont{dictumauthor}{\itshape}
\aliaskomafont{dictumtext}{dictum}
\setlength{\skip\@mpfootins}{\skip\footins}
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\newcommand*{\new@tpo@label}{\@newl@bel{tpo}}
\AtBeginDocument{%
  \if@filesw
    \immediate\write\@auxout{%
      \string\providecommand*\string\new@tpo@label[2]{}%
    }%
  \fi
}
\newcommand*{\scr@tpo}{0}
\newcommand*{\is@thispageodd}[1][\is@thispageodd@setlabel]{%
  \@bsphack
  \begingroup
    \@tempcnta=\scr@tpo
    \advance\@tempcnta by\@ne
    \xdef\scr@tpo{\the\@tempcnta}%
    \expandafter\ifx\csname tpo@\scr@tpo\endcsname\relax
      \protect\G@refundefinedtrue
      \ClassWarning{\KOMAClassName}{%
        odd/even page label number \scr@tpo\space undefined}%
      \edef\@tempa{\the\value{page}}%
    \else
      \edef\@tempa{\csname tpo@\scr@tpo\endcsname}%
    \fi
    \ifodd\number\@tempa
      \aftergroup\thispagewasoddtrue
    \else
      \aftergroup\thispagewasoddfalse
    \fi
  \endgroup
  \edef\is@thispageodd@setlabel{%
    \if@filesw
      \unexpanded{\protected@write\@auxout{\let\arabic\relax}}{%
        \noexpand\string
        \noexpand\new@tpo@label{\scr@tpo}{\noexpand\arabic{page}}}%
    \fi
    \noexpand\def\noexpand\is@thispageodd@setlabel
    {\unexpanded\expandafter{\is@thispageodd@setlabel}}%
  }%
  #1%
  \@esphack
}
\newcommand*{\is@thispageodd@setlabel}{}
\newif\ifthispagewasodd
\providecommand*{\ifthispageodd}{%
  \ClassWarning{\KOMAClassName}{%
    Usage of deprecated command
    `\string\ifthispageodd'.\MessageBreak
    The command has been renamed because of a\MessageBreak
    recommendation of The LaTeX Project Team.\MessageBreak
    Please replace `\string\ifthispageodd' by `\string\Ifthispageodd'%
  }%
  \Ifthispageodd
}
\newcommand{\Ifthispageodd}{%
  \is@thispageodd
  \ifthispagewasodd
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
}
\newcommand\marginline[1]{%
  \marginpar[\raggedleft{#1}]{\raggedright #1}%
}
\scr@ifundefinedorrelax{textsubscript}{%
  \DeclareRobustCommand*\textsubscript[1]{%
    \@textsubscript{\selectfont#1}%
  }%
}{%
  \scr@ifundefinedorrelax{textsubscript }{%
    \DeclareRobustCommand*\textsubscript[1]{%
      \@textsubscript{\selectfont#1}%
    }%
  }{}%
}
\providecommand*{\@textsubscript}[1]{%
  {\m@th\ensuremath{_{\mbox{\fontsize\sf@size\z@#1}}}}%
}
\providecommand*{\scr@endstrut}{\unskip\ifhmode\nobreak\strut\fi}
\newcommand*{\scr@package@not@recommended}[2]{%
  \scr@ifundefinedorrelax{class@shoulddisablepackagewarning@list}{%
    \@firstofone
  }{%
    \edef\reserved@a{%
      \noexpand\in@{#1}{\class@shoulddisablepackagewarning@list}}%
    \reserved@a
    \ifin@\expandafter\@gobble\else\expandafter\@firstofone\fi
  }{%
    \BeforePackage{#1}{%
      \ClassWarning{\KOMAClassName}{%
        Usage of package `#1' together\MessageBreak
        with a KOMA-Script class is not recommended.\MessageBreak
        \if\relax\detokenize{#2}\relax\else
          I'd suggest to use #2.\MessageBreak
        \fi
        Nevertheless, using requested\MessageBreak
        package `#1'%
      }%
    }%
  }%
}%
\scr@package@not@recommended{emptypage}{%
  option\MessageBreak
  `cleardoublepage' with one of it's\MessageBreak
  several values}
\scr@package@not@recommended{fancyhdr}{%
  \MessageBreak
  package `scrlayer' or `scrlayer-scrpage', because\MessageBreak
  they support KOMA-Script classes.\MessageBreak
  With `fancyhdr' several features of class `\KOMAClassName'\MessageBreak
  like options `headsepline', `footsepline' or command\MessageBreak
  `\string\MakeMarkcase' and the commands `\string\setkomafont' and\MessageBreak
  `\string\addtokomafont' for the page style elements need\MessageBreak
  explicite user intervention to work}
\scr@package@not@recommended{minitoc}{}
\scr@package@not@recommended{multitoc}{%
  package `multicol' and, e.g.:\MessageBreak
  \space\space
  \string\BeforeStartingTOC{\string\begin{multicols}{2}}\MessageBreak
  \space\space
  \string\AfterStartingTOC{\string\end{multicols}}\MessageBreak
  to make all ToCs two-columned.\MessageBreak
  \@ifpackagelater{2018/07/18}{}{%
    Note, package `multitoc' breaks additional\MessageBreak
    ToCs generated by `\string\DeclareNewTOC' or\MessageBreak
    packages like `listings' or `newcaption' and\MessageBreak
    even the standard table of contents,\MessageBreak
    list of figures or list of tables,\MessageBreak
    if you omit the corresponding options `toc',\MessageBreak
    `lof' or `lot'.%
  }%
}
\scr@package@not@recommended{parskip}{%
  option\MessageBreak
  `parskip' with one of it's several values}
\scr@package@not@recommended{titleps}{%
  package `scrlayer-scrpage'}
\scr@package@not@recommended{titlesec}{%
  KOMA-Script features\MessageBreak
  like \string\setkomafont, \string\RedeclareSectionCommand,
  \string\sectionlinesformat\MessageBreak
  and several others to re-configure section\MessageBreak
  headings}
\AfterPackage*{sectsty}{%
  \@ifpackagelater{sectsty}{2002/02/26}{%
    \ClassInfo{\KOMAClassName}{Unknown `sectsty' release.\MessageBreak
      Cross your fingers, that is compatible%
    }%
  }{%
    \ClassWarning{\KOMAClassName}{%
      Incompatible package `sectsty' loaded!\MessageBreak
      Package `sectsty' up to version 2.0.2 is incompatible\MessageBreak
      with KOMA-Script from version 2.8e released in 2001.\MessageBreak
      You should avoid that package and configure the\MessageBreak
      section titles of your document using the KOMA-Script\MessageBreak
      user interface, e.g., \string\chapterlinesformat,\MessageBreak
      \string\RedeclareSectionCommand\space etc. or you should ask\MessageBreak
      the `sectsty' maintainer for a more compatible release.\MessageBreak
      Ignoring this warning could result in several error\MessageBreak
      messages and formatting issues after loading package\MessageBreak
      `sectsty'%
    }%
  }%
}
\scr@package@not@recommended{tocbibind}{%
  options like `listof=totoc'\MessageBreak
  or `bibliography=totoc', or commands like\MessageBreak
  `\string\setuptoc{toc}{totoc}' instead of this package,\MessageBreak
  because it breaks several KOMA-Script features of\MessageBreak
  the list of figures, list of tables, bibliography,\MessageBreak
  index and the running head%
}
\scr@package@not@recommended{tocloft}{%
  options like `listof=entryprefix',\MessageBreak
  commands like `\string\listoflofentryname' or\MessageBreak
  `\string\listoflotentryname',
  and `\string\DeclareTOCStyleEntry' or\MessageBreak
  `\string\RedeclareSectionCommand'
  instead of this package,\MessageBreak
  because it breaks several KOMA-Script features of\MessageBreak
  the list of figures, list of tables and table of\MessageBreak
  contents, i.e., options like `listof=numbered',\MessageBreak
  `listof=flat or `toc=flat', commands like\MessageBreak
  `\string\BeforeTOCHead{...}' and
  `\string\AfterTOCHead{...}',\MessageBreak
  `\string\BeforeStartingTOC{...}' and
  \string\AfterStartingTOC{...}',\MessageBreak
  all features of  `\string\DeclareTOCStyleEntry',\MessageBreak
  and the ToC entry features of `\string\DeclareSecionCommand'\MessageBreak
  and `\string\RedeclareSectionCommand' of levels\MessageBreak
  `part',
  `section', `subsection',\MessageBreak
  `subsubsection', `paragraph' and `subparagraph'%
}
\BeforePackage{minitoc}{%
  \let\scr@mt@saved@sect\@sect
}
\AfterPackage{minitoc}{%
  \def\@tempa#1#2#3#4#5#6[#7]#8{%
    \ifnum #2<1 \relax
      \addtocontents{toc}{\protect\sectbegin}
    \fi
    \stc@sect{#1}{#2}{#3}{#4}{#5}{#6}[{#7}]{#8}%
  }%
  \ifx\@sect\@tempa
    \def\@tempa#1#2#3#4#5#6[#7]#8{
      \expandafter
      \ifx\csname #1\endcsname\section\relax
        \addcontentsline{lof}{xsect}{#7}%
        \addcontentsline{lot}{xsect}{#7}%
      \fi
      \ifx\csname #1\endcsname\starsection\relax
        \addcontentsline{lof}{xsect}{#7}%
        \addcontentsline{lot}{xsect}{#7}%
      \fi
      \ifnum #2>\c@secnumdepth\relax
        \let\@svsec\@empty
      \else
        \refstepcounter{#1}%
        \edef\@svsec{\csname the#1\endcsname\hskip 1em}%
      \fi
      \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@
        \begingroup #6\relax
          \@hangfrom{\hskip #3\relax\@svsec}%
          {\interlinepenalty \@M #8\par}%
        \endgroup
        \csname #1mark\endcsname{#7}%
        \addcontentsline{toc}{#1}{%
          \ifnum #2>\c@secnumdepth\relax
          \else
            \protect\numberline{\csname the#1\endcsname}%
          \fi
          #7%
        }%
      \else
        \def\@svsechd{#6\hskip #3\relax
          \@svsec #8\csname #1mark\endcsname{#7}%
          \addcontentsline{toc}{#1}{%
            \ifnum #2>\c@secnumdepth\relax
            \else
              \protect\numberline{\csname the#1\endcsname}
            \fi
            #7}%
        }%
      \fi
      \@xsect{#5}%
    }%
    \ifx\stc@sect\@tempa
      \ClassWarning{\KOMAClassName}{%
        Redefining minitoc's internal command
        `\string\stc@sect'\MessageBreak
        to prevent minitoc to destroy several features\MessageBreak
        of KOMA-Script%
      }%
      \let\stc@sect\scr@mt@saved@sect
    \else
      \ClassInfo{\KOMAClassName}{%
        Deactivating the `minitoc' workaround,\MessageBreak
        because of unexpected definition of\MessageBreak
        `\string\stc@sect'%
      }%
      \let\scr@mt@saved@sect\relax
    \fi
  \else
    \ifx\@sect\scr@mt@saved@sect
      \ClassInfo{\KOMAClassName}{%
        Deactivating the `minitoc' workaround for
        `\string\@sect',\MessageBreak
        because it is not needed%
      }%
    \else
      \ClassInfo{\KOMAClassName}{%
        Deactivating the `minitoc' workaround,\MessageBreak
        because of unexpected definition of\MessageBreak
        `\string\@sect'%
      }%
    \fi
    \let\scr@mt@saved@sect\relax
  \fi
}
%%% From File: $Id: scrkernel-pagestyles.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*{\set@tempdima@hw}{%
  \setlength{\@tempdima}{\textwidth}%
  \if@mincl
    \addtolength{\@tempdima}{\marginparsep}%
    \addtolength{\@tempdima}{\marginparwidth}%
  \fi
}
\newcommand*{\pnumfont}{\normalfont\normalcolor}
\newcommand*{\headfont}{\normalfont\normalcolor\slshape}
\newcommand*{\footfont}{}
\newcommand*{\scr@fnt@pagenumber}{\pnumfont}
\aliaskomafont{pagination}{pagenumber}
\newcommand*{\scr@fnt@pageheadfoot}{\headfont}
\aliaskomafont{pagehead}{pageheadfoot}
\newcommand*{\scr@fnt@pagefoot}{\footfont}
\newcommand*{\scr@fnt@wrn@pagefoot}[1]{%
  This class does not use font element `pagefoot'!\MessageBreak
  Maybe you should load package `scrlayer-scrpage',\MessageBreak
  before using this element%
}
\newcommand*{%
  \pagemark
}{%
  {\usekomafont{pagenumber}{%
    \thepage}}}
\renewcommand*{\ps@plain}{%
  \renewcommand*{\@oddhead}{}%
  \let\@evenhead\@oddhead
  \renewcommand*{\@evenfoot}{%
    \set@tempdima@hw\hss\hb@xt@ \@tempdima{\vbox{%
        \if@fsl \hrule \vskip 3\p@ \fi
        \hb@xt@ \@tempdima{{\pagemark\hfil}}}}}%
  \renewcommand*{\@oddfoot}{%
    \set@tempdima@hw\hb@xt@ \@tempdima{\vbox{%
        \if@fsl \hrule \vskip 3\p@ \fi
        \hb@xt@ \@tempdima{{\hfil\pagemark
            \if@twoside\else\hfil\fi}}}}\hss}%
}%
\newcommand*{\ps@headings}{\let\@mkboth\markboth
  \renewcommand*{\@evenhead}{%
    \set@tempdima@hw\hss\hb@xt@ \@tempdima{\vbox{%
        \hb@xt@ \@tempdima{{\headfont\strut\leftmark\hfil}}%
        \if@hsl \vskip 1.5\p@ \hrule \fi}}}%
  \renewcommand*{\@oddhead}{%
    \set@tempdima@hw\hb@xt@ \@tempdima{\vbox{%
        \hb@xt@ \@tempdima{{\headfont\hfil\strut\rightmark
            \if@twoside\else\hfil\fi}}%
        \if@hsl \vskip 1.5\p@ \hrule \fi}}\hss}%
  \renewcommand*{\@evenfoot}{%
    \set@tempdima@hw\hss\hb@xt@ \@tempdima{\vbox{%
        \if@fsl \hrule \vskip 3\p@ \fi
        \hb@xt@ \@tempdima{{\pagemark\hfil}}}}}%
  \renewcommand*{\@oddfoot}{%
    \set@tempdima@hw\hb@xt@ \@tempdima{\vbox{%
        \if@fsl \hrule \vskip 3\p@ \fi
        \hb@xt@ \@tempdima{{\hfil\pagemark
            \if@twoside\else\hfil\fi}}}}\hss}%
  \renewcommand*{\chaptermark}[1]{%
    \if@twoside\expandafter\markboth\else\expandafter\markright\fi
    {\MakeMarkcase{\Ifnumbered{chapter}{%
          \chaptermarkformat
      }{}##1}%
    }{}%
  }%
  \renewcommand*{\sectionmark}[1]{%
    \if@twoside
      \markright{\MakeMarkcase{\Ifnumbered{section}{\sectionmarkformat}{}%
        ##1}}%
    \fi
  }%
}%
\newcommand*{\ps@myheadings}{\let\@mkboth\@gobbletwo
  \renewcommand*{\@evenhead}{%
    \set@tempdima@hw\hss\hb@xt@ \@tempdima{\vbox{%
        \hb@xt@ \@tempdima{{\headfont\strut\leftmark\hfil}}%
        \if@hsl \vskip 1.5\p@ \hrule \fi}}}%
  \renewcommand*{\@oddhead}{%
    \set@tempdima@hw\hb@xt@ \@tempdima{\vbox{%
        \hb@xt@ \@tempdima{{\headfont\hfil\strut\rightmark
            \if@twoside\else\hfil\fi}}%
        \if@hsl \vskip 1.5\p@ \hrule \fi}}\hss}%
  \renewcommand*{\@evenfoot}{%
    \set@tempdima@hw\hss\hb@xt@ \@tempdima{\vbox{%
        \if@fsl \hrule \vskip 3\p@ \fi
        \hb@xt@ \@tempdima{{\pagemark\hfil}}}}}%
  \renewcommand*{\@oddfoot}{%
    \set@tempdima@hw\hb@xt@ \@tempdima{\vbox{%
        \if@fsl \hrule \vskip 3\p@ \fi
        \hb@xt@ \@tempdima{{\hfil\pagemark
            \if@twoside\else\hfil\fi}}}}\hss}%
  \renewcommand*{\chaptermark}[1]{}%
  \renewcommand*{\sectionmark}[1]{}%
}
\newcommand*{\titlepagestyle}{plain}
\newcommand*{\indexpagestyle}{plain}
\pagestyle{plain}
\pagenumbering{arabic}
%%% From File: $Id: scrlayer.dtx 3894 2022-06-19 10:25:46Z kohm $
%%%            (run: body)
\providecommand*{\@mkleft}{%
  \IfActiveMkBoth{\markleft}{\@gobble}%
}%
\providecommand*{\@mkright}{%
  \IfActiveMkBoth{\markright}{\@gobble}%
}%
\providecommand{\@mkdouble}[1]{%
  \@mkboth{#1}{#1}%
}
%%% From File: $Id: scrkernel-floats.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newlength{\abovecaptionskip}
\newlength{\belowcaptionskip}
\setlength{\abovecaptionskip}{10\p@}
\setlength{\belowcaptionskip}{0\p@}
\newcommand*{\captionformat}{:\ }
\newcommand{\scr@caption}{}
\AtBeginDocument{\let\scr@caption\caption}
\newcommand{\captionabove}{\@captionabovetrue\scr@caption}
\newcommand{\captionbelow}{\@captionabovefalse\scr@caption}
\newcommand*{\scap@caption}{}
\newcommand*{\scap@width}{\linewidth}
\newcommand*{\scap@move}{\z@}
\newif\ifscap@alt
\newcommand*{\scap@currentlabel}{}
\newcommand*{\@captionbeside}{}
\long\def\@captionbeside[#1]#2{%
  \kernel@ifnextchar [%]
    {\@@captionbeside[{#1}]{#2}}
    {\c@pti@nb@sid@[{#1}]{#2}}%
}
\newcommand*{\@@captionbeside}{}
\long\def\@@captionbeside[#1]#2[#3]{%
  \def\scap@pos{#3}%
  \kernel@ifnextchar [%]
    {\@@@captionbeside[{#1}]{#2}}
    {\c@pti@nb@sid@[{#1}]{#2}}%
}
\newcommand*{\@@@captionbeside}{}
\long\def\@@@captionbeside[#1]#2[#3]{%
  \def\scap@width{#3}%
  \kernel@ifnextchar [%]
    {\@@@@captionbeside[{#1}]{#2}}
    {\setlength{\@tempdima}{#3}%
      \addtolength{\@tempdima}{-\linewidth}%
      \setlength{\@tempdima}{-.5\@tempdima}%
      \edef\scap@move{\the\@tempdima}%
      \c@pti@nb@sid@[{#1}]{#2}}%
}
\newcommand*{\@@@@captionbeside}{}
\long\def\@@@@captionbeside[#1]#2[#3]{%
  \def\scap@move{#3}%
  \kernel@ifstar
    {\scap@alttrue\c@pti@nb@sid@[{#1}]{#2}}
    {\scap@altfalse\c@pti@nb@sid@[{#1}]{#2}}%
}
\newbox\c@pti@nb@sid@b@x
\newcommand{\c@pti@nb@sid@}{}
\long\def\c@pti@nb@sid@[#1]#2{%
  \def\scap@caption{%
    \if c\scap@valign
      \setlength{\abovecaptionskip}{\z@}%
    \else \if t\scap@valign
        \setlength{\abovecaptionskip}{-\ht\strutbox}%
      \else \if b\scap@valign
          \setlength{\abovecaptionskip}{\z@}%
        \fi
      \fi
    \fi
    \setlength{\belowcaptionskip}{-\dp\strutbox}%
    \captionbelow[{#1}]{#2}%
  }%
  \begin{lrbox}{\c@pti@nb@sid@b@x}%
}
\newenvironment*{captionbeside}{%
  \@dblarg\@captionbeside
}{%
  \end{lrbox}%
  \settowidth{\@tempdima}{\usebox\c@pti@nb@sid@b@x}%
  \setlength{\@tempdimb}{\scap@width}%
  \addtolength{\@tempdimb}{-\@tempdima}%
  \addtolength{\@tempdimb}{-\columnsep}%
  \ifdim \@tempdimb<2em
    \ClassWarning{\KOMAClassName}{%
      caption beside will be very, very small.\MessageBreak
      In most cases this will result in overfull and\MessageBreak
      underfull \string\hbox\space messages%
    }%
  \fi
  \onelinecaptionsfalse
  \setcapwidth[r]{\@tempdimb}%
  \let\@tempa\scap@pos
  \setlength{\@tempdimc}{\scap@move}%
  \if i\scap@pos\def\@tempa{l}\fi
  \if o\scap@pos\def\@tempa{r}\fi
  \if@twoside
    \Ifthispageodd{}{%
      \if o\scap@pos\def\@tempa{l}\fi
      \if i\scap@pos\def\@tempa{r}\fi
      \ifscap@alt
        \addtolength{\@tempdimc}{\scap@width}%
        \addtolength{\@tempdimc}{-\linewidth}%
        \setlength{\@tempdimc}{-\@tempdimc}%
      \fi
    }%
  \fi
  \hspace*{\@tempdimc}%
  \if l\@tempa
    \rlap{%
      \parbox[\scap@valign]{\@tempdimb}{\scap@caption
        \global\let\scap@currentlabel\@currentlabel}%
      \nobreak\hskip\columnsep
      \parbox[\scap@valign]{\wd\c@pti@nb@sid@b@x}{\usebox\c@pti@nb@sid@b@x}%
    }%
  \else
    \rlap{%
      \parbox[\scap@valign]{\wd\c@pti@nb@sid@b@x}{\usebox\c@pti@nb@sid@b@x}%
      \nobreak\hskip\columnsep
      \parbox[\scap@valign]{\@tempdimb}{\scap@caption
        \global\let\scap@currentlabel\@currentlabel}%
    }%
  \fi
  \par
  \aftergroup\let\aftergroup\@currentlabel
  \aftergroup\scap@currentlabel
}
\newcommand*\capfont{\normalfont\normalcolor}
\newcommand*\caplabelfont{\normalfont\normalcolor}
\newcommand*{\scr@fnt@caption}{\capfont}
\newcommand*{\scr@fnt@captionlabel}{\caplabelfont}
\newif\ifdofullc@p
\dofullc@ptrue
\newif\if@capbreak
\@capbreakfalse
\newcommand*{\setcapindent}{\kernel@ifstar{\@@setcapindent}{\@setcapindent}}
\newcommand*{\@setcapindent}[1]{%
  \setlength{\@tempdima}{#1}%
  \ifdim\@tempdima>\hsize
    \addtolength{\@tempdima}{-\hsize}\@capbreaktrue
  \else
    \@capbreakfalse
  \fi
  \edef\cap@indent{\the\@tempdima}%
  \dofullc@pfalse
}
\newcommand*{\@@setcapindent}[1]{%
  \setlength{\@tempdima}{#1}%
  \edef\cap@indent{\the\@tempdima}%
  \dofullc@pfalse\@capbreaktrue
}
\newcommand*{\setcaphanging}{\dofullc@ptrue\@capbreakfalse}
\newcommand{\@makecaption}[2]{%
  \if@captionabove
    \vskip\belowcaptionskip
  \else
    \vskip\abovecaptionskip
  \fi
  \@@makecaption\@firstofone{#1}{#2}%
  \if@captionabove
    \vskip\abovecaptionskip
  \else
    \vskip\belowcaptionskip
  \fi
}
\newcommand*{\cap@width}{\hsize}
\newcommand*{\cap@left}{\hfill}
\newcommand*{\cap@right}{\hfill}
\newcommand*{\setcapwidth}[2][]{%
  \begingroup%
    \setlength{\@tempdima}{#2}%
    \ifdim\@tempdima <\z@
      \@tempdima\z@
      \ClassWarning{\KOMAClassName}{%
        caption width less than 0pt not allowed.\MessageBreak
        Setting caption width to 0pt%
      }%
    \fi
    \edef\@tempa{\endgroup\def\noexpand\cap@width{\the\@tempdima}}%
  \@tempa
  \begingroup
    \edef\@tempa{#1}%
    \def\@tempb{c}\ifx\@tempa\@tempb
      \endgroup
      \def\cap@margin{\let\cap@left=\hfill\let\cap@right=\hfill}%
    \else
      \def\@tempb{l}\ifx\@tempa\@tempb
        \endgroup
        \def\cap@margin{\let\cap@left=\relax\let\cap@right\hfill}%
      \else
        \def\@tempb{r}\ifx\@tempa\@tempb
          \endgroup
          \def\cap@margin{\let\cap@left=\hfill\let\cap@right=\relax}%
        \else
          \def\@tempb{i}\ifx\@tempa\@tempb
            \endgroup
            \def\cap@margin{%
              \let\cap@left=\relax
              \let\cap@right=\hfill
              \if@twoside
                \Ifthispageodd{}{%
                  \let\cap@left=\hfill
                  \let\cap@right=\relax
                }%
              \fi
            }%
          \else
            \def\@tempb{o}\ifx\@tempa\@tempb
              \endgroup
              \def\cap@margin{%
                \let\cap@left=\hfill
                \let\cap@right=\relax
                \if@twoside
                  \Ifthispageodd{}{%
                    \let\cap@left=\relax
                    \let\cap@right=\hfill
                  }%
                \fi
              }%
            \else
              \ifx \@tempa\@empty\else
                \ClassError{\KOMAClassName}{%
                  unknown optional position argument%
                }{%
                  You've used `#1' as position argument at
                  \string\setcaptionwidth,\MessageBreak
                  but only ONE of `c', `l', `r', `i`, `o` ist
                  allowed.\MessageBreak
                  Argument will be ignored, if you'll continue.%
                }%
              \fi
              \endgroup
  \fi\fi\fi\fi\fi
}
\newcommand*{\setcapdynwidth}[2][]{%
  \def\cap@width{#2}%
  \begingroup
    \edef\@tempa{#1}%
    \def\@tempb{c}\ifx\@tempa\@tempb
      \endgroup
      \def\cap@margin{%
        \ifdim \cap@width<\z@
          \ClassWarning{\KOMAClassName}{%
            caption width less than 0pt not allowed.\MessageBreak
            Setting caption width to 0pt%
          }%
          \let\cap@width\z@
        \fi
        \let\cap@left=\hfill\let\cap@right=\hfill}%
    \else
      \def\@tempb{l}\ifx\@tempa\@tempb
        \endgroup
        \def\cap@margin{%
          \ifdim \cap@width<\z@
            \ClassWarning{\KOMAClassName}{%
              caption width less than 0pt not allowed.\MessageBreak
              Setting caption width to 0pt%
            }%
            \let\cap@width\z@
          \fi
          \let\cap@left=\relax\let\cap@right\hfill}%
      \else
        \def\@tempb{r}\ifx\@tempa\@tempb
          \endgroup
          \def\cap@margin{%
            \ifdim \cap@width<\z@
              \ClassWarning{\KOMAClassName}{%
                caption width less than 0pt not allowed.\MessageBreak
                Setting caption width to 0pt%
              }%
              \let\cap@width\z@
            \fi
            \let\cap@left=\hfill\let\cap@right=\relax}%
        \else
          \def\@tempb{i}\ifx\@tempa\@tempb
            \endgroup
            \def\cap@margin{%
              \ifdim \cap@width<\z@
                \ClassWarning{\KOMAClassName}{%
                  caption width less than 0pt not allowed.\MessageBreak
                  Setting caption width to 0pt%
                }%
                \let\cap@width\z@
              \fi
              \let\cap@left=\relax
              \let\cap@right=\hfill
              \if@twoside
                \Ifthispageodd{}{%
                  \let\cap@left=\hfill
                  \let\cap@right=\relax
                }%
              \fi
            }%
          \else
            \def\@tempb{o}\ifx\@tempa\@tempb
              \endgroup
              \def\cap@margin{%
                \ifdim \cap@width<\z@
                  \ClassWarning{\KOMAClassName}{%
                    caption width less than 0pt not allowed.\MessageBreak
                    Setting caption width to 0pt%
                  }%
                  \let\cap@width\z@
                \fi
                \let\cap@left=\hfill
                \let\cap@right=\relax
                \if@twoside
                  \Ifthispageodd{}{%
                    \let\cap@left=\relax
                    \let\cap@right=\hfill
                  }%
                \fi
              }%
            \else
              \ifx \@tempa\@empty\else
                \ClassError{\KOMAClassName}{%
                  unknown optional position argument%
                }{%
                  You've used `#1' as position argument at
                  \string\setcaptionwidth,\MessageBreak
                  but only ONE of `c', `l', `r', `i`, `o` ist
                  allowed.\MessageBreak
                  Argument will be ignored, if you'll continue.%
                }%
              \fi
              \endgroup
  \fi\fi\fi\fi\fi
}
\newcommand*{\cap@margin}{}
\let\cap@margin=\relax%
\newcommand*{\setcapmargin}{\kernel@ifstar{\@setcapmargin}{\@@setcapmargin}}
\newcommand*{\@setcapmargin}[2][\@tempdimb]{%
  \def\cap@margin{%
    \onelinecaptionsfalse
    \begingroup
      \setlength{\@tempdima}{\hsize}%
      \setlength{\@tempdimb}{#2}%
      \addtolength{\@tempdima}{-\@tempdimb}%
      \setlength{\@tempdimc}{#1}%
      \addtolength{\@tempdima}{-\@tempdimc}%
      \edef\@tempa{\endgroup
        \def\noexpand\cap@width{\the\@tempdima}%
        \noexpand\if@twoside
          \noexpand\Ifthispageodd{%
            \def\noexpand\cap@left{\noexpand\hspace*{\the\@tempdimc}}%
            \def\noexpand\cap@right{\noexpand\hspace*{\the\@tempdimb}}%
          }{%
            \def\noexpand\cap@right{\noexpand\hspace*{\the\@tempdimc}}%
            \def\noexpand\cap@left{\noexpand\hspace*{\the\@tempdimb}}%
          }%
        \noexpand\else
          \def\noexpand\cap@left{\noexpand\hspace*{\the\@tempdimc}}%
          \def\noexpand\cap@right{\noexpand\hspace*{\the\@tempdimb}}%
        \noexpand\fi
      }%
    \@tempa
  }%
}
\newcommand*{\@@setcapmargin}[2][\@tempdimb]{%
  \def\cap@margin{%
    \onelinecaptionsfalse
    \begingroup
      \setlength{\@tempdima}{\hsize}%
      \setlength{\@tempdimb}{#2}%
      \addtolength{\@tempdima}{-\@tempdimb}%
      \setlength{\@tempdimc}{#1}%
      \addtolength{\@tempdima}{-\@tempdimc}%
      \edef\@tempa{\endgroup
        \def\noexpand\cap@width{\the\@tempdima}%
        \def\noexpand\cap@left{\noexpand\hspace*{\the\@tempdimc}}%
        \def\noexpand\cap@right{\noexpand\hspace*{\the\@tempdimb}}%
      }%
    \@tempa
  }%
}
\newcommand{\@@makecaption}[3]{%
  \cap@margin
  \begingroup
    \ifonelinecaptions
      \def\stepcounter##1{\advance\value{##1}\@ne}%
      \let\refstepcounter\stepcounter
      \let\label\@gobble
      \let\@footnotetext=\@gobble
      \let\hypertarget\@gobbletwo
      \edef\@xnewline{%
        \unexpanded{\ClassInfo{\KOMAClassName}{%
            Workaround for not recommended usage of \string\\ or\MessageBreak
            \string\newline in caption text
          }%
          \hspace*{\linewidth}\hspace{1sp}%
        }%
        \unexpanded\expandafter{\@xnewline}%
      }%
      \edef\@xcentercr{%
        \unexpanded{\ClassInfo{\KOMAClassName}{%
            Workaround for not recommended usage of \string\\ or\MessageBreak
            \string\newline in caption text
          }%
          \hspace*{\linewidth}\hspace{1sp}%
        }%
        \unexpanded\expandafter{\@xcentercr}%
      }%
      \settowidth{\@tempdima}{\scr@@makesinglelinecaption{#1}{#2}{#3}}%
      \ifdim\@tempdima>\cap@width
        \aftergroup\scr@makemultilinecaption
      \else
        \aftergroup\scr@makesinglelinecaption
      \fi
    \else
      \aftergroup\scr@makemultilinecaption
    \fi
  \endgroup
  {#1}{#2}{#3}%
}
\newcommand{\scr@makesinglelinecaption}[3]{%
  {%
    \usefontofkomafont{caption}{%
      \hb@xt@\hsize{%
        \cap@left
        \scr@@makesinglelinecaption{#1}{#2}{#3}%
        \cap@right
      }\par\kern\dp\strutbox%
    }%
  }\kern-\dp\strutbox
}
\newcommand{\scr@@makesinglelinecaption}[3]{%
    \usekomafont{caption}{\strut\ignorespaces
      #1{{\usekomafont{captionlabel}{#2\captionformat}}}%
      \ignorespaces #3\unskip}%
}
\newcommand{\scr@makemultilinecaption}[3]{%
  {%
    \usefontofkomafont{caption}{%
      \hb@xt@\hsize{%
        \cap@left
        \vbox{\hsize\cap@width\linewidth\hsize
          \scr@ifundefinedorrelax{@captype}{%
            \ClassWarning{\KOMAClassName}{%
              `\string\caption' outside float.\MessageBreak
              Seems you are using `\string\caption' outside a
              float.\MessageBreak
              Maybe you are using a package that uses
              `\string\@makecaption'\MessageBreak
              without setting `\string\@captype' before.\MessageBreak
              Because I cannot detect the caption type, I'm using\MessageBreak
              the empty one.%
            }%
            \let\@captype\@empty
          }{}%
          \scr@ifundefinedorrelax{ragged\@captype caption}{\raggedcaption}{%
            \@nameuse{ragged\@captype caption}%
          }%
          \ifdofullc@p
            \@hangfrom{%
              \strut
              \scr@smashdp{%
                #1{%
                  \usekomafont{caption}{%
                    \usekomafont{captionlabel}{#2\captionformat}%
                  }%
                }%
              }%
            }%
            {\usekomafont{caption}{#3\scr@endstrut\par}}%
          \else
            \ifdim\cap@indent<\z@
              \strut
              #1{%
                \usekomafont{caption}{%
                  \usekomafont{captionlabel}{#2\captionformat\par}%
                }%
              }%
              \noindent{\usekomafont{caption}{%
                  \hspace*{-\cap@indent}#3\scr@endstrut\par
              }}%
            \else
              \if@capbreak
                \strut
                #1{%
                  \usekomafont{caption}{%
                    \usekomafont{captionlabel}{#2\captionformat\par}%
                  }%
                }%
                \noindent\@hangfrom{\hspace*{\cap@indent}}%
                {\usekomafont{caption}{#3\scr@endstrut\par}}%
              \else
                \@hangfrom{\scr@smashdp\strut\hspace*{\cap@indent}}%
                {%
                  \hspace{-\cap@indent}%
                  \scr@smashdp{%
                    #1{\usekomafont{caption}{%
                        \usekomafont{captionlabel}{#2\captionformat}%
                      }%
                    }%
                  }%
                  {\usekomafont{caption}{#3\scr@endstrut}\par}%
                }%
              \fi
            \fi
          \fi
        }%
        \cap@right
      }\par\kern\dp\strutbox
    }%
  }\kern-\dp\strutbox
}
\newcommand*\setcaptionalignment{%
  \kernel@ifnextchar [%]
    {\@setcaptionalignment}
    {%
      \scr@ifundefinedorrelax{@captype}{\@setcaptionalignment}{%
        \edef\reserved@a{\noexpand\@setcaptionalignment[{\@captype}]}\reserved@a
      }%
    }%
}%
\newcommand*\@setcaptionalignment[2][]{%
  \IfArgIsEmpty{#1}{}{%
    \expandafter\ifnum
    \scr@ifundefinedorrelax{#1}{0}{\scr@ifundefinedorrelax{end#1}{0}{1}}=0
      \ClassWarning{\KOMAClassName}{%
        float type `#1' defined not yet,\MessageBreak
        but setting ragged mode for captions of\MessageBreak
        float type `#1'%
      }%
    \fi
  }%
  \def\reserved@a{#2}%
  \Ifstr{\reserved@a}{j}{%
    \expandafter\let\csname ragged#1caption\endcsname\@empty
  }{%
    \Ifstr{\reserved@a}{l}{%
      \scr@ifundefinedorrelax{LaTeXraggedright}{%
        \expandafter\let\csname ragged#1caption\endcsname\raggedright
      }{%
        \expandafter\let\csname ragged#1caption\endcsname\LaTeXraggedright
      }%
    }{%
      \Ifstr{\reserved@a}{r}{%
        \scr@ifundefinedorrelax{LaTeXraggedleft}{%
          \expandafter\let\csname ragged#1caption\endcsname\raggedleft
        }{%
          \expandafter\let\csname ragged#1caption\endcsname\LaTeXraggedleft
        }%
      }{%
        \Ifstr{\reserved@a}{c}{%
          \scr@ifundefinedorrelax{LaTeXcentering}{%
            \expandafter\let\csname ragged#1caption\endcsname\centering
          }{%
            \expandafter\let\csname ragged#1caption\endcsname\LaTeXcentering
          }%
        }{%
          \Ifstr{\reserved@a}{J}{%
            \scr@ifundefinedorrelax{justifying}{%
              \scr@caption@raggede@warning{J}{\justifying}%
              \expandafter\let\csname ragged#1caption\endcsname\@empty
            }{%
              \expandafter\let\csname ragged#1caption\endcsname\justifying
            }%
          }{%
            \Ifstr{\reserved@a}{L}{%
              \scr@ifundefinedorrelax{RaggedRight}{%
                \scr@caption@raggede@warning{L}{\RaggedRight}%
                \expandafter\let\csname ragged#1caption\endcsname\raggedright
              }{%
                \expandafter\let\csname ragged#1caption\endcsname\RaggedRight
              }%
            }{%
              \Ifstr{\reserved@a}{R}{%
                \scr@ifundefinedorrelax{RaggedLeft}{%
                  \scr@caption@raggede@warning{R}{\RaggedLeft}%
                  \expandafter\let\csname ragged#1caption\endcsname\raggedleft
                }{%
                  \expandafter\let\csname ragged#1caption\endcsname\RaggedLeft
                }%
              }{%
                \Ifstr{\reserved@a}{C}{%
                  \scr@ifundefinedorrelax{Centering}{%
                    \scr@caption@raggede@warning{C}{\Centering}%
                    \expandafter\let\csname ragged#1caption\endcsname\centering
                  }{%
                    \expandafter\let\csname ragged#1caption\endcsname\Centering
                  }%
                }{%
                  \Ifstr{\reserved@a}{}{%
                    \expandafter\let\csname ragged#1caption\endcsname\relax
                  }{%
                    \ClassError{\KOMAClassName}{unknown alignment char `#2'}{%
                      \string\setcaptionalignment\space supports
                      only:\MessageBreak
                      \space\space c - centered captions,\MessageBreak
                      \space\space j - justified captions,\MessageBreak
                      \space\space l - left align captions,\MessageBreak
                      \space\space r - right aligned captions,\MessageBreak
                      \space\space C - centered captions with
                      `ragged2e',\MessageBreak
                      \space\space J - justified captions with
                      `ragged2e',\MessageBreak
                      \space\space L - left align captions with
                      `ragged2e',\MessageBreak
                      \space\space R - right aligned captions with
                      `ragged2e',\MessageBreak
                      or an empty argument to remove special
                      alignment.\MessageBreak
                      If you'd continue, I'd not change the alignment.%
                    }%
                  }%
                }%
              }%
            }%
          }%
        }%
      }%
    }%
  }%
}
\newcommand*{\scr@caption@raggede@warning}[2]{%
  \begingroup
    \lowercase{\def\reserved@a{#1}}%
    \ClassWarning{\KOMAClassName}{%
      `\string#2' undefined!\MessageBreak
      To avoid replacing caption alignment `#1' by `\reserved@a'\MessageBreak
      you should load package `ragged2e' before using\MessageBreak
      `\string\setcaptionalignment'%
    }%
  \endgroup
}
\newcommand*\raggedcaption{}
\newcommand*{\scr@caption@before@longtable@warning}[1]{%
  \ClassWarning{\KOMAClassName}{%
    you've loaded package `#1' before package\MessageBreak
    `longtable'!\MessageBreak
    Because of this package `#1' isn't able to\MessageBreak
    control `\string\caption' at longtables. \space After loading
    \MessageBreak
    package `#1' KOMA-Script also doesn't control\MessageBreak
    `\string\caption'.\MessageBreak
    I think, you should load package `caption' after\MessageBreak
    package `longtable'%
  }%
}
\AfterPackage{longtable}{%
  \if@komalongtable
    \renewcommand{\LT@makecaption}[3]{%
      \noalign{%
        \if@captionabove
          \vskip\belowcaptionskip
        \else
          \vskip\abovecaptionskip
        \fi
      }%
      \LT@mcol\LT@cols c{%
        \hbox to\z@{\hss\parbox[t]\linewidth{%
            \def\@captype{table}%
            \@@makecaption{#1}{#2}{#3}%
            \endgraf
            \if@captionabove
              \vskip\abovecaptionskip
            \else
              \vskip\belowcaptionskip
            \fi
          }%
          \hss
        }%
      }%
    }%
    \newcommand*{\scr@LT@array}{}%
    \let\scr@LT@array=\LT@array
    \renewcommand*{\LT@array}{%
      \let\scr@caption=\LT@caption
      \def\captionabove{\noalign{\global\@captionabovetrue}%
        \scr@caption}%
      \def\captionbelow{\noalign{\global\@captionabovefalse}%
        \scr@caption}%
      \if@tablecaptionabove
        \let\LT@caption=\captionabove
      \else
        \let\LT@caption=\captionbelow
      \fi
      \scr@LT@array
    }%
    \ClassInfo{\KOMAClassName}{%
      longtable captions redefined%
    }%
  \fi
}
\newcommand*{\fs@komaabove}{%
  \let\@fs@capt\floatc@komascript
  \let\@fs@pre\@empty
  \def\@fs@mid{\vskip\abovecaptionskip}%
  \let\@fs@post\@empty
  \let\@fs@iftopcapt\iftrue}
\newcommand*{\fs@komabelow}{%
  \let\@fs@capt\floatc@komascript
  \let\@fs@pre\@empty
  \def\@fs@mid{\vskip\abovecaptionskip}%
  \let\@fs@post\@empty
  \let\@fs@iftopcapt\iffalse}
\newcommand{\floatc@komascript}{\@@makecaption\@firstofone}
\setcounter{topnumber}{2}
\renewcommand*\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand*\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand*\textfraction{.2}
\renewcommand*\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand*\dbltopfraction{.7}
\renewcommand*\dblfloatpagefraction{.5}
\newcommand*{\captionof}[1]{\def\@captype{#1}%
  \begingroup\expandafter\expandafter\expandafter\endgroup
  \expandafter\ifx\csname if@#1captionabove\endcsname\iftrue
    \@captionabovetrue
  \fi
  \scr@caption}
\newcommand*{\captionaboveof}{\@captionabovetrue\captionof}
\newcommand*{\captionbelowof}{\@captionabovefalse\captionof}
\BeforePackage{capt-of}{\let\captionof\relax}
\newenvironment{captionofbeside}[1]{%
  \def\@captype{#1}%
  \captionbeside
}{%
  \endcaptionbeside
}
\newcommand*\figurename{Figure}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\figurename{Figure}
\newcommand*\tablename{Table}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\tablename{Table}
\DeclareNewTOC[%
  type=figure,
  float,
  nonfloat,
  counterwithin=chapter,
  floatpos=tbp,
  floattype=1,
  tocentryindent=1.5em,
  tocentrynumwidth=2.3em,
  atbegin=\def\caption{%
    \if@figurecaptionabove\expandafter\captionabove
    \else\expandafter\captionbelow\fi
  }
]{lof}
\expandafter\ifnum\scr@v@is@le{2.97d}%
  \renewcommand*\thefigure{\thechapter.\@arabic\c@figure}
\fi
\DeclareNewTOC[%
  type=table,
  float,
  nonfloat,
  counterwithin=chapter,
  floatpos=tbp,
  floattype=2,
  tocentryindent=1.5em,
  tocentrynumwidth=2.3em,
  atbegin=\def\caption{%
    \if@tablecaptionabove\expandafter\captionabove
    \else\expandafter\captionbelow\fi
  }
]{lot}
\expandafter\ifnum\scr@v@is@le{2.97d}%
  \renewcommand*\thetable{\thechapter.\@arabic\c@table}
\fi
%%% From File: $Id: scrkernel-footnotes.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\renewcommand*\footnoterule{%
  \normalsize\ftn@rule@test@values
  \kern-\dimexpr 2.6\p@+\ftn@rule@height\relax
  \ifx\@textbottom\relax\else\vskip \z@ \@plus.05fil\fi
  {\usekomafont{footnoterule}{%
      \hrule \@height\ftn@rule@height \@width\ftn@rule@width}}%
  \kern 2.6\p@}
\newcommand*{\ftn@rule@test@values}{%
  \ifdim\ftn@rule@height <\z@
    \ClassWarning{\KOMAClassName}{%
      You might get into trouble, because the\MessageBreak
      height of the footnote rule has a value\MessageBreak
      less than 0%
    }%
  \else
    \ifdim\ftn@rule@height >\dimexpr\skip\footins -2.6\p@\relax
      \ClassWarning{\KOMAClassName}{%
        You might get into trouble, because the\MessageBreak
        height of the footnote rule has a value\MessageBreak
        greater than \the\dimexpr\skip\footins -2.6\p@\relax
      }%
    \fi
  \fi
  \ifdim\ftn@rule@width <\z@
    \ClassWarning{\KOMAClassName}{%
      You might get into trouble, because the width\MessageBreak
      or length of the footnote rule has a value\MessageBreak
      less than 0pt%
    }%
  \else
    \ifdim\ftn@rule@width >\columnwidth
      \ClassWarning{\KOMAClassName}{%
        You might get into trouble, because the width\MessageBreak
        or length of the footnote rule has a value\MessageBreak
        greater than \string\columnwidth
      }%
    \fi
  \fi
}
\newkomafont{footnoterule}{}
\newcommand*{\ftn@rule@width}{.4\columnwidth}
\newcommand*{\ftn@rule@height}{.4\p@}
\newcommand*{\setfootnoterule}[2][]{%
  \IfArgIsEmpty{#1}{}{%
    \renewcommand*{\ftn@rule@height}{#1}%
  }%
  \IfArgIsEmpty{#2}{}{%
    \renewcommand*{\ftn@rule@width}{#2}%
  }%
  \ftn@rule@test@values
}
\@addtoreset{footnote}{chapter}
\newcommand\deffootnote[4][]{%
  \expandafter\ifnum\scr@v@is@ge{3.22}\relax
    \long\def\@makefntext##1{%
      \ExecuteDoHook{footnote/text/begin}%
      \raggedfootnote
      \leftskip #2
      \l@addto@macro\@trivlist{%
        \ifnum\@listdepth=\@ne\advance\leftmargin #2\relax\fi
      }%
      \parindent #3\noindent
      \IfArgIsEmpty{#1}{}{%
        \hskip \dimexpr #1-#2\relax
      }%
      \ftn@font\hbox to \z@{\hss\@@makefnmark}##1%
      \ExecuteDoHook{footnote/text/end}%
    }%
  \else
    \ClassInfo{\KOMAClassName}{%
      Using old \string\@makefntext\space due to compatibility
      level\MessageBreak
      less than 3.22}%
    \long\def\@makefntext##1{%
      \setlength{\@tempdimc}{#3}%
      \def\@tempa{#1}\ifx\@tempa\@empty
        \@setpar{\@@par
          \@tempdima = \hsize
          \addtolength{\@tempdima}{-#2}%
          \parshape \@ne #2 \@tempdima}%
      \else
        \addtolength{\@tempdimc}{#2}%
        \addtolength{\@tempdimc}{-#1}%
        \@setpar{\@@par
          \@tempdima = \hsize
          \addtolength{\@tempdima}{-#1}%
          \@tempdimb = \hsize
          \addtolength{\@tempdimb}{-#2}%
          \parshape \tw@ #1 \@tempdima #2 \@tempdimb
        }%
      \fi
      \par
      \parindent\@tempdimc\noindent
      \ftn@font\hbox to \z@{\hss\@@makefnmark}##1%
    }%
  \fi
  \def\@@makefnmark{\hbox{\ftnm@font{#4}}}%
}
\newcommand*{\raggedfootnote}{}
\newcommand*{\ftn@font}{\normalfont}
\newcommand*{\scr@fnt@footnote}{\ftn@font}
\newcommand*{\ftnm@font}{}
\aliaskomafont{footnotenumber}{footnotelabel}
\newcommand*{\scr@fnt@footnotelabel}{\ftnm@font}
\aliaskomafont{footnotetext}{footnote}
\newcommand*\deffootnotemark[1]{%
  \def\@makefnmark{\hbox{\ftntm@font{#1}}}%
}
\newcommand*{\ftntm@font}{}
\newcommand*{\scr@fnt@footnotereference}{\ftntm@font}
\aliaskomafont{footnoteref}{footnotereference}
\aliaskomafont{footnotemark}{footnotereference}
\newcommand*{\FN@mf@check}{%
  \ifdim\lastkern=\multiplefootnotemarker\relax
    \edef\@x@sf{\the\spacefactor}%
    \unkern\multiplefootnoteseparator
    \spacefactor\@x@sf\relax
  \fi
}
\newcommand*{\scr@mf@prepare}{%
  \kern-\multiplefootnotemarker
  \kern\multiplefootnotemarker\relax
}
\@ifundefined{FN@mf@prepare}{\let\FN@mf@prepare\relax}{}
\newcommand{\scr@saved@footnotetext}{}
\let\scr@saved@footnotetext\@footnotetext
\renewcommand{\@footnotetext}[1]{%
  \scr@saved@footnotetext{#1}%
  \csname FN@mf@prepare\endcsname
}
\BeforePackage{footmisc}{%
  \ifx\@footnotemark\scr@footnotemark
    \let\@footnotemark\scr@saved@footnotemark
  \fi
  \let\@footnotetext\scr@saved@footnotetext
}
\BeforePackage{setspace}{%
  \let\@footnotetext\scr@saved@footnotetext
}
\AfterPackage{setspace}{%
  \let\scr@saved@footnotetext\@footnotetext
  \renewcommand{\@footnotetext}[1]{%
    \scr@saved@footnotetext{#1}%
    \csname FN@mf@prepare\endcsname
  }%
}
\newcommand*{\multiplefootnoteseparator}{%
  \begingroup\let\thefootnotemark\multfootsep\@makefnmark\endgroup
}
\newcommand*{\multfootsep}{,}
\newcommand*{\multiplefootnotemarker}{3sp}
\newcommand*{\thefootnotemark}{\@thefnmark}
\deffootnote[1em]{1.5em}{1em}{\textsuperscript{\thefootnotemark}}
\deffootnotemark{\textsuperscript{\thefootnotemark}}
\providecommand*{\footref}[1]{%
  \begingroup
    \unrestored@protected@xdef\@thefnmark{\ref{#1}}%
  \endgroup
  \@footnotemark
}
%%% From File: $Id: scrkernel-listsof.dtx 3892 2022-06-17 16:26:06Z kohm $
%%%            (run: body)
\g@addto@macro{\numberline@numberpostfix}{\autodot}
\usetocbasicnumberline[%
  \ClassInfo{\KOMAClassName}{Redefining `\string\numberline'}%
]
\doforeachtocfile[float]{%
  \setuptoc{\@currext}{chapteratlist}%
}
\AtAddToTocList[float]{%
  \setuptoc{\@currext}{chapteratlist}%
}
\newcommand*{\scr@dottedtocline}{}
\newcommand*{\last@l@number}{}
\newcommand*{\@l@number}{}
\newcommand*{\set@l@number}[1]{%
  \settowidth{\@tempdima}{#1\enskip}%
  \ifdim\@tempdima >\@l@number
    \xdef\@l@number{\the\@tempdima}%
  \fi%
  \ifdim\@tempdima >\last@l@number \else
    \setlength{\@tempdima}{\last@l@number}%
  \fi%
}
\newcommand*{\before@starttoc}[1]{%
  \let\scr@dottedtocline=\@dottedtocline
  \renewcommand*{\@dottedtocline}[3]{%
    \scr@dottedtocline{##1}{\z@}{\last@l@number}}%
  \renewcommand*{\numberline@box}[1]{%
    \set@l@number{##1}\hb@xt@\@tempdima{##1}}%
  \gdef\@l@number{\z@}%
  \@ifundefined{#1@l@number}{%
    \def\last@l@number{2em}%
  }{%
    \expandafter\ifx\csname #1@l@number\endcsname\@empty
      \let\last@l@number\z@
    \else
      \expandafter\let\expandafter\last@l@number
      \expandafter=\csname#1@l@number\endcsname
    \fi
  }%
  \begingroup
    \def\do@endgroup{\endgroup}%
    \def\do##1{%
      \scr@ifundefinedorrelax{scr@tso@##1@numwidth}{}{%
        \l@addto@macro\do@endgroup{%
          \@namedef{scr@tso@##1@numwidth}{\last@l@number}%
        }%
      }%
      \scr@ifundefinedorrelax{scr@tso@##1@indent}{}{%
        \l@addto@macro\do@endgroup{%
          \@namedef{scr@tso@##1@indent}{\z@}%
        }%
      }%
    }%
    \@nameuse{scr@dte@donumwidth}%
  \do@endgroup
}
\newcommand*{\after@starttoc}[1]{%
  \protected@write\@auxout{}{%
    \string\gdef\expandafter\string\csname#1@l@number\endcsname{%
      \@l@number}}%
}
\g@addto@macro\tocbasic@@before@hook{%
  \if@dynlist\expandafter\before@starttoc\expandafter{\@currext}\fi
}
\g@addto@macro\tocbasic@@after@hook{%
  \if@dynlist\expandafter\after@starttoc\expandafter{\@currext}\fi
}
\newcommand*\contentsname{Contents}
\newcommand*\listoftocname{\contentsname}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\contentsname{Contents}%
\setcounter{tocdepth}{2}
\newcommand*\toc@heading{%
  \ClassWarning{\KOMAClassName}{%
    usage of deprecated \string\toc@heading!\MessageBreak
    You should use the features of package `tocbasic'\MessageBreak
    instead of \string\toc@heading.\MessageBreak
    Definition of \string\toc@heading\space may be removed from\MessageBreak
    KOMA-Script soon, so it should not be used%
  }%
  \chapter*{\contentsname}%
  \@mkboth{\MakeMarkcase{\contentsname}}{\MakeMarkcase{\contentsname}}%
}
\newcommand*{\toc@l@number}{}
\newcommand*{\tableofcontents}{%
  \begingroup
    \let\if@dynlist\if@tocleft
    \expandafter\listoftoc\expandafter{\ext@toc}%
  \endgroup
}
\newcommand{\addtocentrydefault}[3]{%
  \expandafter\tocbasic@addxcontentsline\expandafter{\ext@toc}{#1}{#2}{#3}%
}
\newcommand*{\float@listhead}[1]{%
  \scr@float@listhead@warning
  \float@@listhead{#1}%
  \@mkboth{\MakeMarkcase{#1}}{\MakeMarkcase{#1}}%
  \if@dynlist%
    \newcommand*{\scr@starttoc}{}%
    \let\scr@starttoc=\@starttoc
    \renewcommand*{\@starttoc}[1]{%
      \before@starttoc{##1}\scr@starttoc{##1}\after@starttoc{##1}%
    }%
  \fi
}
\newcommand*{\scr@float@listhead@warning}{%
  \ClassWarning{\KOMAClassName}{%
    \string\float@listhead\space detected!\MessageBreak
    Implementation of \string\float@listhead\space became\MessageBreak
    deprecated in KOMA-Script v3.01 2008/11/14 and\MessageBreak
    has been replaced by several more flexible\MessageBreak
    features of package `tocbasic`.\MessageBreak
    Maybe implementation of \string\float@listhead\space will\MessageBreak
    be removed from KOMA-Script soon.\MessageBreak
    Loading of package `scrhack' may help to\MessageBreak
    avoid this warning, if you are using a\MessageBreak
    a package that still implements the\MessageBreak
    deprecated \string\float@listhead\space interface%
  }%
}
\newcommand*{\scr@float@addtolists@warning}{%
  \ClassWarningNoLine{\KOMAClassName}{%
    \string\float@addtolists\space detected!\MessageBreak
    Implementation of \string\float@addtolist\space became\MessageBreak
    deprecated in KOMA-Script v3.01 2008/11/14 and\MessageBreak
    has been replaced by several more flexible\MessageBreak
    features of package `tocbasic`.\MessageBreak
    Since Version 3.12 support for deprecated\MessageBreak
    \string\float@addtolist\space interface has been\MessageBreak
    restricted to only some of the KOMA-Script\MessageBreak
    features and been removed from others.\MessageBreak
    Loading of package `scrhack' may help to\MessageBreak
    avoid this warning, if you are using a\MessageBreak
    a package that still implements the\MessageBreak
    deprecated \string\float@addtolist\space interface%
  }%
  \global\let\scr@float@addtolists@warning\relax
}
\renewcommand*\listfigurename{List of Figures}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\listfigurename{List of Figures}
\renewcommand*\listoflofname{\listfigurename}
\renewcommand*\listoflofentryname{\figurename}
\renewcommand*\listtablename{List of Tables}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\listtablename{List of Tables}
\renewcommand*\listoflotname{\listtablename}
\renewcommand*\listoflotentryname{\tablename}
%%% From File: $Id: scrkernel-bibliography.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*\bibname{Bibliography}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\bibname{Bibliography}
\newcommand*{\bibpreamble}{\relax}
\let\bibpreamble\relax
\newcommand{\setbibpreamble}[1]{\def\bibpreamble{#1}}
\newdimen\bibindent
\bibindent=1.5em
\newenvironment{thebibliography}[1]{%
  \if@bib@break@
    \bib@beginhook
  \else
    \ifx\bibpreamble\relax\else\ifx\bibpreamble\@empty\else
        \setchapterpreamble{\bibpreamble}%
    \fi\fi
    \bib@heading
    \bib@beginhook
    \bib@before@hook
  \fi
  \renewcommand{\BreakBibliography}[1]{%
    \@bib@break
    \end{thebibliography}%
    \begingroup ##1\endgroup
    \begin{thebibliography}{#1}
  }%
  \list{%
    \@biblabel{\@arabic\c@enumiv}%
  }{%
    \settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \@openbib@code
    \if@bib@break@
      \edef\@tempa{%
        \noexpand\usecounter{enumiv}%
        \noexpand\setcounter{enumiv}{\the\c@enumiv}%
      }\@tempa
      \no@bib@break
    \else
      \usecounter{enumiv}%
    \fi
    \let\p@enumiv\@empty
    \renewcommand*\theenumiv{\@arabic\c@enumiv}%
  }%
  \sloppy\clubpenalty4000 \widowpenalty4000
  \sfcode`\.=\@m
}{%
  \if@bib@break@
    \def\@noitemerr{%
      \@latex@warning{%
        \string\BreakBibliography\space at begin of `thebibliography'
        environment\MessageBreak
        or following \string\BreakBibliography}%
    }%
  \else
    \def\@noitemerr{%
      \@latex@warning{%
        Empty `thebibliography' environment or
        \string\BreakBibliography\MessageBreak
        before end of `thebibliography' environment}%
    }%
  \fi
  \endlist
  \if@bib@break@
  \else
    \bib@after@hook
    \let\bib@before@hook\@empty
    \let\bib@after@hook\@empty
  \fi
  \bib@endhook
}
\newif\if@bib@break@
\newcommand{\no@bib@break}{\global\let\if@bib@break@\iffalse}
\newcommand*{\@bib@break}{\global\let\if@bib@break@\iftrue}
\newcommand*{\bib@before@hook}{}
\newcommand*{\bib@after@hook}{}
\newcommand{\BreakBibliography}[1]{%
  \ClassWarning{\KOMAClassName}{%
    You've used \string\BreakBibliography\space either outside of\MessageBreak
    the bibliography or `thebibliography' was redefined\MessageBreak
    incompatible, e.g., using a bibliography package.\MessageBreak
    \string\BreakBibliography\space ignored%
  }%
}
\newcommand{\AfterBibliographyPreamble}{\g@addto@macro\bib@before@hook}
\newcommand{\AtEndBibliography}{\g@addto@macro\bib@after@hook}
%%% From File: $Id: scrkernel-index.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*{\index@preamble}{}
\let\index@preamble=\relax
\newcommand{\setindexpreamble}[1]{\def\index@preamble{#1}}
\newcommand*{\idx@heading}{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \twocolumn[%
    \@chaptertolistsfalse
                  \idx@@heading{\indexname}]%
  \ifidx@leveldown
    \addsecmark{\indexname}%
  \else
    \@mkdouble{\MakeMarkcase{\indexname}}%
  \fi
}
\newenvironment{theindex}{%
  \if@twocolumn
    \@restonecolfalse
  \else
    \@restonecoltrue
  \fi
  \columnseprule \z@
  \columnsep 35\p@
  \setchapterpreamble{\index@preamble}%
  \idx@heading
  \ifx\indexpagestyle\@empty\else\thispagestyle{\indexpagestyle}\fi
  \parindent\z@
  \setlength{\parskip}{\z@ \@plus .3\p@}%
  \setlength{\parfillskip}{\z@ \@plus 1fil}%
  \let\item\@idxitem
}{%
  \if@restonecol\onecolumn\else\clearpage\fi
}
\newcommand*\@idxitem{\par\hangindent 40\p@}
\newcommand*\subitem{\@idxitem \hspace*{20\p@}}
\newcommand*\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand*\indexspace{%
  \par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax
}
\newcommand*\indexname{Index}
\providecaptionname{american,australian,british,canadian,english,newzealand,%
  UKenglish,ukenglish,USenglish,usenglish}\indexname{Index}
%%% From File: $Id: scrkernel-listsandtabulars.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\if@twocolumn
  \setlength{\leftmargini}{2em}
\else
  \setlength{\leftmargini}{2.5em}
\fi
\setlength{\leftmarginii}{2.2em}
\setlength{\leftmarginiii}{1.87em}
\setlength{\leftmarginiv}{1.7em}
\if@twocolumn
  \setlength{\leftmarginv}{.5em}
  \setlength{\leftmarginvi}{.5em}
\else
  \setlength{\leftmarginv}{1em}
  \setlength{\leftmarginvi}{1em}
\fi
\setlength{\leftmargin}{\leftmargini}
\setlength{\labelsep}{.5em}
\setlength{\labelwidth}{\leftmargini}
\addtolength{\labelwidth}{-\labelsep}
\@beginparpenalty=-\@lowpenalty
\@endparpenalty  =-\@lowpenalty
\@itempenalty    =-\@lowpenalty
\renewcommand*\theenumi{\@arabic\c@enumi}
\renewcommand*\theenumii{\@alph\c@enumii}
\renewcommand*\theenumiii{\@roman\c@enumiii}
\renewcommand*\theenumiv{\@Alph\c@enumiv}
\newcommand*\labelenumi{\theenumi.}
\newcommand*\labelenumii{\theenumii)}
\newcommand*\labelenumiii{\theenumiii.}
\newcommand*\labelenumiv{\theenumiv.}
\renewcommand*\p@enumii{\theenumi}
\renewcommand*\p@enumiii{\p@enumii(\theenumii)}
\renewcommand*\p@enumiv{\p@enumiii\theenumiii}
\newcommand*\labelitemi{\usekomafont{labelitemi}{\textbullet}}
\newcommand*\labelitemii{\usekomafont{labelitemii}{\textendash}}
\newcommand*\labelitemiii{\usekomafont{labelitemiii}{\textasteriskcentered}}
\newcommand*\labelitemiv{\usekomafont{labelitemiv}{\textperiodcentered}}
\newenvironment{description}{%
  \list{}{\labelwidth\z@ \itemindent-\leftmargin
    \let\makelabel\descriptionlabel}%
}{%
  \endlist
}
\newcommand*{\descriptionlabel}[1]{%
  \hspace{\labelsep}\usekomafont{descriptionlabel}{#1}%
}
\newenvironment{labeling}[2][]{%
  \def\sc@septext{#1}%
  \list{}{\settowidth{\labelwidth}{{%
        \usekomafont{labelinglabel}{#2%
          \usekomafont{labelingseparator}{\sc@septext}}%
      }}%
    \leftmargin\labelwidth \advance\leftmargin by \labelsep
    \let\makelabel\labelinglabel
  }%
}{%
  \endlist
}
\newcommand\labelinglabel[1]{%
  \usekomafont{labelinglabel}{#1\hfil
    \usekomafont{labelingseparator}{\sc@septext}}%
}
\newenvironment{verse}{%
  \let\\=\@centercr
  \list{}{\itemsep=\z@
    \itemindent=-1.5em
    \listparindent=\itemindent
    \rightmargin=\leftmargin
    \advance\leftmargin by1.5em
  }%
  \item\relax
}{%
  \endlist
}
\newenvironment{quotation}{%
  \list{}{\listparindent 1em%
    \itemindent    \listparindent
    \rightmargin   \leftmargin
    \parsep        \z@ \@plus\p@
  }%
  \item\relax
}{%
  \endlist
}
\newenvironment{quote}{%
  \list{}{\rightmargin\leftmargin}%
  \item\relax
}{%
  \endlist
}
\newenvironment{addmargin}{%
  \@tempswafalse\@addmargin
}{%
  \advance\@listdepth\@ne
  \endlist
}
\newenvironment{addmargin*}{%
  \@tempswafalse
  \if@twoside\is@thispageodd[]\ifthispagewasodd\else\@tempswatrue\fi
    \edef\scr@addmargin@startpage{\csname tpo@\scr@tpo\endcsname}\fi
  \@addmargin
}{%
  \if@twoside
    \unskip\nobreak\Ifthispageodd{}{}%
    \expandafter\ifx\csname tpo@\scr@tpo\endcsname\scr@addmargin@startpage\else
      \ClassWarning{\KOMAClassName}{%
        page break inside `addmargin*' environment.\MessageBreak
        A `addmargin*' environment starting on page
        \scr@addmargin@startpage\MessageBreak
        ends on page \csname tpo@\scr@tpo\endcsname.\MessageBreak
        This will result in potential wrong margins on\MessageBreak
        every other page.\MessageBreak
        So maybe you should change the `addmargin*'\MessageBreak
        environment, that ends%
      }%
    \fi
  \fi
  \advance\@listdepth\@ne
  \endlist
}
\newcommand*{\@addmargin}[2][\@tempa]{%
  \list{}{%
    \if@tempswa
      \def\@tempa{\leftmargin}%
      \setlength{\leftmargin}{#2}%
      \setlength{\rightmargin}{#1}%
    \else
      \def\@tempa{\rightmargin}%
      \setlength{\rightmargin}{#2}%
      \setlength{\leftmargin}{#1}%
    \fi
    \setlength{\listparindent}{\parindent}%
    \setlength{\itemsep}{\parskip}%
    \setlength{\itemindent}{\z@}%
    \setlength{\@tempskipa}{\topsep}%
    \setlength{\topsep}{\z@}%
    \setlength{\parsep}{\parskip}%
    \setlength{\@tempskipb}{\partopsep}%
    \setlength{\partopsep}{\z@}%
    \let\makelabel\@gobble
    \setlength{\labelwidth}{\z@}%
    \advance\@listdepth\m@ne
  }%
  \expandafter\ifnum\scr@v@is@ge{3.22}%
    \setlength{\topsep}{\@tempskipa}%
    \setlength{\partopsep}{\@tempskipb}%
  \fi
  \item\is@thispageodd@setlabel\nobreak\ignorespaces
}
\newcommand*\descfont{\@gr@gsffamily\bfseries}
\newcommand*{\scr@fnt@descriptionlabel}{\descfont}
\newcommand*{\labelitemfont}{\normalfont}
\newcommand*\scr@fnt@itemizelabel{\labelitemfont}
\newkomafont{labelitemi}{\usekomafont{itemizelabel}}
\newkomafont{labelitemii}{\usekomafont{itemizelabel}\bfseries}
\newkomafont{labelitemiii}{\usekomafont{itemizelabel}}
\newkomafont{labelitemiv}{\usekomafont{itemizelabel}}
\newkomafont{labelinglabel}{}
\newkomafont{labelingseparator}{}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
%%% From File: $Id: scrlogo.dtx 3688 2022-02-10 08:26:37Z kohm $
\RequirePackage{scrlogo}
\endinput
%%
%% End of file `scrreprt.cls'.
