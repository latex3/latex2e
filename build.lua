#!/usr/bin/env texlua

-- Build script for LaTeX2e files

--  No bundle or module here, but these have to be defined
bundle  = "LaTeX2e"
module  = ""

-- A couple of custom variables: the order here is set up for 'importance'
bundles  = {"base", "doc"}
required = {"cyrillic", "graphics", "tools"}

-- Location of main directory: use Unix-style path separators
maindir = "."

-- Help for the master script is simple
function help ()
  print ""
  print " build check   - run automated check system       "
  print " build ctan    - create CTAN-ready archive        "
  print " build doc     - runs all documentation files     "
  print " build clean   - clean out directory tree         "
  print " build install - install files in local texmf tree"
  print ""
end

-- A custom main function
-- While almost all of this is customise, the need to be able to cp and
-- rm files means that loading l3build.lua is very useful
function main (target)
  local function dobundles (target)
    local errorlevel = 0
    for _,i in ipairs (bundles) do
      errorlevel = run (i, "texlua " .. scriptname .. " " .. target)
      if errorlevel ~= 0 then
        break
      end
    end
    for _,i in ipairs (required) do
      errorlevel = run ("required/" .. i, "texlua " .. scriptname .. " " .. target)
      if errorlevel ~= 0 then
        break
      end
    end
    return (errorlevel)
  end
  if target == "check" then
    dobundles ("check")
  elseif target == "clean" then
    print ("Cleaning up")
    dobundles ("clean")
    rm (".", "*.zip")
  elseif target == "ctan" then
    local errorlevel = dobundles ("ctan")
    if errorlevel == 0 then
      for _,i in ipairs (bundles) do
        cp ("*.zip", i, ".")
      end
      -- Handle the fact that the doc subtree is actually part of base in a way
      ren (".", "base.zip", "doc.zip")
      cp ("base.zip", "base/", ".")
      for _,i in ipairs (required) do
        cp ("*.zip", "required/" .. i, ".")
      end
    end
  elseif target == "doc" then
    dobundles ("doc")
  elseif target == "install" then
    dobundles ("install")
  elseif target == "unpack" then
    dobundles ("unpack")
  elseif target == "version" then
      version ()
  else
    help ()
  end
end

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))