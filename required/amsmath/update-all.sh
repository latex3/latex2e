

l3build save -epdftex \
	github-0216.lvt \
	github-0734.lvt \
	github-1265.lvt \
	github-1770.lvt \
	github-1775.lvt \
	github-amsmath-0049.lvt \
	github-amsmath-0049b.lvt \
	github-amsmath-0216.lvt \
	github-amsmath-1815.lvt \
	github-amsrobust-0123.lvt \
	tlb-alignedspace-01.lvt \
	tlb-alignedspace-02.lvt \
	tlb-alignedspace-03.lvt \
	tlb-amsmath-load.lvt \
	tlb-binom-01.lvt \
	tlb-binom-02.lvt \
	tlb-dots-001.lvt \
	tlb-dots-002.lvt \
	tlb-intertext-001.lvt \
	tlb-mathstrut-01.lvt \
	tlb-mathstrut-02.lvt \
	tlb-muskip-001.lvt \
	tlb-utex-001.lvt \
	tlb-utex-002.lvt \
	tlb-utex-003.lvt


l3build save -epdftex,luatex \
	amsldoc-1.lvt \
	amsldoc-3.lvt \
	amsldoc-4-fleqn.lvt \
	amsldoc-4.lvt \
	amsldoc-6.lvt \
	github-0126.lvt \
	github-1289.lvt \
	github-amsmath-0005.lvt \
	github-amsmath-0716.lvt \
	tlb-overunderset01.lvt

l3build save -epdftex,xetex \
	github-0423.lvt
	

l3build save -epdftex,xetex,luatex \
	amsldoc-2.lvt \
	amsldoc-5.lvt \
	tlb-stdminus.lvt

%--------------------------------------------


l3build save -epdftex,luatex -cconfig-search \
	github-0783 \
	github-0783-leqno

%--------------------------------------------


l3build save -exetex,luatex -cconfig-TU \
	tlb-lualatex-math-move \
	tlb-utex-004 \
	tlb-utex-005
