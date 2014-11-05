#!/usr/bin/env texlua

-- Build script for LaTeX2e "base" files

-- Identify the bundle and module
module = "base"
bundle = ""

-- Location of main directory: use Unix-style path separators
maindir = ".."

-- Set up the file types needed here
installfiles = { }
typesetfiles = {"*.dtx", "*.tex"}

-- No dependencies at all (other than l3build of course)
checkdeps  = { }
unpackdeps = { }

-- Simplified help
function help ()
  print ""
  print " build clean - clean out directory tree  "
  print " build ctan  - create CTAN-ready archive "
  print " build doc - runs all documentation files"
  print ""
end

-- doc does all of the targets itself
function main (target, file, engine)
  local errorlevel
  if target == "doc" then
    doc ()
  elseif target == "clean" then
    clean ()
  elseif target == "ctan" then
    ctan (true)
  elseif target == "version" then
    version ()
  else
    help ()
  end
end

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))
