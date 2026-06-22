local function create_whatsit()
  local n = node.new(whatsit_noad, user_defined_sub)
  n.user_id, n.type = flattened_user_id, 100 -- Type 100 == 'd' = decimal. No actual value, so decimal reduces overhead
  return n
end

local new_flatten_whatsit = require'luamml-mathflatten'.new_whatsit

local nest = tex.nest
local lbrace, rbrace = token.create(string.byte'{'), token.create(string.byte'}')

local function finish()
  local top = nest.top
  local head = top.head
  local first = head.next
  if first and first == top.tail then
    head.next, top.tail = nil, head
  else
    node.write(new_flatten_whatsit())
    first = nil
  end
  local outer = nest[nest.ptr - 1]
  local saved_outer_mode = outer.mode
  local saved_inner_mode = top.mode
  tex.runtoks(function()
    top.mode = saved_inner_mode
    token.put_next(rbrace)
  end)
  outer.mode = saved_outer_mode
  if first then
    node.free(node.last_node())
    node.write(first)
    return first
  else
    return nest.top.tail
  end
end

-- By hiding the `{` in a non-expandable, non-brace, non-relax token we avoid weird interactions
-- in e.g. subscripts.
local func = luatexbase.new_luafunction'__luamml_flattened_mathgroup_begin:'
token.set_lua('__luamml_flattened_mathgroup_begin:', func, 'protected')
lua.get_functions_table()[func] = function()
  token.put_next(lbrace)
end

local func = luatexbase.new_luafunction'__luamml_flattened_mathgroup_finish:'
token.set_lua('__luamml_flattened_mathgroup_finish:', func, 'protected')
lua.get_functions_table()[func] = function()
  finish()
end

return {
  finish = finish,
}

