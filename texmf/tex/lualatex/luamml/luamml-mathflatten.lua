local direct = node.direct

local todirect, tonode = direct.todirect, direct.tonode
local traverse, getfield, getid, getsubtype, getlist, getnext, getsub, getsup, getnucleus, getnext, tail, getboth = direct.traverse, direct.getfield, direct.getid, direct.getsubtype, direct.getlist, direct.getnext, direct.getsub, direct.getsup, direct.getnucleus, direct.getnext, direct.tail, direct.getboth
local setfield, setnucleus, setlist, setlink, flush_node, remove = direct.setfield, direct.setnucleus, direct.setlist, direct.setlink, direct.flush_node, direct.remove

local sub_mlist = node.id'sub_mlist'

local simple_noad = node.id'noad'
local accent_noad = node.id'accent'
local style_noad = node.id'style'
local choice_noad = node.id'choice'
local radical_noad = node.id'radical'
local fraction_noad = node.id'fraction'
local fence_noad = node.id'fence'
local whatsit_noad = node.id'whatsit'
local user_defined_sub = node.subtype'user_defined'

local flattened_user_id = luatexbase.new_whatsit'flattened'

local process_mlist

local function process_kernel_field(noad, fieldname, outer_head)
  local kernel = getfield(noad, fieldname)
  if not kernel then return noad, outer_head end
  if getid(kernel) ~= sub_mlist then return noad, outer_head end
  local nested = getlist(kernel)
  local force_flatten
  nested, force_flatten = process_mlist(nested)
  if force_flatten and outer_head then
    if getsub(noad) or getsup(noad) then return noad, outer_head end
    local nested_tail = tail(nested)
    local before, after = getboth(noad)
    if noad == outer_head then
      outer_head = nested or after
    else
      setlink(before, nested)
    end
    setlink(nested_tail, after)
    setlist(kernel, nil)
    flush_node(noad)
    return nil, outer_head, after
  end
  setlist(kernel, nested)
  if not nested or getnext(nested) then return noad, outer_head end
  if getid(nested) ~= simple_noad then return noad, outer_head end
  if getsub(nested) or getsup(nested) then return noad, outer_head end
  if getsubtype(nested) ~= 0 then return noad, outer_head end -- Only flatten mathord. Maybe extend?
  setfield(noad, fieldname, getnucleus(nested))
  setnucleus(nested, nil)
  flush_node(kernel)
  return noad, outer_head
end
function process_mlist(head)
  local force_flatten
  local next_node, state, n = traverse(head)
  while true do
    local id, subtype
    n, id, subtype = next_node(state, n)
    if n == nil then break end
    if id == simple_noad then
      n, head, state = process_kernel_field(n, 'nucleus', head)
      process_kernel_field(n, 'sub')
      process_kernel_field(n, 'sup')
    elseif id == accent_noad then
      process_kernel_field(n, 'nucleus')
      process_kernel_field(n, 'sub')
      process_kernel_field(n, 'sup')
    -- elseif id == style_noad then
    elseif id == choice_noad then
      process_kernel_field(n, 'display')
      process_kernel_field(n, 'text')
      process_kernel_field(n, 'script')
      process_kernel_field(n, 'scriptscript')
    elseif id == radical_noad then
      process_kernel_field(n, 'nucleus')
      process_kernel_field(n, 'sub')
      process_kernel_field(n, 'sup')
    elseif id == fraction_noad then
      process_kernel_field(n, 'num')
      process_kernel_field(n, 'denom')
    -- elseif id == fence_noad then
    elseif id == whatsit_noad and subtype == user_defined_sub and getfield(n, 'user_id') == flattened_user_id then
      head, state = remove(head, n)
      flush_node(n)
      n = nil
      force_flatten = true
    end
  end
  return head, force_flatten
end

luatexbase.add_to_callback('pre_mlist_to_hlist_filter', function(head) return tonode(process_mlist(todirect(head))) end, 'luamml.mathflatten')

local function new_whatsit()
  local n = node.new(whatsit_noad, user_defined_sub)
  n.user_id, n.type = flattened_user_id, 100 -- Type 100 == 'd' = decimal. No actual value, so decimal reduces overhead
  return n
end

local func = luatexbase.new_luafunction'__luamml_flatten_current_mlist:'
token.set_lua('__luamml_flatten_current_mlist:', func, 'protected')
lua.get_functions_table()[func] = function()
  node.write(new_whatsit())
end

return {
  user_id = flattened_user_id,
  new_whatsit = new_whatsit,
}
