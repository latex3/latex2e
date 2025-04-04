

l3build save -cconfig-OR \
	github-863-footmisc \
	memoir-001 \
	scrartcl-001 \
	tlb-multicol-marks-tagged \
	tagging-001 \
	tagging-002-longtable

l3build save -cconfig-OR-luatex \
	footmisc-003 \
	footmisc-004 \
	footmisc-005 \
	footmisc-009-multiple \
	footmisc-009-multiple-tagging \
	footmisc-010-setspace \
	footmisc-010-setspace-tagging \
	footmisc-011-para \
	footmisc-012-side \
	footmisc-012-side-hyperref \
	footmisc-013-scrartcl \
	tagging-001 \
	memoir-001 \
	tagging-001 \
	scrartcl-001 \
	test-minipage \
	test-tnote-setup \
	test1 \
	test10 \
	test11-series \
	test2 \
	test3 \
	test4 \
	test5 \
	test6 \
	test7 \
	test8 \
	test9 



exit

# those can only be tested locally

l3build save -cconfig-OR-local \
	footmisc-local-uafthesis \
	footmisc-local-uwthesis \
	footmisc-local-aastex631

exit




