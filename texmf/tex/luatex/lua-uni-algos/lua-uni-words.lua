-- lua-uni-words.lua
-- Copyright 2025 Marcel Krüger
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

local extended_pictographic, property do
  local p = require'lua-uni-parse'
  local l = lpeg or require'lpeg'

  extended_pictographic = p.parse_file('emoji-data',
    l.Cg(p.fields(p.codepoint_range, 'Extended_Pictographic' * l.Cc(true))) + p.ignore_line,
    p.multiset)
  if not extended_pictographic then
    error[[Break Property matching failed]]
  end

  property = p.parse_file('WordBreakProperty',
    l.Cg(p.fields(p.codepoint_range, l.C(l.R('az', 'AZ', '__')^1))) + p.ignore_line,
    p.multiset)
  if not property then
    error[[Break Property matching failed]]
  end
end

local ignorable = { Extend = true, Format = true, ZWJ = true, }
local controls = { CR = true, LF = true, Newline = true, }

local function context_AHLetter_Mid(cp)
  local prop = property[cp]
  if ignorable[prop] then
    return nil, context_AHLetter_Mid
  end
  if prop == 'ALetter' then
    return false, 'ASTARTED'
  end
  if prop == 'Hebrew_Letter' then
    return false, 'HSTARTED'
  end
  return true, 'PRE'
end

local function context_HLetter_Double(cp)
  local prop = property[cp]
  if ignorable[prop] then
    return nil, context_HLetter_Double
  end
  if prop == 'Hebrew_Letter' then
    return false, 'HSTARTED'
  end
  return true, 'PRE'
end

local function context_Numeric_Mid(cp)
  local prop = property[cp]
  if ignorable[prop] then
    return nil, context_Numeric_Mid
  end
  if prop == 'Numeric' then
    return false, 'NSTARTED'
  end
  return true, 'PRE'
end

local state_map state_map = {
  START = function(prop)
    if prop == 'CR' then
      return 'CR', true
    end
    if prop == 'LF' or prop == 'Newline' then
      return 'START', true
    end
    return state_map.PRE(prop), true
  end,
  PRE = function(prop)
    if controls[prop] then
      return state_map.START(prop)
    end
    if ignorable[prop] then
      return 'PRE', false
    end
    if prop == 'WSegSpace' then
      return 'WHITE', true
    end
    if prop == 'ALetter' then
      return 'ASTARTED', true
    end
    if prop == 'Hebrew_Letter' then
      return 'HSTARTED', true
    end
    if prop == 'Numeric' then
      return 'NSTARTED', true
    end
    if prop == 'Katakana' then
      return 'KSTARTED', true
    end
    if prop == 'ExtendNumLet' then
      return 'EXTEND', true
    end
    if prop == 'Regional_Indicator' then
      return 'RI', true
    end
    return 'PRE', true
  end,
  CR = function(prop)
    if prop == 'LF' then
      return 'START', false
    else
      return state_map.START(prop)
    end
  end,
  WHITE = function(prop)
    if prop == 'WSegSpace' then
      return 'WHITE', false
    else
      return state_map.PRE(prop)
    end
  end,
  EXTEND = function(prop)
    if ignorable[prop] then
      return 'EXTEND', false
    end
    if prop == 'ALetter' then
      return 'ASTARTED', false
    end
    if prop == 'Hebrew_Letter' then
      return 'HSTARTED', false
    end
    if prop == 'Katakana' then
      return 'KSTARTED', false
    end
    if prop == 'Numeric' then
      return 'NSTARTED', false
    end
    if prop == 'ExtendNumLet' then
      return 'EXTEND', false
    end
    return state_map.PRE(prop)
  end,
  KSTARTED = function(prop)
    if ignorable[prop] then
      return 'KSTARTED', false
    end
    if prop == 'Katakana' then
      return 'Katakana', false
    end
    if prop == 'ExtendNumLet' then
      return 'EXTEND', false
    end
    return state_map.PRE(prop)
  end,
  RI = function(prop)
    if ignorable[prop] then
      return 'RI', false
    end
    if prop == 'Regional_Indicator' then
      return 'PRE', false
    end
    return state_map.PRE(prop)
  end,
  ASTARTED = function(prop)
    if ignorable[prop] then
      return 'ASTARTED', false
    end
    if prop == 'ALetter' then
      return 'ASTARTED', false
    end
    if prop == 'Hebrew_Letter' then
      return 'HSTARTED', false
    end
    if prop == 'Numeric' then
      return 'NSTARTED', false
    end
    if prop == 'ExtendNumLet' then
      return 'EXTEND', false
    end
    if prop == 'MidLetter' or prop == 'MidNumLet' or prop == 'Single_Quote' then
      return context_AHLetter_Mid
    end
    return state_map.PRE(prop)
  end,
  HSTARTED = function(prop)
    if ignorable[prop] then
      return 'HSTARTED', false
    end
    if prop == 'ALetter' then
      return 'ASTARTED', false
    end
    if prop == 'Hebrew_Letter' then
      return 'HSTARTED', false
    end
    if prop == 'Numeric' then
      return 'NSTARTED', false
    end
    if prop == 'ExtendNumLet' then
      return 'EXTEND', false
    end
    if prop == 'Single_Quote' then
      return 'HSINGLE_QUOTE', false
    end
    if prop == 'MidLetter' or prop == 'MidNumLet' then
      return context_AHLetter_Mid
    end
    if prop == 'Double_Quote' then
      return context_HLetter_Double
    end
    return state_map.PRE(prop)
  end,
  HSINGLE_QUOTE = function(prop)
    if ignorable[prop] then
      return 'HSINGLE_QUOTE', false
    end
    if prop == 'ALetter' then
      return 'ASTARTED', false
    end
    if prop == 'Hebrew_Letter' then
      return 'HSTARTED', false
    end
    return state_map.PRE(prop)
  end,
  NSTARTED = function(prop)
    if ignorable[prop] then
      return 'NSTARTED', false
    end
    if prop == 'ALetter' then
      return 'ASTARTED', false
    end
    if prop == 'Hebrew_Letter' then
      return 'HSTARTED', false
    end
    if prop == 'Numeric' then
      return 'NSTARTED', false
    end
    if prop == 'ExtendNumLet' then
      return 'EXTEND', false
    end
    if prop == 'MidNum' or prop == 'MidNumLet' or prop == 'Single_Quote' then
      return context_Numeric_Mid
    end
    return state_map.PRE(prop)
  end,
}

local from_ZWJ, to_ZWJ = {}, {}
for k in next, state_map do
  local zwj_state = 'ZWJ_' .. k
  from_ZWJ[zwj_state], to_ZWJ[k] = k, zwj_state
end


-- The value of "state" is considered internal and should not be relied upon.
-- Just pass it to the function as is or pass nil. `nil` should only be passed when the passed codepoint starts a new cluster
local function read_codepoint(cp, state)
  local mapped_state = from_ZWJ[state]
  local new_word
  local prop = property[cp]
  state, new_word = state_map[mapped_state or state or 'START'](prop)
  if mapped_state and extended_pictographic[cp] then
    new_word = false
  end
  if prop == 'ZWJ' then
    state = to_ZWJ[state]
  end
  return new_word, state
end

-- A Lua iterator for strings -- Only reporting the beginning of every word segment
local function word_boundaries_start(str)
  local nextcode, str, i = utf8.codes(str)
  local state = "START"
  local saved_i, saved_code
  return function()
    local new_word, code
    repeat
      i, code = nextcode(str, i)
      if saved_i then
        new_word, state = state(code)
        if new_word ~= nil then
          i, code, saved_i, saved_code = saved_i, saved_code, nil, nil
        end
      else
        if not i then return end
        new_word, state = read_codepoint(code, state)
        if new_word == nil then
          saved_i, saved_code = i, code
        end
      end
    until new_word
    return i, code
  end
end
-- A more useful iterator: returns the byterange of the segment in reverse order followed by a string with the word
local function word_boundaries(str)
  local iter = word_boundaries_start(str)
  return function(_, cur)
    if cur == #str then return end
    local new = iter()
    if not new then return #str, cur + 1, str:sub(cur + 1) end
    return new - 1, cur + 1, str:sub(cur + 1, new - 1)
  end, nil, iter() - 1
end
return {
  read_codepoint = read_codepoint,
  word_boundaries_start = word_bounaries_start,
  word_boundaries = word_boundaries,
}
