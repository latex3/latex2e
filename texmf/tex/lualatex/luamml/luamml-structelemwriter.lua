--[[
   This file defines and returns the main function
   * write_elem(element,stash)
   which adds structure elements/tagging commands to the mathml

   The function has two arguments: tree (xml-tree), stash (boolean).
   The function is loaded by luamml-tex as `write_struct` and used there in
   save_result as `write_struct(mlist_result)` (so with stash=false/nil)
   and as `write_struct(xml, true)` in the callback.
--]]

local pdf_escape = require'luamml-pdf-escape'

-- Create tokens from the main tagpdf commands.
local struct_begin = token.create'tag_struct_begin:n'
local struct_use = token.create'tag_struct_use:n'
local struct_use_num = token.create'tag_struct_use_num:n'
local struct_end = token.create'tag_struct_end:'
local struct_prop_gput = token.create'__tag_struct_prop_gput:nnn'

local mc_begin = token.create'tag_mc_begin:n'
local mc_end = token.create'tag_mc_end:'

local tagpdfsetup = token.create'tagpdfsetup'

local lbrace, rbrace = token.new(string.byte'{', 1), token.new(string.byte'}', 2)

local math_char_t = node.id'math_char'

local escape_name = pdf_escape.escape_name
local escape_string = pdf_escape.escape_text
local bytes_to_luatex_string = pdf_escape.bytes_to_luatex_string

local ltx
local function get_ltx()
  ltx = _ENV.ltx
  if not ltx then
    tex.error("LaTeX PDF support not loaded", {"Maybe try adding \\DocumentMetadata."})
    ltx = {pdf = {object_id = function() return 0 end}, __tag = {tables = {}}}
  end
  function get_ltx()
    return ltx
  end
  return get_ltx()
end

-- a function to retrieve the object number of the mathml NS.
local mathml_ns_obj
local function get_mathml_ns_obj()
  mathml_ns_obj = get_ltx().pdf.object_id'tag/NS/mathml'
  if not mathml_ns_obj then
    tex.error("Failed to find MathML namespace", {"The PDF support does not know the mathml namespace"})
    mathml_ns_obj = 0
  end
  function get_mathml_ns_obj()
    return mathml_ns_obj
  end
  return get_mathml_ns_obj()
end

local tag_tables
local function get_tag_tables()
  tag_tables = assert(get_ltx().__tag.tables)
  function get_tag_tables()
    return tag_tables
  end
  return get_tag_tables()
end

local function get_struct_num_next()
  get_struct_num_next = get_ltx().tag.get_struct_num_next
  return get_struct_num_next()
end

-- a function to create and manage PDF MathML attributes. This is PDF 2.0 specific
local attribute_counter = 0
local attributes = setmetatable({}, {__index = function(t, k)
  attribute_counter = attribute_counter + 1
  local attr_name = string.format('luamml_attr_%i', attribute_counter)
  t[k] = attr_name
  tex.runtoks(function()
    tex.sprint(-2, tagpdfsetup, lbrace, 'role/new-attribute=', lbrace, attr_name, rbrace, lbrace, '/O/NSO/NS ', get_mathml_ns_obj(), ' 0 R')
    tex.cprint(12, bytes_to_luatex_string(k), rbrace, rbrace)
  end)
  return attr_name
end})

local attribute_object_refs = setmetatable({}, {__index = function(t, k)
  local objref = pdf.immediateobj(string.format('<< /O/NSO/NS %i 0 R%s >>', get_mathml_ns_obj(), k)) .. ' 0 R'
  t[k] = objref
  return objref
end})

-- the mc-(luatex)-attributes of tagpdf
local mc_type = luatexbase.attributes.g__tag_mc_type_attr
local mc_cnt = luatexbase.attributes.g__tag_mc_cnt_attr

local attrs = {}
local function build_attributes(tree_node)
  local i = 0
  for attr, val in next, tree_node do
    if type(attr) == 'string' and not string.find(attr, ':') and attr ~= 'xmlns' then
     i = i + 1
     attrs[i] = string.format('%s%s', escape_name(attr), escape_string(val))
    end
  end
  if i == 0 then return end
  table.sort(attrs)

  local attr_list = table.concat(attrs)
  for j = 1, i do attrs[j] = nil end

  return attr_list
end

local function convert_tounicode_to_utf8(touni)
  if type(touni) ~= 'string' or #touni % 4 ~= 0 then
    return false
  end
  local state
  local cps, j = {}, 0
  for i=1, #touni, 4 do
    local unit = tonumber(string.sub(touni, i, i + 3), 16)
    local high = unit & 0xFC00
    if high == 0xD800 then
      if state then
        return false
      end
      state = (unit & 0x3FF) << 10
    elseif high == 0xDC00 then
      if not state then
        return false
      end
      j = j + 1
      cps[j], state = 0x10000 + (state | (unit & 0x3FF)), nil
    else
      if state then
        return false
      end
      j = j + 1
      cps[j] = unit
    end
  end
  return utf8.char(table.unpack(cps, 1, i))
end

local tounicode_font_cache = setmetatable({[0] = false}, {__index = function(t, fid)
  local fontdata = font.getfont(fid)
  if not fontdata then
    t[fid] = false
    return false
  end
  local characters = fontdata.characters
  local result = setmetatable({}, {__index = function(t, cp)
    local c = characters[cp]
    local touni = c and c.tounicode
    local result = false
    if touni then
      result = convert_tounicode_to_utf8(touni) or false
      if not result then
        print'ERROR: Invalid ToUnicode?'
        print(touni)
      end
    end
    t[cp] = result
    return result
  end})
  t[fid] = result
  return result
end})

local tounicode_fam_cache = setmetatable({}, {__index = function(t, mathfont_locator)
  local fam = mathfont_locator >> 2
  local size = mathfont_locator & 3
  if size ~= 0 then
    size = size - 1
  end
  local fid = node.family_font(fam, size) -- Always using textsize. Should be enough for this usecase unless you do something weird.
  local result = tounicode_font_cache[fid]
  t[mathfont_locator] = result
  return result
end})

local function try_derive_actual(tree)
  if tree[':actual'] then return end -- No need to derive actualtext if it's already there
  if tree[':artifact'] then return end -- No need to provide actual text for artifacts
  for i=1, #tree do
    if type(tree[i]) ~= 'string' then
      return
    end
  end
  local nodes = assert(tree[':nodes'])
  if #nodes == 0 then
    return -- Can't be used without nodes since there's no MC to annotate.
  end
  local intended_text = table.concat(tree)
  local derived_text = {}
  for i=1, #nodes do
    local n = nodes[i]
    if n.id ~= math_char_t then
      derived_text = false
      break
    end
    local fam, cp = n.fam, n.char
    local size = (tree[':style'] or 0) >> 1
    local unicode_mapping = tounicode_fam_cache[(fam << 2) | size]
    unicode_mapping = unicode_mapping and unicode_mapping[cp]
    if not unicode_mapping then
      derived_text = false
      break
    end
    derived_text[i] = unicode_mapping
  end
  derived_text = derived_text and table.concat(derived_text)
  if intended_text ~= derived_text then
    tree[':actual'] = intended_text
  end
end

local stash_cnt = 0
local function write_elem(tree, stash)
  if tree[':struct'] then
    return tex.runtoks(function()
      return tex.sprint(-2, struct_use, lbrace, tree[':struct'], rbrace)
    end)
  end

  local attrs = build_attributes(tree)

  if tree[':structnum'] then
    return tex.runtoks(function()
      local structnum = tree[':structnum']
      if attrs then
        local current_attrs = get_tag_tables()[string.format('g__tag_struct_%i_prop', structnum)].A
        local stripped_attrs = current_attrs and current_attrs:match'^%s*%[(.*)%]%s$' or current_attrs
        attrs = attribute_object_refs[attrs]
        local new_attrs = stripped_attrs and string.format('[%s %s]', stripped_attrs, attrs) or attrs
        tex.sprint(-2, struct_prop_gput, lbrace, structnum, rbrace, lbrace, 'A', rbrace, lbrace, new_attrs, rbrace)
      end
      return tex.sprint(-2, struct_use_num, lbrace, tree[':structnum'], rbrace)
    end)
  end
  if not tree[0] then print('ERR', require'inspect'(tree)) end

  if stash then
    tree[':structnum'] = get_struct_num_next()
    stash = ', stash'
  end

  attrs = attrs and attributes[attrs]
  tex.sprint(-2, struct_begin, lbrace, 'tag=', lbrace, tree[0], '/mathml', rbrace) -- 'tag=mo/mathml' is supported syntax
  if stash then tex.sprint(-2, stash) end
  if attrs then tex.sprint(-2, ', attribute=' .. attrs) end
  tex.sprint(rbrace)

  if tree[':nodes'] then
    local n = tree[':nodes']
    try_derive_actual(tree)
    tex.runtoks(function()
    -- luamml-convert sets :actual on some nodes in delim_to_table and acc_to_table.
      if tree[':artifact'] then
        tex.sprint(-2, mc_begin, lbrace, 'artifact', rbrace)
      elseif tree[':actual'] then
        tex.sprint(-2, mc_begin, lbrace, 'tag=Span,actualtext=')
        tex.cprint(12, lbrace, tree[':actual'], rbrace, rbrace)
      else
        tex.sprint(-2, mc_begin, lbrace, 'tag=', lbrace, tree[0], rbrace, rbrace)
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

return {
  write = function(element, stash)
    return write_elem(element, stash)
  end,
  restore_after_math = function()
   tex.runtoks(function()
      tex.sprint(-2, mc_begin, lbrace, rbrace)
   end)
  end,
}
