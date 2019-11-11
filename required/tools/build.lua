#!/usr/bin/env texlua

-- Build script for LaTeX2e "tools" files

-- Identify the bundle and module
bundle = ""
module = "tools"

-- CTAN's name for this is a bit different from ours
ctanpkg = "latex-tools"

-- Location of main directory: use Unix-style path separators
maindir = "../.."

-- Minor modifications to file types
installfiles = {"*.def", "*.sty", "*.tex"}
typesetfiles = {"*.dtx", "tools-overview.tex"}
unpackfiles  = {"tools.ins"}

sourcefiles  = {"*.dtx", "*.ins", "*-????-??-??.sty"}

checkdeps =
  {
    maindir .. "/base",
    maindir .. "/required/graphics"
  }

-- Allow for TU and other tests test
checkconfigs = {"build","config-TU","config-legacy","config-search"}

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
