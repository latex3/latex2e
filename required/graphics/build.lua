#!/usr/bin/env texlua

-- Build script for LaTeX2e "graphics" files

-- Identify the bundle and module
bundle = ""
module = "graphics"

-- CTAN's name for this is a bit different from ours
ctanpkg = "latex-graphics"

-- Location of main directory: use Unix-style path separators
maindir = "../.."

-- Minor modifications to file types
installfiles = {"*.def", "*.sty", "mathcolor.ltx"}
typesetfiles = {"*.dtx", "*.tex"}
docfiles     = {"cat.eps"}

checkengines = {"etex","xetex"}

checkdeps =
  {
    maindir .. "/base",
    maindir .. "/required/tools"
  }

typesetdeps =
  {
    maindir .. "/base",
    maindir .. "/required/amsmath",
    maindir .. "/required/tools"
  }

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

update_tag = update_tag_ltx
