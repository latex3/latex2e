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

-- We really need 4 on most files (toc + references + index (which needs two runs))
typesetruns  = 4

-- Set up the check system to work in 'stand-alone' mode
-- This relies on a format being built by the 'base' dependency
asciiengines   = asciiengines       or {"etex", "pdftex"}
checkengines   = checkengines       or {"pdftex", "xetex", "luatex"}
checkruns      = checkruns          or  2
checksuppfiles = checksuppfiles     or
  {
    "color.cfg",
    "etex.sty",
    "graphics.cfg",
    "test209.tex",
    "test2e.tex",
    "regression-test.tex",
    "lipsum.ltd.tex",
    "lipsum.sty",
    "*.fd",
    "*.txt",
    "load-unicode-xetex-classes.tex",
    "lualibs*.lua", 
    "fontloader*.lua",
    "luaotfload*.lua",
    "fixup_mathaxis.lua",
  }
tagfiles       = tagfiles or {"*.dtx","*.ins","*.tex","README.md"}
typesetsuppfiles = typesetsuppfiles or
  {"color.cfg", "graphics.cfg", "ltxdoc.cfg", "ltxguide.cfg"}

-- Ensure the local format file is used
function tex(file,dir,mode)
  dir = dir or "."
  mode = mode or "nonstopmode"
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
-- See https://docs.github.com/en/actions/learn-github-actions/environment-variables
-- for the meaning of the environment variables, but tl;dr: GITHUB_REF_TYPE says
-- if we have a tag or a branch, GITHUB_REF_NAME has the corresponding name.
-- If either one of them isn't set, we look at the current git HEAD.
do
  local gh_type = os.getenv'GITHUB_REF_TYPE'
  local name = os.getenv'GITHUB_REF_NAME'
  if gh_type == 'tag' and name then
    main_branch = not string.match(name, '^dev-')
  else
    if gh_type ~= 'branch' or not name then
      local f = io.popen'git rev-parse --abbrev-ref HEAD'
      name = f:read'*a':sub(1,-2)
      assert(f:close())
    end
    main_branch = string.match(name, '^main')
  end
  if not main_branch then
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
  local patch_level = "0"
  if rev and tonumber(rev) ~= 0 then
    if main_branch then
      tag = tag .. " patch level " .. rev
      patch_level = rev
    else
      tag = tag .. " pre-release " .. rev
      patch_level = "-" .. rev
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
    "Copyright %(C%) %d%d%d%d%-%d%d%d%d [^\n]*LaTeX") then
    content = string.gsub(content,
      "Copyright %(C%) (%d%d%d%d)%-%d%d%d%d ([^\n]*LaTeX)",
      "Copyright (C) %1-" .. year .. " %2")
  elseif string.match(content,"Copyright %(C%) %d%d%d%d [^\n]*LaTeX") then
    local oldyear = string.match(content,"Copyright %(C%) (%d%d%d%d) ([^\n]*LaTeX)")
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
  if main_branch then
    if rev and tonumber(rev) ~= 0 then
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
function fmt(engines,dest)

  local fmtsearch = false

  local function mkfmt(engine)
    -- Use .ini files if available
    local ini = string.gsub(engine,"tex","") .. "latex"
    -- To support places we are using DVI mode, we have to allow for
    -- "etex" -> "elatex" -> "latex" in format building
    if ini == "elatex" then
        ini = "latex"
    end
    local cmd = engine
    if engine == "luatex" then cmd = "luahbtex" end
    print("Building format for " .. engine)
    local errorlevel = os.execute(
      os_setenv .. " TEXINPUTS=" .. unpackdir .. os_pathsep .. localdir
      .. os_pathsep .. texmfdir .. "//" .. (fmtsearch and os_pathsep or "")
      .. os_concat ..
      os_setenv .. " LUAINPUTS=" .. unpackdir .. os_pathsep .. localdir
      .. os_pathsep .. texmfdir .. "//" .. (fmtsearch and os_pathsep or "")
      .. os_concat .. cmd .. " -etex -ini -output-directory=" .. unpackdir
      .. " " .. ini .. ".ini"
      .. (hide and (" > " .. os_null) or ""))
    if errorlevel ~= 0 then return errorlevel end

    cp(ini .. ".fmt",unpackdir,dest)

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
  local engines = options.engine
  if not engines then
    local target = options.target
    if target == 'check' or target == 'bundlecheck' then
      engines = checkengines
    elseif target == 'save' then
      engines = {stdengine}
    else
      error'Unexpected target in call to checkinit_hook'
    end
  end
  return fmt(engines,testdir)
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
-- we have to run tex first then then index otherwise the index isn't run on the second last run!
    errorlevel =
      tex(file,dir,"batchmode") +
      makeindex(name,dir,".glo",".gls",".glg",glossarystyle) +
      makeindex(name,dir,".idx",".ind",".ilg",indexstyle)
    if errorlevel ~= 0 then return errorlevel end
  end
  return tex(file,dir)
end
