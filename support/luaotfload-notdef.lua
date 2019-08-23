-----------------------------------------------------------------------
--         FILE:  luaotfload-notdef.lua
--  DESCRIPTION:  part of luaotfload / notdef
-----------------------------------------------------------------------

local ProvidesLuaModule = { 
    name          = "luaotfload-notdef",
    version       = "2.991",       --TAGVERSION
    date          = "2019-08-11", --TAGDATE
    description   = "luaotfload submodule / color",
    license       = "GPL v2.0",
    author        = "Marcel Krüger"
}

if luatexbase and luatexbase.provides_module then
  luatexbase.provides_module (ProvidesLuaModule)
end  

local nodenew            = node.direct.new
local getfont            = font.getfont
local setfont            = node.direct.setfont
local getwhd             = node.direct.getwhd
local insert_after       = node.direct.insert_after
local traverse_char      = node.direct.traverse_char
local protect_glyph      = node.direct.protect_glyph
local otffeatures        = fonts.constructors.newfeatures "otf"

local function setnotdef(tfmdata, factor)
  local desc = tfmdata.shared.rawdata.descriptions
  -- So we have to find the .notdef glyph. We only know that it has GID
  -- 0, but we need it's Unicode mapping. Normally it isn't mapped in
  -- the font, so we auto-assigned the first private slot:
  local guess = desc[0xF0000]
  if guess and guess.index == 0 then
    tfmdata.notdefcode = 0xF0000
    return
  end
  print')'
  -- If this didn't happen, it might be mapped to one of the
  -- replacement characters:
  for code = 0xFFFC,0xFFFF do
    guess = desc[code]
    if guess and guess.index == 0 then
      tfmdata.notdefcode = code
      return
    end
  end
  print')))'
  -- Oh no, we couldn't find it. Maybe we can find it by name?
  local code = tfmdata.resources.unicodes[".notdef"]
  -- Better safe than sorry
  guess = code and desc[code]
  if guess and guess.index == 0 then
    tfmdata.notdefcode = code
    return
  end
  print'))))'
  -- So the font didn't do the obvious things and then it lied to us.
  -- At this point we should think about sending an automated complain
  -- to the font author, but we probably can't trust the contact
  -- information either.
  -- We will fall back to brute force now:
  for code, char in pairs(desc) do
    if char.index == 0 then
      tfmdata.notdefcode = code
      return
    end
  end
  -- If we ever reach this point, something odd happened. Either there
  -- are no glyphs at all (then LuaTeX will complain anyway, so let's
  -- ignore that case) or someone tried to use this with a legacy font.
  -- In that case there most likely isn't a `.notdef` glyph anyway and
  -- inserting glyph 0 would insert a random character, so `notdefcode`
  -- better stays `nil`.
end

local glyph_id = node.id'glyph'
local function donotdef(head, font, _, _, _)
  local tfmdata = getfont(font)
  local notdef, chars = tfmdata.unscaled.notdefcode, tfmdata.characters
  if not notdef then return end
  for cur, cid, fid in traverse_char(head) do if fid == font then
    local w, h, d = getwhd(cur)
    if w == 0 and h == 0 and d == 0 and not chars[cid] then
      local notdefnode = nodenew(glyph_id, 256)
      setfont(notdefnode, font, notdef)
      insert_after(cur, cur, notdefnode)
      protect_glyph(cur)
    end
  end end
end

otffeatures.register {
  name        = "notdef",
  description = "Add notdef glyphs",
  default     = 1,
  initializers = {
    node = setnotdef,
  },
  processors = {
    node = donotdef,
  }
}

--- vim:sw=2:ts=2:expandtab:tw=71
