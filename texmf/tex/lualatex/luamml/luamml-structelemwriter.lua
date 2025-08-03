--[[
   This file defines and returns the main function
   * write_elem(element,stash) 
   which adds structure elements/tagging commands to the mathml
   
   The function has two arguments: tree (xml-tree), stash (boolean). 
   The function is loaded by luamml-tex as `write_struct` and used there in 
   save_result as `write_struct(mlist_result)` (so with stash=false/nil)
   and as `write_struct(xml, true)` in the callback.
--]]

-- Create tokens from the main tagpdf commands.
local struct_begin = token.create'tag_struct_begin:n'
local struct_use = token.create'tag_struct_use:n'
local struct_use_num = token.create'tag_struct_use_num:n'
local struct_end = token.create'tag_struct_end:'

local mc_begin = token.create'tag_mc_begin:n'
local mc_end = token.create'tag_mc_end:'

local catlatex       = luatexbase.registernumber("catcodetable@latex")

local function escape_name(name)
  return name
end

local function escape_string(str)
  return str
end

local ltx
local function get_ltx()
  if not ltx then
    ltx = _ENV.ltx
    if not ltx then
      tex.error("LaTeX PDF support not loaded", {"Maybe try adding \\DocumentMetadata."})
      ltx = {pdf = {object_id = function() return 0 end}}
    end
  end
  return ltx
end

-- a function to retrieve the object number of the mathml NS. 
local mathml_ns_obj
local function get_mathml_ns_obj()
  if not mathml_ns_obj then
    mathml_ns_obj = get_ltx().pdf.object_id'tag/NS/mathml'
    if not mathml_ns_obj then
      tex.error("Failed to find MathML namespace", {"The PDF support does not know the mathml namespace"})
      mathml_ns_obj = 0
    end
  end
  return mathml_ns_obj
end

-- a function to create and manage PDF MathML attributes. This is PDF 2.0 specific
local attribute_counter = 0
local attributes = setmetatable({}, {__index = function(t, k)
  attribute_counter = attribute_counter + 1
  local attr_name = string.format('luamml_attr_%i', attribute_counter)
  t[k] = attr_name
  tex.runtoks(function()
    tex.sprint(catlatex,string.format('\\tagpdfsetup{newattribute={%s}{/O/NSO/NS %i 0 R',
        attr_name, mathml_ns_obj or get_mathml_ns_obj()))
    tex.cprint(12, k)
    tex.sprint'}}'
  end)
  return attr_name
end})

-- the mc-(luatex)-attributes of tagpdf
local mc_type = luatexbase.attributes.g__tag_mc_type_attr
local mc_cnt = luatexbase.attributes.g__tag_mc_cnt_attr


local stash_cnt = 0
local attrs = {}
local function write_elem(tree, stash)
  if tree[':struct'] then
    return tex.runtoks(function()
      return tex.sprint(struct_use, '{', tree[':struct'], '}')
    end)
  end
  if tree[':structnum'] then
    return tex.runtoks(function()
      return tex.sprint(struct_use_num, '{', tree[':structnum'], '}')
    end)
  end
  if not tree[0] then print('ERR', require'inspect'(tree)) end
  local i = 0
  for attr, val in next, tree do 
    if type(attr) == 'string' and not string.find(attr, ':') and attr ~= 'xmlns' then    
     i = i + 1
     attrs[i] = string.format('/%s(%s)', escape_name(attr), escape_string(val))
    end 
  end
  table.sort(attrs)

  if stash then
    tree[':structnum'] = get_ltx().tag.get_struct_num_next()
    stash = ', stash, '
  end

  local attr_flag = i ~= 0 and ', attribute=' .. attributes[table.concat(attrs)]
  tex.sprint(struct_begin, '{tag=' .. tree[0] .. '/mathml') -- 'tag=mo/mathml' is supported syntax
  if stash then tex.sprint(stash) end
  if attr_flag then tex.sprint(attr_flag) end
  tex.sprint'}'
  for j = 1, i do attrs[j] = nil end

  if tree[':nodes'] then
    local n = tree[':nodes']
    tex.runtoks(function()
    -- luamml-convert sets :actual on some nodes in delim_to_table and acc_to_table.
      if tree[':actual'] then
       tex.sprint(mc_begin,'{tag=Span,actualtext=')
       tex.cprint(12,tree[':actual'])
       tex.sprint('}')
      else
       tex.sprint{mc_begin, string.format('{tag=%s}', tree[0])}
      end
      -- NOTE: This will also flush all previous sprint's... That's often annoying, but in this 
      -- case actually intentional.
    end)
    local mct, mcc = tex.attribute[mc_type], tex.attribute[mc_cnt]
    for i = 1, #n do
      node.set_attribute(n[i], mc_type, mct)
      node.set_attribute(n[i], mc_cnt, mcc)
    end
    tex.runtoks(function()
      tex.sprint(mc_end)
    end)
  end
  for _, elem in ipairs(tree) do
    if type(elem) ~= 'string' then
      write_elem(elem)
    end
  end
  tex.runtoks(function()
    tex.sprint(struct_end)
  end)
end

return function(element, stash)
  return write_elem(element, stash)
end
