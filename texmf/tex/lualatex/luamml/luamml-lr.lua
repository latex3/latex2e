--[[ This file returns the function 
     * to_unicode which returns characters inside an mtext

     The file is loaded by 
     * luamml-convert.lua (as to_text)
     * luamml-amsmath.lua (as to_text)
     * luamml-array.lua (as to_text)
--]]

local properties = node.get_properties_table()

local function to_unicode(head, tail)
  local result, i = {[0] = 'mtext'}, 0
  local characters, last_fid
  local iter, state, n = node.traverse(head)
  while true do
    local id, sub n, id, sub = iter(state, n)
    if not n or n == tail then break end
    local props = properties[n]
    if props and props.glyph_info then
      i = i+1
      result[i] = glyph_info
    else
      local char, fid = node.is_glyph(n)
      if char then
        if fid ~= last_fid then
          local fontdir = font.getfont(fid)
          characters, last_fid = fontdir.characters, fid
        end
        local uni = characters[char]
        local uni = uni and uni.unicode
        i = i+1
        if uni then
          if type(uni) == 'number' then
            result[i] = utf.char(uni)
          else
            result[i] = utf.char(table.unpack(uni))
          end
        else
          if char < 0x110000 then
            result[i] = utf.char(char)
          else
            result[i] = '\u{FFFD}'
          end
        end
      elseif node.id'math' == id then
        if props then
          local mml = props.saved_mathml_table or props.saved_mathml_core
          if mml then
            i = i+1
            result[i] = mml
            n = node.end_of_math(n)
          end
        end
      -- elseif node.id'whatsit' == id then
        -- TODO(?)
      elseif node.id'glue' == id then
        if n.width > 1000 then -- FIXME: Coordinate constant with tagpdf
          i = i+1
          result[i] = '\u{00A0}' -- non breaking space... There is no real reason why it has to be non breaking, except that MathML often ignore other spaces
        end
      elseif node.id'hlist' == id then
        local nested = to_unicode(n.head)
        table.move(nested, 1, #nested, i+1, result)
        i = i+#nested
      elseif node.id'vlist' == id then
        i = i+1
        result[i] = '\u{FFFD}'
      elseif node.id'rule' == id then
        if n.width ~= 0 then
          i = i+1
          result[i] = '\u{FFFD}'
        end
      elseif node.id'disc' == id then
        local subresult = to_unicode(n.replace)
        table.move(subresult, 1, #subresult, i + 1, result)
        i = i+#subresult
      end -- CHECK: Everything else can probably be ignored, otherwise shout at me
    end
  end
  return result
end

return to_unicode
