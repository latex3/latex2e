#!/usr/bin/env texlua

-- Build script for LaTeX2e "firstaid" files

-- Identify the bundle and module
bundle = ""
module = "firstaid"

-- CTAN's name for this is a bit different from ours
ctanpkg = "latex-firstaid"

-- Location of main directory: use Unix-style path separators
maindir = "../.."

-- Minor modifications to file types
installfiles = {"*.ltx", "*.sty", "*.tex"}
typesetfiles = {"*.dtx"}
unpackfiles  = {"*.ins"}

sourcefiles  = {"*.dtx", "*.ins", "*-????-??-??.sty"}

checkdeps =
  {
    maindir .. "/base",
    maindir .. "/required/amsmath",
    maindir .. "/required/tools"
  }

checkruns     = 2
typesetruns   = 2


-- we want to test against external packages

checksearch  = true

-- Allow for TU and other test configurations
checkconfigs = {"build","config-TU"}



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
