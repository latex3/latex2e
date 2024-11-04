REM l3build save -c config-OR memoir-001 scrartcl-001
REM l3build save -c config-OR-luatex scrartcl-001 test8 test10 test1 test9 test7 memoir-001 test5 test6 test4 test2 test-minipage test3 test-tnote-setup test11-series
REM l3build save -c config-toc toc-ex-article-no-hyperref toc-ex-book-tocdepth toc-ex-article-hyperref-3 toc-manual-addcontentsline toc-debug toc-ex-article-hyperref-1 toc-ex-book-no-hyperref toc-ex-article-hyperref-2 toc-ex-book-hyperref-1
REM l3build save -c config-block -e luatex blocks-quote-02 blocks-theorem-01 blocks-verbatim-01 tagging-0097 blocks-hyperref-01 blocks-theorem-02
REM l3build save -c config-minipage -e luatex minipage-004-hyperref
REM l3build save -c config-float -e luatex float-001 float-005-double float-004 float-003 float-002
REM l3build save -c config-bib bib-010-natbib bib-005 bib-007-natbib bib-009 bib-004 bib-006 bib-008-natbib bib-003
REM l3build save -c config-table-luatex table-007-longtable table-005 table-004-tabularx
REM l3build save -c config-title title-008 title-004 title-005 title-007 title-002 title-009 title-006 title-003
REM l3build save -c config-firstaid test-ltugboat test-amsart-title
REM l3build save -c config-toc -e luatex toc-ex-article-hyperref-2 toc-ex-book-tocdepth toc-ex-article-no-hyperref toc-ex-article-hyperref-3 toc-ex-book-no-hyperref toc-ex-article-hyperref-1 toc-ex-book-hyperref-1 toc-manual-addcontentsline toc-debug
REM l3build save -c config-title -e luatex title-003 title-009 title-007 title-005 title-006 title-004 title-008 title-002

l3build save -c config-block -e luatex blocks-hyperref-01
l3build save -c config-block blocks-000
 l3build check --show-saves -c config-block blocks-000 
