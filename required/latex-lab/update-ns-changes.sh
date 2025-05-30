# l3build save -c config-OR scrartcl-001 memoir-001 tagging-002-longtable
#  l3build save -c config-math mathml-AF-ex1-keys mathcapture-tag-001 mtag-008-gh765
#  l3build save -c config-math-luatex mathml-luamml-2 fakemath mtag-008-gh765 math-20-structelem mathml-luamml-4 math-20-alt-noluamml mathml-luamml-3
#  l3build save -c config-OR-luatex test5 test1 test-tnote-setup memoir-001 test9 test-minipage test8 test11-series test4 scrartcl-001 test7 test6 test3 test2 test10
#  l3build save -c config-toc toc-ex-article-no-hyperref toc-ex-article-hyperref-1 toc-ex-article-hyperref-2 toc-ex-book-no-hyperref toc-ex-article-hyperref-3 toc-manual-addcontentsline toc-ex-book-tocdepth toc-ex-book-hyperref-1
#  l3build save -c config-block gallery-III-with-sec
#  l3build save -c config-graphic graphic-rotating
#  l3build save -c config-minipage minipage-006-gh723
#  l3build save -c config-float marginpar-01 marginpar-03 marginpar-04-gh-444 float-sidewaystable
#  l3build save -c config-bib bib-010-natbib bib-006 bib-007-natbib bib-009 bib-008-natbib bib-005
#  l3build save -c config-table-pdftex table-027-longtable-554 table-010-longtable-pdf2 table-023-multirow table-024-multirow table-025 table-020-rowheader table-009-pdf table-010-longtable-pdf table-026-minipage-37 table-011-endheadbox table-014-pbox table-014-pbox-longtable table-001-pdf
#  l3build save -c config-table-luatex table-001-pdf table-011-endheadbox table-014-pbox-longtable table-009-pdf table-010-longtable-pdf table-010-longtable-pdf2 table-014-pbox
#  l3build save -c config-title title-005 title-009 title-008 title-007 title-006 title-002 title-004 title-003
#  l3build save -c config-firstaid test-amsart-title test-booktabs

  l3build save -c config-sec -e luatex test-gh787
  l3build save -c config-toc -e luatex toc-manual-addcontentsline toc-ex-article-hyperref-3 toc-ex-book-tocdepth toc-ex-article-hyperref-2 toc-ex-book-no-hyperref toc-ex-article-hyperref-1 toc-ex-article-no-hyperref toc-ex-book-hyperref-1
  l3build save -c config-block -e luatex gallery-III-with-sec
  l3build save -c config-graphic -e luatex graphic-rotating
  l3build save -c config-minipage -e luatex minipage-006-gh723
  l3build save -c config-float -e luatex marginpar-04-gh-444 float-sidewaystable marginpar-01 marginpar-03
  l3build save -c config-bib -e luatex bib-005 bib-008-natbib bib-009 bib-006 bib-007-natbib bib-010-natbib
  l3build save -c config-title -e luatex title-004 title-003 title-007 title-006 title-009 title-008 title-002 title-005
