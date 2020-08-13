-- Tests that have only 1 run 

checksearch  = false
testfiledir  = "testfiles-1run"

dynamicfiles = {"*.tst",
                "*.aux","*.toc","*.lof","*.lot",          -- may need more depending on tests
                "github 220 input.tex","github-0220.sty"  -- used by ithub-0220.lvt
	       }

checkruns     = 1
