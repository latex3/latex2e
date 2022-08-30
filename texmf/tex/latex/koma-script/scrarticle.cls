%%
%% This is file `scrarticle.cls',
%% generated with the docstrip utility, extended by scrdocstrip.
%%
%% The original source files were:
%%
%% scrkernel-version.dtx  (with options: `class,article,long')
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
  scrartcl%
}
\newcommand*{\ClassName}{%
  article%
}
\newcommand*{\KOMALongClassName}{}
\edef\KOMALongClassName{scr\ClassName}
\newcommand*{\KOMALongClassFileName}{\KOMALongClassName.\@clsextension}
\edef\KOMALongClassFileName{\KOMALongClassFileName}
\ProvidesClass{\KOMALongClassName}[%
  2022/07/04 v3.37 KOMA-Script
  document class (\ClassName)%
]
\let\ClassName\relax
\expandafter\let\expandafter\KOMAClassName\expandafter\relax
\expandafter\LoadClassWithOptions\expandafter{\KOMAClassName}
\endinput
%%
%% End of file `scrarticle.cls'.
