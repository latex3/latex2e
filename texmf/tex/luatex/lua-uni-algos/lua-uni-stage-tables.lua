-- lua-uni-stage-tables.lua
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

-- This is mainly an internal module used in lua-uni-data to efficiently store
-- the data entries.


-- The source is a 0-based table with integer values fitting into data_bytes bytes.
-- The first return value is a 0-based table with values being 1-based indexes into the second table or 0.
local function compress(compress_bits, data_bytes, signed, source, upper_limit)
  local compress_mask = (1 << compress_bits) - 1
  local default_lower_level = lua.newtable(compress_mask + 1, 0)
  local pattern = (signed and '>i' or '>I') .. data_bytes
  local zero_value = string.pack(pattern, 0)
  for i=1, compress_mask + 1 do
    default_lower_level[i] = zero_value
  end
  local first_stage = upper_limit and lua.newtable((upper_limit >> compress_bits), 1) or {}
  for k, v in next, source do
    if v and v ~= 0 and type(k) == 'number' then
      local high, low = k >> compress_bits, (k & compress_mask) + 1
      local subtable = first_stage[high]
      if not subtable then
        subtable = table.move(default_lower_level, 1, compress_mask + 1, 1, {})
        first_stage[high] = subtable
      end
      subtable[low] = string.pack(pattern, v)
    end
  end
  local default_key = table.concat(default_lower_level)
  local second_stage_lookup = {[default_key] = 0}
  local second_stage = {[0] = default_key}
  for k, v in next, first_stage do
    local key = table.concat(v)
    local index = second_stage_lookup[key]
    if not index then
      index = #second_stage + 1
      second_stage_lookup[key] = index
      second_stage[index] = key
    end
    if index ~= 0 then
      first_stage[k] = index
    end
  end
  if upper_limit then
    for i = 0, upper_limit >> compress_bits do
      first_stage[i] = first_stage[i] or 0
    end
  end
  return first_stage, second_stage
end

local function lookup_identity(value) return value end
local function lookup_table(t) return function(value) return t[value] end end
local function lookup_offset(value, codepoint) return codepoint + value end

local readers = {
  [true] = {
    [1] = sio.readinteger1,
    [2] = sio.readinteger2,
    [3] = sio.readinteger3,
    [4] = sio.readinteger4,
  },
  [false] = {
    [1] = sio.readcardinal1,
    [2] = sio.readcardinal2,
    [3] = sio.readcardinal3,
    [4] = sio.readcardinal4,
  },
}

local function two_stage_metatable(first_stage, second_stage, lookup, bits, bytes)
  local lookup_function, signed
  if lookup == nil then
    signed = false
    lookup_function = lookup_identity
  elseif lookup == 'offset' then
    signed = true
    lookup_function = lookup_offset
  else
    signed = false
    lookup_function = lookup_table(lookup)
  end
  local reader = assert(readers[signed][bytes])
  local block_size = 1 << bits
  local mask = block_size - 1
  local stride = bytes * block_size
  return setmetatable({
    __first_stage = first_stage,
    __second_stage = second_stage,
    __lookup = lookup,
    __bytes = bytes,
    __bits = bits,
  }, {
    __index = function(_, key)
      if type(key) ~= 'number' then return nil end
      local high, low = key >> bits, key & mask
      local second_index = first_stage[high] or 0
      local value
      if second_index ~= 0 then
        value = reader(second_stage, stride * (second_index - 1) + bytes * low + 1)
      else
        value = 0
      end
      return lookup_function(value, key)
    end
  })
end

local function one_stage_metatable(buffer, lookup, bytes)
  local lookup_function, signed
  if lookup == nil then
    signed = false
    lookup_function = lookup_identity
  elseif lookup == 'offset' then
    signed = true
    lookup_function = lookup_offset
  else
    signed = false
    lookup_function = lookup_table(lookup)
  end
  local reader = assert(readers[signed][bytes])
  return setmetatable({
    __buffer = buffer,
    __lookup = lookup,
    __bytes = bytes,
  }, {
    __index = function(_, key)
      local value = reader(buffer, bytes * key + 1)
      return lookup_function(value, key)
    end
  })
end

local function to_two_stage_lookup(source, lookup, bits, bytes)
  local first_stage, second_stage = compress(bits, bytes, source)
  return two_stage_metatable(first_stage, table.concat(second_stage), lookup, codepoint_block_bits, bytes)
end

local function to_three_stage_lookup(source, lookup, bits1, bits2, bytes)
  local intermediate_stage, third_stage = compress(bits2, bytes, lookup == 'offset', source)
  local needed_bytes = math.floor(math.log(#third_stage, 256)) + 1
  local first_stage, second_stage = compress(bits1, needed_bytes, false, intermediate_stage, (0x10FFFF >> bits2) + 1)
  return two_stage_metatable(two_stage_metatable(first_stage, table.concat(second_stage), nil, bits1, needed_bytes), table.concat(third_stage), lookup, bits2, bytes)
end

-- Cache file format (everything in little endian):
--   Header:
--     u32: Version (0x00010000)
--     u8: Stages (supported: 2 or 3)
--     u8: Kind (enum: 0x00 Identity table, 0x01 Delta encoding (signed), 0x02 Mapping table)
--   Mapping table: (only present if kind == 0x02
--     <Data size in bytes>: Entry count without default
--     <u8 size prefixed string>: Default
--     <Entry count> * <u8 size prefixed string>: Entries
--   Outer table:
--     <u32> Number of entries
--     <u8> Size of one entry in bytes
--     <data>
--   Inner tables: (repeated `stages - 1` times)
--     <previous entry size bytes> Number of entries
--     <u8> Size of underlying value in bytes
--     <u8> Bits representing page size (each entry is 2^bits * bytes fields big)
--     <data>
--     
local function serialize(nested_table)
  local buffer = {}
  local nesting_depth do
    local current_table = nested_table
    nesting_depth = 0
    repeat
      nesting_depth = nesting_depth + 1
      current_table = current_table.__first_stage
    until current_table == nil
  end
  local lookup = nested_table.__lookup
  local kind = lookup == nil and 0 or lookup == 'offset' and 1 or 2
  buffer[1] = string.pack('>I4BB', 0x00010000, nesting_depth, kind)
  if kind == 2 then
    buffer[2] = string.pack('>I4', #lookup)
    for i=0, #lookup do
      buffer[3 + i] = string.pack('s1', lookup[i])
    end
  end
  local function serialize_stage(stage, prev)
    local inner_stage = stage.__first_stage
    if inner_stage then
      local nested_bytes = serialize_stage(inner_stage, stage)
      buffer[#buffer + 1] = string.pack(string.format('>I%sBB', nested_bytes), #stage.__second_stage // (stage.__bytes * (1 << stage.__bits)), stage.__bytes, stage.__bits)
      buffer[#buffer + 1] = stage.__second_stage
      return stage.__bytes
    else
      local index_bytes = math.floor(math.log(#prev.__second_stage // ((1 << prev.__bits) * prev.__bytes), 256)) + 1
      buffer[#buffer + 1] = string.pack('>I4B', #stage + 1, index_bytes)
      buffer[#buffer + 1] = string.pack('>' .. string.rep('I' .. index_bytes, #stage + 1), table.unpack(stage, 0))
      return index_bytes
    end
  end
  serialize_stage(nested_table)
  return table.concat(buffer)
end

local function deserialize(data)
  local offset = 1
  local version, nesting_depth, kind
  version, nesting_depth, kind, offset = string.unpack('>I4BB', data, offset)
  if version ~= 0x00010000 then error'Invalid version' end
  local lookup
  if kind == 0 then
    lookup = nil
  elseif kind == 1 then
    lookup = 'offset'
  elseif kind == 2 then
    -- TODO
    local lookup_count
    lookup_count, offset = string.unpack('>I4', data, offset)
    lookup = lua.newtable(lookup_count, 1)
    for i=0, lookup_count do
      lookup[i], offset = string.unpack('s1', data, offset)
    end
  else
    error'Unsupported type'
  end

  local nested_table, previous_bytes
  do
    local entries, bytes
    entries, bytes, offset = string.unpack('>I4B', data, offset)
    local stage_size = entries * bytes
    local stage = data:sub(offset, offset + stage_size - 1)
    offset = offset + stage_size
    nested_table = one_stage_metatable(stage, level == nesting_depth and lookup or nil, bytes)
    previous_bytes = bytes
  end

  for level = 2, nesting_depth do
    local entries, bytes, bits
    entries, bytes, bits, offset = string.unpack(string.format('>I%sBB', previous_bytes), data, offset) --, #stage.__second_stage // (stage.__bytes * (1 << stage.__bits)), stage.__bytes, stage.__bits)
    local stage_size = entries * bytes * (1 << bits)
    local stage = data:sub(offset, offset + stage_size - 1)
    offset = offset + stage_size
    nested_table = two_stage_metatable(nested_table, stage, level == nesting_depth and lookup or nil, bits, bytes)
    previous_bytes = bytes
  end

  assert(offset == #data + 1)
  return nested_table
end

return {
  compress = compress,
  to_two_stage_lookup = to_two_stage_lookup,
  to_three_stage_lookup = to_three_stage_lookup,
  serialize = serialize,
  deserialize = deserialize,
}
