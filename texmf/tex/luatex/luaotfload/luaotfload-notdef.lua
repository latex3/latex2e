-----------------------------------------------------------------------
--         FILE:  luaotfload-notdef.lua
--  DESCRIPTION:  part of luaotfload / notdef
-----------------------------------------------------------------------

local ProvidesLuaModule = { 
    name          = "luaotfload-notdef",
    version       = "3.00",       --TAGVERSION
    date          = "2019-09-13", --TAGDATE
    description   = "luaotfload submodule / color",
    license       = "GPL v2.0",
    author        = "Marcel Krüger"
}

if luatexbase and luatexbase.provides_module then
  luatexbase.provides_module (ProvidesLuaModule)
end  

local flush_node         = node.direct.flush_node
local getfont            = font.getfont
local getnext            = node.direct.getnext
local getwhd             = node.direct.getwhd
local insert             = table.insert
local insert_after       = node.direct.insert_after
local kern_id            = node.id'kern'
local nodenew            = node.direct.new
local otfregister        = fonts.constructors.features.otf.register
local protect_glyph      = node.direct.protect_glyph
local remove             = node.direct.remove
local setfont            = node.direct.setfont
local traverse_char      = node.direct.traverse_char

-- According to DerivedCoreProperties.txt, Default_Ignorable_Code_Point
-- is generated from:
--    Other_Default_Ignorable_Code_Point
--  + Cf (Format characters)
--  + Variation_Selector
--  - White_Space
--  - FFF9..FFFB (Interlinear annotation format characters)
--  - 13430..13438 (Egyptian hieroglyph format characters)
--  - Prepended_Concatenation_Mark (Exceptional format characters that should be visible)
-- Based on HarfBuzz, we add the exclusion
--  - Lo (Letter, Other)
-- This affects Hangul fillers.
local ignorable_codepoints do
  local sep = lpeg.P' '^0 * ';' * lpeg.P' '^0
  local codepoint = lpeg.S'0123456789ABCDEF'^4/function(c)return tonumber(c, 16)end
  local codepoint_range = codepoint * ('..' * codepoint + lpeg.Cc(false))
  local function multirawset(table, key1, key2, value)
    for key = key1,(key2 or key1) do
      rawset(table, key, value)
    end
    return table
  end
  local entry = lpeg.Cg(codepoint * ';' * (1-lpeg.P';')^0 * ';Cf;' * lpeg.Cc(true))^-1 * (1-lpeg.P'\n')^0 * '\n'
  local file = lpeg.Cf(
      lpeg.Ct''
    * entry^0
  , rawset)
  local f = io.open(kpse.find_file"UnicodeData.txt")
  ignorable_codepoints = file:match(f:read'*a')
  f:close()
  entry = lpeg.Cg(codepoint_range * sep * ('Other_Default_Ignorable_Code_Point' * lpeg.Cc(true)
                                               + 'Variation_Selector' * lpeg.Cc(true)
                                               + 'White_Space' * lpeg.Cc(nil)
                                               + 'Prepended_Concatenation_Mark' * lpeg.Cc(nil)
                                          ) * ' # ' * (1-lpeg.P'Lo'))^-1 * (1-lpeg.P'\n')^0 * '\n'
  file = lpeg.Cf(
      lpeg.Carg(1)
    * entry^0
  , multirawset)
  f = io.open(kpse.find_file"PropList.txt")
  ignorable_codepoints = file:match(f:read'*a', 1, ignorable_codepoints)
  f:close()
  for i = 0xFFF9,0xFFFB do
    ignorable_codepoints[i] = nil
  end
  for i = 0x13430,0x13438 do
    ignorable_codepoints[i] = nil
  end
end

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
  -- If this didn't happen, it might be mapped to one of the
  -- replacement characters:
  for code = 0xFFFC,0xFFFF do
    guess = desc[code]
    if guess and guess.index == 0 then
      tfmdata.notdefcode = code
      return
    end
  end
  -- Oh no, we couldn't find it. Maybe we can find it by name?
  local code = tfmdata.resources.unicodes[".notdef"]
  -- Better safe than sorry
  guess = code and desc[code]
  if guess and guess.index == 0 then
    tfmdata.notdefcode = code
    return
  end
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
    if w == 0 and h == 0 and d == 0 and not chars[cid] and not ignorable_codepoints[cid] then
      local notdefnode = nodenew(glyph_id, 256)
      setfont(notdefnode, font, notdef)
      insert_after(cur, cur, notdefnode)
      protect_glyph(cur)
    end
  end end
end

otfregister {
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

function fonts.handlers.otf.handlers.gsub_remove(head,char,dataset,sequence,replacement)
  local next
  head, next = remove(head, char)
  flush_node(char)
  if not head and not next then -- Avoid a double free if we were alone
    head = nodenew(kern_id)
  end
  return head, next, true, true
end

local sequence = {
  features = {invisible = {["*"] = {["*"] = true}}},
  flags = {false, false, false, false},
  name = "invisible",
  order = {"invisible"},
  nofsteps = 1,
  steps = {{
    coverage = ignorable_codepoints,
    index = 1,
  }},
  type = "gsub_remove",
}
local function invisibleinitialiser(tfmdata, value)
  local resources = tfmdata.resources
  local sequences = resources and resources.sequences
  if sequences then
    -- Now we get to the interesting part: At which point should our new sequence be inserted? Let's do it at the end, then they are still seen by all features.
    insert(sequences, sequence)
  end
end
otfregister {
  name = 'invisible',
  description = 'Remove invisible control characters',
  default = true,
  initializers = {
    node = invisibleinitialiser,
  },
}

--- vim:sw=2:ts=2:expandtab:tw=71
