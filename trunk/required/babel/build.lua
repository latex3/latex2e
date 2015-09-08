#!/usr/bin/env texlua

-- Build script for LaTeX2e "babel" files

-- Identify the bundle and module
bundle = ""
module = "babel"

-- Location of main directory: use Unix-style path separators
maindir = "../.."

-- Minor modifications to file types
installfiles = {"*.def", "*.ldf", "*.sty", "*.tex"}
sourcefiles  = {"*.dtx", "*.ins"}
typesetfiles = {"babel.dtx"}

-- babel tests lots of third-party code
checkdeps    = { }
checksearch  = true
unpackdeps   = { }
unpacksearch = true

-- Avoid zapping babel.pdf
cleanfiles = {"*.log", "*.zip"}

-- Babel needs the translation file (to address in l3build)
checkopts = "-translate-file ./ascii.tcx"

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

-- Override formats to be used
checkengines = {"xetex","pdftex"}
checksearch  = true

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))