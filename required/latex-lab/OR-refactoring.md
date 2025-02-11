



```
\def\@makecol{%
  \UseHook {OR/column/before}%              % <--------
%  
  \setbox \@outputbox \box \@cclv
  \@outputbox@removebskip
%  
  \UseTaggingSocket{OR/column/outputbox}              % <--------
%  
  \let \@elt \relax
  \xdef \@freelist {\@freelist \@midlist}%
  \global \let \@midlist \@empty
%  
  \UseSocket {OR/column/outputbox}%         % <--------
%  
  \ifvbox \@kludgeins
    \@make@specialcolbox
  \else
    \@make@normalcolbox
  \fi
  \global \maxdepth \@maxdepth
%  
  \UseHook {OR/column/before/after}%              % <--------
}  
```


```
\def\@outputpage{%
  \UseHook {OR/page/before}%             % <--------
%
  \begingroup
    \let \protect \noexpand
    \language \document@default@language
    \@resetactivechars
    \global \let \@@if@newlist \if@newlist
    \global \@newlistfalse
    \@parboxrestore
    \UseHook {OR/page/reset}%            % <--------
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
       \let \label \@gobble@with@sphack@om
       \let \index \@gobble@with@sphack@som
       \let \glossary \@gobble@with@sphack@om
       \baselineskip \z@skip
       \lineskip \z@skip
       \lineskiplimit \z@
       \@begindvi
       \vskip \topmargin
       \moveright \@themargin \vbox {%
          \setbox \@tempboxa \vbox to\headheight {%
              \vfil
%             
              \pdfannot_link_off:
              \UseTaggingSocket{OR/page/header}{}  % <--------
                {
                  \color@hbox
                    \normalcolor
                    \hb@xt@ \textwidth {\@thehead }%
                  \color@endbox
                }
              \pdfannot_link_on:
%             
           }%
           \dp \@tempboxa \z@
           \box \@tempboxa
           \vskip \headsep
           \box \@outputbox
           \baselineskip \footskip
%             
           \pdfannot_link_off:
           \UseTaggingSocket{OR/page/footer}{}     % <--------
              {
                 \color@hbox
                    \normalcolor
                    \hb@xt@ \textwidth {\@thefoot }%
                  \color@endbox
              }
           \pdfannot_link_on:
%             
      }%
   }%
   \global \let \if@newlist \@@if@newlist
   \global \@colht \textheight
   \stepcounter {page}%
%
  \UseHook {OR/page/after}%                % <--------
}
```

## Questions

### What hook/socket names should we use

 - all `OR/...` as done above?
 - or closer to the command names, e.g., `cmd/@outputpage/before` `@outputpage/reset`, etc?
   In that case one can use the generic hooks but I'm not so keen on using generic hooks for internal commands

- if we can assume that tagging for header and footer is always idential we could reuse the sockets and call them
  `OR/page/headerfoot/before` and   `OR/page/headerfoot/after`


## Hook, sockets, plugs

Plug definition indirect as long as tagpdf.sty still uses the old names
```
\NewSocket{tagsupport/OR/column/outputbox}{0}
\NewSocketPlug{tagsupport/OR/column/outputbox}{default}
  { \@kernel@tagsupport@@makecol }
\AssignSocketPlug{tagsupport/OR/column/outputbox}{default}


\NewSocket{tagsupport/OR/column/footins}{0}
\NewSocketPlug{tagsupport/OR/column/footins}{default}
  { \@kernel@before@footins }
\AssignSocketPlug{tagsupport/OR/column/footins}{default}


\NewSocket{tagsupport/OR/page/header}{2}
\NewSocketPlug{tagsupport/OR/page/header}{default}
  { \@kernel@before@head #2 \@kernel@after@head }
\AssignSocketPlug{tagsupport/OR/page/header}{default}


\NewSocket{tagsupport/OR/page/footer}{2}
\NewSocketPlug{tagsupport/OR/page/footer}{default}
  { \@kernel@before@foot #2 \@kernel@after@foot }
\AssignSocketPlug{tagsupport/OR/page/footer}{default}

```


The hooks are there to support external packages (not yet used).

```
\NewHook{OR/column/before}       % we could use cmd/@makecol/before instead
\NewHook{OR/column/after}        % we could use cmd/@makecol/after instead

\NewHook{OR/page/before}    % we could use cmd/@outputpage/before instead
\NewHook{OR/page/after}     % we could use cmd/@outputpage/after instead

\NewHook{OR/page/reset}
```
