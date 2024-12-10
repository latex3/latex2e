# Packages that use double \kern's

Scan of TeXlive 2022  for checking ... may not be longer accurate and may contain a few false positives
(definitely contains bogus entries right now)


```

      \ifdim\lastkern>\z@\ifdim\lastkern<5sp\relax
./bxjscls/bxjsja-minimal.def



    \ifdim\lastkern=-3sp \unkern
      \ifdim\lastkern=3sp \kern-3sp
    {\kern\MT@outer@kern\kern3sp\kern-3sp\relax}%
./microtype/letterspace.sty


    \ifdim\lastkern=-3sp \unkern
      \ifdim\lastkern=3sp \kern-3sp
    {\kern\MT@outer@kern\kern3sp\kern-3sp\relax}%
./microtype/microtype-pdftex.def

 
    \ifdim\lastkern=-3sp \unkern
      \ifdim\lastkern=3sp \kern-3sp
    {\kern\MT@outer@kern\kern3sp\kern-3sp\relax}%
./microtype/microtype-luatex.def



\providecommand*{\multiplefootnotemarker}{3sp}
./eledmac/eledmac.sty



\providecommand*{\multiplefootnotemarker}{3sp}
./reledmac/reledmac.sty


\edef\CJK@kern{\kern -2sp\kern 2sp}
\edef\CJK@CJK{\kern -1sp\kern 1sp}
./cjk/texinput/CJK.sty


\edef\ruby@kern{\kern -5sp\kern 5sp}
./cjk/texinput/ruby.sty


%     hyphenation between pinyin syllables. Values 1sp-3sp are already used
\edef\py@sp{\kern -4sp\kern 4sp}
./cjk/texinput/pinyin.sty


\providecommand*{\multiplefootnotemarker}{3sp}
./tufte-latex/tufte-common.def



\newcommand*{\multiplefootnotemarker}{3sp}
./memoir/memoir.cls


\providecommand*{\multiplefootnotemarker}{3sp}
./parnotes/parnotes.sty


\providecommand*{\multiplefootnotemarker}{3sp}
./lwarp/lwarp-footmisc.sty


  \bgroup \kern-3sp\kern3sp % kerns so I can test for beginning of list
./examdesign/examdesign.cls


    \kern-1sp \kern1sp }
    \kern-2sp \kern2sp }
    \kern-3sp \kern3sp }
    \kern-4sp \kern4sp }
./polyglossia/gloss-korean.ldf



\NewDocumentCommand \@sidenotes@multisign { } {3sp}
./sidenotes/sidenotes.sty

```
