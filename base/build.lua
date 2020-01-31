#!/usr/bin/env texlua

-- Build script for LaTeX2e "base" files

-- Identify the bundle and module
module = "base"
bundle = ""

-- CTAN's name for this is a bit different from ours
ctanpkg = "latex-base"

-- Location of main directory: use Unix-style path separators
maindir = ".."

docfiledir = "./doc"

-- Set up the file types needed here
installfiles   =
  {
    "*.cfg",
    "*.clo",
    "*.cls",
    "*.def",
    "*.dfu",
    "*.fd",
    "*.ltx",
    "*.lua",
    "*.sty",
    "docstrip.tex",
    "idx.tex",
    "lablst.tex",
    "lppl.tex",
    "ltluatex.tex",
    "ltxcheck.tex",
    "nfssfont.tex",
    "sample2e.tex",
    "small2e.tex",
    "testpage.tex"
  }
sourcefiles    =
  {
    "ltnews.cls",
    "ltxguide.cls",
    "minimal.cls",
    "*.dtx",
    "*.fdd",
    "*.ins",
    "idx.tex",
    "lablst.tex",
    "ltxcheck.tex",
    "sample2e.tex",
    "small2e.tex",
    "testpage.tex",
     "*-????-??-??.sty"
  }
textfiles =
  {
    "README.md",
    "bugs.txt",
    "legal.txt",
    "manifest.txt",
    "changes.old.txt",
    "changes.txt",
    "lppl.txt",
    "lppl-1-0.txt",
    "lppl-1-1.txt",
    "lppl-1-2.txt",
    "tex2.txt",
    "texpert.txt"
  }
typesetfiles   =
  {
    "source2e.tex", -- Has to be first: source2e.ist creation!
    "alltt.dtx",
    "classes.dtx",
    "cmfonts.dtx",
    "doc.dtx",
    "docstrip.dtx",
    "exscale.dtx",
    "fix-cm.dtx",
    "graphpap.dtx",
    "ifthen.dtx",
    "inputenc.dtx",
    "ltunicode.dtx",
    "utf8ienc.dtx",
    "latexrelease.dtx",
    "latexsym.dtx",
    "letter.dtx",
    "ltluatex.dtx",
    "ltxdoc.dtx",
    "makeindx.dtx",
    "nfssfont.dtx",
    "proc.dtx",
    "slides.dtx",
    "slifonts.dtx",
    "syntonly.dtx",
    "*.fdd",
    "*.err",
    "lppl.tex",
    "cfgguide.tex",
    "clsguide.tex",
    "cyrguide.tex",
    "encguide.tex",
    "fntguide.tex",
    "ltnews.tex",
    "ltnews??.tex",
    "ltx3info.tex",
    "modguide.tex",
    "usrguide.tex",
    "latexchanges.tex"
  }
dynamicfiles = {"*.tst"}

-- A few special file for unpacking
unpackfiles     = {"unpack.ins"}
unpacksuppfiles =
  {
    "hyphen.cfg",
    "UShyphen.tex",
    "ot1lmr.fd",
    "t1lmr.fd",
    "t1lmss.fd",
    "t1lmtt.fd",
    "ts1lmr.fd",
    "pdflatex.ini",
    "pdftexconfig.tex"
  }

-- Custom settings for the check system
testsuppdir = "testfiles/helpers"

-- No dependencies at all (other than l3build and for typesetting)
checkdeps   = { }
typesetdeps =
  {
    maindir .. "/required/graphics",
    maindir .. "/required/tools"
  }
unpackdeps  = { }

-- Customise typesetting
indexstyle = "source2e.ist"

-- Allow for TU and other tests test
checkconfigs = {"build","config-TU","config-legacy"}

update_tag = update_tag_base

-- Custom bundleunpack which does not search the localdir
-- That is needed as texsys.cfg is unpacked in an odd way and
-- without this will otherwise not be available
function bundleunpack ()
  local errorlevel = mkdir(localdir)
  if errorlevel ~=0 then
    return errorlevel
  end
  errorlevel = cleandir(unpackdir)
  if errorlevel ~=0 then
    return errorlevel
  end
  for _,i in ipairs (sourcefiles) do
    errorlevel = cp (i, ".", unpackdir)
    if errorlevel ~=0 then
      return errorlevel
    end
  end
  for _,i in ipairs (unpacksuppfiles) do
    errorlevel = cp (i, supportdir, localdir)
    if errorlevel ~=0 then
      return errorlevel
    end
  end
  for _,i in ipairs (unpackfiles) do
    for _,j in ipairs (filelist (unpackdir, i)) do
      os.execute (os_yes .. ">>" .. localdir .. "/yes")
      errorlevel = os.execute (
          -- Notice that os.execute is used from 'here' as this ensures that
          -- localdir points to the correct place: running 'inside'
          -- unpackdir would avoid the need for setting -output-directory
          -- but at the cost of needing to correct the relative position
          -- of localdir w.r.t. unpackdir
          os_setenv .. " TEXINPUTS=" .. unpackdir .. os_concat ..
          unpackexe .. " " .. unpackopts .. " -output-directory=" .. unpackdir
            .. " " .. unpackdir .. "/" .. j .. " < " .. localdir .. "/yes"
        )
      if errorlevel ~=0 then
        return errorlevel
      end
    end
  end
  return 0
end

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

-- Suppress makeindex tree other than formal releases
if not master_branch then
  makeindexfiles = { }
end

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
