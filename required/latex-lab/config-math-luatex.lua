-- Tests for math capture stuff

stdengine    = "luatex"
checkengines = {"luatex"}
checksearch  = true
testfiledir  = "testfiles-math-luatex"

checkdeps =
  {
    maindir .. "/base",
    maindir .. "/required/amsmath"
  }

checkruns     = 2


