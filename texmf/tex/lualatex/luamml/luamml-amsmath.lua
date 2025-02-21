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

do
  local saved
  funcid = luatexbase.new_luafunction'__luamml_amsmath_save_inner_table:n'
  token.set_lua('__luamml_amsmath_save_inner_table:n', funcid)
  lua.get_functions_table()[funcid] = function()
    -- TODO: Error handling etc
    local kind = token.scan_argument()
    local mml_table = get_table()
    if not mml_table then return end
    mml_table.displaystyle = true
    local columns = node.count(node.id'align_record', tex.lists.align_head)//2
    mml_table.columnalign = kind == 'gathered' and 'center' or string.rep('right left', columns, ' ')
    local spacing = {}
    for n in node.traverse_id(node.id'glue', tex.lists.align_head) do
      spacing[#spacing+1] = n.width == 0 and '0' or string.format('%.3fpt', n.width/65781.76)
    end
    mml_table.columnspacing = #spacing > 3 and table.concat(spacing, ' ', 2, #spacing-2) or nil
    saved = mml_table
  end

  funcid = luatexbase.new_luafunction'__luamml_amsmath_save_smallmatrix:'
  token.set_lua('__luamml_amsmath_save_smallmatrix:', funcid)
  lua.get_functions_table()[funcid] = function()
    -- TODO: Error handling etc
    local mml_table = get_table()
    mml_table.align = 'axis'
    mml_table.columnalign = 'center'
    mml_table.columnspacing = '0.278em'
    mml_table.rowspacing = string.format('%.3fpt', tex.lineskip.width/65781.76)
    saved = {[0] = 'mpadded', width = '+0.333em', lspace = '0.167em', mml_table}
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
  local mml_table = get_table()
  if not mml_table then return end
  mml_table.displaystyle = true
  local columns = node.count(node.id'align_record', tex.lists.align_head)//2
  mml_table.columnalign = kind == 'align' and string.rep('right left', columns, ' ') or nil
  mml_table.width = kind == 'multline' and '100%' or nil
  -- mml_table.side = kind == 'multline' and 'rightoverlap' or nil
  local spacing = {}
  for n in node.traverse_id(node.id'glue', tex.lists.align_head) do
    spacing[#spacing+1] = n.width == 0 and '0' or '.8em'
  end
  mml_table.columnspacing = #spacing > 3 and table.concat(spacing, ' ', 2, #spacing-2) or nil
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
