-- Common settings for LaTeX2e development repo

-- The LaTeX2e kernel is needed by everything except 'base'
-- There is an over-ride for that case
checkdeps  = checkdeps  or {maindir .. "/base"}
unpackdeps = unpackdeps or {maindir .. "/base"}

-- Set up the check system to work in 'stand-alone' mode
-- This relies on a format being built by the 'base' dependency
asciiengines   = {"etex", "pdftex"}
checkformat    = "latex"
checkengines   = {"xetex","etex"}
checkruns      = 2
checksuppfiles = 
  {"color.cfg", "graphics.cfg", "test209.tex", "test2e.tex", "xetex.def"}
stdengine      = "etex"
typesetsuppfiles = {"ltxdoc.cfg", "ltxguide.cfg"}

-- Build TDS-style zips
packtdszip = true

-- Global searching is disabled when unpacking and checking
if checksearch == nil then
  checksearch  = false
end
if unpacksearch == nil then
  unpacksearch  = false
end


