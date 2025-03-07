l3build save -epdftex,xetex,luatex \
	tlb-latexrelease-rollback-2020-10-01 \
	tlb-latexrelease-rollback-2021-06-01 \
	tlb-latexrelease-rollback-2021-11-15 \
	tlb-latexrelease-rollback-2022-06-01 \
	tlb-latexrelease-rollback-2022-11-01 \
	tlb-latexrelease-rollback-2023-06-01 \
	tlb-latexrelease-rollback-2023-11-01 \
	tlb-latexrelease-rollback-2024-06-01 \
	tlb-latexrelease-rollback-2024-11-01 \
	tlb-latexrelease-rollback-003-often \
	tlb-latexrelease-rollback-004 \
	tlb-rollback-004-often \
	tlb-rollback-005 \
	github-0479-often

l3build save  \
	tlb-latexrelease-rollback-2023-06-01 \
	tlb-latexrelease-rollback-2025-06-01

l3build save -c config-lthooks \
	lthooks-rollback-args


echo ""
echo "*************************************************"
echo "* Unexpected errors in release rollbacks if any:"
echo "*************************************************"
grep '^!' testfiles/tlb-latexrelease-rollback-2*tlg  # tests with rollback-0... can contain errors

exit

