-----------------------------------------------------------------------
--         FILE:  luaotfload-multiscript.lua
--  DESCRIPTION:  part of luaotfload / multiscript
-----------------------------------------------------------------------

local ProvidesLuaModule = {
    name          = "luaotfload-multiscript",
    version       = "3.00",     --TAGVERSION
    date          = "2019-09-13", --TAGDATE
    description   = "luaotfload submodule / multiscript",
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

local sep = lpeg.P' '^0 * ';' * lpeg.P' '^0
local codepoint = lpeg.S'0123456789ABCDEF'^4/function(c)return tonumber(c, 16)end
local codepoint_range = codepoint * ('..' * codepoint + lpeg.Cc(false))
local function multirawset(table, key1, key2, value)
  for key = key1,(key2 or key1) do
    rawset(table, key, value)
  end
  return table
end
local script_extensions do
  local entry = lpeg.Cg(codepoint_range * sep * lpeg.Ct((lpeg.C(lpeg.R'AZ' * lpeg.R'az'^1))^1 * ' ') * '#')^-1 * (1-lpeg.P'\n')^0 * '\n'
  local file = lpeg.Cf(
      lpeg.Ct''
    * entry^0
  , multirawset)

  local f = io.open(kpse.find_file"ScriptExtensions.txt")
  script_extensions = file:match(f:read'*a')
  f:close()
  for cp,t in next, script_extensions do
    for i=1,#t do
      t[t[i]] = true
    end
  end
end
local script_mapping do
  -- We could extract these from PropertyValueAliases.txt...
  local script_aliases = {
    Adlam = "Adlm", Caucasian_Albanian = "Aghb", Ahom = "Ahom", Arabic = "Arab",
    Imperial_Aramaic = "Armi", Armenian = "Armn", Avestan = "Avst",
    Balinese = "Bali", Bamum = "Bamu", Bassa_Vah = "Bass", Batak = "Batk",
    Bengali = "Beng", Bhaiksuki = "Bhks", Bopomofo = "Bopo", Brahmi = "Brah",
    Braille = "Brai", Buginese = "Bugi", Buhid = "Buhd", Chakma = "Cakm",
    Canadian_Aboriginal = "Cans", Carian = "Cari", Cham = "Cham",
    Cherokee = "Cher", Coptic = "Copt", Cypriot = "Cprt", Cyrillic = "Cyrl",
    Devanagari = "Deva", Dogra = "Dogr", Deseret = "Dsrt", Duployan = "Dupl",
    Egyptian_Hieroglyphs = "Egyp", Elbasan = "Elba", Elymaic = "Elym",
    Ethiopic = "Ethi", Georgian = "Geor", Glagolitic = "Glag",
    Gunjala_Gondi = "Gong", Masaram_Gondi = "Gonm", Gothic = "Goth",
    Grantha = "Gran", Greek = "Grek", Gujarati = "Gujr", Gurmukhi = "Guru",
    Hangul = "Hang", Han = "Hani", Hanunoo = "Hano", Hatran = "Hatr",
    Hebrew = "Hebr", Hiragana = "Hira", Anatolian_Hieroglyphs = "Hluw",
    Pahawh_Hmong = "Hmng", Nyiakeng_Puachue_Hmong = "Hmnp",
    Katakana_Or_Hiragana = "Hrkt", Old_Hungarian = "Hung", Old_Italic = "Ital",
    Javanese = "Java", Kayah_Li = "Kali", Katakana = "Kana",
    Kharoshthi = "Khar", Khmer = "Khmr", Khojki = "Khoj", Kannada = "Knda",
    Kaithi = "Kthi", Tai_Tham = "Lana", Lao = "Laoo", Latin = "Latn",
    Lepcha = "Lepc", Limbu = "Limb", Linear_A = "Lina", Linear_B = "Linb",
    Lisu = "Lisu", Lycian = "Lyci", Lydian = "Lydi", Mahajani = "Mahj",
    Makasar = "Maka", Mandaic = "Mand", Manichaean = "Mani", Marchen = "Marc",
    Medefaidrin = "Medf", Mende_Kikakui = "Mend", Meroitic_Cursive = "Merc",
    Meroitic_Hieroglyphs = "Mero", Malayalam = "Mlym", Modi = "Modi",
    Mongolian = "Mong", Mro = "Mroo", Meetei_Mayek = "Mtei", Multani = "Mult",
    Myanmar = "Mymr", Nandinagari = "Nand", Old_North_Arabian = "Narb",
    Nabataean = "Nbat", Newa = "Newa", Nko = "Nkoo", Nushu = "Nshu",
    Ogham = "Ogam", Ol_Chiki = "Olck", Old_Turkic = "Orkh", Oriya = "Orya",
    Osage = "Osge", Osmanya = "Osma", Palmyrene = "Palm", Pau_Cin_Hau = "Pauc",
    Old_Permic = "Perm", Phags_Pa = "Phag", Inscriptional_Pahlavi = "Phli",
    Psalter_Pahlavi = "Phlp", Phoenician = "Phnx", Miao = "Plrd",
    Inscriptional_Parthian = "Prti", Rejang = "Rjng", Hanifi_Rohingya = "Rohg",
    Runic = "Runr", Samaritan = "Samr", Old_South_Arabian = "Sarb",
    Saurashtra = "Saur", SignWriting = "Sgnw", Shavian = "Shaw",
    Sharada = "Shrd", Siddham = "Sidd", Khudawadi = "Sind", Sinhala = "Sinh",
    Sogdian = "Sogd", Old_Sogdian = "Sogo", Sora_Sompeng = "Sora",
    Soyombo = "Soyo", Sundanese = "Sund", Syloti_Nagri = "Sylo",
    Syriac = "Syrc", Tagbanwa = "Tagb", Takri = "Takr", Tai_Le = "Tale",
    New_Tai_Lue = "Talu", Tamil = "Taml", Tangut = "Tang", Tai_Viet = "Tavt",
    Telugu = "Telu", Tifinagh = "Tfng", Tagalog = "Tglg", Thaana = "Thaa",
    Thai = "Thai", Tibetan = "Tibt", Tirhuta = "Tirh", Ugaritic = "Ugar",
    Vai = "Vaii", Warang_Citi = "Wara", Wancho = "Wcho", Old_Persian = "Xpeo",
    Cuneiform = "Xsux", Yi = "Yiii", Zanabazar_Square = "Zanb",
    Inherited = "Zinh", Common = "Zyyy", Unknown = "Zzzz",
  }
  local entry = lpeg.Cg(codepoint_range * sep * ((lpeg.R'AZ' + lpeg.R'az' + '_')^1/script_aliases))^-1 * (1-lpeg.P'\n')^0 * '\n'
  -- local entry = lpeg.Cg(codepoint_range * sep * lpeg.Cc(true))^-1 * (1-lpeg.P'\n')^0 * '\n'
  local file = lpeg.Cf(
      lpeg.Ct''
    * entry^0
  , multirawset)

  local f = io.open(kpse.find_file"Scripts.txt")
  script_mapping = file:match(f:read'*a')
  f:close()
end

local additional_scripts_tables = { }

local additional_scripts_fonts = setmetatable({}, {
  __index = function(t, fid)
    local f = font.getfont(fid)
    -- table.tofile('myfont2', f)
    local res = f and f.additional_scripts or false
    t[fid] = res
    return res
  end,
})

local function makecombifont(tfmdata, _, additional_scripts)
  local basescript = tfmdata.properties.script
  local scripts = {basescript = false}
  additional_scripts = additional_scripts_tables[additional_scripts]
  for script, fontname in pairs(additional_scripts) do
    if script ~= basescript then
      local f = fonts.definers.read(fontname, tfmdata.size)
      local fid
      if type(f) == 'table' then
        fid = font.define(f)
      else
        error[[FIXME???]]
      end
      scripts[script] = {
        fid = fid,
        font = f,
        characters = f.characters,
      }
    end
  end
  tfmdata.additional_scripts = scripts
end

local glyph_id = node.id'glyph'
-- TODO: unset last_script, matching parentheses etc
function domultiscript(head, _, _, _, direction)
  head = node.direct.todirect(head)
  local last_fid, last_fonts, last_script
  for cur, cid, fid in traverse_char(head) do
    if fid ~= last_fid then
      last_fid, last_fonts, last_script = fid, additional_scripts_fonts[fid]
    end
    if last_fonts then
      local mapped_scr = script_mapping[cid]
      if mapped_scr == "Zinh" then
        mapped_scr = last_script
      else
        local additional_scr = script_extensions[cid]
        if additional_scripts then
          if additional_scripts[last_script] then
            mapped_scr = last_script
          elseif not last_fonts[mapped_scr] then
            for i = 1, #additional_scripts do
              if last_fonts[additional_scripts[i]] then
                mapped_scr = additional_scripts[i]
                break
              end
            end
          end
        elseif mapped_scr == "Zyyy" then
          mapped_scr = last_script
        end
      end
      last_script = mapped_scr
      local mapped_font = last_fonts[mapped_scr]
      if mapped_font then
        setfont(cur, mapped_font.fid)
      end
    end
  end
end

function luaotfload.add_multiscript(name, fonts)
  if fonts == nil then
    fonts = name
    name = #additional_scripts_fonts + 1
  end
  additional_scripts_tables[name] = fonts
  return name
end

otffeatures.register {
  name        = "multiscript",
  description = "Combine fonts for multiple scripts",
  manipulators = {
    node = makecombifont,
  },
  -- processors = { -- processors would be nice, but they are applied
  --                -- too late for our purposes
  --   node = donotdef,
  -- }
}

--- vim:sw=2:ts=2:expandtab:tw=71
