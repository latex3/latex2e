#!/usr/bin/env texlua

-- Build script for LaTeX2e "doc" files

-- Identify the bundle and module
module = "base"
bundle = ""

-- CTAN's name for this is a bit different from ours
ctanpkg = "latex-doc"

-- Location of main directory: use Unix-style path separators
maindir = ".."

-- Set up the file types needed here
installfiles = { }
sourcefiles  = {"ltnews??.tex"}
tagfiles = {"README-doc.md"}
typesetfiles =
  {
    "cfgguide.tex",
    "clsguide.tex",
    "cyrguide.tex",
    "encguide.tex",
    "fntguide.tex",
    "ltnews.tex",
    "ltx3info.tex",
    "modguide.tex",
    "usrguide.tex",
    "latexchanges.tex"
  }

-- No dependencies at all (other than l3build of course)
checkdeps  = { }
unpackdeps = { }

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end

