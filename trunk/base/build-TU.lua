#!/usr/bin/env texlua

checksearch  = true
checkengines = {"etex, "xetex"}
testfiledir  = "testfiles-TU"

-- Variable for skipping font stuff in format building
TUenc = true

dofile("build.lua")