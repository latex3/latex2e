#!/usr/bin/env texlua

-- Build script for LaTeX2e "base" files

-- Identify the bundle and module
module = "base"
bundle = ""

-- Location of main directory: use Unix-style path separators
maindir = ".."

-- Set up the file types needed here
installfiles   =
  {"*.cfg", "*.clo", "*.cls", "*.def", "*.dfu", "*.fd", "*.ltx", "*.sty", "*.tex"}
sourcefiles    = {"*.cls", "*.dtx", "*.fdd", "ltpatch.ltx", "ltunicode.ltx", "*.ins", "*.tex"}
typesetfiles   =
  {
    "source2e.tex",
    "alltt.dtx",
    "classes.dtx",
    "cmfonts.dtx",
    "doc.dtx",
    "docstrip.dtx",
    "exscale.dtx",
    "fixltx2e.dtx",
    "graphpap.dtx",
    "ifthen.dtx",
    "inputenc.dtx",
    "lppl.tex",
    "utf8ienc.dtx",
    "latexsym.dtx",
    "letter.dtx",
    "ltxdoc.dtx",
    "makeindx.dtx",
    "nfssfont.dtx",
    "proc.dtx",
    "slides.dtx",
    "slifonts.dtx",
    "syntonly.dtx",
    "*.fdd",
    "*.err",
  }

-- A few special file for unpacking
unpackfiles     = {"unpack.ins"}
unpacksuppfiles = {"hyphen.cfg", "texsys.cfg", "UShyphen.tex"}

-- Custom settings for the check system
testsuppdir = "testfiles/helpers"

-- No dependencies at all (other than l3build of course)
checkdeps  = { }
unpackdeps = { }

-- Customise typesetting
indexstyle = "source2e.ist"

function format ()
  unpack ()
  -- Much the same as the standard unpack approach: run from 'here' so
  -- the relationships are all correct
  os.execute (
      os_setenv .. " TEXINPUTS=" .. unpackdir .. os_pathsep .. localdir
      .. os_concat ..
      "etex -etex -ini " .. " -output-directory=" .. unpackdir ..
      " " .. unpackdir .. "/latex.ltx"
    )
  -- As format building is added in as an 'extra', the normal
  -- copy mechanism (checkfiles) will fail as things get cleaned up
  -- inside bundleunpack(): get around that using a manual copy
  cp ("latex.fmt", unpackdir, localdir)
end

-- base does all of the targets itself
function main (target, file, engine)
  local errorlevel
  if target == "check" then
    format ()
    errorlevel = check (file, engine)
  elseif target == "clean" then
    errorlevel = clean ()
  elseif target == "ctan" then
    format ()
    errorlevel = ctan (true)
  elseif target == "doc" then
    errorlevel = doc ()
  elseif target == "install" then
    install ()
  elseif target == "save" then
    if file then
      errorlevel = save (file, engine)
    else
      help ()
    end
  elseif target == "unpack" then
    -- A simple way to have the unpack target also build the format
    errorlevel = format ()
  elseif target == "version" then
    version ()
  else
    help ()
  end
  os.exit (errorlevel)
end

-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))
