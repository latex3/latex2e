-----------------------------------------------------------------------
--         FILE:  luaotfload-unicode.lua
--  DESCRIPTION:  part of luaotfload / unicode
-----------------------------------------------------------------------

local ProvidesLuaModule = { 
    name          = "luaotfload-unicode",
    version       = "3.00",       --TAGVERSION
    date          = "2019-09-13", --TAGDATE
    description   = "luaotfload submodule / Unicode helpers",
    license       = "CC0 1.0 Universal",
    author        = "Marcel Krüger"
}

if luatexbase and luatexbase.provides_module then
  luatexbase.provides_module (ProvidesLuaModule)
end  

local utf8codes = utf8.codes
local utf8char = utf8.char
local sub = string.sub
local unpack = table.unpack
local concat = table.concat
local move = table.move

local codepoint = lpeg.S'0123456789ABCDEF'^4/function(c)return tonumber(c, 16)end
local empty = {}
local result = {}

local casefold do
  local nl = ('#' * (1-lpeg.P'\n')^0)^-1 * '\n'
  local entry = codepoint * "; " * lpeg.C(1) * ";" * lpeg.Ct((' ' * codepoint)^1) * "; " * nl
  local file = lpeg.Cf(
      lpeg.Ct(
          lpeg.Cg(lpeg.Ct"", "C")
        * lpeg.Cg(lpeg.Ct"", "F")
        * lpeg.Cg(lpeg.Ct"", "S")
        * lpeg.Cg(lpeg.Ct"", "T"))
    * nl^0 * lpeg.Cg(entry)^0 * nl^0 * -1
  , function(t, base, class, mapping)
    rawset(rawget(t, class), base, mapping)
    return t
  end)

  local f = io.open(kpse.find_file"CaseFolding.txt")
  local data = file:match(f:read'*a')
  f:close()
  function casefold(s, full, special)
    local first = special and data.T or empty
    local second = data.C
    local third = full and data.F or data.S
    local result = result
    for i = #result, 1, -1 do result[i] = nil end
    local i = 1
    for _, c in utf8codes(s) do
      local datum = first[c] or second[c] or third[c]
      if datum then
        local l = #datum
        move(datum, 1, l, i, result)
        i = i + l
      else
        result[i] = c
        i = i + 1
      end
    end
    return utf8char(unpack(result))
  end
end

local alphnum_only do
  local niceentry = lpeg.Cg(codepoint * ';' * (1-lpeg.P';')^0 * ';' * lpeg.S'LN' * lpeg.Cc(true))
  local entry = niceentry^0 * (1-lpeg.P'\n')^0 * lpeg.P'\n'
  local file = lpeg.Cf(
      lpeg.Ct''
    * entry^0
  , rawset)

  local f = io.open(kpse.find_file"UnicodeData.txt")
  local data = file:match(f:read'*a')
  f:close()
  function alphnum_only(s)
    local result = result
    for i = #result, 1, -1 do result[i] = nil end
    local nice = nil
    for p, c in utf8codes(s) do
      if data[c]
          or (c >= 0x3400 and c<= 0x3DB5)
          or (c >= 0x4E00 and c<= 0x9FEF)
          or (c >= 0xAC00 and c<= 0xD7A3)
          then
        if not nice then nice = p end
      else
        if nice then
          result[#result + 1] = sub(s, nice, p-1)
          nice = nil
        end
      end
    end
    if nice then
      result[#result + 1] = sub(s, nice, #s)
    end
    return concat(result)
  end
end

return {
  casefold = casefold,
  alphnum_only = alphnum_only,
}
