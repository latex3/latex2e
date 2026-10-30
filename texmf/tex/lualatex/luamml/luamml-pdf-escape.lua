local byte, char, concat, codes, unpack = string.byte, string.char, table.concat, utf8.codes, table.unpack

local function to_utf16(s)
  local i = 3
  local bytes = {0xFE, 0xFF}
  for _, c in codes(s) do
    if c < 0x10000 then
      -- assert(c < 0xD800 or c >= 0xE000)
      bytes[i] = c >> 8
      bytes[i+1] = c & 0xFF
      i = i+2
    else
      c = c-0x10000
      bytes[i] = 0xD8 | ((c>>18) & 3)
      bytes[i+1] = (c>>10) & 0xFF
      bytes[i+2] = 0xDC | ((c>>8) & 3)
      bytes[i+3] = c & 0xFF
      i = i+4
    end
  end
  return char(unpack(bytes))
end
local l = lpeg
-- \x16 might be a typo in the spec, just exclude it to be safe.
local pdfdoc_matches_utf8 = l.R('\x00\x15', '\x00\x15', '\x17\x17', '\x20\x7e')^0 * -1
local simple_char = 1-l.S'()\\\n\r'
local semi_simple_char = simple_char + l.P'\\'/'\\\\'
local nested = l.P{'(' * (semi_simple_char + l.V(1))^0 * ')'}
local inner = (semi_simple_char + nested + (l.Cc'\\' * l.S'()'))^0 * -1
local patt = l.Cs(l.Cc'(' * inner * l.Cc')')

local function escape_text(s)
  s = tostring(s)
  if not pdfdoc_matches_utf8:match(s) then
    s = to_utf16(s)
  end
  return patt:match(s)
end

local name_unescaped_char = l.R'\x21\x7e' - l.S'#()<>[]{}/%'
local name_escaped_byte = l.P(1) / function(s) string.format('#%02x', byte(s)) end
local escaped_name = l.Cs(l.Cc'/' * (name_unescaped_char + name_escaped_byte)^0)

local function escape_name(s)
  return escaped_name:match(s)
end

local function hide_bytes(s)
  local t1 = {byte(s, 1, -1)}
  for i = 1, #t1 do
    local c = t1[i]
    t1[i] = char(0xF4, 0x90, 0x80 | c >> 6, 0x80 | (c & 0x3F))
  end
  return concat(t1)
end

return {
  escape_text = escape_text,
  escape_name = escape_name,
  bytes_to_luatex_string = hide_bytes,
}
