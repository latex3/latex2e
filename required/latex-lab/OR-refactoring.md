



```
\def\@makecol{%
  \UseHook {OR/makecol/before}%              % <--------
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
  \UseSocket {OR/makecol/outputbox}%         % <--------
%  
  \ifvbox \@kludgeins
    \@make@specialcolbox
  \else
    \@make@normalcolbox
  \fi
  \global \maxdepth \@maxdepth
%  
  \UseHook {OR/makecol/after}%              % <--------
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
    \UseHook {OR/outputpage/reset}%            % <--------
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
              \UseTaggingSocket{OR/head/before}  % <--------
%             
              \color@hbox
                \normalcolor
                \hb@xt@ \textwidth {\@thehead }%
              \color@endbox
%             
              \UseTaggingSocket{OR/head/after}   % <--------
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
           \UseTaggingSocket{OR/foot/before}     % <--------
%             
           \color@hbox
              \normalcolor
              \hb@xt@ \textwidth {\@thefoot }%
            \color@endbox
%             
            \UseTaggingSocket{OR/foot/after}     % <--------
            \pdfannot_link_on:
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

## Questions

### What hook/socket names should we use

 - all `OR/...` as done above?
 - or closer to the command names, e.g., `cmd/@outputpage/before` `@outputpage/reset`, etc?
   In that case one can use the generic hooks but I'm not so keen on using generic hooks for internal commands

- if we can assume that tagging for header and footer is always idential we could reuse the sockets and call them
  `OR/headfoot/before` and   `OR/headfoot/after`


## Hook, sockets, plugs

Plug definition indirect as long as tagpdf.sty still uses the old names
```
\NewSocket{tagsupport/OR/makecol}{0}
\NewSocketPlug{tagsupport/OR/makecol}{default}
  { \@kernel@tagsupport@@makecol }


\NewSocket{tagsupport/OR/footins}{0}
\NewSocketPlug{tagsupport/OR/footins}{default}
  { \@kernel@before@footins }


\NewSocket{tagsupport/OR/head/before}{0}
\NewSocketPlug{tagsupport/OR/head/before}{default}
  { \@kernel@before@head }

\NewSocket{tagsupport/OR/head/after}{0}
\NewSocketPlug{tagsupport/OR/head/after}{default}
  { \@kernel@after@head }


\NewSocket{tagsupport/OR/foot/before}{0}
\NewSocketPlug{tagsupport/OR/foot/before}{default}
  { \@kernel@before@foot }

\NewSocket{tagsupport/OR/foot/after}{0}
\NewSocketPlug{tagsupport/OR/foot/after}{default}
  { \@kernel@after@foot }


\NewSocket{OR/makecol/before}{0}       % we could use cmd/@makecol/before instead
\NewSocket{OR/makecol/after}{0}        % we could use cmd/@makecol/after instead

\NewSocket{OR/outputpage/before}{0}    % we could use cmd/@outputpage/before instead
\NewSocket{OR/outputpage/after}{0}     % we could use cmd/@outputpage/after instead

\UseHook {OR/outputpage/reset}{0}

```



```
```
