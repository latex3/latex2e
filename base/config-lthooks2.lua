-- Tests for lthooks

checkengines = {"etex"}
checksearch  = true
testfiledir  = "testfiles-lthooks2"
checkdeps    = checkdeps   or
  {
    maindir .. "/base",
    maindir .. "/required/tools"
  }

-- Custom settings for the check system
-- testsuppdir = "testfiles-lthooks2/helpers"


checkruns     = 2

