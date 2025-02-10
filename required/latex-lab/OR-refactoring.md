



```
\def\@makecol{%
  \UseHook {OR/makecol/before}%            % <--------
%  
  \setbox \@outputbox \box \@cclv
  \@outputbox@removebskip
%  
  \UseTaggingSocket{OR/makecol}              % <--------
%  
  \let \@elt \relax
  \xdef \@freelist {\@freelist \@midlist}%
  \global \let \@midlist \@empty
%  
  \UseSocket {@makecol/outputbox}%           % <--------
%  
  \ifvbox \@kludgeins
    \@make@specialcolbox
  \else
    \@make@normalcolbox
  \fi
  \global \maxdepth \@maxdepth
%  
  \UseHook {OR/makecol/after}%             % <--------
}  
```


```
\def\@outputpage{%
  \UseHook {OR/outputpage/before}%             % <--------
%
  \begingroup
    \let \protect \noexpand
    \language \document@default@language
    \@resetactivechars
    \global \let \@@if@newlist \if@newlist
    \global \@newlistfalse
    \@parboxrestore
    \shipout \vbox {%
       \set@typeset@protect
       \aftergroup \endgroup
       \aftergroup \set@typeset@protect
       \if@specialpage
          \global \@specialpagefalse
          \@nameuse {ps@\@specialstyle}%
       \fi
       \if@twoside
          \ifodd \count \z@
             \let \@thehead \@oddhead
             \let \@thefoot \@oddfoot
             \let \@themargin \oddsidemargin
          \else
             \let \@thehead \@evenhead
             \let \@thefoot \@evenfoot
             \let \@themargin \evensidemargin
          \fi
       \fi
       \reset@font \normalsize \normalsfcodes
       \let \label \@gobble
       \let \index \@gobble
       \let \glossary \@gobble
       \baselineskip \z@skip
       \lineskip \z@skip
       \lineskiplimit \z@
       \@begindvi
       \vskip \topmargin
       \moveright \@themargin \vbox {%
          \setbox \@tempboxa \vbox to\headheight {%
              \vfil
%             
              \@kernel@before@head                  % <-----
%             
              \color@hbox
                \normalcolor
                \hb@xt@ \textwidth {\@thehead }%
              \color@endbox
%             
              \@kernel@after@head                   % <-----
%             
           }%
           \dp \@tempboxa \z@
           \box \@tempboxa
           \vskip \headsep
           \box \@outputbox
           \baselineskip \footskip
%             
           \@kernel@before@foot                     % <-----
%             
           \color@hbox
              \normalcolor
              \hb@xt@ \textwidth {\@thefoot }%
            \color@endbox
%             
            \@kernel@after@foot                     % <-----
%             
      }%
   }%
   \global \let \if@newlist \@@if@newlist
   \global \@colht \textheight
   \stepcounter {page}%
%
  \UseHook {OR/outputpage/after}%                % <--------
}
```



Plug definition indirect as long as tagpdf.sty still uses the old names
```
\NewSocket{tagsupport/OR/makecol}
\NewSocketPlug{tagsupport/OR/makecol}{default}
  { \@kernel@tagsupport@@makecol }


\NewSocket{tagsupport/OR/footins}
\NewSocketPlug{tagsupport/OR/footins}{default}
  { \@kernel@before@footins }


\NewSocket{OR/makecol/before}       % we could use cmd/@makecol/before instead
\NewSocket{OR/makecol/after}        % we could use cmd/@makecol/after instead

\NewSocket{OR/outputpage/before}    % we could use cmd/@outputpage/before instead
\NewSocket{OR/outputpage/after}     % we could use cmd/@outputpage/after instead
```



```
```
