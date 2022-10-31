%%
%% This is file `scrlttr2.cls',
%% generated with the docstrip utility, extended by scrdocstrip.
%%
%% The original source files were:
%%
%% scrkernel-version.dtx  (with options: `class,letter')
%% scrkernel-basics.dtx  (with options: `class,load')
%% scrkernel-compatibility.dtx  (with options: `class,letter,init')
%% scrkernel-typearea.dtx  (with options: `class,scrlttr2,init')
%% scrkernel-compatibility.dtx  (with options: `class,letter,option')
%% scrkernel-miscellaneous.dtx  (with options: `class,letter,option')
%% scrkernel-letterclassoptions.dtx  (with options: `class,letter,option')
%% scrkernel-language.dtx  (with options: `class,letter,option')
%% scrkernel-fonts.dtx  (with options: `class,letter,option')
%% scrkernel-variables.dtx  (with options: `class,letter,option')
%% scrkernel-pseudolengths.dtx  (with options: `class,letter,option')
%% scrkernel-typearea.dtx  (with options: `class,letter,options')
%% scrkernel-paragraphs.dtx  (with options: `class,letter,option')
%% scrkernel-pagestyles.dtx  (with options: `class,letter,option')
%% scrkernel-floats.dtx  (with options: `class,letter,option')
%% scrkernel-footnotes.dtx  (with options: `class,letter,option')
%% scrkernel-listsandtabulars.dtx  (with options: `class,letter,option')
%% scrkernel-notepaper.dtx  (with options: `class,letter,option')
%% scrkernel-addressfiles.dtx  (with options: `class,letter,option')
%% scrkernel-miscellaneous.dtx  (with options: `class,letter,execoption')
%% scrkernel-compatibility.dtx  (with options: `class,letter,body')
%% scrkernel-fonts.dtx  (with options: `class,letter,body')
%% scrkernel-miscellaneous.dtx  (with options: `class,letter,body')
%% scrkernel-letterclassoptions.dtx  (with options: `class,letter,body')
%% scrkernel-language.dtx  (with options: `class,letter,body')
%% scrkernel-variables.dtx  (with options: `class,letter,body')
%% scrkernel-pseudolengths.dtx  (with options: `class,letter,body')
%% scrkernel-typearea.dtx  (with options: `class,letter,body')
%% scrkernel-paragraphs.dtx  (with options: `class,letter,body')
%% scrkernel-pagestyles.dtx  (with options: `class,letter,body')
%% scrkernel-floats.dtx  (with options: `class,letter,body')
%% scrkernel-footnotes.dtx  (with options: `class,letter,body')
%% scrkernel-listsandtabulars.dtx  (with options: `class,letter,body')
%% scrkernel-notepaper.dtx  (with options: `class,letter,body')
%% scrkernel-addressfiles.dtx  (with options: `class,letter,body')
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
  scrlttr2%
}
\newcommand*{\KOMAClassFileName}{\KOMAClassName.\@clsextension}
\edef\KOMAClassFileName{\KOMAClassFileName}
\newcommand*{\ClassName}{%
  letter%
}
\ProvidesClass{\KOMAClassName}[%
  2022/07/04 v3.37 KOMA-Script
  document class (\ClassName)%
]
%%% From File: $Id: scrkernel-basics.dtx 3913 2022-06-28 07:45:49Z kohm $
%%%            (run: load)
\RequirePackage{scrkbase}[\KOMAScriptVersion]
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
\KOMA@ifkey{egregdoesnotlikesansseriftitles}{@egregdoesnotlikesansseriftitles}
\newcommand*{\@gr@gsffamily}{%
  \if@egregdoesnotlikesansseriftitles\else\sffamily\fi
}
%%% From File: $Id: scrkernel-letterclassoptions.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\newcommand*{\lco@test}{%
  \IfFileExists{\CurrentOption.lco}{%
    \ClassWarningNoLine{\KOMAClassName}{%
      loading of LCO via class option
      `\CurrentOption'.\MessageBreak
      Note: Loading a LCO via class option is deprecated.\MessageBreak
      \space\space\space\space\space\space
      You should use
      `\string\LoadLetterOption\string{\CurrentOption\string}'\MessageBreak
      instead%
    }%
    \expandafter\AtEndOfClass\expandafter{%
      \expandafter\LoadLetterOption\expandafter{\CurrentOption}%
    }%
    \expandafter\def\expandafter\scr@pti@nerr@r\expandafter{%
      \expandafter\def\expandafter\scr@pti@nerr@r\expandafter{%
        \scr@pti@nerr@r
      }%
    }%
  }{}%
}
\AtEndOfClass
  {\LoadLetterOption{DIN}}
%%% From File: $Id: scrkernel-language.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\newif\if@orgdate\@orgdatetrue
\KOMA@key{numericaldate}[true]{%
  \if@orgdate\@orgdatefalse\else\@orgdatetrue\fi
  \KOMA@set@ifkey{numericaldate}{@orgdate}{#1}%
  \KOMA@kav@replacebool{.%
    \KOMAClassFileName
  }{numericaldate}{@orgdate}%
  \if@orgdate\@orgdatefalse\else\@orgdatetrue\fi
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{numericaldate}{true}
\KOMA@DeclareDeprecatedOption{scrdate}{numericaldate=true}
\KOMA@DeclareDeprecatedOption{orgdate}{numericaldate=false}
%%% From File: $Id: scrkernel-fonts.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
\providecommand*\@ptsize{%
  12%
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
%%% From File: $Id: scrkernel-variables.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
%%% From File: $Id: scrkernel-pseudolengths.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
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
    \raggedbottom
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
  \lco@test
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
%%% From File: $Id: scrkernel-listsandtabulars.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
%%% From File: $Id: scrkernel-notepaper.dtx 3895 2022-06-20 10:37:02Z kohm $
%%%            (run: option)
\KOMA@ifkey{firsthead}{@firsthead}
\KOMAExecuteOptions{firsthead=true}
\newcommand*{\@alignfrom}{0}
\KOMA@key{fromalign}{%
  \KOMA@set@ncmdkey{fromalign}{@alignfrom}{%
    {left}{0},%
    {center}{1},{centered}{1},{middle}{1},%
    {right}{2},%
    {locationleft}{3},{leftlocation}{3},%
    {locationright}{4},{rightlocation}{4},{location}{4},%
    {no}{10000},{false}{10000},{off}{10000}%
  }{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \KOMA@kav@xreplacevalue{.%
      \KOMAClassFileName
    }{fromalign}{#1}%
    \ifcase\@alignfrom\or\or\or\@firstheadfalse\or\@firstheadfalse\fi
  \fi
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{fromalign}{left}
\KOMA@ncmdkey{fromrule}[below]{@rulefrom}{%
  {false}{0},{no}{0},{off}{0},{aftername}{1},%
  {below}{2},{afteraddress}{2},{true}{2},{yes}{2},{on}{2}%
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{fromrule}{false}
\KOMA@ifkey{fromphone}{@phone}
\KOMA@ifkey{frommobilephone}{@mobilephone}
\KOMA@ifkey{fromfax}{@fax}
\KOMA@ifkey{fromemail}{@email}
\KOMA@ifkey{fromurl}{@www}
\KOMA@ifkey{fromlogo}{@logo}
\newcommand*{\@afieldmode}{\@ne}
\KOMA@ncmdkey{addrfield}[true]{@afieldmode}{%
  {false}{0},{off}{0},{no}{0},%
  {true}{1},{on}{1},{yes}{1},%
  {PP}{2},{pp}{2},%
  {PPexplicite}{2},{PPExplicite}{2},%
  {ppexplicite}{2},{ppExplicite}{2},%
  {backgroundimage}{3},%
  {PPbackgroundimage}{3},{PPBackgroundImage}{3},{PPBackGroundImage}{3},%
  {ppbackgroundimage}{3},{ppBackgroundImage}{3},{ppBackGroundImage}{3},%
  {image}{4},{Image}{4},%
  {PPimage}{4},{PPImage}{4},%
  {ppimage}{4},{ppImage}{4},%
  {topaligned}{5},{alignedtop}{5}%
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{addrfield}{true}
\KOMA@ncmdkey{priority}[A]{ltr@priority}{%
  {no}{0},{off}{0},{false}{0},{manual}{0},%
  {B}{1},{b}{1},%
  {economy}{1},{Economy}{1},{ECONOMY}{1},%
  {B-ECONOMY}{1},{B-Economy}{1},{b-economy}{1},%
  {A}{2},{a}{2},%
  {priority}{2},{Priority}{2},{PRIORITY}{2},%
  {A-PRIORITY}{2},{A-Priority}{2},{a-priority}{2}%
}%
\KOMA@kav@add{.%
  \KOMAClassFileName
}{priority}{false}
\newcommand{\backaddr@format}[1]{}
\let\backaddr@format\underline
\newif\if@baddr\@baddrtrue
\KOMA@key{backaddress}[true]{%
  \begingroup
    \KOMA@set@ncmdkey{backaddress}{@tempa}{%
      {false}{0},{off}{0},{no}{0},%
      {true}{1},{on}{1},{yes}{1},%
      {underlined}{2},%
      {plain}{3}%
    }{#1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \aftergroup\FamilyKeyStateProcessed
      \ifcase\@tempa
        \endgroup
        \@baddrfalse
      \or
        \endgroup
        \@baddrtrue
      \or
        \endgroup
        \@baddrtrue
        \let\backaddr@format\underline
      \or
        \endgroup
        \@baddrtrue
        \let\backaddr@format\@firstofone
      \else
        \endgroup
      \fi
      \if@baddr
        \ifx\backaddr@format\underline
          \KOMA@kav@replacevalue{.%
            \KOMAClassFileName
          }{backaddress}{underlined}%
        \else
          \ifx\backaddr@format\@firstofone
            \KOMA@kav@replacevalue{.%
              \KOMAClassFileName
            }{backaddress}{plain}%
          \else
            \KOMA@kav@replacevalue{.%
              \KOMAClassFileName
            }{backaddress}{true}%
          \fi
        \fi
      \else
        \KOMA@kav@replacevalue{.%
          \KOMAClassFileName
        }{backaddress}{false}%
      \fi
  \else
      \endgroup
      \FamilyKeyStateUnknownValue
  \fi
}
\newif\if@bigloc
\KOMA@key{locfield}[wide]{%
  \begingroup
    \KOMA@set@ncmdkey{locfield}{@tempa}{{wide}{0},{narrow}{1}}{#1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \ifcase\@tempa
        \endgroup
        \@bigloctrue
        \KOMA@kav@replacevalue{.%
          \KOMAClassFileName
        }{locfield}{wide}%
      \else
        \endgroup
        \@biglocfalse
        \KOMA@kav@replacevalue{.%
          \KOMAClassFileName
        }{locfield}{narrow}%
      \fi
    \else
      \endgroup
      \FamilyKeyStateUnknownValue
  \fi
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{locfield}{narrow}
\KOMA@DeclareDeprecatedOption{wlocfield}{locfield=wide}
\KOMA@DeclareDeprecatedOption{slocfield}{locfield=narrow}

\newif\if@fold\@foldtrue
\newcommand*{\@usefolds}{TMBPL}
\KOMA@key{foldmarks}[true]{%
  \begingroup
    \KOMA@set@ifkey\@empty{@fold}{#1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \if@fold\aftergroup\@foldtrue\else\aftergroup\@foldfalse\fi
      \aftergroup\FamilyKeyStateProcessed
    \else
      \aftergroup\FamilyKeyStateProcessed
      \def\sc@nf@ldch@rs##1{%
        \ifx ##1\@nil\else
          \if ##1T\g@addto@macro\@usefolds{##1}\else
            \if ##1M\g@addto@macro\@usefolds{##1}\else
              \if ##1B\g@addto@macro\@usefolds{##1}\else
                \if ##1P\g@addto@macro\@usefolds{##1}\else
                  \if ##1L\g@addto@macro\@usefolds{##1}\else
                    \if ##1V\g@addto@macro\@usefolds{L}\else
                      \if ##1H\g@addto@macro\@usefolds{TMBP}\else
                        \if ##1t\scr@removechar\@usefolds{T}\else
                          \if ##1m\scr@removechar\@usefolds{M}\else
                            \if ##1b\scr@removechar\@usefolds{B}\else
                              \if ##1p\scr@removechar\@usefolds{P}\else
                                \if ##1l\scr@removechar\@usefolds{L}\else
                                  \if ##1v%
                                    \scr@removechar\@usefolds{L}%
                                  \else
                                    \if ##1h%
                                      \scr@removechar\@usefolds{T}%
                                      \scr@removechar\@usefolds{M}%
                                      \scr@removechar\@usefolds{B}%
                                    \else
                                      \aftergroup\FamilyKeyStateUnknownValue
                                    \fi
                                  \fi
                                \fi
                              \fi
                            \fi
                          \fi
                        \fi
                      \fi
                    \fi
                  \fi
                \fi
              \fi
            \fi
          \fi
          \expandafter\sc@nf@ldch@rs
        \fi
      }%
      \expandafter\sc@nf@ldch@rs#1\@nil
    \fi
  \endgroup
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \KOMA@kav@xreplacevalue{.%
      \KOMAClassFileName
    }{foldmarks}{\@usefolds}%
    \KOMA@kav@xadd{.%
      \KOMAClassFileName
    }{foldmarks}{\if@fold true\else false\fi}%
  \fi
}
\KOMA@kav@xadd{.%
  \KOMAClassFileName
}{foldmarks}{\@usefolds}%
\KOMA@kav@add{.%
  \KOMAClassFileName
}{foldmarks}{true}%
\newcommand*{\scr@removechar}[2]{%
  \def\in@@##1#2##2##3\in@@{%
    \ifx\in@##2\else
      \def\in@@####1#2\in@{\gdef#1{##1####1}}%
      \in@@##2##3%
    \fi}%
  \expandafter\in@@#1#2\in@\in@@
}
\newif\if@refwide
\newcommand*{\@datepos}{1}
\KOMA@key{refline}[wide]{%
  \begingroup
    \KOMA@set@ncmdkey{refline}{@tempa}{{wide}{0},{narrow}{1},%
      {dateleft}{2},{leftdate}{2},%
      {dateright}{3},{rightdate}{3},%
      {nodate}{4}%
    }{#1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \aftergroup\FamilyKeyStateProcessed
      \ifcase\@tempa% wide
        \endgroup
        \@refwidetrue
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{wide}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{narrow}%
        \KOMA@kav@add{.%
          \KOMAClassFileName
        }{refline}{wide}%
      \or% narrow
        \endgroup
        \@refwidefalse
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{wide}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{narrow}%
        \KOMA@kav@add{.%
          \KOMAClassFileName
        }{refline}{narrow}%
      \or% dateleft
        \endgroup
        \def\@datepos{2}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{dateleft}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{dateright}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{nodate}%
        \KOMA@kav@add{.%
          \KOMAClassFileName
        }{refline}{dateleft}%
      \or% dateright
        \endgroup
        \def\@datepos{1}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{dateleft}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{dateright}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{nodate}%
        \KOMA@kav@add{.%
          \KOMAClassFileName
        }{refline}{dateright}%
      \or% nodate
        \endgroup
        \def\@datepos{0}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{dateleft}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{dateright}%
        \KOMA@kav@remove{.%
          \KOMAClassFileName
        }{refline}{nodate}%
        \KOMA@kav@add{.%
          \KOMAClassFileName
        }{refline}{nodate}%
      \fi
    \else
      \endgroup
      \FamilyKeyStateUnknownValue
  \fi
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{refline}{dateright}%
\KOMA@kav@add{.%
  \KOMAClassFileName
}{refline}{narrow}%
\newcommand{\subject@format}[1]{#1}
\newcommand*{\raggedsubject}{}
\newif\if@subj
\newif\if@subjafter
\KOMA@key{subject}{%
  \begingroup
    \KOMA@set@ncmdkey{subject}{@tempa}{%
      {titled}{0},%
      {untitled}{1},%
      {afteropening}{2},%
      {beforeopening}{3},%
      {underlined}{4},%
      {left}{5},%
      {right}{6},%
      {centered}{7}%
    }{#1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \aftergroup\FamilyKeyStateProcessed
      \ifcase\@tempa
        \aftergroup\@subjtrue
      \or
        \aftergroup\@subjfalse
      \or
        \aftergroup\@subjaftertrue
      \or
        \aftergroup\@subjafterfalse
      \or
        \aftergroup\let\aftergroup\subject@format\aftergroup\underline
      \or
        \aftergroup\let\aftergroup\raggedsubject\aftergroup\raggedright
      \or
        \aftergroup\let\aftergroup\raggedsubject\aftergroup\raggedleft
      \or
        \aftergroup\let\aftergroup\raggedsubject\aftergroup\centering
      \fi
    \else
      \aftergroup\FamilyKeyStateUnknownValue
    \fi
  \endgroup
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \KOMA@kav@xreplacevalue{.%
      \KOMAClassFileName
    }{subject}{\if@subj titled\else untitled\fi}%
    \KOMA@kav@xadd{.%
      \KOMAClassFileName
    }{subject}{\if@subjafter after\else before\fi opening}%
    \ifx\subject@format\underline
      \KOMA@kav@add{.%
        \KOMAClassFileName
      }{subject}{underlined}%
    \fi
    \ifx\raggedsubject\raggedright
      \KOMA@kav@add{.%
        \KOMAClassFileName
      }{subject}{left}%
    \else
      \ifx\raggedsubject\raggedleft
        \KOMA@kav@add{.%
          \KOMAClassFileName
        }{subject}{right}%
      \else
        \ifx\raggedsubject\centering
          \KOMA@kav@add{.%
            \KOMAClassFileName
          }{subject}{centered}%
        \fi
      \fi
    \fi
  \fi
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{subject}{untitled}%
\KOMA@kav@add{.%
  \KOMAClassFileName
}{subject}{beforeopening}%
\KOMA@ifkey{enlargefirstpage}{@enlargefp}
\KOMA@ifkey{firstfoot}{@firstfoot}\@firstfoottrue
\newcommand*{\@pageat}{4}
\KOMA@key{pagenumber}{%
  \begingroup
    \KOMA@set@ncmdkey{pagenumber}{@tempa}{%
      {no}{-1},{off}{-1},{false}{-1},%
      {topleft}{0},{headleft}{0},%
      {topmiddle}{1},{topcenter}{1},{topcentered}{1},%
      {headmiddle}{1},{headcenter}{1},{headcentered}{1},%
      {topright}{2},{headright}{2},%
      {botleft}{3},{footleft}{3},%
      {botmiddle}{4},{botcenter}{4},{botcentered}{4},%
      {footmiddle}{4},{footcenter}{4},{footcentered}{4},%
      {botright}{5},{footright}{5},%
      {top}{10},{head}{10},{bot}{11},{foot}{11},%
      {left}{20},{middle}{21},{center}{21},{centered}{21},{right}{22}%
    }{#1}%
    \ifx\FamilyKeyState\FamilyKeyStateProcessed
      \aftergroup\FamilyKeyStateProcessed
      \ifnum\@tempa<10
        \edef\@tempa{\endgroup\edef\noexpand\@pageat{\@tempa}}%
      \else
        \ifnum\@tempa<20
          \@tempcnta\@pageat\relax
          \ifnum\@tempcnta>2
            \advance\@tempcnta by -3
          \fi
          \ifnum\@tempa=11
            \advance\@tempcnta by 3
          \fi
          \edef\@tempa{\endgroup\edef\noexpand\@pageat{\the\@tempcnta}}%
        \else
          \ifnum\@pageat>2
            \edef\@pageat{3}%
          \else
            \edef\@pageat{0}%
          \fi
          \@tempcnta\@tempa
          \advance\@tempcnta by -20
          \advance\@tempcnta by\@pageat
          \edef\@tempa{\endgroup\edef\noexpand\@pageat{\the\@tempcnta}}%
        \fi
      \fi
    \else
      \def\@tempa{\endgroup\FamilyKeyStateUnknownValue}%
    \fi
  \@tempa
  \KOMA@kav@xreplacevalue{.%
    \KOMAClassFileName
  }{pagenumber}{%
    \ifcase \@pageat
      topleft%
    \or
      topmiddle%
    \or
      topright%
    \or
      botleft%
    \or
      botmiddle%
    \or
      botright%
    \else
      false%
    \fi
  }%
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{pagenumber}{botmiddle}
\newif\if@scrsymbols
\KOMA@key{symbolicnames}[true]{%
  \KOMA@set@ifkey{symbolicnames}{@scrsymbols}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \def\scr@symbols@font{marvosym}%
  \else
    \KOMA@set@ncmdkey{symbolicnames}{reserved@a}{%
      {marvosym}{0},%
      {fontawesome}{1},{awesome}{1},%
    }{#1}%
    \ifx \FamilyKeyState\FamilyKeyStateProcessed
      \@scrsymbolstrue
      \ifcase \number\reserved@a
        \def\scr@symbols@font{marvosym}%
      \else
        \def\scr@symbols@font{fontawesome}%
      \fi
    \fi
  \fi
  \ifx \FamilyKeyState\FamilyKeyStateProcessed
    \KOMA@kav@xreplacevalue{.%
      \KOMAClassFileName
    }{symbolicnames}{#1}%
    \if@scrsymbols
      \Ifstr{\scr@symbols@font}{marvosym}{%
        \def\scr@symbol@phone{\Telefon}%
        \def\scr@symbol@fax{\FAX}%
        \def\scr@symbol@email{\Email}%
        \def\scr@symbol@mobilephone{\Mobilefone}%
        \def\scr@symbol@www{\@empty}%
      }{%
        \def\scr@symbol@phone{\faPhone}%
        \def\scr@symbol@fax{\faFax}%
        \def\scr@symbol@email{\faEnvelopeO}%
        \def\scr@symbol@mobilephone{\faMobilePhone}%
        \def\scr@symbol@www{\faGlobe}%
      }%
      \if@atdocument
        \begingroup
          \@tempswafalse
          \expandafter\ifdefined\scr@symbol@phone\else\@tempswatrue\fi
          \expandafter\ifdefined\scr@symbol@fax\else\@tempswatrue\fi
          \expandafter\ifdefined\scr@symbol@email\else\@tempswatrue\fi
          \expandafter\ifdefined\scr@symbol@mobilephone\else\@tempswatrue\fi
          \expandafter\ifdefined\scr@symbol@www\else\@tempswatrue\fi
          \if@tempswa
            \aftergroup\@scrsymbolsfalse
            \ClassWarning{\KOMAClassName}{%
              Option `symbolicnames=#1'
              ignorred.\MessageBreak
              You've tried to set option `symbolicnames'\MessageBreak
              after \string\begin{document}, but without\MessageBreak
              loading package `\scr@symbols@font' before.\MessageBreak
              You should either switch on option\MessageBreak
              `symbolicnames' before \string\begin{document}\MessageBreak
              or load package `\scr@letter@symbols@font' in the
              document\MessageBreak
              preamble to avoid this warning%
            }%
          \fi
        \endgroup
      \else
        \ifx\@fileswith@pti@ns\@badrequireerror
          \Ifstr{\@currext}{\@clsextension}{%
            \expandafter\AtEndOfClass
          }{%
            \Ifstr{\@currext}{\@pkgextension}{%
              \expandafter\AtEndOfPackage
            }{%
              \expandafter\AtBeginDocument
            }%
          }%
        \else
          \expandafter\@firstofone
        \fi
        {\RequirePackage{\scr@symbols@font}}%
      \fi
    \fi
  \fi
}
\KOMA@kav@add{.%
  \KOMAClassFileName
}{symbolicnames}{false}%
\newcommand*{\scr@symbols@font}{}
\newcommand*{\scr@symbol@phone}{\undefined}
\newcommand*{\scr@symbol@fax}{\undefined}
\newcommand*{\scr@symbol@email}{\undefined}
\newcommand*{\scr@symbol@mobilephone}{\undefined}
\newcommand*{\scr@symbol@www}{\undefined}
%%% From File: $Id: scrkernel-addressfiles.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: option)
%%% From File: $Id: scrkernel-miscellaneous.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: execoption)
\KOMAExecuteOptions{%
  parskip=false,%
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
\expandafter\ifnum \@nameuse{scr@v@2.95}>\scr@compatibility\relax
  \newcommand*{\@setif}[2][]{%
    \begingroup
      \edef\@tempa{#1}\ifx\@tempa\@empty
        \def\@tempa{\KOMA@set@ifkey{#2}{@#2}}%
      \else
        \def\@tempa{\KOMA@set@ifkey{#2}{#1}}%
      \fi
    \expandafter\endgroup\@tempa
  }%
\fi
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
%%% From File: $Id: scrkernel-miscellaneous.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
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
\scr@package@not@recommended{parskip}{%
  option\MessageBreak
  `parskip' with one of it's several values}
\scr@package@not@recommended{titleps}{%
  package `scrlayer-scrpage'}
%%% From File: $Id: scrkernel-letterclassoptions.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*{\LoadLetterOption}[1]{%
  \@ifundefined{@restore@catcode@level}%
    {\let\@restore@catcode@level=\z@}{}%
  \ifnum\@restore@catcode@level =\z@
    \ifnum\catcode`\@=11
      \let\@restore@catcode\relax
    \else
      \@tempcnta=\catcode`\@
      \edef\@restore@catcode{%
        \noexpand\catcode`\noexpand\@=\the\@tempcnta}%
      \makeatletter
    \fi
  \fi
  \@tempcnta=\@restore@catcode@level\relax
  \advance\@tempcnta by \@ne\relax
  \edef\@restore@catcode@level{\the\@tempcnta}%
  \scr@sp@def\reserved@a{#1}%
  \edef\reserved@a{%
    \noexpand\edef\noexpand\scr@currentlco{\reserved@a}%
    \noexpand\InputIfFileExists{\reserved@a.lco}{%
      \noexpand\ClassInfo{scrlttr2%
      }{Letter-Class-Option `#1' loaded}%
    }{%
      \noexpand\ClassError{scrlttr2%
      }{%
        Letter-Class-Option file `#1.lco' not found%
      }{%
        You've told me to load the Letter-Class-Option `#1'. So I have
        to load\noexpand\MessageBreak
        the file `#1.lco'. But the file isn't available.}%
    }%
    \scr@ifundefinedorrelax{scr@currentlco}{%
      \unexpanded{\let\scr@currentlco\relax}%
    }{%
      \noexpand\def\noexpand\scr@currentlco{\scr@currentlco}%
    }%
  }%
  \if@atdocument
    \edef\reserved@a{%
      \unexpanded\expandafter{\reserved@a}%
      \ifx\RequirePackage\@notprerr
        \unexpanded{\let\RequirePackage\@notprerr}%
      \else
        \noexpand\def\noexpand\RequirePackage{%
          \unexpanded\expandafter{\RequirePackage}%
        }%
      \fi
      \ifx\usepackage\@notprerr
        \unexpanded{\let\usepackage\@notprerr}%
      \else
        \noexpand\def\noexpand\usepackage{%
          \unexpanded\expandafter{\usepackage}%
        }%
      \fi
    }%
    \let\RequirePackage\lco@RequirePackage
    \let\usepackage\lco@RequirePackage
    \expandafter\reserved@a
  \else \expandafter\reserved@a
  \fi
  \@tempcnta=\@restore@catcode@level\relax
  \advance\@tempcnta by \m@ne\relax
  \edef\@restore@catcode@level{\the\@tempcnta}%
  \ifnum\@tempcnta =\z@
    \@restore@catcode
  \fi
}
\newcommand*{\lco@RequirePackage}[2][]{%
  \begingroup
    \@for\reserved@a:=#2\do{%
      \scr@trim@spaces\reserved@a
      \scr@ifundefinedorrelax{ver@\reserved@a.\scr@pkgextension}{%
        \ClassError{\KOMAClassName}{%
          lco-file `\scr@currentlco' can be used only in preamble%
        }{%
          The lco-file `\scr@currentlco' uses \string\RequirePackage\space or
          \string\usepackage\space to load\MessageBreak
          package `\reserved@a'. This means you have to either load
          `\reserved@a'\MessageBreak
          or lco-file `\scr@currentlco' in the document preamble.
        }%
      }{}%
    }%
  \endgroup
  \scr@gobbleopt
}
\newcommand*{\LoadLetterOptions}[1]{%
  \begingroup
    \def\reserved@a{\endgroup}%
    \@for\reserved@b:=#1\do{%
      \scr@trim@spaces\reserved@b
      \ifx\reserved@b\@empty\else
        \edef\reserved@a{\expandafter\unexpanded\expandafter{\reserved@a
            \LoadLetterOption}{\reserved@b}\relax}%
      \fi
    }%
  \reserved@a
}
\newcommand*{\LOPNP@option}{}
\newcommand*{\LOPNP@size}{}
\newcommand*{\@PapersizeWarning}{%
  \begingroup%
    \edef\@tempc{\noexpand\@tempswafalse
      \noexpand\ifdim\paperwidth<\the\dimexpr\paperwidth-.1mm\relax
      \relax
      \noexpand\else
        \noexpand\ifdim\paperwidth>\the\dimexpr\paperwidth+.1mm\relax
        \relax
        \noexpand\else
          \noexpand\ifdim\paperheight<\the\dimexpr\paperheight-.1mm\relax
          \relax
          \noexpand\else
            \noexpand\ifdim\paperheight>\the\dimexpr\paperheight+.1mm\relax
            \relax
            \noexpand\else
              \noexpand\@tempswatrue
            \noexpand\fi
          \noexpand\fi
        \noexpand\fi
      \noexpand\fi
      \noexpand\@@PapersizeWarning
    }%
    \def\@tempb{letter}\ifx\LOPNP@size\@tempb%
      \setlength{\paperheight}{11in}\setlength{\paperwidth}{8.5in}%
    \else\def\@tempb{legal}\ifx\LOPNP@size\@tempb%
        \setlength{\paperheight}{14in}\setlength{\paperwidth}{8.5in}%
      \else\def\@tempb{executive}\ifx\LOPNP@size\@tempb%
          \setlength{\paperheight}{10.5in}\setlength{\paperwidth}{7.25in}%
        \else%
          \PaperNameToSize[letter]{\LOPNP@size}%
        \fi
      \fi
    \fi
    \@tempc
  \endgroup%
}
\AfterPackage*{typearea}{%
\ProvideUnknownPaperSizeError{letter}{%
  \ClassError{scrlttr2}{%
    papersize `\LOPNP@size' undefined}{%
    You've told me to check for paper size
    `\LOPNP@size'\MessageBreak
    at letter option file `\LOPNP@option.lco',\MessageBreak
    but this paper size is not supported.\MessageBreak
    See the KOMA-Script manual for informations about known
    paper sizes.}%
}
}
\newcommand*{\@@PapersizeWarning}{%
  \if@tempswa\else%
  \ClassWarningNoLine{scrlttr2%
  }{%
    Letter option file `\LOPNP@option.lco'\MessageBreak
    needs paper size `\LOPNP@size'.\MessageBreak
    Current paper size is not `\LOPNP@size'!\MessageBreak
    \scr@ifundefinedorrelax{KOMAClassName}{%
      You should load package `typearea' either\MessageBreak
      with option `paper=\LOPNP@size,paper=portrait' or
      additionally\MessageBreak
    }{%
      You should add `paper=\LOPNP@size,paper=portrait' at the\MessageBreak
      option list of `\string\documentclass' or\MessageBreak
    }%
    add `\string\KOMAoptions{paper=\LOPNP@size,paper=portrait}'\MessageBreak
    before starting this letter!\MessageBreak
    Maybe you know what you are doing,\MessageBreak
    so I do not change this myself}%
  \fi
  }
\newcommand*{\LetterOptionNeedsPapersize}[2]{%
  \edef\LOPNP@size{#2}\edef\LOPNP@option{#1}%
}
%%% From File: $Id: scrkernel-language.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*{\g@addnumerical@date}[2]{%
  \@ifundefined{date#1}{%
    \ClassInfo{scrlttr2%
    }{%
      no date found for language `#1'\MessageBreak
      --> skipped%
    }%
  }{%
    \expandafter\g@addto@macro\csname date#1\endcsname{%
      \let\sym@date=\today%
      \def\num@date{#2}%
      \def\today{\if@orgdate\sym@date\else\num@date\fi}%
    }%
  }%
}
\AtBeginDocument{%
  \@ifundefined{captionsenglish}{\let\captionsenglish\@empty}{}%
  \@ifundefined{dateenglish}{\def\dateenglish{%
      \def\today{\ifcase\month\or
        January\or February\or March\or April\or May\or June\or
        July\or August\or September\or October\or November\or December\fi
        \space\number\day, \number\year}%
    }%
  }{}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\yourrefname{Your ref.}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\yourmailname{Your letter of}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\myrefname{Our ref.}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\customername{Customer no.}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\invoicename{Invoice no.}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\subjectname{Subject}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\ccname{cc}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\enclname{encl}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\headtoname{To}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\headfromname{From}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\datename{Date}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\pagename{Page}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\phonename{Phone}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\mobilephonename{Mobile phone}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\faxname{Fax}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\emailname{Email}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\wwwname{Url}%
  \providecaptionname{american,australian,british,canadian,%
    english,newzealand,%
    UKenglish,ukenglish,USenglish,usenglish}\bankname{Bank account}%
  \g@addnumerical@date{american}{\number\month/\number\day/\number\year}%
  \g@addnumerical@date{australian}{\number\day/\number\month/\number\year}%
  \g@addnumerical@date{british}{\number\day/\number\month/\number\year}%
  \g@addnumerical@date{canadian}{\number\year/\number\month/\number\day}%
  \g@addnumerical@date{english}{\number\day/\number\month/\number\year}%
  \g@addnumerical@date{newzealand}{\number\day/\number\month/\number\year}%
  \g@addnumerical@date{UKenglish}{\number\day/\number\month/\number\year}%
  \g@addnumerical@date{ukenglish}{\number\day/\number\month/\number\year}%
  \g@addnumerical@date{USenglish}{\number\month/\number\day/\number\year}%
  \g@addnumerical@date{usenglish}{\number\month/\number\day/\number\year}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\yourrefname{Ihr Zeichen}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\yourmailname{Ihr Schreiben vom}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\myrefname{Unser Zeichen}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\customername{Kundennummer}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\invoicename{Rechnungsnummer}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\subjectname{Betrifft}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\ccname{Kopien an}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\enclname{Anlage}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\headtoname{An}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\headfromname{Von}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\datename{Datum}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\pagename{Seite}%
  \providecaptionname{german}\phonename{Telephon}%
  \providecaptionname{ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\phonename{Telefon}%
  \providecaptionname{german}\mobilephonename{Mobiltelephon}%
  \providecaptionname{ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\mobilephonename{Mobiltelefon}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\faxname{Fax}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\emailname{E-Mail}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\wwwname{URL}%
  \providecaptionname{german,ngerman,austrian,naustrian,%
    swissgerman,nswissgerman}\bankname{Bankverbindung}%
  \g@addnumerical@date{german}{\number\day.\,\number\month.\,\number\year}%
  \g@addnumerical@date{ngerman}{\number\day.\,\number\month.\,\number\year}%
  \g@addnumerical@date{austrian}{\number\day.\,\number\month.\,\number\year}%
  \g@addnumerical@date{naustrian}{\number\day.\,\number\month.\,\number\year}%
  \g@addnumerical@date{swissgerman}{\number\day.\,\number\month.\,\number\year}%
  \g@addnumerical@date{nswissgerman}{%
    \number\day.\,\number\month.\,\number\year}%
  \providecaptionname{%
    acadian,canadien,francais,french}\yourrefname{Vos r\'ef\'erences}%
  \providecaptionname{%
    acadian,canadien,francais,french}\yourmailname{Votre lettre du}%
  \providecaptionname{%
    acadian,canadien,francais,french}\myrefname{Nos r\'ef\'erences}%
  \providecaptionname{%
    acadian,canadien,francais,french}\customername{Num\'ero de client}%
  \providecaptionname{%
    acadian,canadien,francais,french}\invoicename{Num\'ero de facture}%
  \providecaptionname{%
    acadian,canadien,francais,french}\subjectname{Concernant}%
  \providecaptionname{%
    acadian,canadien,francais,french}\ccname{Copie \`a}%
  \providecaptionname{%
    acadian,canadien,francais,french}\enclname{Annexes}%
  \providecaptionname{%
    acadian,canadien,francais,french}\headtoname{A}%
  \providecaptionname{%
    acadian,canadien,francais,french}\headfromname{De}%
  \providecaptionname{%
    acadian,canadien,francais,french}\datename{Date}%
  \providecaptionname{%
    acadian,canadien,francais,french}\pagename{Page}%
  \providecaptionname{%
    acadian,canadien,francais,french}\phonename{T\'el\'ephone}%
  \providecaptionname{%
    acadian,canadien,francais,french}\mobilephonename{Portable}%
  \providecaptionname{%
    acadian,canadien,francais,french}\faxname{T\'el\'efax}%
  \providecaptionname{%
    acadian,canadien,francais,french}\emailname{E-mail}%
  \providecaptionname{%
    acadian,canadien,francais,french}\wwwname{URL}%
  \providecaptionname{%
    acadian,canadien,francais,french}\bankname{Compte en banque}%
  \g@addnumerical@date{acadian}{\number\day.\,\number\month.\,\number\year}%
  \g@addnumerical@date{canadien}{\number\year/\number\month/\number\day}%
  \g@addnumerical@date{francais}{\number\day.\,\number\month.\,\number\year}%
  \g@addnumerical@date{french}{\number\day.\,\number\month.\,\number\year}%
  \providecaptionname{italian}\yourrefname{Vs./Rif.}% or Vostro Riferimento
  \providecaptionname{italian}\yourmailname{Vs.~lettera del}% or Vostra
                                                            % lettera del
  \providecaptionname{italian}\myrefname{Ns./Rif.}% or Nostro Riferimento
  \providecaptionname{italian}\customername{Nr.~cliente}% or Cliente num.
  \providecaptionname{italian}\invoicename{Nr.~fattura}% or Fattura num.
  \providecaptionname{italian}\subjectname{Oggetto}%
  \providecaptionname{italian}\ccname{Per conoscenza}% or Copia a
  \providecaptionname{italian}\enclname{Allegato}% or (plural) Allegati
  \providecaptionname{italian}\headtoname{A}%
  \providecaptionname{italian}\headfromname{Da}%
  \providecaptionname{italian}\datename{Data}%
  \providecaptionname{italian}\pagename{Pagina}%
  \providecaptionname{italian}\phonename{Telefono}%
  \providecaptionname{italian}\mobilephonename{Telefonino}%
  \providecaptionname{italian}\faxname{Fax}%
  \providecaptionname{italian}\emailname{Email}%
  \providecaptionname{italian}\wwwname{Sito Web}%
  \providecaptionname{italian}\bankname{Conto bancario}%
  \g@addnumerical@date{italian}{\number\day.\,\number\month.\,\number\year}%
  \providecaptionname{spanish}\yourrefname{Su ref.}%
  \providecaptionname{spanish}\yourmailname{Su carta de}%
  \providecaptionname{spanish}\myrefname{Nuestra ref.}%
  \providecaptionname{spanish}\customername{No. de cliente}%
  \providecaptionname{spanish}\invoicename{No. de factura}%
  \providecaptionname{spanish}\subjectname{Asunto}%
  \providecaptionname{spanish}\ccname{Copias}%
  \providecaptionname{spanish}\enclname{Adjunto}%
  \providecaptionname{spanish}\headtoname{A}%
  \providecaptionname{spanish}\headfromname{De}%
  \providecaptionname{spanish}\datename{Fecha}%
  \providecaptionname{spanish}\pagename{P\'agina}%
  \providecaptionname{spanish}\phonename{Tel\'efono}%
  \providecaptionname{spanish}\mobilephonename{M\'ovil}%
  \providecaptionname{spanish}\faxname{Fax}%
  \providecaptionname{spanish}\emailname{Email}% or Correo electr\'onico
  \providecaptionname{spanish}\wwwname{URL}% or P\`agina web
  \providecaptionname{spanish}\bankname{Cuenta bancaria}%
  \g@addnumerical@date{spanish}{\number\day.\,\number\month.\,\number\year}%
  \providecaptionname{croatian}\yourrefname{Va\v{s} znak}%
  \providecaptionname{croatian}\yourmailname{Va\v{s}e pismo od}%
  \providecaptionname{croatian}\myrefname{Na\v{s} znak}%
  \providecaptionname{croatian}\customername{Broj kupca}%
  \providecaptionname{croatian}\invoicename{Broj fakture}%
  \providecaptionname{croatian}\subjectname{Predmet}%
  \providecaptionname{croatian}\ccname{Kopija}%
  \providecaptionname{croatian}\enclname{Privitak}%
  \providecaptionname{croatian}\headtoname{Prima}%
  \providecaptionname{croatian}\headfromname{\v{S}alje}%
  \providecaptionname{croatian}\datename{Nadnevak}%
  \providecaptionname{croatian}\pagename{Stranica}%
  \providecaptionname{croatian}\phonename{Telefon}%
  \providecaptionname{croatian}\mobilphonename{Mobitel}%
  \providecaptionname{croatian}\faxname{Fax}%
  \providecaptionname{croatian}\emailname{E-Mail}%
  \providecaptionname{croatian}\wwwname{URL}%
  \providecaptionname{croatian}\bankname{Bankovna veza}%
  \g@addnumerical@date{croatian}{\number\day.\,\number\month.\,\number\year.}%
  \providecaptionname{dutch}\yourrefname{Uw kenmerk}%
  \providecaptionname{dutch}\yourmailname{Uw brief van}%
  \providecaptionname{dutch}\myrefname{Ons kenmerk}%
  \providecaptionname{dutch}\customername{Klant No.}%
  \providecaptionname{dutch}\invoicename{Rekening No.}%
  \providecaptionname{dutch}\subjectname{Onderwerp}%
  \providecaptionname{dutch}\ccname{Kopie aan}%
  \providecaptionname{dutch}\enclname{Bijlage(n)}%
  \providecaptionname{dutch}\headtoname{Aan}%
  \providecaptionname{dutch}\headfromname{Van}%
  \providecaptionname{dutch}\datename{Datum}%
  \providecaptionname{dutch}\pagename{Pagina}%
  \providecaptionname{dutch}\phonename{Telefoon}%
  \providecaptionname{dutch}\mobilephonename{Mobieltje}%
  \providecaptionname{dutch}\faxname{Fax}%
  \providecaptionname{dutch}\emailname{E--mail}%
  \providecaptionname{dutch}\wwwname{URL}%
  \providecaptionname{dutch}\bankname{Bankrekening}%
  \g@addnumerical@date{dutch}{\number\day.\,\number\month.\,\number\year}%
  \providecaptionname{finnish}\yourrefname{Viitteenne}%
  \providecaptionname{finnish}\yourmailname{Kirjeenne}%
  \providecaptionname{finnish}\myrefname{Viitteemme}%
  \providecaptionname{finnish}\customername{Asiakasnumero}%
  \providecaptionname{finnish}\invoicename{Laskun numero}%
  \providecaptionname{finnish}\subjectname{Asia}%
  \providecaptionname{finnish}\ccname{Jakelu}%
  \providecaptionname{finnish}\enclname{Liitteet}%
  \providecaptionname{finnish}\headtoname{Vastaanottaja}%
  \providecaptionname{finnish}\headfromname{L\"ahett\"aj\"a}%
  \providecaptionname{finnish}\datename{P\"aiv\"a}%
  \providecaptionname{finnish}\pagename{Sivu}%
  \providecaptionname{finnish}\phonename{Puhelin}%
  \providecaptionname{finnish}\mobilephonename{Matkapuhelin}%
  \providecaptionname{finnish}\faxname{Faksi}%
  \providecaptionname{finnish}\emailname{S\"ahk\"oposti}%
  \providecaptionname{finnish}\wwwname{URL}%
  \providecaptionname{finnish}\bankname{Pankkitilin numero}%
  \g@addnumerical@date{finnish}{\number\day.\number\month.\number\year}%
  \providecaptionname{norsk}\yourrefname{Deres ref.}%
  \providecaptionname{norsk}\yourmailname{Deres brev av:}%
  \providecaptionname{norsk}\myrefname{V\aa{}r ref:}%
  \providecaptionname{norsk}\customername{Kundenummer}%
  \providecaptionname{norsk}\invoicename{Fakturanummer}%
  \providecaptionname{norsk}\subjectname{Emne}%
  \providecaptionname{norsk}\ccname{Kopi til}%
  \providecaptionname{norsk}\enclname{Vedlegg}%
  \providecaptionname{norsk}\headtoname{Til}%
  \providecaptionname{norsk}\headfromname{Fra}%
  \providecaptionname{norsk}\datename{Dato}%
  \providecaptionname{norsk}\pagename{Side}%
  \providecaptionname{norsk}\phonename{Telefon}%
  \providecaptionname{norsk}\mobilephonename{Mobiltelefon}%
  \providecaptionname{norsk}\faxname{Telefaks}%
  \providecaptionname{norsk}\emailname{E-post}%
  \providecaptionname{norsk}\wwwname{Url}%
  \providecaptionname{norsk}\bankname{Bankkontonummer}%
  \g@addnumerical@date{norsk}{\number\day.\number\month.\number\year}%
  \providecaptionname{swedish}\yourrefname{Er ref}%
  \providecaptionname{swedish}\yourmailname{Ert brev av}%
  \providecaptionname{swedish}\myrefname{V\aa{}r ref}%
  \providecaptionname{swedish}\customername{Kundnummer}%
  \providecaptionname{swedish}\invoicename{Fakturanummer}%
  \providecaptionname{swedish}\subjectname{\"Amne}%
  \providecaptionname{swedish}\ccname{Kopia till}%
  \providecaptionname{swedish}\enclname{Bilagor}% Singular: Bilaga
  \providecaptionname{swedish}\headtoname{Till}%
  \providecaptionname{swedish}\headfromname{Fr\aa{}n}%
  \providecaptionname{swedish}\datename{Datum}%
  \providecaptionname{swedish}\pagename{Sida}%
  \providecaptionname{swedish}\phonename{Telefon}%
  \providecaptionname{swedish}\mobilephonename{Mobiltelefon}%
  \providecaptionname{swedish}\faxname{Telefax}%
  \providecaptionname{swedish}\emailname{E-post}%
  \providecaptionname{swedish}\wwwname{Hemsida}%
  \providecaptionname{swedish}\bankname{Bankgiro}% PlusGiro
  \g@addnumerical@date{swedish}{\number\day/\number\month~\number\year}%
  \providecaptionname{polish}\yourrefname{Wasz znak}%
  \providecaptionname{polish}\yourmailname{Wasze pismo z dnia}%
  \providecaptionname{polish}\myrefname{Nasz znak}%
  \providecaptionname{polish}\customername{Numer klienta}%
  \providecaptionname{polish}\invoicename{Numer rachunku}%
  \providecaptionname{polish}\subjectname{Dotyczy}%
  \providecaptionname{polish}\ccname{Rozdzielnik}%
  \providecaptionname{polish}\enclname{Za\l\aob{}czniki}%
  \providecaptionname{polish}\headtoname{Do}%
  \providecaptionname{polish}\headfromname{Od}%
  \providecaptionname{polish}\datename{Data}%
  \providecaptionname{polish}\pagename{Strona}%
  \providecaptionname{polish}\phonename{Telefon}%
  \providecaptionname{polish}\mobilephonename{Numer mobilny}%
  \providecaptionname{polish}\faxname{Fax}%
  \providecaptionname{polish}\emailname{E-mail}%
  \providecaptionname{polish}\wwwname{URL}%
  \providecaptionname{polish}\bankname{Konto}%
  \g@addnumerical@date{polish}{\number\day.\,\number\month.\,\number\year}%
  \providecaptionname{czech}\yourrefname{Va\v{s}e zna\v{c}ka}%
  \providecaptionname{czech}\yourmailname{V\'{a}\v{s} dopis ze dne}%
  \providecaptionname{czech}\myrefname{Na\v{s}e zna\v{c}ka}%
  \providecaptionname{czech}\customername{Z\'akaznick\'e \v{c}\'{\i}slo}%
  \providecaptionname{czech}\invoicename{Fakura\v{c}n\'{\i} \v{c}\'{\i}slo}%
  \providecaptionname{czech}\subjectname{Pr\v{e}dm\v{e}t}%
  \providecaptionname{czech}\ccname{Kopie}%
  \providecaptionname{czech}\enclname{P\v{r}\'{\i}loha}%
  \providecaptionname{czech}\headtoname{Komu}%
  \providecaptionname{czech}\headfromname{Od}%
  \providecaptionname{czech}\datename{Datum}%
  \providecaptionname{czech}\pagename{Strana}%
  \providecaptionname{czech}\phonename{Telefon}%
  \providecaptionname{czech}\mobilephonename{Mobil}%
  \providecaptionname{czech}\faxname{Fax}%
  \providecaptionname{czech}\emailname{E-Mail}%
  \providecaptionname{czech}\wwwname{URL}%
  \providecaptionname{czech}\bankname{Bankovn\'{\i} spojen\'{\i}}%
  \g@addnumerical@date{czech}{\number\day.\,\number\month.\,\number\year}%
  \providecaptionname{slovak}\yourrefname{Va\v{s}a zna\v{c}ka}%
  \providecaptionname{slovak}\yourmailname{V\'{a}\v{s} list zo d\v{n}a}%
  \providecaptionname{slovak}\myrefname{Na\v{s}a zna\v{c}ka}%
  \providecaptionname{slovak}\customername{Z\'akazn\'{\i}cke \v{c}\'{\i}slo}%
  \providecaptionname{slovak}\invoicename{\'{C}\'{\i}slo fakt\'ury}%
  \providecaptionname{slovak}\subjectname{Predmet}%
  \providecaptionname{slovak}\ccname{K\'{o}pia pre koho}%
  \providecaptionname{slovak}\enclname{Pr\'{\i}loha}%
  \providecaptionname{slovak}\headtoname{Komu}%
  \providecaptionname{slovak}\headfromname{Od}%
  \providecaptionname{slovak}\datename{D\'{a}tum}%
  \providecaptionname{slovak}\pagename{Strana}%
  \providecaptionname{slovak}\phonename{Telef\'{o}n}%
  \providecaptionname{slovak}\mobilephonename{Mobil}%
  \providecaptionname{slovak}\faxname{Fax}%
  \providecaptionname{slovak}\emailname{E-Mail}%
  \providecaptionname{slovak}\wwwname{URL}%
  \providecaptionname{slovak}\bankname{Bankov\'{e} spojenie}%
  \g@addnumerical@date{slovak}{\number\day.\,\number\month.\,\number\year}%
  \captionsenglish
  \dateenglish
  \begingroup\expandafter\expandafter\expandafter\endgroup
  \expandafter\ifx\csname date\languagename\endcsname\relax
    \ClassWarningNoLine{scrlttr2%
    }{%
      \string\language\space is \the\language, \string\languagename\space is
      `\languagename'\MessageBreak
      but \expandafter\string\csname
      date\languagename\endcsname\space not defined!\MessageBreak
      This seems to be a bug at you're `hyphen.cfg'.\MessageBreak
      Undefining macro \string\languagename\space to avoid errors%
    }%
    \let\languagename=\undefined
  \fi
  \ifx\languagename\undefined
    \ClassWarningNoLine{scrlttr2%
    }{\string\languagename\space not
      defined, using \string\language.\MessageBreak
      This may result in use of wrong language!\MessageBreak
      You should use a compatible language
      package\MessageBreak
      (e.g. `Babel', `german', `ngerman', ...)}%
    \ifx\l@american\undefined\else\ifnum\language=\l@american
        \@nameuse{captionsamerican}%
        \@nameuse{extrasamerican}%
        \@nameuse{dateamerican}%
    \fi\fi
    \ifx\l@australian\undefined\else\ifnum\language=\l@australian
        \@nameuse{captionsaustralian}%
        \@nameuse{extrasaustralian}%
        \@nameuse{dateaustralian}%
    \fi\fi
    \ifx\l@british\undefined\else\ifnum\language=\l@british
        \@nameuse{captionsbritish}%
        \@nameuse{extrasbritish}%
        \@nameuse{datebritish}%
    \fi\fi
    \ifx\l@canadian\undefined\else\ifnum\language=\l@canadian
        \@nameuse{captionscanadian}%
        \@nameuse{extrascanadian}%
        \@nameuse{datecanadian}%
    \fi\fi
    \ifx\l@newzealand\undefined\else\ifnum\language=\l@newzealand
        \@nameuse{captionsnewzealand}%
        \@nameuse{extrasnewzealand}%
        \@nameuse{datenewzealand}%
    \fi\fi
    \ifx\l@UKenglish\undefined\else\ifnum\language=\l@UKenglish
        \@nameuse{captionsUKenglish}%
        \@nameuse{extrasUKenglish}%
        \@nameuse{dateUKenglish}%
    \fi\fi
    \ifx\l@ukenglish\undefined\else\ifnum\language=\l@ukenglish
        \@nameuse{captionsukenglish}%
        \@nameuse{extrasukenglish}%
        \@nameuse{dateukenglish}%
    \fi\fi
    \ifx\l@USenglish\undefined\else\ifnum\language=\l@USenglish
        \@nameuse{captionsUSenglish}%
        \@nameuse{extrasUSenglish}%
        \@nameuse{dateUSenglish}%
    \fi\fi
    \ifx\l@usenglish\undefined\else\ifnum\language=\l@usenglish
        \@nameuse{captionsusenglish}%
        \@nameuse{extrasusenglish}%
        \@nameuse{dateusenglish}%
    \fi\fi
    \ifx\l@austrian\undefined\else\ifnum\language=\l@austrian
        \@nameuse{captionsaustrian}%
        \@nameuse{extrasaustrian}%
        \@nameuse{dateaustrian}%
    \fi\fi
    \ifx\l@naustrian\undefined\else\ifnum\language=\l@naustrian
        \@nameuse{captionsnaustrian}%
        \@nameuse{extrasnaustrian}%
        \@nameuse{datenaustrian}%
    \fi\fi
    \ifx\l@german\undefined\else\ifnum\language=\l@german
        \@nameuse{captionsgerman}%
        \@nameuse{extrasgerman}%
        \@nameuse{dategerman}%
    \fi\fi
    \ifx\l@ngerman\undefined\else\ifnum\language=\l@ngerman
        \@nameuse{captionsngerman}%
        \@nameuse{extrasngerman}%
        \@nameuse{datengerman}%
    \fi\fi
    \ifx\l@swissgerman\undefined\else\ifnum\language=\l@swissgerman
        \@nameuse{captionsswissgerman}%
        \@nameuse{extrasswissgerman}%
        \@nameuse{dateswissgerman}%
    \fi\fi
    \ifx\l@nswissgerman\undefined\else\ifnum\language=\l@nswissgerman
        \@nameuse{captionsnswissgerman}%
        \@nameuse{extrasnswissgerman}%
        \@nameuse{datenswissgerman}%
    \fi\fi
    \ifx\l@acadian\undefined\else\ifnum\language=\l@acadian
        \@nameuse{captionsacadian}%
        \@nameuse{extrasacadian}%
        \@nameuse{dateacadian}%
    \fi\fi
    \ifx\l@canadien\undefined\else\ifnum\language=\l@canadien
        \@nameuse{captionscanadien}%
        \@nameuse{extrascanadien}%
        \@nameuse{datecanadien}%
    \fi\fi
    \ifx\l@francais\undefined\else\ifnum\language=\l@francais
        \@nameuse{captionsfrancais}%
        \@nameuse{extrasfrancais}%
        \@nameuse{datefrancais}%
    \fi\fi
    \ifx\l@french\undefined\else\ifnum\language=\l@french
        \@nameuse{captionsfrench}%
        \@nameuse{extrasfrench}%
        \@nameuse{datefrench}%
    \fi\fi
    \ifx\l@italian\undefined\else\ifnum\language=\l@italian
        \@nameuse{captionsitalian}%
        \@nameuse{extrasitalian}%
        \@nameuse{dateitalian}%
    \fi\fi
    \ifx\l@spanish\undefined\else\ifnum\language=\l@spanish
        \@nameuse{captionsspanish}%
        \@nameuse{extrasspanish}%
        \@nameuse{datespanish}%
    \fi\fi
    \ifx\l@croatian\undefined\else\ifnum\language=\l@croatian
        \@nameuse{captionscroatian}%
        \@nameuse{extrascroatian}%
        \@nameuse{datecroatian}%
    \fi\fi
    \ifx\l@dutch\undefined\else\ifnum\language=\l@dutch
        \@nameuse{captionsdutch}%
        \@nameuse{extrasdutch}%
        \@nameuse{datedutch}%
    \fi\fi
    \ifx\l@finnish\undefined\else\ifnum\language=\l@finnish
        \@nameuse{captionsfinnish}%
        \@nameuse{extrasfinnish}%
        \@nameuse{datefinnish}%
    \fi\fi
    \ifx\l@norsk\undefined\else\ifnum\language=\l@norsk
        \@nameuse{captionsnorsk}%
        \@nameuse{extrasnorsk}%
        \@nameuse{datenorsk}%
    \fi\fi
    \ifx\l@swedish\undefined\else\ifnum\language=\l@swedish
        \@nameuse{captionsswedish}%
        \@nameuse{extrasswedish}%
        \@nameuse{dateswedish}%
    \fi\fi
    \ifx\l@polish\undefined\else\ifnum\language=\l@polish
        \@nameuse{captionspolish}%
        \@nameuse{extraspolish}%
        \@nameuse{datepolish}%
    \fi\fi
    \ifx\l@czech\undefined\else\ifnum\language=\l@czech
        \@nameuse{captionsczech}%
        \@nameuse{extrasczech}%
        \@nameuse{dateczech}%
    \fi\fi
    \ifx\l@slovak\undefined\else\ifnum\language=\l@slovak
        \@nameuse{captionsslovak}%
        \@nameuse{extrasslovak}%
        \@nameuse{dateslovak}%
    \fi\fi
  \else
    \edef\@tempa{nohyphenation}%
    \ifx\languagename\@tempa
      \ClassWarningNoLine{scrlttr2%
      }{%
        You've selected language `\languagename'.\MessageBreak
        Maybe your LaTeX format contains Babel extension\MessageBreak
        but you have not selected a language using\MessageBreak
        Babel package.\MessageBreak
        Please select another language!\MessageBreak
        Only as a workaround english captions and date\MessageBreak
        will be used%
      }%
    \else
      \ClassInfo{scrlttr2%
      }{%
        trying to activate captions and date\MessageBreak
        of language `\languagename'%
      }%
      \csname date\languagename\endcsname
      \csname captions\languagename\endcsname
      \ClassInfo{scrlttr2%
      }{%
        used language is `\languagename'.\MessageBreak
        Supported languages are: `english', `UKenglish',\MessageBreak
        `ukenglish', `british', `american', `USenglish',\MessageBreak
        `usenglish', `australian`,`canadian', `newzealand',\MessageBreak
        `german', `ngerman', `austrian', `naustrian',\MessageBreak
        `swissgerman', `nswissgermsn',\MessageBreak
        `acadian', `canadien', `francais', `french', \MessageBreak
        `dutch', `italian', `spanish', `polish',\MessageBreak
        `croatian', `finnish', `norsk', `swedish',\MessageBreak
        `czech', `slovak'%
      }%
    \fi
  \fi
}
%%% From File: $Id: scrkernel-variables.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*{\newkomavar}{%
  \kernel@ifstar {\@tempswatrue\@newkomavar}{\@tempswafalse\@newkomavar}}
\newcommand*{\@newkomavar}[2][\relax]{%
  \@ifundefined{scr@#2@name}{%
    \@ifundefined{scr@#2@var}{%
      \begingroup
        \def\@tempa{#1}\def\@tempb{\relax}%
        \ifx\@tempa\@tempb\endgroup\else
        \endgroup\@namedef{scr@#2@name}{#1}%
      \fi%
      \expandafter\let\csname scr@#2@var\endcsname=\@empty
      \if@tempswa\addtoreffields{#2}\fi
    }{%
      \ClassError{scrlttr2%
      }{%
        This should never happen%
      }{%
        The contents of the KOMA-Script variable `#2'\MessageBreak
        is undefined, but the name of the variable is
        defined.\MessageBreak
        This should never happen. So someone crashs me!%
      }%
    }%
  }{%
    \ClassError{scrlttr2%
    }{%
      Variable `#2' already defined%
    }{%
      I'll ignore this command, if you'll continue.%
    }%
  }%
}
\newcommand*{\setkomavar}{%
  \kernel@ifstar {\@setkomaname}{\@setkomavar}}
\newcommand*{\@setkomavar}[1]{%
  \kernel@ifnextchar [%]
  {\@@setkomavar{#1}}{\@@setkomavar{#1}[\relax]}}
\newcommand*{\@setkomaname}[2]{%
  \@ifundefined{scr@#1@var}{%
    \@komavar@err{set}{#1}%
  }{%
    \@namedef{scr@#1@name}{#2}%
    \csname scr@#1@postsetname\endcsname
  }%
}
\newcommand*{\@@setkomavar}{}
\long\def\@@setkomavar#1[#2]#3{%
  \@ifundefined{scr@#1@var}{%
    \@komavar@err{set}{#1}%
  }{%
    \@namedef{scr@#1@var}{#3}%
    \csname scr@#1@postsetvar\endcsname
    \begingroup
      \def\@tempa{#2}\def\@tempb{\relax}%
      \ifx\@tempa\@tempb\endgroup\else
      \endgroup\@namedef{scr@#1@name}{#2}%
      \csname scr@#1@postsetname\endcsname
    \fi
  }%
}
\newcommand*{\@komavar@err}[2]{%
  \ClassError{scrlttr2%
  }{%
    KOMA-Script variable not defined%
  }{%
    You've tried to #1 the not defined KOMA-Script variable
    `#2'.\MessageBreak
    You have to define the variable using \string\newkomavar\space
    before\MessageBreak
    you do this.%
  }%
}
\DeclareRobustCommand*{\usekomavar}{%
  \kernel@ifstar {\@usekomaname}{\@usekomavar}}
\newcommand*{\@usekomavar}[2][\@firstofone]{%
  \@ifundefined{scr@#2@var}{%
    \@komavar@err{use}{#2}%
  }{%
    #1{\@nameuse{scr@#2@var}}%
  }%
}
\newcommand*{\@usekomaname}[2][\@firstofone]{%
  \@ifundefined{scr@#2@var}{%
    \@komavar@err{use}{#2}%
  }{%
    #1{\@nameuse{scr@#2@name}}%
  }%
}
\newcommand*{\ifkomavar}{%
  \ClassWarning{\KOMAClassName}{%
    Usage of deprecated command `\string\ifkomavar'.\MessageBreak
    The command has been renamed to because of a\MessageBreak
    recommendation of LaTeX3 team members.\MessageBreak
    Please replace `\string\ifkomavar' by `\string\Ifkomavar'%
  }%
  \Ifkomavar
}
\DeclareRobustCommand*{\Ifkomavar}[1]{%
  \scr@ifundefinedorrelax{scr@#1@var}{%
    \expandafter\@secondoftwo
  }{%
    \expandafter\@firstoftwo
  }%
}
\newcommand*{\ifkomavarempty}{%
  \ClassWarning{\KOMAClassName}{%
    Usage of deprecated command `\string\ifkomavarempty'.\MessageBreak
    The command has been renamed to because of a\MessageBreak
    recommendation of LaTeX3 team members.\MessageBreak
    Please replace `\string\ifkomavarempty' by `\string\Ifkomavarempty'%
  }%
  \Ifkomavarempty
}
\DeclareRobustCommand*{\Ifkomavarempty}{%
  \begingroup
  \kernel@ifstar {\@tempswatrue\@ifkomavarempty}%
                 {\@tempswafalse\@ifkomavarempty}%
}
\newcommand{\@ifkomavarempty}[1]{%
    \Ifkomavar{#1}{%
      \if@tempswa
        \@ifundefined{scr@#1@name}{%
          \aftergroup\@firstoftwo
        }{%
          \expandafter\ifx\csname scr@#1@name\endcsname\@empty
            \aftergroup\@firstoftwo
          \else
            \aftergroup\@secondoftwo
          \fi
        }%
      \else
        \expandafter\ifx\csname scr@#1@var\endcsname\@empty
          \aftergroup\@firstoftwo
        \else
          \aftergroup\@secondoftwo
        \fi
      \fi
    }{%
      \@komavar@err{use}{#1}%
      \aftergroup\@gobbletwo
    }%
  \endgroup
}
\newcommand*{\foreachkomavar}[2]{%
  \@for \reserved@a:=#1\do{%
    \scr@trim@spaces\reserved@a
    \ifx\reserved@a\@empty\else
      \edef\reserved@a{\unexpanded{#2}{\reserved@a}}\expandafter\reserved@a
    \fi
  }%
}
\newcommand*{\foreachkomavarifempty}[3]{%
  \@for \reserved@a:=#1\do{%
    \scr@trim@spaces\reserved@a
    \ifx\reserved@a\@empty\else
      \edef\reserved@a{%
        \noexpand\Ifkomavarempty{\reserved@a}%
        {\unexpanded{#2}{\reserved@a}}%
        {\unexpanded{#3}{\reserved@a}}%
      }\expandafter\reserved@a
    \fi
  }%
}
\newcommand*{\foreachemptykomavar}[2]{%
  \@for \reserved@a:=#1\do{%
    \scr@trim@spaces\reserved@a
    \ifx\reserved@a\@empty\else
      \edef\reserved@a{%
        \noexpand\Ifkomavarempty{\reserved@a}{\unexpanded{#2}{\reserved@a}}{}%
      }\expandafter\reserved@a
    \fi
  }%
}
\newcommand*{\foreachnonemptykomavar}[2]{%
  \@for \reserved@a:=#1\do{%
    \scr@trim@spaces\reserved@a
    \ifx\reserved@a\@empty\else
      \edef\reserved@a{%
        \noexpand\Ifkomavarempty{\reserved@a}{}{\unexpanded{#2}{\reserved@a}}%
      }\expandafter\reserved@a
    \fi
  }%
}
%%% From File: $Id: scrkernel-pseudolengths.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*{\Ifplength}[1]{%
  \@ifundefined{ltr@len@#1}{\@secondoftwo}{\@firstoftwo}%
}
\newcommand*{\if@plength}{%
  \ClassWarning{\KOMAClassName}{%
    Internal macro `\string\if@plength' is deprecated.\MessageBreak
    Please use `\string\Ifplength' instead}%
  \Ifplength
}
\newcommand*{\newplength}[1]{%
  \@ifundefined{ltr@len@#1}{%
    \expandafter\let\csname ltr@len@#1\endcsname=\z@%
  }{%
    \ClassError{scrlttr2%
    }{%
      pseudo-length \expandafter\string\csname ltr@len@#1\endcsname
      already defined%
    }{%
      You've tried to define a new pseudo-length using\MessageBreak
      \string\@newplength\space
      or \string\newplength.\MessageBreak
      Please, try another name%
    }%
  }%
}
\newcommand*{\@newplength}{%
  \ClassWarning{\KOMAClassName}{%
    Internal macro `\string\@newplength' is deprecated.\MessageBreak
    Please use `\string\newplength' instead}%
  \newplength
}
\newcommand*{\useplength}[1]{%
  \glueexpr \csname ltr@len@#1\endcsname\relax}%
\newcommand*{\setlengthtoplength}[3][]{%
  \setlength{#2}{\useplength{#3}}%
  \setlength{#2}{#1#2}}
\newcommand*{\setplength}[3][]{%
  \begingroup%
    \setlength{\@tempskipa}{\glueexpr #3\relax}%
    \setlength{\@tempskipa}{#1\@tempskipa}%
    \edef\@tempa{\noexpand\endgroup%
      \noexpand\expandafter\noexpand\renewcommand\noexpand\expandafter*%
      \noexpand\csname ltr@len@#2\noexpand\endcsname{\the\@tempskipa}%
    }%
  \@tempa
}
\newcommand*{\@setplength}{%
  \ClassWarning{\KOMAClassName}{%
    Internal macro `\string\@setplength' is deprecated.\MessageBreak
    Please use `\string\setplength' instead}%
  \setplength
}
\newcommand*{\setplengthtowidth}[3][]{%
  \begingroup
    \settowidth{\@tempdima}{#3}%
    \setlength{\@tempdima}{#1\@tempdima}%
    \edef\@tempa{\noexpand\endgroup
      \noexpand\expandafter\noexpand\renewcommand\noexpand\expandafter*%
      \noexpand\csname ltr@len@#2\noexpand\endcsname{\the\@tempdima}%
    }%
  \@tempa
}
\newcommand*{\setplengthtoheight}[3][]{%
  \begingroup
    \settoheight{\@tempdima}{#3}%
    \setlength{\@tempdima}{#1\@tempdima}%
    \edef\@tempa{\noexpand\endgroup
      \noexpand\expandafter\noexpand\renewcommand\noexpand\expandafter*%
      \noexpand\csname ltr@len@#2\noexpand\endcsname{\the\@tempdima}%
    }%
  \@tempa
}
\newcommand*{\setplengthtodepth}[3][]{%
  \begingroup
    \settodepth{\@tempdima}{#3}%
    \setlength{\@tempdima}{#1\@tempdima}%
    \edef\@tempa{\noexpand\endgroup
      \noexpand\expandafter\noexpand\renewcommand\noexpand\expandafter*%
      \noexpand\csname ltr@len@#2\noexpand\endcsname{\the\@tempdima}%
    }%
  \@tempa
}
\newcommand*{\setplengthtototalheight}[3][]{%
  \begingroup
    \settoheight{\@tempdima}{#3}%
    \settodepth{\@tempdimb}{#3}%
    \addtolength{\@tempdima}{\@tempdimb}%
    \setlength{\@tempdima}{#1\@tempdima}%
    \edef\@tempa{\noexpand\endgroup
      \noexpand\expandafter\noexpand\renewcommand\noexpand\expandafter*%
      \noexpand\csname ltr@len@#2\noexpand\endcsname{\the\@tempdima}%
    }%
  \@tempa
}
\newcommand*{\addtolengthplength}[3][]{%
  \begingroup%
    \setlengthtoplength[{#1}]{\@tempskipa}{#3}%
    \edef\@tempa{\endgroup%
      \noexpand\addtolength{#2}{\the\@tempskipa}}%
  \@tempa%
}
\newcommand*{\addtoplength}[3][]{%
  \begingroup%
    \setlength{\@tempskipa}{\glueexpr #3\relax}%
    \setlength{\@tempskipa}{#1\@tempskipa}%
    \addtolengthplength{\@tempskipa}{#2}%
    \edef\@tempa{\noexpand\endgroup%
      \noexpand\expandafter\noexpand\renewcommand\noexpand\expandafter*%
      \noexpand\csname ltr@len@#2\noexpand\endcsname{\the\@tempskipa}%
      }%
  \@tempa%
}
\newcommand*{\@addtoplength}{%
  \ClassWarning{\KOMAClassName}{%
    Internal macro `\string\@addtoplength' is deprecated.\MessageBreak
    Please use `\string\addtoplength' instead}%
  \addtoplength}
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
\@lowpenalty  = 51
\@medpenalty  =151
\@highpenalty =301
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
\newcommand*{\scr@fnt@wrn@pagehead}[1]{%
  `pagehead' is only an alias of `pageheadfoot'.\MessageBreak
  Font of page foot will also be changed%
}
\newcommand*{\scr@fnt@pagefoot}{\footfont}
\newcommand*{%
  \pagemark
}{%
  {\usekomafont{pagenumber}{%
    \pagename\nobreakspace
    \thepage}}}
\renewcommand*{\ps@plain}{%
  \renewcommand*{\@oddhead}{%
    \vbox{\vbox{\hsize=\textwidth\hbox to\textwidth{%
          \parbox[b]{\textwidth}{\strut
            \ifnum\@pageat>-1
              \ifnum\@pageat<3
                \ifcase\@pageat\raggedright\or\centering\or\raggedleft\fi
                \pagemark
              \else
                \hfill
              \fi
            \else
              \hfill
            \fi
          }%
        }%
        \if@hsl\kern1pt\rule{\textwidth}{.4pt}\fi
      }%
    }%
  }%
  \let\@evenhead\@oddhead%
  \renewcommand*{\@oddfoot}{%
    \parbox[t]{\textwidth}{%
      \if@fsl
        {%
          \raggedright%
          \vskip-\baselineskip\vskip.4pt
          \hrulefill\\
        }%
      \fi
      \ifnum\@pageat>2
        \ifcase\@pageat\or\or\or\raggedright\or\centering\or\raggedleft\fi
        \strut\pagemark
      \else
        \hfill
      \fi
    }%
  }%
  \let\@evenfoot\@oddfoot
}
\newcommand*{\ps@headings}{\let\@mkboth\markboth
  \renewcommand*{\@oddhead}{%
    \vbox{%
      \vbox{\hsize=\textwidth\hbox to\textwidth{\headfont\noindent
          \usekomavar{nexthead}}}%
      \if@hsl\kern1pt\rule{\textwidth}{.4pt}\fi%
    }%
  }%
  \let\@evenhead\@oddhead
  \renewcommand*{\@oddfoot}{%
    \parbox[t]{\textwidth}{%
      \if@fsl
        {%
          \raggedright%
          \vskip-\baselineskip\vskip.4pt
          \hrulefill\\
        }%
      \fi
      \vbox{\hsize=\textwidth\hbox to\textwidth{\headfont\footfont\noindent
          \usekomavar{nextfoot}}}%
    }%
  }%
  \let\@evenfoot\@oddfoot
}
\newcommand*{\ps@myheadings}{%
  \ps@headings
  \let\@mkboth\@gobbletwo
}
\pagestyle{plain}
\pagenumbering{arabic}
%%% From File: $Id: scrkernel-floats.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
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
%%% From File: $Id: scrkernel-listsandtabulars.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
  \setlength{\leftmargini}{2.5em}
\setlength{\leftmarginii}{2.2em}
\setlength{\leftmarginiii}{1.87em}
\setlength{\leftmarginiv}{1.7em}
  \setlength{\leftmarginv}{1em}
  \setlength{\leftmarginvi}{1em}
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
%%% From File: $Id: scrkernel-notepaper.dtx 3895 2022-06-20 10:37:02Z kohm $
%%%            (run: body)

\newkomavar{firsthead}
\setkomavar{firsthead}{%
  \parbox[b]{\useplength{firstheadwidth}}%
  {\centering\usekomafont{fromaddress}{%
      \Ifkomavarempty{fromname}{}{%
        {\usekomafont{fromname}%
          {\ignorespaces\usekomavar{fromname}}\\[-8pt]}
        {\usekomafont{fromrule}{\rule{\useplength{firstheadwidth}}{.4pt}}}\\
      }%
      \Ifkomavarempty{fromaddress}{}{%
        \ignorespaces\usekomavar{fromaddress}%
      }%
    }%
  }%
}
\newcommand*{\scr@firsthead@postsetvar}{%
  \KOMAExecuteOptions[.%
    \KOMAClassFileName
  ]{fromalign=no}%
}
\newcommand*{\@gen@firsthead}{%
  \ifcase\@alignfrom
    \setkomavar{firsthead}{%
      \parbox[b]{\textwidth}{\raggedright
        {\usekomafont{fromname}\strut\ignorespaces
          \usekomavar{fromname}%
          {%
            \ifnum\@rulefrom=1\\[-.5\baselineskip]%
              \usekomafont{fromrule}{%
                \setlength{\@tempdima}{\useplength{fromrulewidth}}%
                \ifdim\@tempdima=\z@
                  \setlength{\@tempdima}{\textwidth}%
                  \if@logo
                    \settowidth{\@tempdimb}{\usekomavar{fromlogo}}%
                    \addtolength{\@tempdima}{-\@tempdimb}%
                  \fi
                \fi
                \expandafter\rule\expandafter{\the\@tempdima}{%
                  \useplength{fromrulethickness}}}%
            \fi
          }%
          \\
        }%
        {\usekomafont{fromaddress}\strut\ignorespaces
          \usekomavar{fromaddress}%
          \if@phone\\\usekomavar*{fromphone}\usekomavar{fromphone}\fi%
          \if@mobilephone
            \\\usekomavar*{frommobilephone}\usekomavar{frommobilephone}%
          \fi%
          \if@fax\\\usekomavar*{fromfax}\usekomavar{fromfax}\fi%
          \if@email\\\usekomavar*{fromemail}\usekomavar{fromemail}\fi%
          \if@www\\\usekomavar*{fromurl}\usekomavar{fromurl}\fi%
          \ifnum\@rulefrom=2\\[-.5\baselineskip]%
            \usekomafont{fromrule}{%
              \setlength{\@tempdima}{\useplength{fromrulewidth}}%
              \ifdim\@tempdima=\z@
                \setlength{\@tempdima}{\textwidth}%
              \fi
              \expandafter\rule\expandafter{\the\@tempdima}{%
                \useplength{fromrulethickness}}}%
          \fi
          \\
        }%
      }%
      \if@logo
        \llap{\usekomavar{fromlogo}}%
      \fi
    }%
    \renewcommand*{\@alignfrom}{0}%
  \or
    \setkomavar{firsthead}{%
      \parbox[b]{\textwidth}{\centering
        {\usekomafont{fromname}\strut\ignorespaces
          \usekomavar{fromname}%
          {%
            \ifnum\@rulefrom=1\\[-.5\baselineskip]%
              \usekomafont{fromrule}{%
                \setlength{\@tempdima}{\useplength{fromrulewidth}}%
                \ifdim\@tempdima=\z@
                  \setlength{\@tempdima}{\textwidth}%
                \fi
                \expandafter\rule\expandafter{\the\@tempdima}{%
                  \useplength{fromrulethickness}}}%
            \fi
          }%
          \\
        }%
        {\usekomafont{fromaddress}\strut\ignorespaces
          \usekomavar{fromaddress}%
          \if@phone\\\usekomavar*{fromphone}\usekomavar{fromphone}\fi%
          \if@mobilephone
            \\\usekomavar*{frommobilephone}\usekomavar{frommobilephone}%
          \fi%
          \if@fax\\\usekomavar*{fromfax}\usekomavar{fromfax}\fi%
          \if@email\\\usekomavar*{fromemail}\usekomavar{fromemail}\fi%
          \if@www\\\usekomavar*{fromurl}\usekomavar{fromurl}\fi%
          \ifnum\@rulefrom=2\\[-.5\baselineskip]%
            \usekomafont{fromrule}{%
              \setlength{\@tempdima}{\useplength{fromrulewidth}}%
              \ifdim\@tempdima=\z@
                \setlength{\@tempdima}{\textwidth}%
              \fi
              \expandafter\rule\expandafter{\the\@tempdima}{%
                \useplength{fromrulethickness}}}%
          \fi
          \\
        }%
      }%
    }%
    \renewcommand*{\@alignfrom}{1}%
  \or
    \setkomavar{firsthead}{%
      \if@logo
        \rlap{\usekomavar{fromlogo}}%
      \fi
      \parbox[b]{\textwidth}{\raggedleft
        {\usekomafont{fromname}\strut\ignorespaces
          \usekomavar{fromname}%
          {%
            \ifnum\@rulefrom=1\\[-.5\baselineskip]%
              \usekomafont{fromrule}{%
                \setlength{\@tempdima}{\useplength{fromrulewidth}}%
                \ifdim\@tempdima=\z@
                  \setlength{\@tempdima}{\textwidth}%
                  \if@logo
                    \settowidth{\@tempdimb}{\usekomavar{fromlogo}}%
                    \addtolength{\@tempdima}{-\@tempdimb}%
                  \fi
                \fi
                \expandafter\rule\expandafter{\the\@tempdima}{%
                  \useplength{fromrulethickness}}}%
            \fi
          }%
          \\
        }%
        {\usekomafont{fromaddress}\strut\ignorespaces
          \usekomavar{fromaddress}%
          \if@phone\\\usekomavar*{fromphone}\usekomavar{fromphone}\fi%
          \if@mobilephone
            \\\usekomavar*{frommobilephone}\usekomavar{frommobilephone}%
          \fi%
          \if@fax\\\usekomavar*{fromfax}\usekomavar{fromfax}\fi%
          \if@email\\\usekomavar*{fromemail}\usekomavar{fromemail}\fi%
          \if@www\\\usekomavar*{fromurl}\usekomavar{fromurl}\fi%
          \ifnum\@rulefrom=2\\[-.5\baselineskip]%
            \usekomafont{fromrule}{%
              \setlength{\@tempdima}{\useplength{fromrulewidth}}%
              \ifdim\@tempdima=\z@
                \setlength{\@tempdima}{\textwidth}%
              \fi
              \expandafter\rule\expandafter{\the\@tempdima}{%
                \useplength{fromrulethickness}}}%
          \fi
          \\
        }%
      }%
    }%
    \renewcommand*{\@alignfrom}{2}%
  \fi
}
\newcommand*{\@firsthead}{%
  \ClassWarning{scrlttr2}{%
    Deprecated usage of \string\@firsthead.\MessageBreak
    \string\usekomavar{firsthead} should be used\MessageBreak
    instead of \string\@firsthead
  }%
  \usekomavar{firsthead}%
}
\newcommand{\firsthead}{%
  \ClassWarning{scrlttr2}{%
    Deprecated usage of \string\firsthead.\MessageBreak
    You should use \string\setkomavar{firsthead}\MessageBreak
    instead of \string\firsthead
  }
  \setkomavar{firsthead}%
}
\newkomafont{foldmark}{}
\newkomafont{fromname}{}
\newkomafont{fromaddress}{}
\newkomafont{fromrule}{}
\newkomafont{backaddress}{\@gr@gsffamily}
\newkomafont{specialmail}{}
\newkomafont{priority}{\fontsize{10pt}{10pt}\sffamily\bfseries}
\newkomafont{prioritykey}{\fontsize{24.88pt}{24.88pt}\selectfont}
\newkomafont{PPlogo}{\sffamily\bfseries}
\newkomafont{PPdata}{\sffamily}
\newkomafont{addressee}{}
\newkomafont{toname}{}
\newkomafont{toaddress}{}
\newkomafont{refname}{\@gr@gsffamily\scriptsize}
\ifnum\scr@compatibility=\@nameuse{scr@v@2.97}\relax
  \newkomafont{refvalue}{\sffamily\scriptsize}
\else
  \newkomafont{refvalue}{}
\fi
\newkomafont{placeanddate}{}
\newkomafont{lettertitle}{\normalcolor\@gr@gsffamily\bfseries}
  \aliaskomafont{title}{lettertitle}%
\newkomafont{lettersubject}{\normalfont\bfseries}
  \aliaskomafont{subject}{lettersubject}%
\newplength{foldmarkhpos}
\newplength{foldmarkvpos}
\newplength{tfoldmarkvpos}
\newplength{mfoldmarkvpos}
\newplength{bfoldmarkvpos}
\newplength{lfoldmarkhpos}
\newplength{pfoldmarklength}
\newplength{tfoldmarklength}
\newplength{mfoldmarklength}
\newplength{bfoldmarklength}
\newplength{lfoldmarklength}
\newplength{foldmarkthickness}
\setplength{foldmarkthickness}{.2pt}
\newplength{toaddrvpos}
\newplength{backaddrheight}
\newplength{toaddrhpos}
\newplength{specialmailindent}
\newplength{specialmailrightindent}
\newplength{toaddrindent}
\newplength{PPheadheight}
\newplength{PPheadwidth}
\newplength{PPdatamatrixvskip}
\newplength{toaddrwidth}
\newplength{toaddrheight}
\newplength{locvpos}
\newplength{locwidth}
\newplength{lochpos}
\newplength{locheight}
\newplength{refvpos}
\newplength{refwidth}
\newplength{refhpos}
\newplength{refaftervskip}
\newplength{sigbeforevskip}
\newplength{sigindent}
\newplength{firstfootvpos}
\newplength{firstfootwidth}
\newplength{firstfoothpos}
\setplength{firstfoothpos}{\maxdimen}
\newplength{firstheadvpos}
\newplength{firstheadwidth}
\newplength{firstheadhpos}
\setplength{firstheadhpos}{\maxdimen}
\newplength{fromrulewidth}
\setplength{fromrulewidth}{0pt}
\newplength{fromrulethickness}
\setplength{fromrulethickness}{.4pt}
\newkomavar{firstfoot}
\newcommand*{\@firstfoot}{%
  \ClassWarning{scrlttr2}{%
    Deprecated usage of \string\@firstfoot.\MessageBreak
    \string\usekomavar{firstfoot} should be used\MessageBreak
    instead of \string\@firstfoot
  }%
  \usekomavar{firstfoot}%
}
\newcommand{\firstfoot}{%
  \ClassWarning{scrlttr2}{%
    Deprecated usage of \string\firstfoot.\MessageBreak
    You should use \string\setkomavar{firstfoot}\MessageBreak
    instead of \string\firstfoot
  }
  \setkomavar{firstfoot}%
}
\newcommand*{\move@topt}{%
  \null\vskip -1in\vskip -\topmargin%
  \vskip -\headheight\vskip -\headsep%
  \vskip -\topskip%
  \ignorespaces%
}
\newcommand*{\move@frompt}{%
  \vskip 1in\vskip \topmargin%
  \vskip \headheight\vskip \headsep%
  \vskip \topskip%
  \vskip -\baselineskip%
  \ignorespaces%
}
\newcommand*{\move@topl}{%
  \null\hskip -1in%
  \ifodd\value{page}\hskip -\oddsidemargin\else\hskip -\evensidemargin\fi
  \ignorespaces%
}
\newcommand*{\move@frompl}{%
  \hskip 1in%
  \ifodd\value{page}\hskip \oddsidemargin\else\hskip \evensidemargin\fi%
  \ignorespaces%
}
\newcommand{\vb@t@z}[1]{{%
    \setbox\z@\vbox to\z@{\color@begingroup #1\color@endgroup\vss}%
    \setparsizes{\z@}{\z@}{\z@ plus 1fil}\par@updaterelative
    \setlength{\baselineskip}{\z@}%
    \setlength{\@tempdima}{\ht0}\addtolength{\@tempdima}{\dp0}%
    \box\z@\vskip-\@tempdima%
  }%
}
\newcommand*{\@foldmark}[2]{%
  \vb@t@z{\setlength{\@tempdima}{#1}%
    \addtolengthplength[-.5]{\@tempdima}{foldmarkthickness}%
    \vskip \@tempdima
    \rlap{\move@topl\hskip\useplength{foldmarkhpos}%
      \usekomafont{foldmark}{%
        \rule{#2}{\useplength{foldmarkthickness}}}}}%
  \ignorespaces
}
\newcommand*{\@hfoldmark}[1]{%
  \begingroup
    \@expandtwoargs\in@{#1}{\@usefolds}%
    \ifin@
      \lowercase{%
        \edef\@tempa{%
          \noexpand\ifdim \noexpand\useplength{#1foldmarkvpos}=\noexpand\z@
          \noexpand\else
            \noexpand\@foldmark{%
              \noexpand\useplength{#1foldmarkvpos}%
            }{%
              \noexpand\useplength{#1foldmarklength}%
            }%
          \noexpand\fi
        }%
      }%
      \@tempa
    \fi
  \endgroup
}
\newcommand*{\@vfoldmark}[1]{%
  \begingroup
    \ifdim \useplength{lfoldmarkhpos}=\z@\else
      \@expandtwoargs\in@{#1}{\@usefolds}%
      \ifin@
        \vb@t@z{%
          \ifdim \useplength{foldmarkvpos}<\z@
            \nobreak\vskip \paperheight\nobreak
          \fi
          \vskip \useplength{foldmarkvpos}%
          \vskip \useplength{foldmarkthickness}%
          \rlap{\move@topl
            \setlength{\@tempdima}{\useplength{lfoldmarkhpos}}%
            \addtolengthplength[-.5]{\@tempdima}{foldmarkthickness}%
            \hskip\@tempdima
            \usekomafont{foldmark}{%
              \rule{\useplength{foldmarkthickness}}%
                   {\useplength{lfoldmarklength}}%
            }%
          }%
        }%
        \ignorespaces
      \fi
    \fi
  \endgroup
}
\newcommand*{\@foldmarks}{%
  \if@fold%
    \typeout{Foldmarks: yes}%
    \move@topt
    \ifdim \useplength{pfoldmarklength}=\z@
      \setplength{pfoldmarklength}{4mm}%
    \fi
    \ifdim \useplength{tfoldmarklength}=\z@
      \setplength{tfoldmarklength}{2mm}%
    \fi
    \ifdim \useplength{mfoldmarklength}=\z@
      \setplength{mfoldmarklength}{2mm}%
    \fi
    \ifdim \useplength{bfoldmarklength}=\z@
      \setplength{bfoldmarklength}{2mm}%
    \fi
    \ifdim \useplength{lfoldmarklength}=\z@
      \setplength{lfoldmarklength}{4mm}%
    \fi
    \begingroup
      \@expandtwoargs\in@{P}{\@usefolds}%
      \ifin@
        \@foldmark{.5\paperheight}{\useplength{pfoldmarklength}}%
      \fi
    \endgroup
    \@hfoldmark{T}%
    \@hfoldmark{M}%
    \@hfoldmark{B}%
    \@vfoldmark{L}%
    \move@frompt
  \else
    \typeout{Foldmarks: no}%
  \fi%
}
\newif\if@savevbox@warning\@savevbox@warningtrue
\newcommand{\@savevbox}[6][]{%
  \begingroup%
    \vbox to #2{#1#3}%
    \if@savevbox@warning\@savevbox@warningfalse%
      \setbox\z@\vbox{\color@begingroup #3\color@endgroup}%
      \setlength{\@tempdima}{#2}%
      \setlength{\@tempdimb}{\ht0}\addtolength{\@tempdimb}{\dp0}%
      \ifdim \@tempdimb>\@tempdima%
        \addtolength{\@tempdimb}{-\@tempdima}%
        \ClassWarning{scrlttr2}{%
          #4 is \the\@tempdimb\space too high.\MessageBreak
          You have to change `\string#5'\MessageBreak
          or you have to define a smaller\MessageBreak
          #4 using \string#6.\MessageBreak
          Because of this too high #4\MessageBreak
          you've got an overfull \string\vbox\space message%
        }%
      \fi%
    \fi%
  \endgroup%
}
\newcommand*{\@firstheadfootfield}{%
  \if@firsthead
    \typeout{Head of first page}%
    \move@topt\vskip\useplength{firstheadvpos}%
    \vb@t@z{%
      \rlap{\move@topl
        \ifdim\useplength{firstheadhpos}<\paperwidth
          \ifdim \useplength{firstheadhpos}>-\paperwidth
            \ifdim \useplength{firstheadhpos}<\z@
              \setlength\@tempskipa{\paperwidth}%
              \addtolengthplength{\@tempskipa}{firstheadhpos}%
              \addtolengthplength[-]{\@tempskipa}{firstheadwidth}%
            \else
              \setlength{\@tempskipa}{\useplength{firstheadhpos}}%
            \fi
          \else
            \setlength\@tempskipa{\oddsidemargin}%
            \addtolength\@tempskipa{1in}%
          \fi
        \else
          \setlength\@tempskipa{.5\paperwidth}%
          \addtolengthplength[-.5]{\@tempskipa}{firstheadwidth}%
        \fi
        \hskip\@tempskipa
        \vbox{\hsize\useplength{firstheadwidth}%
          \setlength{\@tempskipa}{\useplength{toaddrvpos}}%
          \addtolengthplength[-1]{\@tempskipa}{firstheadvpos}%
          \addtolength{\@tempskipa}{-\baselineskip}%
          \setlength{\textwidth}{\useplength{firstheadwidth}}%
          \setlength{\parfillskip}{\z@ \@plus 1fil}%
          \@savevbox{\@tempskipa}{\noindent\usekomavar{firsthead}%
            \vskip \z@ \@plus .00001fil}%
          {head of first page}{firstheadvpos}{\setkomavar}%
        }%
      }%
    }%
    \vskip-\useplength{firstheadvpos}\move@frompt
  \else
    \typeout{No head at first page}%
  \fi
  \move@topt
  \if@firstfoot
    \typeout{Foot of first page}%
    \vb@t@z{%
      \rlap{\move@topl
         \ifdim\useplength{firstfoothpos}<\paperwidth
          \ifdim \useplength{firstfoothpos}>-\paperwidth
            \ifdim \useplength{firstfoothpos}<\z@
              \setlength\@tempskipa{\paperwidth}%
              \addtolengthplength{\@tempskipa}{firstfoothpos}%
              \addtolengthplength[-]{\@tempskipa}{firstfootwidth}%
            \else
              \setlength{\@tempskipa}{\useplength{firstfoothpos}}%
            \fi
          \else
            \setlength\@tempskipa{\oddsidemargin}%
            \addtolength\@tempskipa{1in}%
          \fi
        \else
          \setlength\@tempskipa{.5\paperwidth}%
          \addtolengthplength[-.5]{\@tempskipa}{firstfootwidth}%
        \fi
        \hskip\@tempskipa
        \vbox{\hsize\useplength{firstfootwidth}%
          \vskip\useplength{firstfootvpos}%
          \setlength{\textwidth}{\useplength{firstfootwidth}}%
          \setlength{\parfillskip}{\z@ \@plus 1fil}%
          \vbox{\hsize\useplength{firstfootwidth}\noindent
            \usekomavar{firstfoot}}%
        }%
      }%
    }%
  \else
    \typeout{No foot at first page}%
  \fi
  \move@frompt%
  {%
    \setlength{\@tempdima}{1in}\addtolength{\@tempdima}{\topmargin}%
    \addtolength{\@tempdima}{\headheight}%
    \addtolength{\@tempdima}{\headsep}%
    \addtolength{\@tempdima}{\textheight}%
    \addtolength{\@tempdima}{\footskip}%
    \if@firstfoot
      \addtolengthplength[-1]{\@tempdima}{firstfootvpos}%
    \else
      \addtolength{\@tempdima}{-\paperheight}%
    \fi
    \ifdim\@tempdima>\z@\enlargethispage{-\@tempdima}%
    \else\if@enlargefp\enlargethispage{-\@tempdima}\fi\fi
  }%
}
\newcommand*{\@addrfield}{%
  \ifcase \ifnum\@afieldmode=5 \@ne\else\@afieldmode\fi\relax
    \typeout{Address: No}%
  \or
    \begingroup%
      \if@baddr
        \Ifkomavarempty{backaddress}{%
          \let\@tempa\@empty\let\@tempb\@empty
        }{%
          \def\@tempa{backaddress}\def\@tempb{,\space}%
        }%
      \else
        \let\@tempa\@empty\let\@tempb\@empty
      \fi
      \ifcase \ltr@priority
        \Ifkomavarempty{specialmail}{}{%
          \edef\@tempa{\@tempa\@tempb specialmail}\def\@tempb{,\space}%
        }%
      \or
        \edef\@tempa{\@tempa\@tempb B-Economy}\def\@tempb{,\space}%
      \or
        \edef\@tempa{\@tempa\@tempb A-Priority}\def\@tempb{,\space}%
      \fi
      \typeout{Address (\@tempa\@tempb addressee)}%
    \endgroup%
    \move@topt\vskip\useplength{toaddrvpos}%
    \vb@t@z{{\setparsizes{\z@}{\z@}{\z@ plus 1fil}\par@updaterelative
        \rlap{\move@topl
          \setlengthtoplength{\@tempskipa}{toaddrhpos}%
          \ifdim \@tempskipa<\z@
            \addtolength{\@tempskipa}{\paperwidth}%
            \addtolengthplength[-]{\@tempskipa}{toaddrwidth}%
          \fi
          \hskip\@tempskipa
          \@savevbox{\useplength{toaddrheight}}{\hsize\useplength{toaddrwidth}%
            \@savevbox[\vss]{\useplength{backaddrheight}}{%
              \hsize\useplength{toaddrwidth}%
              \if@baddr
                \Ifkomavarempty{backaddress}{}{{%
                    \noindent%
                    \backaddr@format{\scriptsize
                      {%
                        \def\\{\usekomavar{backaddressseparator}\@ogobble}%
                        \usekomafont{backaddress}%
                        {\usekomavar{backaddress}}%
                      }}}}%
              \fi
            }{backaddress}{backaddrheight}{\setkomavar}%
            \ifcase \ltr@priority
            \or
              \setkomavar{specialmail}{%
                {\usekomafont{priority}{%
                    {\usekomafont{prioritykey}{B}}%
                    -ECONOMY}}%
              }%
            \or
              \setkomavar{specialmail}{%
                {\usekomafont{priority}{%
                    {\usekomafont{prioritykey}{A}}%
                    -PRIORITY}}%
              }%
            \fi
            \Ifkomavarempty{specialmail}{}{%
              \vbox{\hsize\useplength{toaddrwidth}%
                \noindent\hspace*{\useplength{specialmailindent}}%
                \specialmail@format{%
                  \usekomafont{specialmail}\usekomavar{specialmail}}%
                \hspace*{\useplength{specialmailrightindent}}}%
            }%
            \ifnum\@afieldmode=\@ne\vfil\fi%
            \noindent\hskip\useplength{toaddrindent}%
            \setlength{\@tempdima}{\useplength{toaddrwidth}}%
            \addtolengthplength[-2]{\@tempdima}{toaddrindent}%
            \vbox{\hsize\@tempdima\raggedright
              \usekomafont{addressee}{%
                {\usekomafont{toname}{\usekomavar{toname}\\}}%
                {\usekomafont{toaddress}{\usekomavar{toaddress}\endgraf}}}}%
            \vfil\null\vskip-\baselineskip}%
          {address field}{toaddrheight}%
          {\begin{letter} or you\MessageBreak
            have to define a smaller special purpose using\MessageBreak
            \string\specialmail}%
        }}}%
    \vskip-\useplength{toaddrvpos}\move@frompt
  \else
    \begingroup%
      \if@baddr
        \let\@tempa\@empty\let\@tempb\@empty
        \ifcase \@afieldmode\relax\or\or
          \def\@tempa{PP-mode}\def\@tempb{,\space}%
        \or
          \def\@tempa{backgroundimage-mode}\def\@tempb{,\space}%
        \or
          \def\@tempa{image-mode}\def\@tempb{,\space}%
        \fi
        \Ifkomavarempty{backaddress}{}{%
          \edef\@tempa{\@tempa\@tempb backaddress ignored}\def\@tempb{,\space}%
        }%
      \else
        \let\@tempa\@empty\let\@tempb\@empty
      \fi
      \ifcase \ltr@priority
        \Ifkomavarempty{specialmail}{}{%
          \edef\@tempa{\@tempa\@tempb specialmail ignored}\def\@tempb{,\space}%
        }%
      \or
        \edef\@tempa{\@tempa\@tempb B-Economy}\def\@tempb{,\space}%
      \or
        \edef\@tempa{\@tempa\@tempb A-Priority}\def\@tempb{,\space}%
      \fi
      \typeout{Address (\@tempa\@tempb addressee)}%
    \endgroup%
    \move@topt\vskip\useplength{toaddrvpos}%
    \vb@t@z{{%
        \setparsizes{\z@}{\z@}{\z@ plus 1fil}\par@updaterelative
        \ifdim \useplength{toaddrindent}=\z@
          \setplength{toaddrindent}{8mm}%
        \fi
        \ifdim \useplength{PPheadheight}=\z@
          \setplength{PPheadheight}{20.74pt}%
        \fi
        \ifdim \useplength{PPheadwidth}=\z@
          \setplength{PPheadwidth}{42mm}%
        \fi
        \ifdim \useplength{PPdatamatrixvskip}=\z@
          \setplength{PPdatamatrixvskip}{9mm}%
        \fi
        \rlap{\move@topl
          \setlengthtoplength{\@tempskipa}{toaddrhpos}%
          \ifdim \@tempskipa<\z@
            \addtolength{\@tempskipa}{\paperwidth}%
            \addtolengthplength[-]{\@tempskipa}{toaddrwidth}%
          \fi
          \hskip\@tempskipa
          \@savevbox{\useplength{toaddrheight}}{\hsize\useplength{toaddrwidth}%
            \ifnum\@afieldmode=\tw@
              \vskip 2pt\relax
              \hskip \useplength{toaddrindent}\relax
              \fbox{%
                \vbox to \dimexpr \useplength{PPheadheight}-2\fboxsep\relax{%
                  \setlength{\parindent}{0pt}%
                  \hsize \dimexpr \useplength{PPheadwidth}-2\fboxsep\relax
                  \sbox\@tempboxa{%
                    {\fontsize{20.74pt}{20.74pt}\selectfont
                      \usekomafont{PPlogo}{P.P.}}\hskip 2mm%
                  }%
                  \dp\@tempboxa\z@
                  \setlength{\@tempdima}{\hsize}%
                  \addtolength{\@tempdima}{-\wd\@tempboxa}%
                  \hbox{\box\@tempboxa
                    \vbox to \dimexpr
                    \useplength{PPheadheight}-2\fboxsep\relax{%
                      \vss\hsize\@tempdima
                      \raggedright
                      \fontsize{8pt}{9pt}\selectfont\usekomafont{PPdata}%
                      \usekomavar*{fromzipcode}\usekomavar{zipcodeseparator}%
                      \usekomavar{fromzipcode}\scr@endstrut\\
                      \usekomavar{place}\scr@endstrut
                      \hfill
                    }%
                  }%
                  \vss
                }%
              }%
              \hskip 1mm
              \mbox{%
                \vbox to \useplength{PPheadheight}{%
                  \addtolengthplength[-]{\hsize}{PPheadwidth}%
                  \addtolength{\hsize}{-1mm}%
                  \addtolengthplength[-2]{\hsize}{toaddrindent}%
                  \setlength{\parindent}{0pt}%
                  \fontsize{8pt}{9pt}\selectfont\usekomafont{PPdata}%
                  \hfill\usekomavar{PPcode}
                  \vss
                  \ifcase \ltr@priority
                  \or
                    \usekomafont{priority}{%
                      {\usekomafont{prioritykey}{B}}%
                      -ECONOMY\hss\vskip-\dp\strutbox
                    }%
                  \or
                    \usekomafont{priority}{%
                      {\usekomafont{prioritykey}{A}}%
                      -PRIORITY\hss\vskip-\dp\strutbox
                    }%
                  \fi
                  \vss
                }%
              }%
              \vskip 1mm
              \vskip-\ht\strutbox
              \noindent\hskip\useplength{toaddrindent}%
              \hrulefill%
              \hskip\useplength{toaddrindent}%
              \vbox to\z@{\hsize\z@
                \vskip \useplength{PPdatamatrixvskip}\relax
                \llap{\usekomavar{PPdatamatrix}\hskip\useplength{toaddrindent}}%
                \vss
              }%
            \else
              \vskip 1mm
              \noindent\expandafter\hskip\useplength{toaddrindent}%
              \vbox to \useplength{PPheadheight}{%
                \addtolengthplength[-2]{\hsize}{toaddrindent}%
                \setlength{\parindent}{0pt}%
                \usekomavar{addresseeimage}%
                \vss
              }%
              \vskip 1mm
              \vskip\dp\strutbox
            \fi
            \ifnum \@afieldmode=4 \else
              \vfil%
              \noindent\hskip\useplength{toaddrindent}%
              \setlength{\@tempdima}{\useplength{toaddrwidth}}%
              \addtolengthplength[-2]{\@tempdima}{toaddrindent}%
              \vbox{\hsize\@tempdima
                \Ifkomavarempty{PPdatamatrix}{}{%
                  \addtolength{\hsize}{-2mm}%
                  \settowidth\@tempdima{\usekomavar{PPdatamatrix}}%
                  \addtolength{\hsize}{-\@tempdima}%
                }%
                \raggedright
                \usekomafont{addressee}{%
                  {\usekomafont{toname}{\usekomavar{toname}\\}}%
                  {\usekomafont{toaddress}{\usekomavar{toaddress}\endgraf}}}}%
            \fi
            \vss\null}%
          {address field}{toaddrheight}%
          {\string\begin{letter}}%
        }}}%
    \vskip-\useplength{toaddrvpos}\move@frompt
  \fi
}
\newcommand*{\specialmail@format}[1]{}
\let\specialmail@format\underline
\newcommand*{\@ogobble}[1][]{}
\newcommand*{\@locfield}{%
  \ifdim \useplength{locwidth}=\z@%
    \setplength{locwidth}{\paperwidth}%
    \ifdim \useplength{toaddrhpos}>\z@
      \addtoplength[-2]{locwidth}{\useplength{toaddrhpos}}%
    \else
      \addtoplength[2]{locwidth}{\useplength{toaddrhpos}}%
    \fi
    \addtoplength[-1]{locwidth}{\useplength{toaddrwidth}}%
    \if@bigloc%
      \setplength[.66667]{locwidth}{\useplength{locwidth}}%
    \else%
      \setplength[.5]{locwidth}{\useplength{locwidth}}%
    \fi%
  \fi%
  \ifcase\@alignfrom
  \or
    \if@logo
      \Ifkomavarempty{location}{\setkomavar{location}{\null}}{}%
    \fi
  \or
  \or
    \Ifkomavarempty{location}{\setkomavar{location}{\null}}{}%
  \or
    \Ifkomavarempty{location}{\setkomavar{location}{\null}}{}%
  \fi
  \Ifkomavarempty{location}{%
    \typeout{Location field: empty}%
  }{%
    \typeout{Location field: yes}%
    \ifdim \useplength{lochpos}=\z@%
      \setplength{lochpos}{\useplength{toaddrhpos}}%
    \fi
    \ifdim \useplength{locvpos}=\z@%
      \setplength{locvpos}{\useplength{toaddrvpos}}%
    \fi
    \ifdim \useplength{locheight}=\z@%
      \setplength{locheight}{\useplength{toaddrheight}}%
    \fi
    \move@topt\vskip\useplength{locvpos}%
    \vb@t@z{\noindent\makebox[0pt][l]{%
        \move@topl
        \setlengthtoplength[-]{\@tempskipa}{lochpos}%
        \ifdim \@tempskipa<\z@
          \addtolength{\@tempskipa}{\paperwidth}%
        \else
          \addtolengthplength{\@tempskipa}{locwidth}%
        \fi
        \hskip\@tempskipa
        \makebox[0pt][r]{%
          \@savevbox{\useplength{locheight}}{%
            \noindent\hsize\useplength{locwidth}%
            \ifcase\@alignfrom
            \or
              \if@logo
                \Ifkomavarempty{fromlogo}{\null}{%
                  {\raggedleft\noindent\usekomavar{fromlogo}\\
                    \vskip\parskip}\noindent}%
              \fi
            \or
            \or
              \if@logo
                \Ifkomavarempty{fromlogo}{}{%
                  \raggedleft\usekomavar{fromlogo}\par}%
              \fi
              \raggedright
              {\usekomafont{fromname}\strut\ignorespaces
                \usekomavar{fromname}%
                {%
                  \ifnum\@rulefrom=1\\[-.5\baselineskip]%
                    \usekomafont{fromrule}{%
                      \setlength{\@tempdima}{\useplength{fromrulewidth}}%
                      \ifdim\@tempdima=\z@
                        \setlength{\@tempdima}{\useplength{locwidth}}%
                      \fi
                      \expandafter\rule\expandafter{\the\@tempdima}{%
                        \useplength{fromrulethickness}}%
                    }%
                  \fi
                }%
                \\
              }%
              {\usekomafont{fromaddress}\strut\ignorespaces
                \usekomavar{fromaddress}%
                \if@phone\\\usekomavar*{fromphone}\usekomavar{fromphone}\fi%
                \if@mobilephone
                  \\\usekomavar*{frommobilephone}\usekomavar{frommobilephone}%
                \fi%
                \if@fax\\\usekomavar*{fromfax}\usekomavar{fromfax}\fi%
                \if@email\\\usekomavar*{fromemail}\usekomavar{fromemail}\fi%
                \if@www\\\usekomavar*{fromurl}\usekomavar{fromurl}\fi%
                \ifnum\@rulefrom=2\\[-.5\baselineskip]%
                  \usekomafont{fromrule}{%
                    \setlength{\@tempdima}{\useplength{fromrulewidth}}%
                    \ifdim\@tempdima=\z@
                      \setlength{\@tempdima}{\useplength{locwidth}}%
                    \fi
                    \expandafter\rule\expandafter{\the\@tempdima}{%
                      \useplength{fromrulethickness}}}%
                \fi
                \\
              }%
            \or
              \raggedleft
              \if@logo
                \Ifkomavarempty{fromlogo}{}{\usekomavar{fromlogo}\par}%
              \fi
              {\usekomafont{fromname}\strut\ignorespaces
                \usekomavar{fromname}%
                {%
                  \ifnum\@rulefrom=1\\[-.5\baselineskip]%
                    \usekomafont{fromrule}{%
                      \setlength{\@tempdima}{\useplength{fromrulewidth}}%
                      \ifdim\@tempdima=\z@
                        \setlength{\@tempdima}{\useplength{locwidth}}%
                      \fi
                      \expandafter\rule\expandafter{\the\@tempdima}{%
                        \useplength{fromrulethickness}}%
                    }%
                  \fi
                }%
                \\
              }%
              {\usekomafont{fromaddress}\strut\ignorespaces
                \usekomavar{fromaddress}%
                \if@phone\\\usekomavar*{fromphone}\usekomavar{fromphone}\fi%
                \if@mobilephone%
                  \\\usekomavar*{frommobilephone}\usekomavar{frommobilephone}%
                \fi%
                \if@fax\\\usekomavar*{fromfax}\usekomavar{fromfax}\fi%
                \if@email\\\usekomavar*{fromemail}\usekomavar{fromemail}\fi%
                \if@www\\\usekomavar*{fromurl}\usekomavar{fromurl}\fi%
                \ifnum\@rulefrom=2\\[-.5\baselineskip]%
                  \usekomafont{fromrule}{%
                    \setlength{\@tempdima}{\useplength{fromrulewidth}}%
                    \ifdim\@tempdima=\z@
                      \setlength{\@tempdima}{\useplength{locwidth}}%
                    \fi
                    \expandafter\rule\expandafter{\the\@tempdima}{%
                      \useplength{fromrulethickness}}}%
                \fi
                \\
              }%
            \fi
            \usekomavar{location}%
            \vskip \z@ \@plus .00001fil}%
          {location field}{locheight}{\setkomavar}%
        }}%
    }%
    \vskip-\useplength{locvpos}\move@frompt
  }%
}
\newcommand*{\do@set@reffield}{}
\newcommand*{\@set@reffield}[1]{%
  \Ifkomavarempty{#1}{}{%
    \settowidth{\@tempdima}{\strut\usekomafont{refvalue}\usekomavar{#1}}%
    \sbox\z@{\strut\usekomafont{refname}\usekomavar*{#1}}%
    \ifdim \@tempdima<\wd0\setlength{\@tempdima}{\wd0}\fi
    \if@tempswa\enskip\hfill\fi
    \parbox[t]{\@tempdima}{\noindent\raggedright
        \strut\box\z@\\\usekomafont{refvalue}\strut\usekomavar{#1}}%
    \@tempswatrue
  }%
}
\newcommand*{\@test@reffield}[1]{%
  \Ifkomavarempty{#1}{}{%
    \@tempswatrue
  }%
}
\newcommand*{\@set@reffields}{}%
\newcommand*{\addtoreffields}[1]{%
  \l@addto@macro{\@set@reffields}{\do@set@reffield{#1}}%
}
\newcommand*{\removereffields}{%
  \renewcommand*{\@set@reffields}{}%
}
\newcommand*{\defaultreffields}{%
  \removereffields
  \addtoreffields{yourref}%
  \addtoreffields{yourmail}%
  \addtoreffields{myref}%
  \addtoreffields{customer}%
  \addtoreffields{invoice}%
}
\defaultreffields
\newcommand*{\@datefield}{%
  {%
    \setparsizes{\z@}{\z@}{\z@ plus 1fil}\par@updaterelative
    \ifdim\useplength{refwidth}=\z@
      \if@refwide
        \setplength{refwidth}{\paperwidth}%
        \ifdim \useplength{toaddrhpos}>\z@
          \setplength{refhpos}{\useplength{toaddrhpos}}%
        \else
          \setplength[-]{refhpos}{\useplength{toaddrhpos}}%
        \fi
        \addtoplength[-2]{refwidth}{\useplength{refhpos}}%
      \else
        \setplength{refwidth}{\textwidth}%
        \setplength{refhpos}{\oddsidemargin}%
        \addtoplength{refhpos}{1in}%
      \fi
    \else
      \ifdim\useplength{refhpos}=\z@
        \begingroup
          \setlength\@tempdima{\textwidth}%
          \addtolengthplength[-]{\@tempdima}{refwidth}%
          \setlength\@tempdimb{\oddsidemargin}%
          \addtolength\@tempdimb{1in}%
          \setlength{\@tempdimc}{\paperwidth}%
          \addtolength{\@tempdimc}{-\textwidth}%
          \divide\@tempdimb by 32768\relax
          \divide\@tempdimc by 32768\relax
          \ifdim\@tempdimc=\z@\else
            \multiply\@tempdima by\@tempdimb
            \divide\@tempdima by\@tempdimc
          \fi
          \edef\@tempa{\noexpand\endgroup
            \noexpand\setplength{refhpos}{\the\@tempdima}}%
        \@tempa
    \fi\fi
    \@tempswafalse
    \move@topt\vskip\useplength{refvpos}%
    \@tempswafalse
    \let\do@set@reffield\@test@reffield
    \@set@reffields
    \ifcase \@datepos\else\@test@reffield{date}\fi
    \if@tempswa
      \@tempswafalse
      \rlap{\noindent\move@topl\hskip\useplength{refhpos}%
        \vbox{\hsize\useplength{refwidth}%
          \noindent
          \ifnum \@datepos=2
            \@set@reffields
            \if@tempswa
              \@tempswafalse
              \@set@reffield{date}%
            \fi
          \fi
          \let\do@set@reffield\@set@reffield
          \@set@reffields%
          \if@tempswa
            \ifnum \@datepos=1 \@set@reffield{date}\fi%
            \sbox\z@{\usekomafont{refname}\strutbox}%
            \ifdim\ht\z@>\ht\strutbox
              \ClassWarningNoLine{scrlttr2}{%
                Font element `refname' should not be larger than
                \string\normalsize!}%
            \fi
            \sbox\z@{\usekomafont{refvalue}\strutbox}%
            \ifdim\ht\z@>\ht\strutbox
              \ClassWarningNoLine{scrlttr2}{%
                Font element `refvalue' should not be larger than
                \string\normalsize!}%
            \fi
          \else
            \ifcase \@datepos\else
              \ifnum \@datepos=1 \enskip\hfill\fi
              {\usekomafont{placeanddate}{\Ifkomavarempty{place}{}{%
                    \usekomavar{place}\usekomavar{placeseparator}}%
                  \usekomavar{date}}}%
            \fi
          \fi
        }%
      }%
    \fi
    \vskip\useplength{refaftervskip}%
  }%
}
\newcommand*{\@makelettertitle}{%
  \Ifkomavarempty{title}{%
    \typeout{Title: no}%
  }{%
    \typeout{Title: yes}%
    {\setparsizes{\z@}{\z@}{\z@ plus 1fil}\par@updaterelative
      \centering\LARGE\usekomafont{lettertitle}\usekomavar{title}\par}%
    \vskip\baselineskip%
  }%
}
\newcommand*{\@subjfield}{{%
    \setparsizes{\z@}{\z@}{\z@ plus 1fil}\par@updaterelative
    \Ifkomavarempty{subject}{%
      \typeout{Subject: no}%
    }{%
      \ifx\raggedsubject\@empty
        \ifdim\useplength{subjectvpos}=\z@
          \if@subjafter%
            \typeout{Subject: after opening}%
            \let\raggedsubject\centering%
          \else
            \typeout{Subject: before opening}%
            \def\raggedsubject{\noindent\@hangfrom}%
          \fi
        \else
          \typeout{Subject: at absolute vertical position}%
          \def\raggedsubject{\noindent\@hangfrom}%
        \fi
      \fi
      \ifdim\useplength{subjectvpos}=\z@
        \vskip\useplength{subjectbeforevskip}%
        \begingroup
      \else
        \move@topt\vskip\useplength{subjectvpos}%
        \expandafter\vb@t@z\expandafter{%
      \fi
      \usekomafont{lettersubject}%
      \raggedsubject{\if@subj \subject@format{\strut\ignorespaces
          \usekomavar*{subject}}\fi}%
      \subject@format{\strut\ignorespaces\usekomavar{subject}}\par
      \ifdim\useplength{subjectvpos}=\z@
        \endgroup
        \vskip\useplength{subjectaftervskip}%
      \else
        }%
        \vskip-\useplength{subjectvpos}\move@frompt
      \fi
    }%
  }%
}
\newplength{subjectvpos}
\setplength{subjectvpos}{0pt}
\newplength{subjectaftervskip}
\setplength{subjectaftervskip}{2\baselineskip}
\newplength{subjectbeforevskip}
\setplength{subjectbeforevskip}{0pt}
\newkomavar{nexthead}
\setkomavar{nexthead}{%
  \rlap{\parbox[c]{\textwidth}{\raggedright\strut
      \ifnum\@pageat=0\pagemark\else\leftmark\fi\strut}}%
  \parbox[c]{\textwidth}{%
    \centering\strut
    \ifcase\@pageat
      \rightmark
    \or
      \pagemark
    \or
      \rightmark
    \fi\strut}%
  \llap{\parbox[c]{\textwidth}{\raggedleft\strut
      \ifcase\@pageat
        \leftmark
      \or
        \rightmark
      \or
        \pagemark
      \else
        \rightmark
      \fi\strut}}%
}%
\newcommand{\nexthead}{%
  \ClassWarning{scrlttr2}{%
    Deprecated usage of \string\nexthead.\MessageBreak
    You should use \string\setkomavar{nexthead}\MessageBreak
    instead of \string\nexthead
  }
  \setkomavar{nexthead}%
}
\newcommand*{\@nexthead}{%
  \ClassWarning{scrlttr2}{%
    Deprecated usage of \string\@nexthead.\MessageBreak
    \string\usekomavar{nexthead} should be used\MessageBreak
    instead of \string\@nexthead
  }%
  \usekomavar{nexthead}%
}
\newkomavar{nextfoot}
\setkomavar{nextfoot}{%
  \ifnum\@pageat>2
    \parbox[c]{\textwidth}{%
      \ifcase\@pageat\or\or\or\raggedright\or\centering\or\raggedleft\fi
      \strut\pagemark%
      }%
  \fi
}
\newcommand{\nextfoot}{%
  \ClassWarning{scrlttr2}{%
    Deprecated usage of \string\nextfoot.\MessageBreak
    You should use \string\setkomavar{nextfoot}\MessageBreak
    instead of \string\nextfoot
  }
  \setkomavar{nextfoot}%
}
\newcommand*{\@nextfoot}{%
  \ClassWarning{scrlttr2}{%
    Deprecated usage of \string\@nextfoot.\MessageBreak
    \string\usekomavar{nextfoot} should be used\MessageBreak
    instead of \string\@nextfoot
  }%
  \usekomavar{nextfoot}%
}
\newenvironment{letter}[2][]{%
  \if@twocolumn
    \ClassWarning{\KOMAClassName}{%
      twocolumn mode not supported.\MessageBreak
      If you really want a twocolumned letter, you should\MessageBreak
      use package `multicol' and add a `multicols'\MessageBreak
      environment inside your letter.\MessageBreak
      Switching back to oneside%
    }%
    \letter@restonecoltrue
    \expandafter\onecolumn
  \else
    \letter@restonecolfalse
  \fi
  \cleardoubleoddemptypage
  \raggedbottom
  \scr@ifundefinedorrelax{letterpagestyle}{}{%
    \ifx\letterpagestyle\@empty\else
      \pagestyle{\letterpagestyle}%
    \fi
  }%
  \refstepcounter{letter}%
  \let\thisletter\@currentlabel
  \setcounter{page}{\@ne}%
  \setcounter{footnote}{0}%
  \interlinepenalty=200\@processto{#2}%
  \KOMAoptions{#1}%
  \@beginletterhook
}{%
  \stopletter
  \let\@currentlabel\thisletter
  \label{\thisletter.lastpage}%
  \@@par\pagebreak\@@par%
  \ifletter@restonecol\twocolumn\fi
}
\newif\ifletter@restonecol
\newcommand*{\thisletter}{outside.letter.undefined}
\newcommand*{\letterlastpage}{\pageref{\thisletter.lastpage}}
\newcommand*{\stopletter}{}
\newcommand{\@processto}[1]{%
  \IfArgIsEmpty{#1}{%
  }{%
    \expandafter\@xproc#1\\\@nil
    \ifx\reserved@b\@empty\else\expandafter\@xproc#1\@nil\fi
    \edef\reserved@a{%
      \noexpand\setkomavar{toname}{\unexpanded\expandafter{\reserved@a}}%
      \noexpand\setkomavar{toaddress}{\unexpanded\expandafter{\reserved@b}}%
    }\reserved@a
  }%
}
\newcommand*{\@xproc}{}
\long\def\@xproc#1\\#2\@nil{%
  \def\reserved@a{#1}\def\reserved@b{#2}%
}
\g@addto@macro\flushbottom{%
  \AtEndLetter{\vskip \z@\@plus.0001fil\relax}%
}
\newcounter{letter}
\newcommand*{\letterpagestyle}{%
}
\newcommand{\AtBeginLetter}{\g@addto@macro\@beginletterhook}
\newcommand{\@beginletterhook}{}
\newcommand{\AtEndLetter}{\g@addto@macro\stopletter}
\newcommand*{\stopbreaks}{\interlinepenalty \@M
 \def\par{\@@par\nobreak}\let\\=\@nobreakcr
 \let\vspace\@nobreakvspace}
\DeclareRobustCommand*{\@nobreakvspace}{%
  \kernel@ifstar{\@nobreakvspacex}{\@nobreakvspacex}}
\newcommand*{\@nobreakvspacex}[1]{\ifvmode\nobreak\vskip #1\relax\else
 \@bsphack\vadjust{\nobreak\vskip #1}\@esphack\fi}
\newcommand*{\@nobreakcr}{\kernel@ifstar{\@normalcr*}{\@normalcr*}}
\newcommand*{\startbreaks}{\let\\=\@normalcr
 \interlinepenalty 200\def\par{\@@par\penalty 200\relax}}
\newcommand{\opening}[1]{%
  \@PapersizeWarning
  \@gen@firsthead
  \@mkboth{\scr@fromname@var}{\scr@subject@var}%
  \thispagestyle{empty}%
  \noindent
  \@foldmarks\@firstheadfootfield
  \@addrfield\@locfield
  \ifdim\useplength{subjectvpos}=\z@\else\@subjfield\fi
  \@datefield
  \@makelettertitle
  \ifdim\useplength{subjectvpos}=\z@\if@subjafter\else\@subjfield\fi\fi
  {\setparsizes{\z@}{\z@}{\z@ plus 1fil}\par@updaterelative#1\par}%
  {\setlength{\@tempdima}{\baselineskip}%
    \addtolength{\@tempdima}{-\parskip}%
    \ifdim \@tempdima>\z@\vskip\@tempdima\fi}%
  \ifdim\useplength{subjectvpos}=\z@\if@subjafter\@subjfield\fi\fi
  \@afterindentfalse\@afterheading
}
\newcommand*{\closing}[1]{{%
    \setparsizes{\z@}{\z@}{\z@ plus 1fil}\par@updaterelative\nobreak\par
    \nobreak\vskip\baselineskip
    \stopbreaks\noindent
    \settowidth{\@tempdima}{%
      \begin{tabular}{@{}l@{}}
        #1\tabularnewline
        \usekomavar{signature}\tabularnewline
      \end{tabular}%
    }%
    \setlength{\@tempdimb}{\hsize}%
    \addtolength{\@tempdimb}{-\useplength{sigindent}}%
    \ifdim\@tempdima>\@tempdimb\setlength{\@tempdima}{\@tempdimb}\fi
    \hspace{\useplength{sigindent}}%
    \parbox{\@tempdima}{\raggedsignature\strut\ignorespaces
      #1\ifhmode\scr@endstrut\\[\useplength{sigbeforevskip}]
        \else\vskip \useplength{sigbeforevskip}\fi
      \strut\ignorespaces
      \usekomavar{signature}\ifhmode\scr@endstrut\fi}}\par
  \nobreak\vskip\baselineskip
}
\newcommand\ps{\par%
  \ifdim\parskip=\z@
    \vskip\baselineskip
  \fi\startbreaks\noindent\ignorespaces
}
\newcommand*{\cc}[1]{\par%
  \ifdim\parskip=\z@%
    \vskip\baselineskip%
  \fi\noindent%
  \begingroup
    \parbox[t]{\textwidth}{%
      \Ifkomavarempty*{ccseparator}{}{%
        \@hangfrom{%
          \strut\usekomavar*{ccseparator}\usekomavar{ccseparator}}%
        }%
      \ignorespaces #1\strut}%
    \setlength{\parfillskip}{\z@ \@plus 1fil}\par
  \endgroup
}
\newcommand*{\encl}[1]{\par%
  \ifdim\parskip=\z@%
    \vskip\baselineskip%
  \fi\noindent%
  \begingroup
    \parbox[t]{\textwidth}{%
      \Ifkomavarempty*{enclseparator}{}{%
        \@hangfrom{%
          \strut\usekomavar*{enclseparator}\usekomavar{enclseparator}}%
        }%
      \ignorespaces #1\strut}%
    \setlength{\parfillskip}{\z@ \@plus 1fil}\par
  \endgroup
}
\newkomavar{place}
\newkomavar{location}
\newkomavar{specialmail}
\newkomavar{title}
\newkomavar{fromlogo}
\newkomavar{fromzipcode}
\newkomavar{PPcode}
\newkomavar{PPdatamatrix}
\newkomavar{addresseeimage}
\newkomavar{signature}
\setkomavar{signature}{\usekomavar{fromname}}
\newkomavar{backaddress}
\setkomavar{backaddress}{%
  \Ifkomavarempty{fromname}{}{%
    \strut\ignorespaces\usekomavar{fromname}%
    \Ifkomavarempty{fromaddress}{}{\\}}%
  \Ifkomavarempty{fromaddress}{}{%
    \strut\ignorespaces\usekomavar{fromaddress}}%
  }
\newkomavar[\usekomavar{place}]{placeseparator}
\setkomavar{placeseparator}{,\nobreakspace}
\newkomavar[\subjectname]{subjectseparator}
\setkomavar{subjectseparator}{: }
\newkomavar[\ccname]{ccseparator}
\setkomavar{ccseparator}{: }
\newkomavar[\enclname]{enclseparator}
\setkomavar{enclseparator}{: }
\newkomavar{backaddressseparator}
\setkomavar{backaddressseparator}{,\nobreakspace}
\newkomavar[\if@scrsymbols\scr@symbol@phone\else\phonename\fi]{phoneseparator}
\setkomavar{phoneseparator}{\if@scrsymbols\else:\fi\nobreakspace}
\newkomavar[%
  \if@scrsymbols\scr@symbol@mobilephone\else\mobilephonename\fi
]{mobilephoneseparator}
\setkomavar{mobilephoneseparator}{\usekomavar{phoneseparator}}
\newkomavar[\if@scrsymbols\scr@symbol@fax\else\faxname\fi]{faxseparator}
\setkomavar{faxseparator}{\if@scrsymbols\else:\fi\nobreakspace}
\newkomavar[\if@scrsymbols\scr@symbol@email\else\emailname\fi]{emailseparator}
\setkomavar{emailseparator}{\if@scrsymbols\else:\fi\nobreakspace}
\newkomavar[\if@scrsymbols\scr@symbol@www\else\wwwname\fi]{urlseparator}
\setkomavar{urlseparator}{\if@scrsymbols\else:\nobreakspace\fi}
\newkomavar{zipcodeseparator}
\setkomavar{zipcodeseparator}{\,--\,}
\newkomavar[\headfromname]{fromname}
\newkomavar[\usekomavar{fromname}]{fromaddress}
\newkomavar[\headtoname]{toname}
\newkomavar[\usekomavar{toname}]{toaddress}
\newkomavar[\usekomavar*{phoneseparator}%
  \usekomavar{phoneseparator}]{fromphone}
\newkomavar[\usekomavar*{mobilephoneseparator}%
  \usekomavar{mobilephoneseparator}]{frommobilephone}
\newkomavar[\usekomavar*{faxseparator}%
  \usekomavar{faxseparator}]{fromfax}
\newkomavar[\usekomavar*{emailseparator}%
  \usekomavar{emailseparator}]{fromemail}
\newkomavar[\usekomavar*{urlseparator}%
  \usekomavar{urlseparator}]{fromurl}
\newkomavar[\bankname]{frombank}
\newkomavar[\yourrefname]{yourref}
\newkomavar[\yourmailname]{yourmail}
\newkomavar[\myrefname]{myref}
\newkomavar[\customername]{customer}
\newkomavar[\invoicename]{invoice}
\newkomavar[\usekomavar*{subjectseparator}%
  \usekomavar{subjectseparator}]{subject}
\newkomavar[\datename]{date}
\setkomavar{date}{\@date}
\newcommand*{\scr@saved@date}{}
\let\scr@saved@date\date
\renewcommand*{\date}[1]{%
  \ClassWarning{\KOMAClassName}{%
    \string\date\space changes the internal \string\LaTeX\space date
    only.\MessageBreak
    You should note that this changes the default\MessageBreak
    value of variable `date' only as long as nobody\MessageBreak
    uses `\string\setkomavar` to change the content of\MessageBreak
    variable `date'.\MessageBreak
    Therefore, usage of `\string\setkomavar' is recommended\MessageBreak
    to change the letter's date%
  }%
  \scr@saved@date{#1}%
}
%%% From File: $Id: scrkernel-addressfiles.dtx 3874 2022-06-05 10:38:02Z kohm $
%%%            (run: body)
\newcommand*{\adrentry}[7]{%
  \ClassWarning{\KOMAClassName}{%
    command `\string\adrentry' is deprecated.\MessageBreak
    You should use `\string\addrentry' with additional\MessageBreak
    empty 8th argument}%
  \addrentry{#1}{#2}{#3}{#4}{#5}{#6}{#7}{}}
\newcommand*{\addrentry}[9]{\def\@tempa{#1}\ifx \@tempa\@empty \else
 \def\@tempa{#2}\ifx \@tempa\@empty
  \expandafter\def\csname #9\endcsname{#1\\#3}%
 \else
  \expandafter\def\csname #9\endcsname{#2 #1\\#3}%
 \fi \fi}
\newcommand*{\adrchar}{%
  \ClassWarning{\KOMAClassName}{%
    command `\string\adrchar' is deprecated.\MessageBreak
    You should use `\string\addrchar'}
  \addrchar}
\newcommand*{\addrchar}[1]{}
%%% From File: $Id: scrlogo.dtx 3688 2022-02-10 08:26:37Z kohm $
\RequirePackage{scrlogo}
\endinput
%%
%% End of file `scrlttr2.cls'.
