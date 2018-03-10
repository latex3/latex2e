#!/usr/bin/env texlua

-- Build script for LaTeX2e "cyrillic" files

-- Identify the bundle and module
bundle = ""
module = "cyrillic"

-- CTAN's name for this is a bit different from ours
ctanpkg = "latex-cyrillic"

-- Location of main directory: use Unix-style path separators
maindir = "../.."

-- Minor modifications to file types
installfiles = {"*.def", "*.fd", "*.sty", "*.tex"}
sourcefiles  = {"*.dtx", "*.fdd", "*.ins"}
typesetfiles = {"*.dtx", "*.fdd"}

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end

