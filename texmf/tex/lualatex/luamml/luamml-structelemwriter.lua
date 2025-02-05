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

local attribute_counter = 0
local attributes = setmetatable({}, {__index = function(t, k)
  attribute_counter = attribute_counter + 1
  local attr_name = string.format('luamml_attr_%i', attribute_counter)
  t[k] = attr_name
  tex.runtoks(function()
    tex.sprint(catlatex,string.format('\\tagpdfsetup{newattribute={%s}{/O/NSO/NS %i 0 R',
        attr_name, mathml_ns_obj or get_mathml_ns_obj()))
    -- tex.sprint(string.format('\\tagpdfsetup{newattribute={%s}{/O/MathML-3',
    --     attr_name))
    tex.cprint(12, k)
    tex.sprint'}}'
  end)
  return attr_name
end})

local mc_type = luatexbase.attributes.g__tag_mc_type_attr
local mc_cnt = luatexbase.attributes.g__tag_mc_cnt_attr
-- print('!!!', mc_type, mc_cnt)

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
  for attr, val in next, tree do if type(attr) == 'string' and not string.find(attr, ':') and attr ~= 'xmlns' then
  -- for attr, val in next, tree do if type(attr) == 'string' and string.byte(attr) ~= 0x3A then
    i = i + 1
    attrs[i] = string.format('/%s(%s)', escape_name(attr), escape_string(val))
  end end
  table.sort(attrs)

  if stash then
    tree[':structnum'] = get_ltx().tag.get_struct_num_next()
    stash = ', stash, '
  end

  local attr_flag = i ~= 0 and ', attribute=' .. attributes[table.concat(attrs)]
  tex.sprint(struct_begin, '{tag=' .. tree[0] .. '/mathml')
  if stash then tex.sprint(stash) end
  if attr_flag then tex.sprint(attr_flag) end
  tex.sprint'}'
  for j = 1, i do attrs[j] = nil end

  if tree[':nodes'] then
    local n = tree[':nodes']
    tex.runtoks(function()
      if tree[':actual'] then
       tex.sprint(mc_begin,'{tag=Span,actualtext=')
       tex.cprint(12,tree[':actual'])
       tex.sprint('}')
      else
       tex.sprint{mc_begin, string.format('{tag=%s}', tree[0])}
      end
      -- NOTE: This will also flush all previous sprint's... That's often annoying, but in this case actually intentional.
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
