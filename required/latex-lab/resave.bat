To regenerate the test files, run

  l3build save documentmetadata-latest documentmetadata-support-000 gh-tagging628-settodim tagging-gh34 gh-tagging628-settodim-calc documentmetadata-tagging documentmetadata-support-002 documentmetadata-support-001
  l3build save -c config-OR tlb-multicol-marks-tagged
  l3build save -c config-math math-phantom mathcapture-017 mathcapture-009 mtag-005-intertext mathcapture-014 mtag-004 mtag-003 mathcapture-001 mathcapture-008 mathcapture-018 mtag-002 tagging-842 mathcapture-012 mathml-AF-hash mathml-write mathcapture-006 mathcapture-005 mathcapture-019 mathcapture-004 mathcapture-002 mathcapture-011 math-suspended-gh661 mtag-001 mathml-AF-ex1
  l3build save -c config-math-luatex smash test-math-split-leqno-centertags mathml-luamml-5 mathml-luamml-invisible-1 fakemath-error test-math-split-reqno-tbtags mathml-luamml-1 mathml-luamml-2a test-math-split-reqno-centertags amsmath-mbox test-math-split-leqno-tbtags structelem-mbox math-phantom math-suspended-gh661
  l3build save -c config-OR-luatex test9 test-tnote-setup footmisc-004 scrartcl-001 test10 test-minipage footmisc-003 footmisc-009-multiple-tagging
  l3build save -c config-sec test-gh830-comma test-gh787 test-gh777-sec-end test-faulty-nesting test-stop-sect test-gh725-opt-arg
  l3build save -c config-toc -e luatex toc-ex-article-hyperref-2 toc-ex-article-hyperref-1 toc-ex-book-hyperref-1 toc-ex-article-hyperref-3
  l3build save -c config-toc toc-math-leaders toc-debug
  l3build save -c config-block tagging-0767 blocks-trivlist-02 blocks-minipage-gh544 blocks-itemize-01 blocks-user-keys-01 blocks-itemize-02 blocks-hyperref-01 blocks-description-01b ptag-001 blocks-enumerate-02b blocks-quote-02 blocks-list-01 blocks-verbatim-nested-gh119 tagging-0730 tagging-0840 tagging-0097 blocks-enumerate-01b problem-blocks-tabbing blocks-verbatim-02 blocks-theorem-04 blocks-quote-01 blocks-theorem-01 blocks-verbatim-01 blocks-item-01 blocks-item-02 blocks-list-01b blocks-theorem-03 blocks-list-02b blocks-item-04 blocks-trivlist-01 blocks-list-03b blocks-description-02b blocks-description-03 blocks-theorem-02 blocks-itemize-01b
  l3build save -c config-graphic graphic-006-width tikz-008 graphic-011-picture graphic-002 tikz-007 graphic-013-draft graphic-004-angle graphic-012-scale graphic-007-corr graphic-001 graphic-faults graphic-008-alt graphic-005-trim graphic-010-actualtext graphic-003 graphic-009-rotatebox
  l3build save -c config-minipage minipage-003-todo minipage-001 minipage-002-todo minipage-004-hyperref minipage-005-footnote text-phantom
  l3build save -c config-float -e luatex marginpar-01
  l3build save -c config-float float-005-double float-003 float-007-gh55 float-011-multicol float-010-outside float-004 float-006-spacing float-001 float-002
  l3build save -c config-footnote footmisc-floats-000 footmisc-001 footnote-heading footmisc-002 footmisc-floats-001 footnote-float-above
  l3build save -c config-bib -e luatex bib-010-natbib bib-008-natbib bib-006 bib-009
  l3build save -c config-bib bib-003 bib-004
  l3build save -c config-LM-tagging shorthands
  l3build save -c config-table-pdftex table-019 table-008-disable table-017 table-006-longtable table-005 table-002 table-007-longtable table-012-caption table-019-deprecated-keys table-021-longtable table-009 table-026-multirow table-022-cline table-001 table-008-multi table-020 table-003 table-016-math table-004-tabularx table-015 table-013-longtable-hyperref
  l3build save -c config-table-luatex table-005 table-016 table-013-longtable-hyperref table-008-multi table-002 table-012-caption table-006-longtable table-015 table-000 table-020 table-007-longtable table-021-longtable table-015-presentation table-019 table-018 table-017 table-003 table-001 table-004-tabularx table-009
  l3build save -c config-title title-empty
  l3build save -c config-title -e luatex title-006
  l3build save -c config-firstaid test-ltugboat test-amsthm test-amsart-733 test-cleveref test-amsthm-736 test-amsart-thm test-blindtext test-fancyvrb

To detect engine-specific differences, run after that

  l3build check --show-saves documentmetadata-latest documentmetadata-support-000 gh-tagging628-settodim tagging-gh34 gh-tagging628-settodim-calc documentmetadata-tagging documentmetadata-support-002 documentmetadata-support-001
  l3build check --show-saves -c config-OR tlb-multicol-marks-tagged
  l3build check --show-saves -c config-math math-phantom mathcapture-017 mathcapture-009 mtag-005-intertext mathcapture-014 mtag-004 mtag-003 mathcapture-001 mathcapture-008 mathcapture-018 mtag-002 tagging-842 mathcapture-012 mathml-AF-hash mathml-write mathcapture-006 mathcapture-005 mathcapture-019 mathcapture-004 mathcapture-002 mathcapture-011 math-suspended-gh661 mtag-001 mathml-AF-ex1
  l3build check --show-saves -c config-math-luatex smash test-math-split-leqno-centertags mathml-luamml-5 mathml-luamml-invisible-1 fakemath-error test-math-split-reqno-tbtags mathml-luamml-1 mathml-luamml-2a test-math-split-reqno-centertags amsmath-mbox test-math-split-leqno-tbtags structelem-mbox math-phantom math-suspended-gh661
  l3build check --show-saves -c config-OR-luatex test9 test-tnote-setup footmisc-004 scrartcl-001 test10 test-minipage footmisc-003 footmisc-009-multiple-tagging
  l3build check --show-saves -c config-sec test-gh830-comma test-gh787 test-gh777-sec-end test-faulty-nesting test-stop-sect test-gh725-opt-arg
  l3build check --show-saves -c config-toc toc-math-leaders toc-debug
  l3build check --show-saves -c config-block tagging-0767 blocks-trivlist-02 blocks-minipage-gh544 blocks-itemize-01 blocks-user-keys-01 blocks-itemize-02 blocks-hyperref-01 blocks-description-01b ptag-001 blocks-enumerate-02b blocks-quote-02 blocks-list-01 blocks-verbatim-nested-gh119 tagging-0730 tagging-0840 tagging-0097 blocks-enumerate-01b problem-blocks-tabbing blocks-verbatim-02 blocks-theorem-04 blocks-quote-01 blocks-theorem-01 blocks-verbatim-01 blocks-item-01 blocks-item-02 blocks-list-01b blocks-theorem-03 blocks-list-02b blocks-item-04 blocks-trivlist-01 blocks-list-03b blocks-description-02b blocks-description-03 blocks-theorem-02 blocks-itemize-01b
  l3build check --show-saves -c config-graphic graphic-006-width tikz-008 graphic-011-picture graphic-002 tikz-007 graphic-013-draft graphic-004-angle graphic-012-scale graphic-007-corr graphic-001 graphic-faults graphic-008-alt graphic-005-trim graphic-010-actualtext graphic-003 graphic-009-rotatebox
  l3build check --show-saves -c config-minipage minipage-003-todo minipage-001 minipage-002-todo minipage-004-hyperref minipage-005-footnote text-phantom
  l3build check --show-saves -c config-float float-005-double float-003 float-007-gh55 float-011-multicol float-010-outside float-004 float-006-spacing float-001 float-002
  l3build check --show-saves -c config-footnote footmisc-floats-000 footmisc-001 footnote-heading footmisc-002 footmisc-floats-001 footnote-float-above
  l3build check --show-saves -c config-bib bib-003 bib-004
  l3build check --show-saves -c config-LM-tagging shorthands
  l3build check --show-saves -c config-table-pdftex table-019 table-008-disable table-017 table-006-longtable table-005 table-002 table-007-longtable table-012-caption table-019-deprecated-keys table-021-longtable table-009 table-026-multirow table-022-cline table-001 table-008-multi table-020 table-003 table-016-math table-004-tabularx table-015 table-013-longtable-hyperref
  l3build check --show-saves -c config-table-luatex table-005 table-016 table-013-longtable-hyperref table-008-multi table-002 table-012-caption table-006-longtable table-015 table-000 table-020 table-007-longtable table-021-longtable table-015-presentation table-019 table-018 table-017 table-003 table-001 table-004-tabularx table-009
  l3build check --show-saves -c config-title title-empty
  l3build check --show-saves -c config-firstaid test-ltugboat test-amsthm test-amsart-733 test-cleveref test-amsthm-736 test-amsart-thm test-blindtext test-fancyvrb
