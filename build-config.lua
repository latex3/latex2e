-- Common settings for LaTeX2e development repo

-- The LaTeX2e kernel is needed by everything except 'base'
-- There is an over-ride for that case
checkdeps  = checkdeps  or {maindir .. "/base"}
unpackdeps = unpackdeps or {maindir .. "/base"}

-- Set up the check system to work in 'stand-alone' mode
-- This relies on a format being built by the 'base' dependency
checkformat    = ""
checkopts      = "-translate-file ./ascii.tcx -efmt=latex.fmt -output-format=dvi"
checkengines   = {"etex"}
checkruns      = 2
checksuppfiles = 
  {"ascii.tcx", "color.cfg", "graphics.cfg", "test209.tex", "test2e.tex"}
stdengine      = "etex"
typesetsuppfiles = {"ltxdoc.cfg", "ltxguide.cfg"}

-- Only rename README.txt but upload all .txt files
readmefiles  = {"README.txt"}
textfiles    = {"*.txt"}

-- Global searching is disabled when unpacking and checking
checksearch  = false
unpacksearch = false