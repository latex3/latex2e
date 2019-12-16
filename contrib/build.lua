#!/usr/bin/env texlua

-- Build script for contrib packages

-- Identify the bundle and module
-- Just filler as this is purely a location for tests
module = "contrib"
bundle = ""

-- Location of main directory: use Unix-style path separators
maindir = ".."

-- Non-standard settings
checkdeps   =
  {
    maindir .. "/base",
    maindir .. "/required/amsmath",
    maindir .. "/required/graphics",
    maindir .. "/required/tools"
  }
checksearch = true

-- Load the common build code
dofile(maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end

