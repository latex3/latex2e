-- lua-uni-data-parser.lua
-- Copyright 2020--2025 Marcel Krüger
--
-- This work may be distributed and/or modified under the
-- conditions of the LaTeX Project Public License, either version 1.3
-- of this license or (at your option) any later version.
-- The latest version of this license is in
--   http://www.latex-project.org/lppl.txt
-- and version 1.3 or later is part of all distributions of LaTeX
-- version 2005/12/01 or later.
--
-- This work has the LPPL maintenance status `maintained'.
-- 
-- The Current Maintainer of this work is Marcel Krüger

-- This is mainly an internal module used in lua-uni-data to efficiently store
-- the data entries.
--
-- This is an internal module which should only be loaded by other parts of lua-uni-algos.
-- If you want to access the data parsed here, please use lua-uni-data.

local bits = 6

local parse, lpeg = require'lua-uni-parse', lpeg or require'lpeg'
local lookup_table = require'lua-uni-stage-tables'
local to_three_stage_lookup = lookup_table.to_three_stage_lookup

local function dynamic_invertible_table(default)
  local forward, count = {}, 0
  local backward = setmetatable({}, {__index = function(t, key)
    local index = count + 1
    count = index
    forward[index], t[key] = key, index
    return index
  end})
  if default ~= nil then
    forward[0], backward[default] = default, 0
  end
  return forward, backward
end

local read_properties do
  local l, p = lpeg, parse
  local any_property = l.R('az', 'AZ', '__')^1

  function read_properties(filename, default, properties_pattern)
    local forward_mapping, inverted_mapping = dynamic_invertible_table(default)
    properties_pattern = l.P(properties_pattern or any_property)
    local result = p.parse_file(filename,
      l.Cg(p.fields(p.codepoint_range, properties_pattern / inverted_mapping)) + p.ignore_line,
      p.multiset
    )
    if not result then
      return nil, string.format("Failed to parse %s", filename)
    end
    return result, forward_mapping
  end
end

local category_mapping
local general_category, ccc, decomposition_mapping, compatibility_mapping, uppercase, lowercase, titlecase do
  local reverse_category_mapping
  category_mapping, reverse_category_mapping = dynamic_invertible_table'Cn'
  local function multiset(ts, key, key_range, general_category, ccc, decomp_kind, decomp_mapping, upper, lower, title)
    key_range = key_range or key
    for codepoint=key, key_range do
      ts[1][codepoint], ts[2][codepoint], ts[4][codepoint], ts[5][codepoint], ts[6][codepoint], ts[7][codepoint] = general_category, ccc, decomp_mapping, upper and upper - codepoint, lower and lower - codepoint, title and title - codepoint or upper and upper - codepoint
      if not decomp_kind then
        ts[3][codepoint] = decomp_mapping
      end
    end
    return ts
  end
  local l, p = lpeg, parse
  local Cnil = l.Cc(nil)
  local letter = l.R('AZ', 'az')
  local codepoint_or_ud_range = p.codepoint * ( -- When scanning a range in UnicodeData.txt, we use the data from the entry of the end of the range.
    ';<' * p.ignore_field * lpeg.B', First>' * p.ignore_line * p.codepoint
    + l.Cc(nil)
  )
  local parsed = assert(p.parse_file('UnicodeData', l.Cf(
    l.Ct(l.Ct'' * l.Ct'' * l.Ct'' * l.Ct'' * l.Ct'' * l.Ct'' * l.Ct'') * (
      l.Cg(p.fields(codepoint_or_ud_range,
                    p.ignore_field, -- Name (ignored)
                    l.R'AZ' * l.R'az' / reverse_category_mapping, -- General_Category
                    '0' * Cnil + p.number, -- Canonical_Combining_Class
                    p.ignore_field, -- Bidi_Class (ignored)
                    ('<' * l.C(letter^1) * '> ' + Cnil) -- Decomposition_Type
                  * (l.Ct(p.codepoint * (' ' * p.codepoint)^0) + Cnil), -- Decomposition_Mapping
                    p.ignore_field, -- Numeric_Type / Numeric_Value (ignored)
                    p.ignore_field, -- Numeric_Type / Numeric_Value (ignored)
                    p.ignore_field, -- Numeric_Type / Numeric_Value (ignored)
                    p.ignore_field, -- Bidi_Mirrored (ignored)
                    p.ignore_field, -- obsolete
                    p.ignore_field, -- obsolete
                    (p.codepoint + Cnil), -- Simple_Uppercase_Mapping
                    (p.codepoint + Cnil), -- Simple_Lowercase_Mapping
                    (p.codepoint + Cnil)) -- Simple_Titlecase_Mapping
      ) + p.eol
    )^0, multiset) * -1))
  general_category, ccc, decomposition_mapping, compatibility_mapping, uppercase, lowercase, titlecase = unpack(parsed)
end

local grapheme_break_property, grapheme_break_mapping = assert(read_properties('GraphemeBreakProperty', 'Other'))
local word_break_property, word_break_mapping = assert(read_properties('WordBreakProperty', 'Other'))

general_category = to_three_stage_lookup(general_category, category_mapping, bits, bits, 1)
ccc = to_three_stage_lookup(ccc, nil, bits, bits, 1)
grapheme_break_property = to_three_stage_lookup(grapheme_break_property, grapheme_break_mapping, bits, bits, 1)
uppercase = to_three_stage_lookup(uppercase, 'offset', bits, bits, 3)
lowercase = to_three_stage_lookup(lowercase, 'offset', bits, bits, 3)
titlecase = to_three_stage_lookup(titlecase, 'offset', bits, bits, 3)
word_break_property = to_three_stage_lookup(word_break_property, word_break_mapping, bits, bits, 1)

return {
  tables = {
    category = general_category,
    ccc = ccc,
    grapheme = grapheme_break_property,
    uppercase = uppercase,
    lowercase = lowercase,
    titlecase = titlecase,
    wordbreak = word_break_property,
  },
  misc = {
    decomposition_mapping = decomposition_mapping,
    compatibility_mapping = compatibility_mapping,
  },
}
