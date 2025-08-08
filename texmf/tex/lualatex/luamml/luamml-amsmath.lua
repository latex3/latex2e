--[[
   This file is loaded by luamml-patches-amsmath.sty
   
   It defines the luafunctions
   * \__luamml_amsmath_add_last_to_row:
   * \__luamml_amsmath_add_box_to_row:
   * \__luamml_amsmath_set_row_columnalign:n
   * \__luamml_amsmath_save_inner_table:n
   * \__luamml_amsmath_save_smallmatrix:
   * \__luamml_amsmath_finalize_inner_table:
   * \__luamml_amsmath_save_inner_table:n
   * \__luamml_amsmath_save_smallmatrix:
   * \__luamml_amsmath_finalize_inner_table:
   * \__luamml_amsmath_save_tag_with_struct_elem:N
   * \__luamml_amsmath_save_tag:
   * \__luamml_amsmath_set_tag:
   
   These are all rather special commands used in amsmath environments to 
   get the correct math tagging.
   
   TODO: error handling and more documentation
--]]

-- TODO these two are unused?
local write_xml = require'luamml-xmlwriter'
local make_root = require'luamml-convert'.make_root

local save_result = require'luamml-tex'.save_result
local store_column = require'luamml-table'.store_column
local store_tag = require'luamml-table'.store_tag
local store_notag = require'luamml-table'.store_notag
local get_table = require'luamml-table'.get_table
local set_row_attribute = require'luamml-table'.set_row_attribute
local to_text = require'luamml-lr'

local properties = node.get_properties_table()

local math_t = node.id'math'

local funcid = luatexbase.new_luafunction'__luamml_amsmath_add_last_to_row:'
token.set_lua('__luamml_amsmath_add_last_to_row:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  -- TODO: Error handling etc
  -- local box = token.scan_int()
  local nest = tex.nest.top
  local head, startmath = nest.head, nest.tail
  repeat
    startmath = startmath.prev
  until startmath == head or (startmath.id == math_t and startmath.subtype == 0)
  if startmath == head then return end
  assert(startmath.id == node.id"math")
  store_column(startmath)
end

local funcid = luatexbase.new_luafunction'__luamml_amsmath_add_box_to_row:'
token.set_lua('__luamml_amsmath_add_box_to_row:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  -- TODO: Error handling etc
  -- local box = token.scan_int()
  local boxnum = 0
  local startmath = tex.box[boxnum].list
  assert(startmath.id == math_t)
  store_column(startmath)
end

local funcid = luatexbase.new_luafunction'__luamml_amsmath_set_row_columnalign:n'
token.set_lua('__luamml_amsmath_set_row_columnalign:n', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  set_row_attribute('columnalign', token.scan_argument())
end

--[[
  This function is used to add a intent :continued-row to
  rows of a split environment.
  we assume that the table is a mtable with mrow with mtd. 
  we check row 2..n. If the first cell is empty, we assume a continued row and
  set the intent on the mrow.
  
  The function is used below in \__luamml_amsmath_save_inner_table:n
--]]
local function add_intent_continued_row (table)
  for index, row in ipairs(table) do
    if index > 1 and row[1] and #row[1] == 0 then
      row.intent = ':continued-row'
    end
  end
end

--[[
 This function adds an intent =":pause-medium" on every second mtd in a table
 currently it is also on the first (after the label) but this could be changed
 used in \__luamml_amsmath_finalize_table:n for 
 'align' or 'alignat' or 'flalign' or  'xalignat' or 'xxalignat'
--]]

local function add_intent_pause (mmltable)
  for _, row in ipairs(mmltable) do
    for colindex, col in ipairs(row) do
      if colindex % 2 == 0 then
        col.intent = ':pause-medium'
      end 
    end
  end
end


--[[
 debug function for tables
 activate with \directlua{debugmtable=2} or \directlua{debugmtable='split'}
 change 2025-05-26: fixed logic if kind doesn't exist. 
--]]

local function debug_mtable (mtable, kind)
 if debugmtable == 2 or debugmtable == kind then
   texio.write_nl('==============')
   texio.write_nl(kind or '?kind?')
   texio.write_nl(table.serialize(mtable))
   texio.write_nl('==============')
 end
end

do
  local saved
  funcid = luatexbase.new_luafunction'__luamml_amsmath_save_inner_table:n'
  token.set_lua('__luamml_amsmath_save_inner_table:n', funcid)
  lua.get_functions_table()[funcid] = function()
    -- TODO: Error handling etc
    local kind = token.scan_argument()
    kind = kind:gsub("*","")
    local mml_table = get_table()
    if not mml_table then return end
    mml_table.displaystyle = true
    mml_table.class=kind
    if kind=="split" then
     add_intent_continued_row (mml_table)
    end
    local columns = node.count(node.id'align_record', tex.lists.align_head)//2
    mml_table.columnalign = kind == 'gathered' and 'center' or string.rep('right left', columns, ' ')
    local spacing = {}
    for n in node.traverse_id(node.id'glue', tex.lists.align_head) do
      spacing[#spacing+1] = n.width == 0 and '0' or string.format('%.3fpt', n.width/65781.76)
    end
    mml_table.columnspacing = #spacing > 3 and table.concat(spacing, ' ', 2, #spacing-2) or nil
    debug_mtable(mml_table,kind)
    saved = mml_table
  end

  funcid = luatexbase.new_luafunction'__luamml_amsmath_save_smallmatrix:'
  token.set_lua('__luamml_amsmath_save_smallmatrix:', funcid)
  lua.get_functions_table()[funcid] = function()
    -- TODO: Error handling etc
    local mml_table = get_table()
    mml_table.align = 'axis'
    mml_table.class='smallmatrix'
    mml_table.columnalign = 'center'
    mml_table.columnspacing = '0.278em'
    mml_table.rowspacing = string.format('%.3fpt', tex.lineskip.width/65781.76)
    saved = {[0] = 'mrow',
      {[0] = 'mspace', width = '0.167em'},
      mml_table,
      {[0] = 'mspace', width = '0.167em'},
    }
    debug_mtable(mml_table,kind)
    saved = mml_table
  end

  funcid = luatexbase.new_luafunction'__luamml_amsmath_finalize_inner_table:'
  token.set_lua('__luamml_amsmath_finalize_inner_table:', funcid)
  lua.get_functions_table()[funcid] = function()
    -- TODO: Error handling etc
    local vcenter = tex.nest.top.tail.nucleus
    local props = properties[vcenter]
    if not props then
      props = {}
      properties[vcenter] = props
    end
    props.mathml_table = assert(saved)
    saved = nil
  end
end

funcid = luatexbase.new_luafunction'__luamml_amsmath_finalize_table:n'
token.set_lua('__luamml_amsmath_finalize_table:n', funcid)
lua.get_functions_table()[funcid] = function()
  -- TODO: Error handling etc
  local kind = token.scan_argument()
  kind = kind:gsub("*","")
  local mml_table = get_table()
  if not mml_table then return end
  mml_table.displaystyle = true
  mml_table.class=kind
  -- this should perhaps be configurable and extendable
  if kind == 'align' or 'alignat' or 'flalign' or  'xalignat' or 'xxalignat' then
   mml_table.intent=":system-of-equations"
   add_intent_pause (mml_table)
  end
  local columns = node.count(node.id'align_record', tex.lists.align_head)//2
  mml_table.columnalign = kind == 'align' and 'left '..string.rep('right left', columns, ' ') or nil
  mml_table.width = kind == 'multline' and '100%' or nil
  -- mml_table.side = kind == 'multline' and 'rightoverlap' or nil
  local spacing = {}
  for n in node.traverse_id(node.id'glue', tex.lists.align_head) do
    spacing[#spacing+1] = n.width == 0 and '0' or '.8em'
  end
  mml_table.columnspacing = #spacing > 3 and "0 "..table.concat(spacing, ' ', 2, #spacing-2) or nil
  debug_mtable(mml_table,kind)
  save_result(mml_table, true)
end

local last_tag

funcid = luatexbase.new_luafunction'__luamml_amsmath_save_tag:'
token.set_lua('__luamml_amsmath_save_tag:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  local nest = tex.nest.top
  local chars = {}
  last_tag = to_text(nest.head)
end

funcid = luatexbase.new_luafunction'__luamml_amsmath_save_tag_with_struct_elem:N'
token.set_lua('__luamml_amsmath_save_tag_with_struct_elem:N', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  local struct_num = token.scan_int()
  local nest = tex.nest.top
  local chars = {}
  last_tag = to_text(nest.head)
  last_tag[':structnum'] = struct_num
end

funcid = luatexbase.new_luafunction'__luamml_amsmath_set_tag:'
token.set_lua('__luamml_amsmath_set_tag:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  if not last_tag then
    store_notag({[0] = 'mtd',''})
  else
    store_tag({[0] = 'mtd', last_tag})
    last_tag = nil
  end
end
