-- 
--  This is file `l3backend-testphase.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  l3backend-testphase.dtx  (with options: `lua')
--  
--  Copyright (C) 2019-2021 The LaTeX Project
--  
--  It may be distributed and/or modified under the conditions of
--  the LaTeX Project Public License (LPPL), either version 1.3c of
--  this license or (at your option) any later version.  The latest
--  version of this license is in the file:
--  
--     https://www.latex-project.org/lppl.txt
--  
--  This file is part of the "LaTeX PDF management testphase bundle" (The Work in LPPL)
--  and all files in that bundle must be distributed together.
--  
--  File: l3backend-testphase.dtx




ltx= ltx or {}
ltx.__pdf      = ltx.__pdf or {}
ltx.__pdf.Page = ltx.__pdf.Page or {}
ltx.__pdf.Page.dflt = ltx.__pdf.Page.dflt or {}
ltx.__pdf.Page.Resources = ltx.__pdf.Resources or {}
ltx.__pdf.Page.Resources.Properties = ltx.__pdf.Page.Resources.Properties or {}
ltx.__pdf.Page.Resources.List={"ExtGState","ColorSpace","Pattern","Shading"}
ltx.__pdf.object = ltx.__pdf.object or {}

ltx.pdf= ltx.pdf or {} -- for "public" functions

local __pdf = ltx.__pdf
local pdf = pdf

local function __pdf_backend_Page_gput (name,value)
 __pdf.Page.dflt[name]=value
end

local function __pdf_backend_Page_gremove (name)
 __pdf.Page.dflt[name]=nil
end

local function __pdf_backend_Page_gclear ()
 __pdf.Page.dflt={}
end

local function __pdf_backend_ThisPage_gput (page,name,value)
 __pdf.Page[page] = __pdf.Page[page] or {}
 __pdf.Page[page][name]=value
end

local function __pdf_backend_ThisPage_gpush (page)
 local token=""
 local t = {}
 local tkeys= {}
 for name,value in pairs(__pdf.Page.dflt) do
   t[name]=value
 end
 if __pdf.Page[page] then
  for name,value in pairs(__pdf.Page[page]) do
   t[name] = value
  end
 end
 -- sort the table to get reliable test files.
 for name,value in pairs(t) do
  table.insert(tkeys,name)
 end
 table.sort(tkeys)
 for _,name in ipairs(tkeys) do
   token = token .. "/"..name.." "..t[name]
 end
 return token
end

function ltx.__pdf.backend_ThisPage_gput (page,name,value) -- tex.count["g_shipout_readonly_int"]
 __pdf_backend_ThisPage_gput (page,name,value)
end

function ltx.__pdf.backend_ThisPage_gpush (page)
  pdf.setpageattributes(__pdf_backend_ThisPage_gpush (page))
end

function ltx.__pdf.backend_Page_gput (name,value)
  __pdf_backend_Page_gput (name,value)
end

function ltx.__pdf.backend_Page_gremove (name)
  __pdf_backend_Page_gremove (name)
end

function ltx.__pdf.backend_Page_gclear ()
  __pdf_backend_Page_gclear ()
end

local Properties  = ltx.__pdf.Page.Resources.Properties
local ResourceList= ltx.__pdf.Page.Resources.List
local function __pdf_backend_PageResources_gpush (page)
 local token=""
 if Properties[page] then
-- we sort the table, so that the pdf test works
  local t = {}
  for name,value in pairs  (Properties[page]) do
   table.insert (t,name)
  end
  table.sort (t)
  for _,name in ipairs(t) do
   token = token .. "/"..name.." ".. Properties[page][name]
  end
  token = "/Properties <<"..token..">>"
 end
  for i,name in ipairs(ResourceList) do
   if ltx.__pdf.Page.Resources[name] then
   token = token .. "/"..name.." "..ltx.pdf.object_ref("__pdf/Page/Resources/"..name)
   end
  end
 return token
end

-- the function is public, as I probably need it in tagpdf too ...
function ltx.pdf.Page_Resources_Properties_gput (page,name,value) -- tex.count["g_shipout_readonly_int"]
 Properties[page] = Properties[page] or {}
 Properties[page][name]=value
 pdf.setpageresources(__pdf_backend_PageResources_gpush (page))
end

function ltx.pdf.Page_Resources_gpush(page)
 pdf.setpageresources(__pdf_backend_PageResources_gpush (page))
end

function ltx.pdf.object_ref (objname)
 if ltx.__pdf.object[objname] then
  local ref= ltx.__pdf.object[objname]
  return ref
 else
  return "false"
 end
end
-- 
--  End of File `l3backend-testphase.lua'.
