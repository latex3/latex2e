#!/usr/bin/env texlua

-- Build script for LaTeX2e "latex-lab" files

-- Identify the bundle and module
bundle = ""
module = "latex-lab"

ctanpkg = "latex-lab"

maindir = "../.."

-- Minor modifications to file types
installfiles = {
                 "*.ltx",
                 "*.sty",
		 "glyphtounicode-cmex.tex",
         "tagpdf-ns-latex-lab.def"  
		}
typesetfiles = {
                 "latex-lab-*.dtx",
                 "*-doc.tex",
		 "*-code.tex",
	       }

unpackfiles  = {"*.ins"}

sourcefiles  = {
                 "*.dtx", "*.ins",
                 "*-????-??-??.sty",
  		 "glyphtounicode-cmex.tex",
		}
textfiles = {"README.md", "changes.txt"}
-- not testing xetex in the lab, we may want to switch to pdftex instead of etex though

checkengines = { "pdftex", "luatex" }

checkdeps =
  {
    maindir .. "/base",
    maindir .. "/required/firstaid",
    maindir .. "/required/amsmath",
    maindir .. "/required/graphics",
    maindir .. "/required/tools"
  }


checkruns     = 4
typesetruns   = 2

typesetdeps =
  {
    maindir .. "/base",
    maindir .. "/required/amsmath",
    maindir .. "/required/graphics",
    maindir .. "/required/tools"
  }

-- we want to test against external packages

checksearch  = true

-- Allow for TU and other test configurations

checkconfigs = 
 {"build","config-TU","config-OR",
  "config-math","config-math-luatex",
  "config-OR-luatex",
  "config-sec",
  "config-toc",
  "config-block",
  "config-graphic",
  "config-minipage",
  "config-float",
  "config-bib",
  "config-LM-tagging",
  "config-table-pdftex",
  "config-table-luatex",
  "config-title",
  "config-firstaid"
 }



-- Upload meta data

uploadconfig = {
 pkg = module,
-- version = "v1.0a 2020-01-01",
 author = "LaTeX Project team",
 license = "lppl1.3c",
-- summary = "",
 ctanPath = "/macros/latex/" .. module,
 repository = "https://github.com/latex3/latex2e",
 bugtracker = "https://github.com/latex3/latex2e/issues",
 uploader = "LaTeX Project team",
 email = "latex-team@latex-project.org",
 update = true ,
}


-- Load the common settings for the LaTeX2e repo
dofile (maindir .. "/build-config.lua")
table.insert(checksuppfiles,"supp-pdf.mkii")
