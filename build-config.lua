-- Common settings for LaTeX2e development repo

-- The LaTeX2e kernel is needed by everything except 'base'
-- There is an over-ride for that case
checkdeps   = checkdeps   or {maindir .. "/base"}
typesetdeps = typesetdeps or
  {
    maindir .. "/base",
    maindir .. "/required/graphics",
    maindir .. "/required/tools"
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
  {
    "color.cfg",
    "etex.sty",
    "graphics.cfg",
    "test209.tex",
    "test2e.tex",
    "xetex.def",
    "dvips.def",
    "lipsum.sty",
    "*.txt",
    "load-unicode-xetex-classes.tex",
    "lualibs*.lua", 
    "fontloader*.lua",
    "luaotfload*.lua",
    "luaotfloat.sty"
  }
stdengine      = stdengine          or "etex"
tagfiles       = tagfiles or {"*.dtx","*.ins","*.tex","README.md"}
typesetsuppfiles = typesetsuppfiles or
  {"color.cfg", "graphics.cfg", "ltxdoc.cfg", "ltxguide.cfg"}

-- Ensure the local format file is used
function tex(file,dir,mode)
  local dir = dir or "."
  local mode = mode or "nonstopmode"
  return runcmd(
    'pdftex -fmt=pdflatex -interaction=' .. mode .. ' -jobname="' ..
      string.match(file,"^[^.]*") .. '" "\\input ' .. file .. '"',
    dir,{"TEXINPUTS","TEXFORMATS","LUAINPUTS"})
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
--
-- See stackoverflow.com/a/12142066/212001
-- Also luaotfload build.lua: getting the Travis-CI version right is 'fun'
do
  local tag = os.getenv'TRAVIS_TAG'
  if tag and tag ~= "" then
    master_branch = not string.match(tag, '^dev-')
  else
    local branch = os.getenv'TRAVIS_BRANCH'
    if not branch then
      local f = io.popen'git rev-parse --abbrev-ref HEAD'
      branch = f:read'*a':sub(1,-2)
      assert(f:close())
    end
    master_branch = string.match(branch, '^master')
  end
  if not master_branch then
    tdsroot = "latex-dev"
    print("Creating/installing dev-version in " .. tdsroot)
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
    if not year ~= oldyear then
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
    else
      patch_level = "0"
    end
  else
    if rev and rev ~= 0 then
      tag = tag .. " pre-release " .. rev
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
    if rev then
      tag = tag .. " pre-release " .. rev
    end
  end
  return string.gsub(content,
    "\nRelease " .. iso .. "[^\n]*\n",
    "\nRelease " .. tag .. "\n")
end

-- Need to build format files
local function fmt(engines,dest)

  local fmtsearch = false

  local function mkfmt(engine)
    -- Use .ini files if available
    local src = "latex.ltx"
    local ini = string.gsub(engine,"tex","") .. "latex.ini"
    if fileexists(supportdir .. "/" .. ini) then
      src = ini
    end
    print("Building format for " .. engine)
    local errorlevel = os.execute(
      os_setenv .. " TEXINPUTS=" .. unpackdir .. os_pathsep .. localdir
      .. os_pathsep .. texmfdir .. "//" .. (fmtsearch and os_pathsep or "")
      .. os_concat ..
      os_setenv .. " LUAINPUTS=" .. unpackdir .. os_pathsep .. localdir
      .. os_pathsep .. texmfdir .. "//" .. (fmtsearch and os_pathsep or "")
      .. os_concat .. engine .. " -etex -ini -output-directory=" .. unpackdir
      .. " " .. src 
      .. (hide and (" > " .. os_null) or ""))
    if errorlevel ~= 0 then return errorlevel end

    local engname = string.match(src,"^[^.]*") .. ".fmt"
    local fmtname = string.gsub(engine,"tex$","") .. "latex.fmt"
    if engine == "etex" then fmtname = "latex.fmt" end
    if engname ~= fmtname then
      ren(unpackdir,engname,fmtname)
    end
    cp(fmtname,unpackdir,dest)

    return 0
  end

  if dest ~= typesetdir and
    (not options["config"] or options["config"][1] ~= "config-TU") then
    cp("fonttext.cfg",supportdir,unpackdir)
  end

  -- Zap the custom hyphen.cfg when typesetting
  if dest == typesetdir then
    rm(localdir,"hyphen.cfg")
    fmtsearch =  true
  end

  local errorlevel
  for _,engine in pairs(engines) do
    errorlevel = mkfmt(engine)
    if errorlevel ~= 0 then return errorlevel end
  end
  return 0
end

function checkinit_hook()
  return fmt(options["engine"] or checkengines,testdir)
end

function docinit_hook() return fmt({"pdftex"},typesetdir) end

-- Shorten second run
function typeset(file,dir)
  dir = dir or "."
  local errorlevel = tex(file,dir)
  if errorlevel ~= 0 then
    return errorlevel
  end
  local name = jobname(file)
  errorlevel = biber(name,dir) + bibtex(name,dir)
  if errorlevel ~= 0 then
    return errorlevel
  end
  for i = 2,typesetruns - 1 do
    errorlevel =
      makeindex(name,dir,".glo",".gls",".glg",glossarystyle) +
      makeindex(name,dir,".idx",".ind",".ilg",indexstyle)    +
      tex(file,dir,"batchmode")
    if errorlevel ~= 0 then return errorlevel end
  end
  return tex(file,dir)
end
