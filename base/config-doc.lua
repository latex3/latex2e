-- Test with search tree enabled

-- checkengines = {"etex" }       -- use all engines

checksearch  = true

-- even with search = true we have to load tools to get multicol :-(
checkdeps =
  {
    maindir .. "/required/tools"
  }

testfiledir  = "./testfiles-doc"

-- testsuppdir  = testfiledir .. "/support"
