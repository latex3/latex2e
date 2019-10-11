#!/usr/bin/env texlua

-- Build script for LaTeX2e "amsmath" files

-- Identify the bundle and module
bundle = ""
module = "amsmath"

-- CTAN's name for this is a bit different from ours
ctanpkg = "latex-amsmath"

-- Location of main directory: use Unix-style path separators
maindir = "../.."

-- Minor modifications to file types
sourcefiles  = {"*.dtx", "*.ins", "amstex.sty","amsmath-2018-12-01.sty"}
typesetfiles = {"*.dtx", "*.tex"}

-- Allow for TU test
checkconfigs = {"build","config-TU"}

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

update_tag = update_tag_ltx

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end

