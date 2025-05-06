#!/usr/bin/env texlua

-- Build script for LaTeX2e "latex-lab" files

-- Identify the bundle and module
bundle = ""
module = "latex-lab"

ctanpkg = "latex-lab"

maindir = "../.."

-- Minor modifications to file types
installfiles = {
                 "*.ltx",
                 "*.sty",
		 "glyphtounicode-cmex.tex",
         "tagpdf-ns-latex-lab.def"  
		}
typesetfiles = {
                 "latex-lab-*.dtx",
                 "*-doc.tex",
		 "*-code.tex",
	       }



unpackfiles  = {"*.ins"}

sourcefiles  = {
                 "*.dtx", "*.ins",
                 "*-????-??-??.sty",
  		 "glyphtounicode-cmex.tex",
		}
textfiles = {"README.md", "changes.txt"}
-- not testing xetex in the lab, we may want to switch to pdftex instead of etex though

checkengines = { "pdftex", "luatex" }

checkdeps =
  {
    maindir .. "/base",
    maindir .. "/required/firstaid",
    maindir .. "/required/amsmath",
    maindir .. "/required/graphics",
    maindir .. "/required/tools"
  }


checkruns     = 4
typesetruns   = 2

typesetdeps =
  {
    maindir .. "/base",
    maindir .. "/required/amsmath",
    maindir .. "/required/graphics",
    maindir .. "/required/tools"
  }

-- we want to test against external packages

checksearch  = true

-- Allow for TU and other test configurations

checkconfigs = 
 {"build","config-TU","config-OR",
  "config-math","config-math-luatex",
  "config-OR-luatex",
  "config-sec",
  "config-toc",
  "config-block",
  "config-graphic",
  "config-minipage",
  "config-float",
  "config-footnote",
  "config-bib",
  "config-LM-tagging",
  "config-table-pdftex",
  "config-table-luatex",
  "config-title",
  "config-firstaid"
 }



-- Upload meta data

uploadconfig = {
 pkg = module,
-- version = "v1.0a 2020-01-01",
 author = "LaTeX Project team",
 license = "lppl1.3c",
-- summary = "",
 ctanPath = "/macros/latex/" .. module,
 repository = "https://github.com/latex3/latex2e",
 bugtracker = "https://github.com/latex3/latex2e/issues",
 uploader = "LaTeX Project team",
 email = "latex-team@latex-project.org",
 update = true ,
}


-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

update_tag = update_tag_ltx

table.insert(checksuppfiles,"supp-pdf.mkii")


-- adapt some function to allow typesetting with luatex

-- we need a copy of the local fmt function

local function fmt(engines,dest)

  local fmtsearch = false

  local function mkfmt(engine)
    -- Use .ini files if available
    local ini = string.gsub(engine,"tex","") .. "latex"
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


-- now build both the pdflatex and lualatex format

function docinit_hook() return fmt({"pdftex","luatex"},typesetdir) end

-- To be able to choose the format we make use of the specialtypesetting table

specialtypesetting = specialtypesetting or {}
specialtypesetting["latex-lab-tikz.dtx"] = {format = "lualatex"}

function tex(file,dir,mode)
  dir = dir or "."
  mode = mode or "nonstopmode"
  local format = 'pdftex -fmt=pdflatex'
  if specialtypesetting and specialtypesetting[file] then
    format = specialtypesetting[file].format or format
  end
  return runcmd(
    format .. ' -interaction=' .. mode .. ' -jobname="' ..
      string.match(file,"^[^.]*") .. '" "\\input ' .. file .. '"',
    dir,{"TEXINPUTS","TEXFORMATS","LUAINPUTS"})
end
