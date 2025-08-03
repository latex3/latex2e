--[[
   This file returns an anonymous function 
   with the arguments element, indent, version, which 
   write the mathml tree through the here defined write_elem(tree, indent) 
   function to a file or to a stream.
   
   Used by luamml-tex as write_xml in save_result. 
--]]

-- FIXME: Not sure yet if this will be needed
local function escape_name(name)
  return name
end

local escapes = {
  ['"'] = "&quot;",
  ['<'] = "&lt;",
  ['>'] = "&gt;",
  ['&'] = "&amp;",
}
local function escape_text(text)
  return string.gsub(string.gsub(tostring(text), '["<>&]', escapes), '[\x00-\x08\x0B\x0C\x0E-\x1F]', function(x)
    return string.format('^^%02x', string.byte(x))
  end)
end

local attrs = {}
local function write_elem(tree, indent)
  if not tree[0] then print('ERR', require'inspect'(tree)) end
  local escaped_name = escape_name(assert(tree[0]))
  local i = 0
  for attr, val in next, tree do if type(attr) == 'string' then
    if not string.find(attr, ':', 1, true) then
    -- if string.byte(attr) ~= 0x3A then
      i = i + 1
      attrs[i] = string.format(' %s="%s"', escape_name(attr), escape_text(val))
    end
  end end
  table.sort(attrs)
  local out = string.format('%s<%s%s', indent or '', escaped_name, table.concat(attrs))
  for j = 1, i do attrs[j] = nil end
  if not tree[1] then
    return out .. '/>'
  end
  out = out .. '>'
  -- Never indent the content if it's purely text.
  if #tree == 1 and type(tree[1]) == 'string' then
    indent = nil
  end
  local inner_indent = indent and indent .. '  '
  local is_string
  for _, elem in ipairs(tree) do
    if type(elem) == 'string' then
      if inner_indent and not is_string then
        out = out .. inner_indent
      end
      out = out .. escape_text(elem)
      is_string = true
    else
      out = out .. write_elem(elem, inner_indent)
      is_string = nil
    end
  end
  if indent then out = out .. indent end
  return out .. '</' .. escaped_name .. '>'
end

return function(element, indent, version)
  return (version == '11' and '<?xml version="1.1"?>' or '') ..
    write_elem(element, indent and '\n' or nil)
end
