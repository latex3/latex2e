#!/usr/bin/env texlua

-- Build script for LaTeX2e "babel" files

dofile("settings.build.lua")

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))