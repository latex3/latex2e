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

-- Allow for TU test and tests that need amsthm, for example
checkconfigs = {"build","config-TU","config-search"}

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

tag_format = "LaTeX3"
