#!/usr/bin/env texlua

-- Build script for LaTeX2e "latex-lab" files

-- Identify the bundle and module
bundle = ""
module = "latex-lab"

ctanpkg = "latex-lab"

maindir = "../.."

-- Minor modifications to file types
installfiles = {"*.ltx", "*.sty"}
typesetfiles = {
                 "latex-lab-testphase.dtx",
                 "latex-lab-new-or.dtx",
                 "latex-lab-footnotes.dtx",
                 "*-doc.tex",
		 "*-code.tex",
	       }

unpackfiles  = {"*.ins"}

sourcefiles  = {"*.dtx", "*.ins", "*-????-??-??.sty"}

-- not testing xetex in the lab, we may want to switch to pdftex instead of etex though

checkengines = { "etex", "luatex" }


checkdeps =
  {
    maindir .. "/base"
  }

checkruns     = 2
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
checkconfigs = {"build","config-TU","config-OR"}



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
 note = [[Uploaded automatically by l3build...]],
}


-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")
