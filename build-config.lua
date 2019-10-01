-- Common settings for LaTeX2e development repo

-- The LaTeX2e kernel is needed by everything except 'base'
-- There is an over-ride for that case
checkdeps   = checkdeps   or {maindir .. "/base"}
typesetdeps = typesetdeps or
  {
    maindir .. "/base",
    maindir .. "/required/graphics",
    maindir .. "/required/tool"
  }
unpackdeps  = unpackdeps  or {maindir .. "/base"}

-- We really need 3 on most files (toc + references)
typesetruns  = 3

-- Set up the check system to work in 'stand-alone' mode
-- This relies on a format being built by the 'base' dependency
asciiengines   = asciiengines       or {"etex"}
checkformat    = checkformat        or "latex"
checkengines   = checkengines       or {"etex", "xetex", "luatex"}
checkruns      = checkruns          or  2
checksuppfiles = checksuppfiles     or
  {"color.cfg", "graphics.cfg", "test209.tex", "test2e.tex", "xetex.def", "dvips.def", "lipsum.sty", "*.txt", "lualibs*.lua", "fontloader*.lua", "luaotfload*.lua", "luaotfloat.sty"}
stdengine      = stdengine          or "etex"
tagfiles       = tagfiles or {"*.dtx","*.ins","*.tex","README.md"}
typesetsuppfiles = typesetsuppfiles or
  {"color.cfg", "graphics.cfg", "ltxdoc.cfg", "ltxguide.cfg"}

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
--  Used by base, cyrillic, tools
function update_tag(file,content,tagname,tagdate)
  local year = os.date("%Y")
  if string.match(content,"%% Copyright %(C%) %d%d%d%d%-%d%d%d%d\n") then
    content = string.gsub(content,
      "Copyright %(C%) (%d%d%d%d)%-%d%d%d%d\n",
      "Copyright (C) %1-" .. year .. "\n")
  elseif string.match(content,"%% Copyright %(C%) %d%d%d%d\n") then
    local oldyear = string.match(content,"%% Copyright %(C%) (%d%d%d%d)\n")
    if not year == oldyear then
      content = string.gsub(content,
        "Copyright %(C%) %d%d%d%d\n",
        "Copyright (C) " .. oldyear .. "-" .. year .. "\n")
    end
  end
  if not string.match(file,"%.md$") and not string.match(file,"ltvers.dtx") then
    -- Stop here for files other than .md
    return content
  end
  local iso = "%d%d%d%d%-%d%d%-%d%d"
  local tag, rev = string.match(tagname,"^(.*):([^:]*)$")
  if not tag then
    tag = tagname
  end
  local patch_level = ""
  if master_branch then
    if rev then
      tag = tag .. " patch level " .. rev
      patch_level = rev
    end
  else
    tag = tag .. " pre-release "
    if rev then
      tag = tag .. rev
      patch_level = "-" .. rev
    else
      patch_level = "0"
    end
  end
  if file == "README.md" then
    return string.gsub(content,
      "\nRelease " .. iso .. "[^\n]*\n",
      "\nRelease " .. tag .. "\n")
  elseif file == "ltvers.dtx" then
    return string.gsub(content,
      "\\patch@level{%-?%d}",
      "\\patch@level{" .. patch_level .. "}")
  end
  return content
end

-- Form used by amsmath, graphics (and similar to LaTeX3)
function update_tag_ltx(file,content,tagname,tagdate)
  local year = os.date("%Y")
  if string.match(content,
    "Copyright %(C%) %d%d%d%d%-%d%d%d%d [^\n]*LaTeX3? Project") then
    content = string.gsub(content,
      "Copyright %(C%) (%d%d%d%d)%-%d%d%d%d ([^\n]*LaTeX3? Project)",
      "Copyright (C) %1-" .. year .. " %2")
  elseif string.match(content,"Copyright %(C%) %d%d%d%d LaTeX") then
    local oldyear = string.match(content,"Copyright %(C%) (%d%d%d%d) LaTeX")
    if year ~= oldyear then
      content = string.gsub(content,
        "Copyright %(C%) %d%d%d%d LaTeX",
        "Copyright (C) " .. oldyear .. "-" .. year .. " LaTeX")
    end
  end
  if not string.match(file,"%.md$") then
    -- Stop here for files other than .md
    return content
  end
  local iso = "%d%d%d%d%-%d%d%-%d%d"
  local tag, rev = string.match(tagname,"^(.*):([^:]*)$")
  if not tag then
    tag = tagname
  end
  if master_branch then
    if rev then
      tag = tag .. " patch level " .. rev
    end
  else
    tag = tag .. " pre-release "
    if rev then
      tag = tag .. rev
    else
      patch_level = "0"
    end
  end
  return string.gsub(content,
    "\nRelease " .. iso .. "[^\n]*\n",
    "\nRelease " .. tag .. "\n")
end
