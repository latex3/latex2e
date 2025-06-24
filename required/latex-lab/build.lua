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
typesetfiles_list = {
  {
    "blocks-code.tex",
    "blocks-doc.tex",
    "documentmetadata-support-code.tex",
    "documentmetadata-support-doc.tex",
    "latex-lab-amsmath.dtx",
    "latex-lab-namespace.dtx",
    "latex-lab-sec.dtx",
  },
  {
    "latex-lab-graphic.dtx",
    "latex-lab-l3doc-tagging.dtx",
    "latex-lab-marginpar.dtx",
    "latex-lab-math.dtx",
    "latex-lab-mathintent.dtx",
    "latex-lab-mathpkg.dtx",
    "latex-lab-mathtools.dtx",
    "latex-lab-minipage.dtx",
    "latex-lab-new-or-1.dtx",
    "latex-lab-new-or-2.dtx",
    "latex-lab-float.dtx",
    "latex-lab-firstaid.dtx",
  },
  {
    "latex-lab-table.dtx",
    "latex-lab-testphase.dtx",
    "latex-lab-text.dtx",
    "latex-lab-tikz.dtx",
    "latex-lab-title.dtx",
    "latex-lab-toc.dtx",
    "latex-lab-toc-hyperref-changes.dtx",
    "latex-lab-toc-kernel-changes.dtx",
    "latex-lab-unicode-math.dtx",
    "latex-lab-footnotes.dtx",
    "latex-lab-bib.dtx",
  }
}
local doc_component_setting = os.getenv'LTX_DOC_COMPONENT'
if doc_component_setting then
  typesetfiles = typesetfiles_list[math.tointeger(doc_component_setting)]
else
  typesetfiles = {}
  for _, files in ipairs(typesetfiles_list) do
    table.move(files, 1, #files, #typesetfiles + 1, typesetfiles)
  end
end



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
typesetruns   = 3

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
 {"build","config-OR",
  "config-math","config-math-luatex",
  "config-OR-luatex",
  "config-sec",
  "config-toc",
  "config-block",
  "config-graphic",
  "config-minipage",
  "config-float",
  "config-footnote",
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

tag_format = "LaTeX3"

table.insert(checksuppfiles,"supp-pdf.mkii")

-- now build both the pdflatex and lualatex format

function docinit_hook() return fmt({"pdftex","luatex"},typesetdir) end

-- To be able to choose the format we make use of the specialtypesetting table

specialtypesetting = specialtypesetting or {}
specialtypesetting["latex-lab-bib.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-amsmath.dtx"] = {format = "lualatex"}
-- the block really needs lualatex! with pdflatex there is a memory exceeded error
-- when writing the tag tree.
specialtypesetting["latex-lab-block.dtx"] = {format = "lualatex"}
specialtypesetting["blocks-code.tex"] = {format = "lualatex"}
specialtypesetting["blocks-doc.tex"] = {format = "lualatex"}
specialtypesetting["latex-lab-firstaid.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-float.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-footnotes.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-graphic.dtx"] = {format = "lualatex"}
-- specialtypesetting["latex-lab-l3doc-tagging.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-marginpar.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-math.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-mathintent.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-mathpkg.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-mathtools.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-minipage.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-namespace.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-new-or-1.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-new-or-2.dtx"] = {format = "lualatex"} -- error
specialtypesetting["latex-lab-sec.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-table.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-testphase.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-text.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-tikz.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-toc.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-toc-hyperref-changes.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-toc-kernel-changes.dtx"] = {format = "lualatex"}
specialtypesetting["latex-lab-unicode-math.dtx"] = {format = "lualatex"}
-- specialtypesetting["documentmetadata-support.dtx"] = {format = "lualatex"}
specialtypesetting["documentmetadata-support-doc.tex"] = {format = "lualatex"}
specialtypesetting["documentmetadata-support-code.tex"] = {format = "lualatex"}


function tex(file,dir,mode)
  dir = dir or "."
  mode = mode or "nonstopmode"
  local format = 'pdftex -fmt=pdflatex'
  if specialtypesetting and specialtypesetting[file] then
    format = specialtypesetting[file].format or format
  end
  return runcmd(
    format .. ' -interaction=' .. mode .. ' -jobname="' ..
      string.match(file,"^[^.]*") .. '" "\\input ' .. file .. '"',
    dir,{"TEXINPUTS","TEXFORMATS","LUAINPUTS"})
end
