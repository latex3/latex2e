-- 
--  This is file `tagpdf.lua',
--  generated with the docstrip utility.
-- 
--  The original source files were:
-- 
--  tagpdf-backend.dtx  (with options: `lua')
--  
--  Copyright (C) 2019-2025 Ulrike Fischer
--  
--  It may be distributed and/or modified under the conditions of
--  the LaTeX Project Public License (LPPL), either version 1.3c of
--  this license or (at your option) any later version.  The latest
--  version of this license is in the file:
--  
--     https://www.latex-project.org/lppl.txt
--  
--  This file is part of the "tagpdf bundle" (The Work in LPPL)
--  and all files in that bundle must be distributed together.
--  
--  File: tagpdf-backend.dtx
-- tagpdf.lua
-- Ulrike Fischer

local ProvidesLuaModule = {
    name          = "tagpdf",
    version       = "0.99w",       --TAGVERSION
    date          = "2025-10-31", --TAGDATE
    description   = "tagpdf lua code",
    license       = "The LATEX Project Public License 1.3c"
}

if luatexbase and luatexbase.provides_module then
  luatexbase.provides_module (ProvidesLuaModule)
end

--[[
The code has quite probably a number of problems
 - more variables should be local instead of global
 - the naming is not always consistent due to the development of the code
 - the traversing of the shipout box must be tested with more complicated setups
 - it should probably handle more node types
 -
--]]

--[[
the main table is named ltx.__tag. It contains the functions and also the data
collected during the compilation.

ltx.__tag.mc     will contain mc connected data.
ltx.__tag.role   will contain data related to parent-child relations.
ltx.__tag.struct will contain structure related data.
ltx.__tag.page   will contain page data
ltx.__tag.tables contains also data from mc and struct (from older code). This needs cleaning up.
             There are certainly dublettes, but I don't dare yet ...
ltx.__tag.func   will contain (public) functions.
ltx.__tag.trace  will contain tracing/logging functions.
local functions starts with __
functions meant for users will be in ltx.tag

functions
 ltx.__tag.func.get_num_from (tag):    takes a tag (string) and returns the id number
 ltx.__tag.func.output_num_from (tag): takes a tag (string) and prints (to tex) the id number
 ltx.__tag.func.get_tag_from (num):    takes a num and returns the tag
 ltx.__tag.func.output_tag_from (num): takes a num and prints (to tex) the tag
 ltx.__tag.func.store_mc_data (num,key,data): stores key=data in ltx.__tag.mc[num]
 ltx.__tag.func.store_mc_label (label,num): stores label=num in ltx.__tag.mc.labels
 ltx.__tag.func.store_mc_kid (mcnum,kid,page): stores the mc-kids of mcnum on page page
 ltx.__tag.func.store_mc_in_page(mcnum,mcpagecnt,page): stores in the page table the number of mcnum on this page
 ltx.__tag.func.store_struct_mcabs (structnum,mcnum): stores relations structnum<->mcnum (abs)
 ltx.__tag.func.mc_insert_kids (mcnum): inserts the /K entries for mcnum by wandering through the [kids] table
 ltx.__tag.func.mark_page_elements(box,mcpagecnt,mccntprev,mcopen,name,mctypeprev) : the main function
 ltx.__tag.func.mark_shipout (): a wrapper around the core function which inserts the last EMC
 ltx.__tag.func.fill_parent_tree_line (page): outputs the entries of the parenttree for this page
 ltx.__tag.func.output_parenttree(): outputs the content of the parenttree
 ltx.__tag.func.pdf_object_ref(name,index): outputs the object reference for the object name
 ltx.__tag.func.markspaceon(), ltx.__tag.func.markspaceoff(): (de)activates the marking of positions for space chars
 ltx.__tag.trace.show_mc_data (num,loglevel): shows ltx.__tag.mc[num] is the current log level is >= loglevel
 ltx.__tag.trace.show_all_mc_data (max,loglevel): shows a maximum about mc's if the current log level is >= loglevel
 ltx.__tag.trace.show_seq: shows a sequence (array)
 ltx.__tag.trace.show_struct_data (num): shows data of structure num
 ltx.__tag.trace.show_prop: shows a prop
 ltx.__tag.trace.log
 ltx.__tag.trace.showspaces : boolean

 ltx.tag.get_structnum: number, shows the current structure number
 ltx.tag.get_structnum_next: number, shows the next structure number
--]]

local mctypeattributeid  = luatexbase.new_attribute ("g__tag_mc_type_attr")
local mccntattributeid   = luatexbase.new_attribute ("g__tag_mc_cnt_attr")
local structnumattributeid   = luatexbase.new_attribute ("g__tag_structnum_attr")
local iwspaceOffattributeid = luatexbase.new_attribute ("g__tag_interwordspaceOff_attr")
local iwspaceattributeid = luatexbase.new_attribute ("g__tag_interwordspace_attr")
local iwfontattributeid  = luatexbase.new_attribute ("g__tag_interwordfont_attr")
local tagunmarkedbool= token.create("g__tag_tagunmarked_bool")
local truebool       = token.create("c_true_bool")
local softhyphenbool = token.create("g__tag_softhyphen_bool")

local catlatex       = luatexbase.registernumber("catcodetable@latex")
local tableinsert    = table.insert
local nodeid           = node.id
local nodecopy         = node.copy
local nodegetattribute = node.get_attribute
local nodesetattribute = node.set_attribute
local nodehasattribute = node.has_attribute
local nodenew          = node.new
local nodetail         = node.tail
local nodeslide        = node.slide
local noderemove       = node.remove
local nodetraverseid   = node.traverse_id
local nodetraverse     = node.traverse
local nodeinsertafter  = node.insert_after
local nodeinsertbefore = node.insert_before
local pdfpageref       = pdf.pageref

local fonthashes      = fonts.hashes
local identifiers     = fonthashes.identifiers
local fontid          = font.id

local HLIST          = node.id("hlist")
local VLIST          = node.id("vlist")
local RULE           = node.id("rule")
local DISC           = node.id("disc")
local GLUE           = node.id("glue")
local GLYPH          = node.id("glyph")
local KERN           = node.id("kern")
local PENALTY        = node.id("penalty")
local LOCAL_PAR      = node.id("local_par")
local MATH           = node.id("math")

local NEXT = next
local explicit_disc = 1
local regular_disc = 3
ltx             = ltx        or { }
ltx.tag         = ltx.tag       or { } -- user commands
ltx.__tag          = ltx.__tag        or { }
ltx.__tag.mc       = ltx.__tag.mc     or  { } -- mc data
ltx.__tag.role     = ltx.__tag.role   or  { } -- parent-child data
ltx.__tag.role.states = ltx.__tag.role.states   or  { } -- the states
ltx.__tag.role.index  = ltx.__tag.role.index    or  { } -- standard types to index
                                                  --- numbers
ltx.__tag.role.matrix = ltx.__tag.role.matrix   or  { } -- implements the matrix
ltx.__tag.struct   = ltx.__tag.struct or  { } -- struct data
ltx.__tag.tables   = ltx.__tag.tables or  { } -- tables created with new prop and new seq.
                                        -- wasn't a so great idea ...
                                        -- g__tag_role_tags_seq used by tag<-> is in this tables!
                                        -- used for pure lua tables too now!
ltx.__tag.page     = ltx.__tag.page   or  { } -- page data, currently only i->{0->mcnum,1->mcnum,...}
ltx.__tag.trace    = ltx.__tag.trace  or  { } -- show commands
ltx.__tag.func     = ltx.__tag.func   or  { } -- functions
ltx.__tag.conf     = ltx.__tag.conf   or  { } -- configuration variables

local __tag_get_struct_num =
 function()
  local a = token.get_macro("g__tag_struct_stack_current_tl")
  return a
 end

local __tag_get_struct_counter =
 function()
  local a = tex.getcount("c@g__tag_struct_abs_int")
  return a
 end

local __tag_get_struct_num_next =
 function()
  local a = tex.getcount("c@g__tag_struct_abs_int") + 1
  return a
 end

ltx.tag.get_struct_num = __tag_get_struct_num
ltx.tag.get_struct_counter = __tag_get_struct_counter
ltx.tag.get_struct_num_next = __tag_get_struct_num_next
local __tag_log =
 function (message,loglevel)
  if (loglevel or 3) <= tex.count["l__tag_loglevel_int"] then
   texio.write_nl("tagpdf: ".. message)
  end
 end

ltx.__tag.trace.log = __tag_log
function ltx.__tag.trace.show_seq (seq)
 if (type(seq) == "table") then
  for i,v in ipairs(seq) do
   __tag_log ("[" .. i .. "] => " .. tostring(v),1)
  end
  else
   __tag_log ("sequence " .. tostring(seq) .. " not found",1)
  end
end
local __tag_pairs_prop =
 function  (prop)
      local a = {}
      for n in pairs(prop) do tableinsert(a, n) end
      table.sort(a)
      local i = 0                -- iterator variable
      local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], prop[a[i]]
        end
      end
      return iter
  end

function ltx.__tag.trace.show_prop (prop)
 if (type(prop) == "table") then
  for i,v in __tag_pairs_prop (prop) do
    __tag_log ("[" .. i .. "] => " .. tostring(v),1)
  end
 else
   __tag_log ("prop " .. tostring(prop) .. " not found or not a table",1)
 end
 end
function ltx.__tag.trace.show_mc_data (num,loglevel)
 if ltx.__tag and ltx.__tag.mc and ltx.__tag.mc[num] then
  for k,v in pairs(ltx.__tag.mc[num]) do
   __tag_log  ("mc"..num..": "..tostring(k).."=>"..tostring(v),loglevel)
  end
  if ltx.__tag.mc[num]["kids"] then
  __tag_log ("mc" .. num .. " has " .. #ltx.__tag.mc[num]["kids"] .. " kids",loglevel)
   for k,v in ipairs(ltx.__tag.mc[num]["kids"]) do
    __tag_log ("mc ".. num .. " kid "..k.." =>" .. v.kid.." on page " ..v.page,loglevel)
   end
  end
 else
  __tag_log  ("mc"..num.." not found",loglevel)
 end
end
function ltx.__tag.trace.show_all_mc_data (min,max,loglevel)
 for i = min, max do
  ltx.__tag.trace.show_mc_data (i,loglevel)
 end
 texio.write_nl("")
end

function ltx.__tag.trace.show_struct_data (num)
 if ltx.__tag and ltx.__tag.struct and ltx.__tag.struct[num] then
  for k,v in ipairs(ltx.__tag.struct[num]) do
   __tag_log  ("struct "..num..": "..tostring(k).."=>"..tostring(v),1)
  end
 else
  __tag_log   ("struct "..num.." not found ",1)
 end
end

local __tag_get_mc_cnt_type_tag = function (n)
  local mccnt      =  nodegetattribute(n,mccntattributeid)  or -1
  local mctype     =  nodegetattribute(n,mctypeattributeid)  or -1
  local tag        =  ltx.__tag.func.get_tag_from(mctype)
  return mccnt,mctype,tag
end
local function __tag_get_mathsubtype  (mathnode)
 if mathnode.subtype == 0 then
  subtype = "beginmath"
 else
  subtype = "endmath"
 end
 return subtype
end
ltx.__tag.tables.role_tag_attribute = {}
ltx.__tag.tables.role_attribute_tag = {}
local __tag_alloctag =
 function (tag)
   if not ltx.__tag.tables.role_tag_attribute[tag] then
    table.insert(ltx.__tag.tables.role_attribute_tag,tag)
    ltx.__tag.tables.role_tag_attribute[tag]=#ltx.__tag.tables.role_attribute_tag
    __tag_log  ("Add "..tag.." "..ltx.__tag.tables.role_tag_attribute[tag],3)
   end
 end
ltx.__tag.func.alloctag = __tag_alloctag
local __tag_get_num_from =
 function (tag)
  if ltx.__tag.tables.role_tag_attribute[tag] then
    a= ltx.__tag.tables.role_tag_attribute[tag]
  else
    a= -1
  end
  return a
 end

ltx.__tag.func.get_num_from = __tag_get_num_from

function ltx.__tag.func.output_num_from (tag)
  local num = __tag_get_num_from (tag)
  tex.sprint(catlatex,num)
  if num == -1 then
   __tag_log ("Unknown tag "..tag.." used")
  end
end
local __tag_get_tag_from =
 function  (num)
  if ltx.__tag.tables.role_attribute_tag[num] then
   a = ltx.__tag.tables.role_attribute_tag[num]
  else
   a= "UNKNOWN"
  end
 return a
end

ltx.__tag.func.get_tag_from = __tag_get_tag_from

function ltx.__tag.func.output_tag_from (num)
  tex.sprint(catlatex,__tag_get_tag_from (num))
end
function ltx.__tag.func.store_mc_data (num,key,data)
 ltx.__tag.mc[num] = ltx.__tag.mc[num] or { }
 ltx.__tag.mc[num][key] = data
 __tag_log  ("INFO TEX-STORE-MC-DATA: "..num.." => "..tostring(key).." => "..tostring(data),3)
end
function ltx.__tag.func.store_mc_label (label,num)
 ltx.__tag.mc["labels"] = ltx.__tag.mc["labels"] or { }
 ltx.__tag.mc.labels[label] = num
end
function ltx.__tag.func.store_mc_kid (mcnum,kid,page)
 __tag_log("INFO TAG-STORE-MC-KID: "..mcnum.." => " .. kid.." on page " .. page,3)
 ltx.__tag.mc[mcnum]["kids"] = ltx.__tag.mc[mcnum]["kids"] or { }
 local kidtable = {kid=kid,page=page}
 tableinsert(ltx.__tag.mc[mcnum]["kids"], kidtable )
end

function ltx.__tag.func.mc_num_of_kids (mcnum)
 local num = 0
 if ltx.__tag.mc[mcnum] and ltx.__tag.mc[mcnum]["kids"] then
   num = #ltx.__tag.mc[mcnum]["kids"]
 end
 __tag_log ("INFO MC-KID-NUMBERS: " .. mcnum .. "has " .. num .. "KIDS",4)
 return num
end
local __tag_backend_create_emc_node
if tex.outputmode == 0 then
 if token.get_macro("c_sys_backend_str") == "dvipdfmx" then
  function __tag_backend_create_emc_node ()
    local emcnode = nodenew("whatsit","special")
      emcnode.data = "pdf:code EMC"
    return emcnode
  end
 else -- assume a dvips variant
  function __tag_backend_create_emc_node ()
    local emcnode = nodenew("whatsit","special")
      emcnode.data = "ps:SDict begin mark /EMC pdfmark end"
    return emcnode
  end
 end
else -- pdf mode
  function __tag_backend_create_emc_node ()
    local emcnode = nodenew("whatsit","pdf_literal")
      emcnode.data = "EMC"
      emcnode.mode=1
    return emcnode
  end
end

local function __tag_insert_emc_node (head,current)
  local emcnode= __tag_backend_create_emc_node()
  head = node.insert_before(head,current,emcnode)
  return head
end
local __tag_backend_create_bmc_node
if tex.outputmode == 0 then
 if token.get_macro("c_sys_backend_str") == "dvipdfmx" then
  function __tag_backend_create_bmc_node (tag)
    local bmcnode = nodenew("whatsit","special")
    bmcnode.data = "pdf:code /"..tag.." BMC"
    return bmcnode
  end
 else -- assume a dvips variant
  function __tag_backend_create_bmc_node (tag)
    local bmcnode = nodenew("whatsit","special")
    bmcnode.data = "ps:SDict begin mark/"..tag.." /BMC pdfmark end"
    return bmcnode
  end
 end
else -- pdf mode
  function __tag_backend_create_bmc_node (tag)
    local bmcnode = nodenew("whatsit","pdf_literal")
    bmcnode.data = "/"..tag.." BMC"
    bmcnode.mode=1
    return bmcnode
  end
end

local function __tag_insert_bmc_node (head,current,tag)
 local bmcnode = __tag_backend_create_bmc_node (tag)
 head = node.insert_before(head,current,bmcnode)
 return head
end
local __tag_backend_create_bdc_node

if tex.outputmode == 0 then
 if token.get_macro("c_sys_backend_str") == "dvipdfmx" then
  function __tag_backend_create_bdc_node (tag,dict)
    local bdcnode = nodenew("whatsit","special")
    bdcnode.data = "pdf:code /"..tag.."<<"..dict..">> BDC"
    return bdcnode
  end
 else -- assume a dvips variant
  function __tag_backend_create_bdc_node (tag,dict)
    local bdcnode = nodenew("whatsit","special")
    bdcnode.data = "ps:SDict begin mark/"..tag.."<<"..dict..">> /BDC pdfmark end"
    return bdcnode
  end
 end
else -- pdf mode
  function __tag_backend_create_bdc_node (tag,dict)
    local bdcnode = nodenew("whatsit","pdf_literal")
    bdcnode.data = "/"..tag.."<<"..dict..">> BDC"
    bdcnode.mode=1
    return bdcnode
  end
end

local function __tag_insert_bdc_node (head,current,tag,dict)
 bdcnode= __tag_backend_create_bdc_node (tag,dict)
 head = node.insert_before(head,current,bdcnode)
 return head
end
local function __tag_pdf_object_ref (name,index)
   local object
   if ltx.pdf.object_id then
     object = ltx.pdf.object_id (name,index) ..' 0 R'
   else
     local tokenname = 'c__pdf_object_'..name..'/'..index..'_int'
     object = token.create(tokenname).mode ..' 0 R'
   end
   return object
end
ltx.__tag.func.pdf_object_ref = __tag_pdf_object_ref
local function __tag_show_spacemark (head,current,color,height)
 local markcolor = color or "1 0 0"
 local markheight = height or 10
 local pdfstring
 if tex.outputmode == 0 then
  -- ignore dvi mode for now
 else
  pdfstring = node.new("whatsit","pdf_literal")
       pdfstring.data =
       string.format("q "..markcolor.." RG "..markcolor.." rg 0.4 w 0 %g m 0 %g l S Q",-3,markheight)
       head = node.insert_after(head,current,pdfstring)
  return head
 end
end
local function __tag_fakespace()
   tex.setattribute(iwspaceattributeid,1)
   tex.setattribute(iwfontattributeid,font.current())
end
ltx.__tag.func.fakespace = __tag_fakespace
--[[ a function to mark up places where real space chars should be inserted
     it only sets an attribute.
--]]

local function __tag_mark_spaces (head)
  local inside_math = false
  for n in nodetraverse(head) do
    local id = n.id
    if id == GLYPH then
      local glyph = n
      default_currfontid = glyph.font
      if glyph.next and (glyph.next.id == GLUE)
        and not inside_math  and (glyph.next.width >0)
      then
        nodesetattribute(glyph.next,iwspaceattributeid,1)
        nodesetattribute(glyph.next,iwfontattributeid,glyph.font)
      -- for debugging
       if ltx.__tag.trace.showspaces then
        __tag_show_spacemark (head,glyph)
       end
      elseif glyph.next and (glyph.next.id==KERN) and not inside_math then
       local kern = glyph.next
       if kern.next and (kern.next.id== GLUE)  and (kern.next.width >0)
       then
        nodesetattribute(kern.next,iwspaceattributeid,1)
        nodesetattribute(kern.next,iwfontattributeid,glyph.font)
       end
      end
     --  look also back
     if glyph.prev and (glyph.prev.id == GLUE)
        and not inside_math
        and (glyph.prev.width >0)
        and not nodehasattribute(glyph.prev,iwspaceattributeid)
      then
        nodesetattribute(glyph.prev,iwspaceattributeid,1)
        nodesetattribute(glyph.prev,iwfontattributeid,glyph.font)
      -- for debugging
       if ltx.__tag.trace.showspaces then
        __tag_show_spacemark (head,glyph)
       end
      end
    elseif id == PENALTY then
      local glyph = n
      -- __tag_log ("PENALTY ".. n.subtype.."VALUE"..n.penalty,3)
      if glyph.next and (glyph.next.id == GLUE)
        and not inside_math  and (glyph.next.width >0) and n.subtype==0
      then
        nodesetattribute(glyph.next,iwspaceattributeid,1)
        --  changed 2024-01-18, issue #72
        nodesetattribute(glyph.next,iwfontattributeid,default_currfontid)
      -- for debugging
       if ltx.__tag.trace.showspaces then
        __tag_show_spacemark (head,glyph)
       end
      end
    elseif id == MATH then
      inside_math = (n.subtype == 0)
    end
  end
  return head
end
local function __tag_activate_mark_space ()
 if not luatexbase.in_callback ("pre_linebreak_filter","markspaces") then
  luatexbase.add_to_callback("pre_linebreak_filter",__tag_mark_spaces,"markspaces")
  luatexbase.add_to_callback("hpack_filter",__tag_mark_spaces,"markspaces")
 end
end

ltx.__tag.func.markspaceon=__tag_activate_mark_space

local function __tag_deactivate_mark_space ()
 if luatexbase.in_callback ("pre_linebreak_filter","markspaces") then
 luatexbase.remove_from_callback("pre_linebreak_filter","markspaces")
 luatexbase.remove_from_callback("hpack_filter","markspaces")
 end
end

ltx.__tag.func.markspaceoff=__tag_deactivate_mark_space
local default_space_char = nodenew(GLYPH)
local default_fontid     = fontid("TU/lmr/m/n/10")
local default_currfontid = fontid("TU/lmr/m/n/10")
default_space_char.char  = 32
default_space_char.font  = default_fontid
local function __tag_font_has_space (fontid)
 t= fonts.hashes.identifiers[fontid]
 if luaotfload.aux.slot_of_name(fontid,"space")
    or t and t.characters and t.characters[32] and t.characters[32]["unicode"]==32
 then
    return true
 else
    return false
 end
end
local function __tag_space_chars_shipout (box)
 local head = box.head
  if head then
    for n in node.traverse(head) do
      local spaceattr = -1
      if not nodehasattribute(n,iwspaceOffattributeid) then
        spaceattr = nodegetattribute(n,iwspaceattributeid)  or -1
      end
      if n.id == HLIST  then -- enter the hlist
         __tag_space_chars_shipout (n)
      elseif n.id == VLIST then -- enter the vlist
         __tag_space_chars_shipout (n)
      elseif n.id == GLUE then
        if ltx.__tag.trace.showspaces and spaceattr==1  then
          __tag_show_spacemark (head,n,"0 1 0")
        end
        if spaceattr==1  then
          local space
          local space_char = node.copy(default_space_char)
          local curfont    = nodegetattribute(n,iwfontattributeid)
          __tag_log ("INFO SPACE-FUNCTION-FONT: ".. tostring(curfont),3)
          if curfont and
            -- luaotfload.aux.slot_of_name(curfont,"space")
            __tag_font_has_space (curfont)
          then
            space_char.font=curfont
          end
          head, space = node.insert_before(head, n, space_char) --
          n.width     = n.width - space.width
          space.attr  = n.attr
        end
      end
    end
    box.head = head
  end
end

function ltx.__tag.func.space_chars_shipout (box)
  __tag_space_chars_shipout (box)
end
function ltx.__tag.func.mc_insert_kids (mcnum,single)
  if ltx.__tag.mc[mcnum] then
  __tag_log("INFO TEX-MC-INSERT-KID-TEST: " .. mcnum,4)
   if ltx.__tag.mc[mcnum]["kids"] then
    if #ltx.__tag.mc[mcnum]["kids"] > 1 and single==1 then
     tex.sprint(catlatex,"[")
    end
    for i,kidstable in ipairs( ltx.__tag.mc[mcnum]["kids"] ) do
     local kidnum  = kidstable["kid"]
     local kidpage = kidstable["page"]
     local kidpageobjnum = pdfpageref(kidpage)
     __tag_log("INFO TEX-MC-INSERT-KID: " .. mcnum ..
                      " insert KID " ..i..
                      " with num " .. kidnum ..
                      " on page " .. kidpage.."/"..kidpageobjnum,3)
     tex.sprint(catlatex,"<</Type /MCR /Pg "..kidpageobjnum .. " 0 R /MCID "..kidnum.. ">> " )
    end
    if #ltx.__tag.mc[mcnum]["kids"] > 1 and single==1 then
     tex.sprint(catlatex,"]")
    end
   else
    -- this is typically not a problem, e.g. empty hbox in footer/header can
    -- trigger this warning.
    __tag_log("WARN TEX-MC-INSERT-NO-KIDS: "..mcnum.." has no kids",2)
    if single==1 then
      tex.sprint(catlatex,"null")
    end
   end
  else
   __tag_log("WARN TEX-MC-INSERT-MISSING: "..mcnum.." doesn't exist",0)
  end
end
function ltx.__tag.func.store_struct_mcabs (structnum,mcnum)
 ltx.__tag.struct[structnum]=ltx.__tag.struct[structnum] or { }
 ltx.__tag.struct[structnum]["mc"]=ltx.__tag.struct[structnum]["mc"] or { }
 -- a structure can contain more than on mc chunk, the content should be ordered
 tableinsert(ltx.__tag.struct[structnum]["mc"],mcnum)
 __tag_log("INFO TEX-MC-INTO-STRUCT: "..
                   mcnum.." inserted in struct "..structnum,3)
 -- but every mc can only be in one structure
 ltx.__tag.mc[mcnum]= ltx.__tag.mc[mcnum] or { }
 ltx.__tag.mc[mcnum]["parent"] = structnum
end

-- pay attention: lua counts arrays from 1, tex pages from one
-- mcid and arrays in pdf count from 0.
function ltx.__tag.func.store_mc_in_page (mcnum,mcpagecnt,page)
 ltx.__tag.page[page] = ltx.__tag.page[page] or {}
 ltx.__tag.page[page][mcpagecnt] = mcnum
 __tag_log("INFO TAG-MC-INTO-PAGE: page " .. page ..
                   ": inserting MCID " .. mcpagecnt .. " => " .. mcnum,3)
end
local function __tag_update_mc_attributes (head,mcnum,type)
 for n in node.traverse(head) do
   node.set_attribute(n,mccntattributeid,mcnum)
   node.set_attribute(n,mctypeattributeid,type)
   if n.id == HLIST or n.id == VLIST then
     __tag_update_mc_attributes (n.list,mcnum,type)
   end
 end
 return head
end
ltx.__tag.func.update_mc_attributes = __tag_update_mc_attributes
--[[
    Now follows the core function
    It wades through the shipout box and checks the attributes
    ARGUMENTS
    box: is a box,
    mcpagecnt: num, the current page cnt of mc (should start at -1 in shipout box), needed for recursion
    mccntprev: num, the attribute cnt of the previous node/whatever - if different we have a chunk border
    mcopen: num, records if some bdc/emc is open
    These arguments are only needed for log messages, if not present are replaces by fix strings:
    name: string to describe the box
    mctypeprev: num, the type attribute of the previous node/whatever

    there are lots of logging messages currently. Should be cleaned up in due course.
    One should also find ways to make the function shorter.
--]]

function ltx.__tag.func.mark_page_elements (box,mcpagecnt,mccntprev,mcopen,name,mctypeprev)
  local name = name or ("SOMEBOX")
  local mctypeprev = mctypeprev or -1
  local abspage = status.total_pages + 1  -- the real counter is increased
                                          -- inside the box so one off
                                          -- if the callback is not used. (???)
  __tag_log ("INFO TAG-ABSPAGE: " .. abspage,3)
  __tag_log ("INFO TAG-ARGS: pagecnt".. mcpagecnt..
                    " prev "..mccntprev ..
                    " type prev "..mctypeprev,4)
  __tag_log ("INFO TAG-TRAVERSING-BOX: ".. tostring(name)..
                    " TYPE ".. node.type(node.getid(box)),3)
  local head = box.head -- ShipoutBox is a vlist?
  if head then
    mccnthead, mctypehead,taghead = __tag_get_mc_cnt_type_tag (head)
    __tag_log ("INFO TAG-HEAD: " ..
                      node.type(node.getid(head))..
                      " MC"..tostring(mccnthead)..
                      " => TAG " .. tostring(mctypehead)..
                      " => ".. tostring(taghead),3)
  else
    __tag_log ("INFO TAG-NO-HEAD: head is "..
                       tostring(head),3)
  end
  for n in node.traverse(head) do
    local mccnt, mctype, tag = __tag_get_mc_cnt_type_tag (n)
    local spaceattr = nodegetattribute(n,iwspaceattributeid)  or -1
    __tag_log ("INFO TAG-NODE: "..
                       node.type(node.getid(n))..
                      " MC".. tostring(mccnt)..
                      " => TAG ".. tostring(mctype)..
                      " => " ..  tostring(tag),3)
    if n.id == HLIST
    then -- enter the hlist
     mcopen,mcpagecnt,mccntprev,mctypeprev=
      ltx.__tag.func.mark_page_elements (n,mcpagecnt,mccntprev,mcopen,"INTERNAL HLIST",mctypeprev)
    elseif n.id == VLIST then -- enter the vlist
     mcopen,mcpagecnt,mccntprev,mctypeprev=
      ltx.__tag.func.mark_page_elements (n,mcpagecnt,mccntprev,mcopen,"INTERNAL VLIST",mctypeprev)
    elseif n.id == GLUE and not n.leader then -- at glue real space chars are inserted, but this has
                                   -- been done if the previous shipout wandering, so here it is ignored
    elseif n.id == LOCAL_PAR then  -- local_par is ignored
    elseif n.id == PENALTY then    -- penalty is ignored
    elseif n.id == KERN then       -- kern is ignored
     __tag_log ("INFO TAG-KERN-SUBTYPE: "..
       node.type(node.getid(n)).." "..n.subtype,4)
    else
     -- math is currently only logged.
     -- we could mark the whole as math
     -- for inner processing the mlist_to_hlist callback is probably needed.
     if n.id == MATH then
      __tag_log("INFO TAG-MATH-SUBTYPE: "..
        node.type(node.getid(n)).." "..__tag_get_mathsubtype(n),4)
     end
     -- endmath
     __tag_log("INFO TAG-MC-COMPARE: current "..
               mccnt.." prev "..mccntprev,4)
     if mccnt~=mccntprev then -- a new mc chunk
      __tag_log ("INFO TAG-NEW-MC-NODE: "..
                         node.type(node.getid(n))..
                        " MC"..tostring(mccnt)..
                        " <=> PREVIOUS "..tostring(mccntprev),4)
      if mcopen~=0 then -- there is a chunk open, close it (hope there is only one ...
       box.list=__tag_insert_emc_node (box.list,n)
       mcopen = mcopen - 1
       __tag_log ("INFO TAG-INSERT-EMC: " ..
         mcpagecnt .. " MCOPEN = " .. mcopen,3)
       if mcopen ~=0 then
        __tag_log ("WARN TAG-OPEN-MC: " .. mcopen,1)
       end
      end
      if ltx.__tag.mc[mccnt] then
       if ltx.__tag.mc[mccnt]["artifact"] then
        __tag_log("INFO TAG-INSERT-ARTIFACT: "..
                          tostring(ltx.__tag.mc[mccnt]["artifact"]),3)
        if ltx.__tag.mc[mccnt]["artifact"] == "" then
         box.list = __tag_insert_bmc_node (box.list,n,"Artifact")
        else
         box.list = __tag_insert_bdc_node (box.list,n,"Artifact", "/Type /"..ltx.__tag.mc[mccnt]["artifact"])
        end
       else
        __tag_log("INFO TAG-INSERT-TAG: "..
                          tostring(tag),3)
        mcpagecnt = mcpagecnt +1
        __tag_log ("INFO TAG-INSERT-BDC: "..mcpagecnt,3)
        local dict= "/MCID "..mcpagecnt
        if ltx.__tag.mc[mccnt]["raw"] then
         __tag_log("INFO TAG-USE-RAW: "..
           tostring(ltx.__tag.mc[mccnt]["raw"]),3)
         dict= dict .. " " .. ltx.__tag.mc[mccnt]["raw"]
        end
        if ltx.__tag.mc[mccnt]["alt"] then
         __tag_log("INFO TAG-USE-ALT: "..
            tostring(ltx.__tag.mc[mccnt]["alt"]),3)
         dict= dict .. " " .. ltx.__tag.mc[mccnt]["alt"]
        end
        if ltx.__tag.mc[mccnt]["lang"] then
         __tag_log("INFO TAG-USE-LANG: "..
            tostring(ltx.__tag.mc[mccnt]["lang"]),3)
         dict= dict .. " " .. ltx.__tag.mc[mccnt]["lang"]
        end
        if ltx.__tag.mc[mccnt]["actualtext"] then
         __tag_log("INFO TAG-USE-ACTUALTEXT: "..
           tostring(ltx.__tag.mc[mccnt]["actualtext"]),3)
         dict= dict .. " " .. ltx.__tag.mc[mccnt]["actualtext"]
        end
        box.list = __tag_insert_bdc_node (box.list,n,tag, dict)
        ltx.__tag.func.store_mc_kid (mccnt,mcpagecnt,abspage)
        ltx.__tag.func.store_mc_in_page(mccnt,mcpagecnt,abspage)
        ltx.__tag.trace.show_mc_data (mccnt,3)
       end
       mcopen = mcopen + 1
      else
       if tagunmarkedbool.mode == truebool.mode then
        __tag_log("INFO TAG-NOT-TAGGED: this has not been tagged, using artifact",2)
        box.list = __tag_insert_bmc_node (box.list,n,"Artifact")
        mcopen = mcopen + 1
       else
        __tag_log("WARN TAG-NOT-TAGGED: this has not been tagged",1)
       end
      end
      mccntprev = mccnt
     end
    end -- end if
  end -- end for
  if head then
    mccnthead, mctypehead,taghead = __tag_get_mc_cnt_type_tag (head)
    __tag_log ("INFO TAG-ENDHEAD: " ..
                       node.type(node.getid(head))..
                      " MC"..tostring(mccnthead)..
                      " => TAG "..tostring(mctypehead)..
                      " => "..tostring(taghead),4)
  else
    __tag_log ("INFO TAG-ENDHEAD: ".. tostring(head),4)
  end
  __tag_log ("INFO TAG-QUITTING-BOX "..
                     tostring(name)..
                    " TYPE ".. node.type(node.getid(box)),4)
 return mcopen,mcpagecnt,mccntprev,mctypeprev
end

function ltx.__tag.func.mark_shipout (box)
 mcopen = ltx.__tag.func.mark_page_elements (box,-1,-100,0,"Shipout",-1)
 if mcopen~=0 then -- there is a chunk open, close it (hope there is only one ...
  local emcnode = __tag_backend_create_emc_node ()
  local list = box.list
  if list then
     list = node.insert_after (list,node.tail(list),emcnode)
     mcopen = mcopen - 1
     __tag_log ("INFO SHIPOUT-INSERT-LAST-EMC: MCOPEN " .. mcopen,3)
  else
     __tag_log ("WARN SHIPOUT-UPS: this shouldn't happen",0)
  end
  if mcopen ~=0 then
     __tag_log ("WARN SHIPOUT-MC-OPEN: " .. mcopen,1)
  end
 end
end

function ltx.__tag.func.fill_parent_tree_line (page)
     -- we need to get page-> i=kid -> mcnum -> structnum
     -- pay attention: the kid numbers and the page number in the parent tree start with 0!
    local numsentry =""
    local pdfpage = page-1
    if ltx.__tag.page[page] and ltx.__tag.page[page][0] then
     mcchunks=#ltx.__tag.page[page]
     __tag_log("INFO PARENTTREE-NUM:  page "..
                   page.." has "..mcchunks.."+1 Elements ",4)
     for i=0,mcchunks do
     -- what does this log??
      __tag_log("INFO PARENTTREE-CHUNKS:  "..
        ltx.__tag.page[page][i],4)
     end
     if mcchunks == 0 then
      -- only one chunk so no need for an array
      local mcnum  = ltx.__tag.page[page][0]
      local structnum = ltx.__tag.mc[mcnum]["parent"]
      local propname  = "g__tag_struct_"..structnum.."_prop"
      --local objref   =  ltx.__tag.tables[propname]["objref"] or "XXXX"
      local objref = __tag_pdf_object_ref('__tag/struct',structnum)
      __tag_log("INFO PARENTTREE-STRUCT-OBJREF:  =====>"..
        tostring(objref),5)
      numsentry = pdfpage .. " [".. objref .. "]"
      __tag_log("INFO PARENTTREE-NUMENTRY: page " ..
        page.. " num entry = ".. numsentry,3)
     else
      numsentry = pdfpage .. " ["
       for i=0,mcchunks do
        local mcnum  = ltx.__tag.page[page][i]
        local structnum = ltx.__tag.mc[mcnum]["parent"] or 0
        local propname  = "g__tag_struct_"..structnum.."_prop"
        --local objref   =  ltx.__tag.tables[propname]["objref"] or "XXXX"
        local objref = __tag_pdf_object_ref('__tag/struct',structnum)
        numsentry = numsentry .. " ".. objref
       end
      numsentry = numsentry .. "] "
      __tag_log("INFO PARENTTREE-NUMENTRY: page " ..
        page.. " num entry = ".. numsentry,3)
     end
    else
      __tag_log ("INFO PARENTTREE-NO-DATA: page "..page,3)
      numsentry = pdfpage.." []"
    end
    return numsentry
end

function ltx.__tag.func.output_parenttree (abspage)
 for i=1,abspage do
  line = ltx.__tag.func.fill_parent_tree_line (i) .. "^^J"
  tex.sprint(catlatex,line)
 end
end
do
  local properties = node.get_properties_table()
  local is_soft_hyphen_prop = 'tagpdf.rewrite-softhyphen.is_soft_hyphen'
  local hyphen_char = 0x2D
  local soft_hyphen_char = 0xAD
  local softhyphen_fonts = setmetatable({}, {__index = function(t, fid)
    local fdir = identifiers[fid]
    local format = fdir and fdir.format
    local result = (format == 'opentype' or format == 'truetype')
    local characters = fdir and fdir.characters
    result = result and (characters and characters[soft_hyphen_char]) ~= nil
    t[fid] = result
    return result
  end})
  local function process_softhyphen_pre(head, _context, _dir)
    if softhyphenbool.mode ~= truebool.mode then return true end
    for disc, sub in node.traverse_id(DISC, head) do
      if sub == explicit_disc or sub == regular_disc then
        for n, _ch, _f in node.traverse_char(disc.pre) do
          local props = properties[n]
          if not props then
            props = {}
            properties[n] = props
          end
          props[is_soft_hyphen_prop] = true
        end
      end
    end
    return true
  end

  local function process_softhyphen_post(head, _context, _dir)
    if softhyphenbool.mode ~= truebool.mode then return true end
    for disc, sub in node.traverse_id(DISC, head) do
      for n, ch, fid in node.traverse_glyph(disc.pre) do
        local props = properties[n]
        if softhyphen_fonts[fid] and ch == hyphen_char and props and props[is_soft_hyphen_prop] then
          n.char = soft_hyphen_char
          props.glyph_info = nil
        end
      end
    end
    return true
  end

  luatexbase.add_to_callback('pre_shaping_filter', process_softhyphen_pre, 'tagpdf.rewrite-softhyphen')
  luatexbase.add_to_callback('post_shaping_filter', process_softhyphen_post, 'tagpdf.rewrite-softhyphen')
end
local function role_get_parent_child_rule (parent,child)
   local state=
   ltx.__tag.role.matrix[ltx.__tag.role.index[parent]]
   and ltx.__tag.role.matrix[ltx.__tag.role.index[parent]][ltx.__tag.role.index[child]] or 0
   return state
end
ltx.__tag.func.role_get_parent_child_rule=role_get_parent_child_rule
function check_update_stashed (struct,loglevel,loop)
 loop = (loop or 0)  + 1
 if loop > 10 then
  __tag_log ('Warning: Too deeply nested stashed structures',0)
  return
 end
 __tag_log ('updating parentrole for stashed structure '..struct,loglevel)
 local parent = ltx.__tag.tables['g__tag_struct_'..struct..'_prop']['parentnum']
 if parent then
   local ptag =
    string.match(ltx.__tag.tables['g__tag_struct_'..parent..'_prop']['parentrole'], "{(.-)}{(.-)}")
   if ptag == 'STASHED' then
   -- look at the parent and update it first
     check_update_stashed (parent,loglevel,loop)
   end
   -- now copy the parent role from the parent
     ltx.__tag.tables['g__tag_struct_'..struct..'_prop']['parentrole']
        =
     ltx.__tag.tables['g__tag_struct_'..parent..'_prop']['parentrole']
   __tag_log
    ('new parentrole: ' .. ltx.__tag.tables['g__tag_struct_'..struct..'_prop']['parentrole'], loglevel)
 else
  __tag_log ('Warning: structure '..struct.. 'has no parent.',0)
 end
end

function check_parent_child_rules (loglevel)
 texio.write_nl('\n')
 __tag_log ('checking parent-child rules ...' ,0)
 for i=2,ltx.tag.get_struct_counter() do
  local t,tNS=
    string.match(ltx.__tag.tables['g__tag_struct_'..i..'_prop']['tag'], "{(.-)}{(.-)}")
  local r,rNS=
    string.match(ltx.__tag.tables['g__tag_struct_'..i..'_prop']['rolemap'], "{(.-)}{(.-)}")
  local p,pNS=
    string.match(ltx.__tag.tables['g__tag_struct_'..i..'_prop']['parentrole'], "{(.-)}{(.-)}")
  local parent=ltx.__tag.tables['g__tag_struct_'..i..'_prop']['parentnum']
  if parent then
    __tag_log (i..': '.. t..':'..tNS,loglevel)
    __tag_log (i..': '.. r..':'..rNS,loglevel)
    __tag_log (i..': '.. p..':'..pNS,loglevel)
    __tag_log ('parent of ' ..i..': '.. parent,loglevel )
    if p == 'STASHED' then
     check_update_stashed  (i,loglevel,0)
     p,pNS=
       string.match(ltx.__tag.tables['g__tag_struct_'..i..'_prop']['parentrole'], "{(.-)}{(.-)}")
    end
    local pt,ptNS=
    string.match(ltx.__tag.tables['g__tag_struct_'..parent..'_prop']['tag'], "{(.-)}{(.-)}")
    local pr,prNS=
    string.match(ltx.__tag.tables['g__tag_struct_'..parent..'_prop']['rolemap'], "{(.-)}{(.-)}")
    local pp,ppNS=
    string.match(ltx.__tag.tables['g__tag_struct_'..parent..'_prop']['parentrole'], "{(.-)}{(.-)}")
    if pp == 'STASHED' then
     check_update_stashed  (parent,loglevel,0)
     pp,ppNS=
      string.match(ltx.__tag.tables['g__tag_struct_'..parent..'_prop']['parentrole'], "{(.-)}{(.-)}")
    end
    __tag_log (parent..': '.. pt..':'..ptNS,loglevel)
    __tag_log (parent..': '.. pr..':'..prNS,loglevel)
    __tag_log (parent..': '.. pp..':'..ppNS,loglevel)
   -- now check the rule.
   -- at first rolemap of child against rolemap of parent.
    local state=ltx.__tag.func.role_get_parent_child_rule (pr,r)
    __tag_log ('rule of '..pr.."->"..r..' is '..state,loglevel)
    -- if the state is 7 we check against parentrole of the parent
    if state == 7 then
     state=ltx.__tag.func.role_get_parent_child_rule (pp,r)
     __tag_log ('Parent-Child relation '..pp.."->"..r..' is '..state,loglevel)
    end
    if state == 0 then
      __tag_log
      ('Warning: Parent-Child relation '
       ..ptNS..':'..pt..' -> '..tNS..':'..t..' is unknown',0)
      __tag_log
       ('Structure ' ..parent..' -> '..i,0)
    end
    if state == -1 then
     __tag_log
      ('Warning: Parent-Child relation '
       ..ptNS..':'..pt..' -> '..tNS..':'..t..' is not allowed',0)
     __tag_log
       ('Structure ' ..parent..' -> '..i,0)
    end
    -- check also for MC
    state =ltx.__tag.func.role_get_parent_child_rule ( r ,'MC')
    local curtag=r
    if state == 7 then
     state =ltx.__tag.func.role_get_parent_child_rule ( p ,'MC')
     local curtag=p
    end
    if state == -1 then
     if ltx.__tag.struct[i] and NEXT(ltx.__tag.struct[i]) then
       __tag_log
       ('Warning: Real content (MC) is not allowed in ' ..curtag,0)
     end
    end
    __tag_log('=======================================',loglevel)
   end
  end -- end for
 end

ltx.__tag.func.check_parent_child_rules=check_parent_child_rules

  if luatexbase.callbacktypes['linksplit'] then
   luatexbase.add_to_callback('linksplit', function(start_link, position)
     if start_link == nil then return end
     local structnum =
       node.get_attribute(start_link,luatexbase.attributes.g__tag_structnum_attr)
     if structnum and structnum > -1 then
      local s = ltx.__tag.tables['g__tag_struct_'..structnum..'_prop']['rolemap']
      if s and (string.find(s,'Link') or string.find(s,'Reference')) then
           local struct_insert_annot_shipout = token.create'__tag_struct_insert_annot_shipout:nnn'
           local parentnum = tex.count['c@g__tag_parenttree_obj_int']
           start_link.link_attr =
              start_link.link_attr ..
              ' /LTEX_position /' .. position ..
              '/StructParent ' .. parentnum
           tex.sprint(catlatex,struct_insert_annot_shipout,'{'..
              structnum..'}{'..
              start_link.objnum..' 0 R}{'..
              parentnum ..'}')
           -- the counter must be set explicitly as struct_insert_annot_shipout doesn't do it!
           tex.setcount('global','c@g__tag_parenttree_obj_int',parentnum +1)
            __tag_log(position .. " link part has object id " .. start_link.objnum .. " and structparent id " .. parentnum,2)
       else
        __tag_log('Warning: Link not in Link or Reference structure element',0)
        __tag_log('OBJR not created',0)
        __tag_log('',0)
       end
     end
   end, 'tagpdf')
  end
-- 
--  End of File `tagpdf.lua'.
