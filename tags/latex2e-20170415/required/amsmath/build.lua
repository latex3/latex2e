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
sourcefiles  = {"*.dtx", "*.ins", "amstex.sty"}
typesetfiles = {"*.dtx", "*.tex"}

-- Avoid isolation (cf. babel)
checkdeps    = { }
checksearch  = true
unpackdeps   = { }
unpacksearch = true

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))
