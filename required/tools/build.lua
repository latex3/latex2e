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
    maindir .. "/required/amsmath",
    maindir .. "/required/graphics"
  }

checkruns = 3  -- some tests need 3 runs to settle!

typesetdeps =
  {
    maindir .. "/required/amsmath"    -- for l3doc.cls :-(
  }

-- Allow for TU and other tests test
checkconfigs = {"build","config-TU","config-legacy","config-search"}

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")
