#!/usr/bin/env texlua

-- Build script for LaTeX2e "tools" files

-- Identify the bundle and module
bundle = ""
module = "tools"

-- Location of main directory: use Unix-style path separators
maindir = "../.."

-- Minor modifications to file types
installfiles = {"*.def", "*.sty"}
typesetfiles = {"*.dtx"}
unpackfiles  = {"tools.ins"}

checkdeps = {maindir .. "/base", maindir .. "/required/graphics"}

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))