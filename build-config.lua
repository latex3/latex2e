-- Common settings for LaTeX2e development repo

-- The LaTeX2e kernel is needed by everything except 'base'
-- There is an over-ride for that case
checkdeps  = checkdeps  or {maindir .. "/base"}
unpackdeps = unpackdeps or {maindir .. "/base"}

-- Set up the check system to work in 'stand-alone' mode
-- This relies on a format being built by the 'base' dependency
asciiengines   = asciiengines       or {"etex"}
checkformat    = checkformat        or "latex"
checkengines   = checkengines       or {"etex", "xetex", "luatex"}
checkruns      = checkruns          or  2
checksuppfiles = checksuppfiles     or
  {"color.cfg", "graphics.cfg", "test209.tex", "test2e.tex", "xetex.def", "dvips.def", "lipsum.sty"}
stdengine      = stdengine          or "etex"
typesetsuppfiles = typesetsuppfiles or {"ltxdoc.cfg", "ltxguide.cfg"}

-- Build TDS-style zips
packtdszip = true

-- Global searching is disabled when unpacking and checking
if checksearch == nil then
  checksearch  = false
end
if unpacksearch == nil then
  unpacksearch  = false
end

-- Allow for 'next' release
-- See stackoverflow.com/a/12142066/212001
local branch = os.execute("git rev-parse --abbrev-ref HEAD") or ""
if branch ~= "master" then
  tdsroot = tdsroot or "latex-next"
end
