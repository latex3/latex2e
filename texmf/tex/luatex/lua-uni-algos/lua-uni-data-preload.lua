-- lua-uni-data-preload.lua
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
--
local lookup_table = require'lua-uni-stage-tables'
local serialize = lookup_table.serialize
local deserialize = lookup_table.deserialize

-- Serialize a Lua value into a string.
-- Not designed to be human readable but only to be reloaded into Lua with load().
local function serialize_lua(value)
  local t = type(value)
  local fmt
  if t == 'number' then
    fmt = math.type(value) == 'integer' and '%#X' or '%A'
  elseif t == 'string' then
    fmt = '%q'
  elseif t == 'boolean' or t == 'nil' then
    fmt = '%s'
  elseif t == 'table' then
    local k, v
    local entries, length = {}, 0
    while true do
      local last_key = k or 0
      k, v = next(value, k)
      if math.type(k) == 'integer' and k > last_key and k - last_key < 5 then
        for i = last_key+1, k-1 do
          length = length + 1
          entries[length] = 'nil'
        end
        length = length + 1
        entries[length] = serialize_lua(v)
      else
        break
      end
    end
    while k ~= nil do
      length = length + 1
      entries[length] = string.format('[%s] = %s', serialize_lua(k), serialize_lua(v))
      k, v = next(value, k)
    end
    fmt, value = '{%s}', table.concat(entries, ', ', 1, length)
  elseif t == 'function' or t == 'thread' or t == 'userdata' then
    error"Unsupported type in deserialize"
  end
  return string.format(fmt, value)
end

return {
  generate_bytecode = function()
    local data = require'lua-uni-data'

    local tables = {}
    for k, v in next, data.tables do
      tables[#tables + 1] = string.format("[%q] = deserialize %q,", k, serialize(v))
    end
    return assert(load(string.format("\z
      package.preload['lua-uni-data'] = function() \z
        local deserialize = require'lua-uni-stage-tables'.deserialize \z
        return { \z
          tables = { %s }, \z
          misc = %s, \z
        }\z
      end\z
    ", table.concat(tables), serialize_lua(data.misc, 'misc')), 'preloaded_unicode_data', 't'))
  end,
}
