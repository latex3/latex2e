--[[
   This file defines the luafunctions
   * \__luamml_array_init_col:
   * \__luamml_array_finalize_col:w
   * \__luamml_array_save_array:
   * \__luamml_array_finalize_array:
   
   The functions are used in tagging sockets, that are used in array.sty and 
   handle the math tagging of the array environment.
 
--]]

-- TODO why are 4 these loaded?
local write_xml = require'luamml-xmlwriter'
local make_root = require'luamml-convert'.make_root
local save_result = require'luamml-tex'.save_result
local store_tag = require'luamml-table'.store_tag

local store_column = require'luamml-table'.store_column
local store_column_xml = require'luamml-table'.store_column_xml
local get_table = require'luamml-table'.get_table
local to_text = require'luamml-lr'

local properties = node.get_properties_table()

--[[ Documentation of luafunctions \__luamml_array_init_col:
   Initialization code for a cell, used in \@classz
   TODO: error handling
--]]   

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

--[[ Documentation of luafunctions \__luamml_array_finalize_col:w
   finalize a cell, used in \@classz
   the argument, a number, describes the alignment.
   TODO: error handling
--]]  

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
    -- Oh no, we got text. Let's complain to the user, it's probably their fault
    print'We are mathematicians, don\'t bother us with text'
    store_column_xml(to_text(startmath, tex.nest.top.tail)).columnalign = alignment
  end
end

local saved_array

--[[ Documentation of luafunctions \__luamml_array_save_array:
   save the array as a table.
   Used in \endarray.
   TODO: error handling
--]]  

funcid = luatexbase.new_luafunction'__luamml_array_save_array:'
token.set_lua('__luamml_array_save_array:', funcid)
lua.get_functions_table()[funcid] = function()
  -- TODO: Error handling etc.
  local colsep = tex.dimen['col@sep']
  saved_array = get_table()
  if colsep ~= 0 then
    saved_array = {[0] = 'mrow',
      {[0] = 'mspace', width = string.format('%.3fpt', colsep/65781.76)},
      saved_array,
      {[0] = 'mspace', width = string.format('%.3fpt', colsep/65781.76)},
    }
  end
end

--[[ Documentation of luafunctions \__luamml_array_finalize_array:
   finalize the array
   Used in \endarray.
   TODO: error handling
--]]  

funcid = luatexbase.new_luafunction'__luamml_array_finalize_array:'
token.set_lua('__luamml_array_finalize_array:', funcid)
lua.get_functions_table()[funcid] = function()
  local nucl = tex.nest.top.tail.nucleus
  local array = saved_array
  saved_array = nil
  if not array then
    tex.error(
      "Socket tagsupport/math/luamml/array/finalize without an array to be finalized. \z
      This is a bug",
      {
        "Please report this to the maintainer of the package defining\n\z
        the table command you just used.\n\z
        The socket tagsupport/math/luamml/array/finalize can only be used\n\z
        after saving a table with tagsupport/math/luamml/array/save, but\n\z
        no saved table could be found."
      }
    )
    return
  end
  if not nucl then
    tex.error(
      "Socket tagsupport/math/luamml/array/finalize executed in \z
      unexpected location. This is a bug",
      {
        string.format(
          "Please report this to the maintainer of the package defining\n\z
          the table command you just used.\n\z
          The socket tagsupport/math/luamml/array/finalize should always\n\z
          come directly after the math noad which contains the finalized\n\z
          array, but it appeared after a %s instead.",
          node.type(tex.nest.top.tail)
        )
      }
    )
    return
  end
  local props = nucl and properties[nucl]
  if not props then
    props = {}
    properties[nucl] = props
  end
  props.mathml_table = array
end
