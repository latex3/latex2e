-- Common settings for LaTeX2e development repo

-- The LaTeX2e kernel is needed by everything except 'base'
-- There is an over-ride for that case
checkdeps   = checkdeps   or {maindir .. "/base"}
typesetdeps = typesetdeps or {maindir .. "/base"}
unpackdeps  = unpackdeps  or {maindir .. "/base"}

-- Set up the check system to work in 'stand-alone' mode
-- This relies on a format being built by the 'base' dependency
asciiengines   = asciiengines       or {"etex"}
checkformat    = checkformat        or "latex"
checkengines   = checkengines       or {"etex", "xetex", "luatex"}
checkruns      = checkruns          or  2
checksuppfiles = checksuppfiles     or
  {"color.cfg", "graphics.cfg", "test209.tex", "test2e.tex", "xetex.def", "dvips.def", "lipsum.sty"}
stdengine      = stdengine          or "etex"
tagfiles       = tagfiles or {"README.md"}
typesetsuppfiles = typesetsuppfiles or {"ltxdoc.cfg", "ltxguide.cfg"}

-- Ensure the local format file is used
typesetexe = 'pdftex -interaction=nonstopmode "&pdflatex"'
typesetopts = ""

-- Force finding the format file
function tex(file,dir)
  local dir = dir or "."
  return runcmd(typesetexe .. " " .. typesetopts .. " \"" .. typesetcmds
    .. "\\input " .. file .. "\"",
    dir,{"TEXINPUTS","TEXFORMATS"})
end

-- Build TDS-style zips
packtdszip = true

-- Global searching is disabled when unpacking and checking
if checksearch == nil then
  checksearch  = false
end
if unpacksearch == nil then
  unpacksearch  = false
end

-- Allow for 'dev' release
-- See stackoverflow.com/a/12142066/212001
local errorlevel = os.execute("git rev-parse --abbrev-ref HEAD > branch.tmp")
local master_branch = true
if errorlevel ~= 0 then
  exit(1)
else
  local f = assert(io.open("branch.tmp", "rb"))
  local branch = f:read("*all")
  f:close()
  os.remove("branch.tmp")
  if not string.match(branch, "%s*master%s*") then
    master_branch = false
    tdsroot = tdsroot or "latex-dev"
    ctanpkg = ctanpkg or ""
    ctanpkg = ctanpkg .. "-dev"
    ctanzip = ctanpkg
  end
end

-- Detail how to set the version automatically
update_tag = update_tag or function (file,content,tagname,tagdate)
  local iso = "%d%d%d%d%-%d%d%-%d%d"
  local tag, rev = string.match(tagname,"^(.*):([^:]*)$")
  if master_branch then
    if rev then
      tag = tag .. " patch level " .. rev
    end
  else
    tag = tag .. " pre-release "
    if rev then
      tag = tag .. rev
    end
  end
  return string.gsub(content,
    "\nRelease " .. iso .. "[^\n]*\n",
    "\nRelease " .. tag .. "\n")
end