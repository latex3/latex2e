%
% We are still waiting to find the time to consolidate ltxdoc, l3doc, etc, so for now this
% is yet another internal class that loads l3doc + the extra bits from ltxdoc we want for newer dtx files.
%
% None of this is meant to stay, so this class is not supposed to be used outside of the kernel documentation!
% It may get incompatible updates and it will vanish again, eventually.
\ProvidesClass{l3in2edoc}[2026-01-20 v1.0 Internal LaTeX documentation class based on l3doc]

\LoadClassWithOptions{l3doc}

% load support for tagging, if \DocumentMetadata is used

\IfDocumentMetadataT{\RequirePackage{latex-lab-testphase-l3doc}}

% load some extra definitions for new documentation
%
\input{ltxdoc-extra.ltx}

% Some redefinitions for template descriptions

\renewenvironment{TemplateInterfaceDescription}[1]
 {%
   \subsubsection{The template type `#1'}
   \begingroup
   \@beginparpenalty\@M
   \description
   \def\TemplateArgument##1##2{\item[Arg:~##1]##2\par}%
   \def\TemplateSemantics%
     {\enddescription\endgroup
     \subsubsection*{Semantics:}}%
 }
 {\par\bigskip}

\renewenvironment{TemplateDescription}[2]
  {\subsubsection{The \texttt{#1} template `#2'}
    \paragraph*{Attributes:}
    \begingroup
    \@beginparpenalty\@M
    \description
    \long\def\TemplateKey##1##2##3##4{%
        \item[\texttt{##1} (\textit{\mdseries##2})]##3%
        \ifx\TemplateKey##4\TemplateKey\else
          \hfill\penalty500\hbox{}\hfill\space Default:~\texttt{##4}%
          \nobreak\hskip-\parfillskip\hskip0pt\relax
        \fi
        \par
      }%
    \def\TemplateSemantics{%
        \enddescription\endgroup
        \paragraph*{Semantics \& Comments:}%
      }%
  }
  {\par\bigskip}
\endinput
           
