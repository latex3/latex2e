local write_xml = require'luamml-xmlwriter'
local make_root = require'luamml-convert'.make_root
local save_result = require'luamml-tex'.save_result
local store_column = require'luamml-table'.store_column
local store_column_xml = require'luamml-table'.store_column_xml
local store_tag = require'luamml-table'.store_tag
local get_table = require'luamml-table'.get_table
local to_text = require'luamml-lr'

local properties = node.get_properties_table()

local funcid = luatexbase.new_luafunction'__luamml_array_init_col:'
token.set_lua('__luamml_array_init_col:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  -- TODO: Error handling etc
  local nest = tex.nest[tex.nest.ptr-1]
  -- The special will be deleted again, it just marks the right math list since the start math node is not there yet
  local special = node.new('whatsit', 'special')
  node.insert_after(nest.tail, nest.tail, special)
  nest.tail = special
  local temp = nest.head
  local props = properties[temp]
  if not props then
    props = {}
    properties[temp] = props
  end
  props.luamml_array_startmath = special
end

local funcid = luatexbase.new_luafunction'__luamml_array_finalize_col:w'
token.set_lua('__luamml_array_finalize_col:w', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  local alignment = token.scan_int() -- Do it first to consume number even if we end early
  -- TODO: Error handling etc
  local temp = tex.nest.top.head
  local props = properties[temp]
  local special = props and props.luamml_array_startmath
  if not special then return end
  node.remove(tex.nest.top.head, special)
  local startmath = node.free(special)
  props.luamml_array_startmath = nil

  alignment = alignment == 1 and 'left' or alignment == 2 and 'right' or nil

  if node.end_of_math(startmath) == tex.nest.top.tail then
    if startmath.next == tex.nest.top.tail then return end
    store_column(startmath).columnalign = alignment
  else
    -- Oh no, we got text. Let't complain to the user, it's probably their fault
    print'We are mathematicians, don\'t bother us with text'
    store_column_xml(to_text(startmath, tex.nest.top.tail)).columnalign = alignment
  end
end

local saved_array

funcid = luatexbase.new_luafunction'__luamml_array_save_array:'
token.set_lua('__luamml_array_save_array:', funcid)
lua.get_functions_table()[funcid] = function()
  -- TODO: Error handling etc.
  local colsep = tex.dimen['col@sep']
  saved_array = get_table()
  if colsep ~= 0 then
    saved_array = {[0] = 'mpadded',
      width = string.format('%+.3fpt', 2*colsep/65781.76),
      lspace = string.format('%+.3fpt', colsep/65781.76),
      saved_array
    }
  end
end

funcid = luatexbase.new_luafunction'__luamml_array_finalize_array:'
token.set_lua('__luamml_array_finalize_array:', funcid)
lua.get_functions_table()[funcid] = function()
  -- TODO: Error handling etc.
  local nucl = tex.nest.top.tail.nucleus
  local props = properties[nucl]
  if not props then
    props = {}
    properties[nucl] = props
  end
  props.mathml_table = saved_array
  saved_array = nil
end
