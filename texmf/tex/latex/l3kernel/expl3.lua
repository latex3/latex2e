--
-- This is file `expl3.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- l3luatex.dtx  (with options: `package,lua')
-- l3names.dtx  (with options: `package,lua')
-- l3sys.dtx  (with options: `package,lua')
-- l3token.dtx  (with options: `package,lua')
-- 
-- Copyright (C) 1990-2021 The LaTeX Project
-- 
-- It may be distributed and/or modified under the conditions of
-- the LaTeX Project Public License (LPPL), either version 1.3c of
-- this license or (at your option) any later version.  The latest
-- version of this license is in the file:
-- 
--    https://www.latex-project.org/lppl.txt
-- 
-- This file is part of the "l3kernel bundle" (The Work in LPPL)
-- and all files in that bundle must be distributed together.
-- 
-- File: l3luatex.dtx
l3kernel = l3kernel or { }
local l3kernel = l3kernel
ltx = ltx or {utils={}}
ltx.utils = ltx.utils or { }
local ltxutils = ltx.utils
local io       = io
local kpse     = kpse
local lfs      = lfs
local math     = math
local md5      = md5
local os       = os
local string   = string
local tex      = tex
local texio    = texio
local tonumber = tonumber
local abs        = math.abs
local byte       = string.byte
local floor      = math.floor
local format     = string.format
local gsub       = string.gsub
local lfs_attr   = lfs.attributes
local open       = io.open
local os_date    = os.date
local setcatcode = tex.setcatcode
local sprint     = tex.sprint
local cprint     = tex.cprint
local write      = tex.write
local write_nl   = texio.write_nl
local utf8_char  = utf8.char

local scan_int     = token.scan_int or token.scan_integer
local scan_string  = token.scan_string
local scan_keyword = token.scan_keyword
local put_next     = token.put_next

local true_tok     = token.create'prg_return_true:'
local false_tok    = token.create'prg_return_false:'
local function deprecated(table, name, func)
  table[name] = function(...)
    write_nl(format("Calling deprecated Lua function %s", name))
    table[name] = func
    return func(...)
  end
end
local kpse_find = (resolvers and resolvers.findfile) or kpse.find_file
local function escapehex(str)
  return (gsub(str, ".",
    function (ch) return format("%02X", byte(ch)) end))
end
deprecated(l3kernel, 'charcat', function(charcode, catcode)
  cprint(catcode, utf8_char(charcode))
end)
local os_clock   = os.clock
local base_clock_time = 0
local function elapsedtime()
  local val = (os_clock() - base_clock_time) * 65536 + 0.5
  if val > 2147483647 then
    val = 2147483647
  end
  write(format("%d",floor(val)))
end
l3kernel.elapsedtime = elapsedtime
local function resettimer()
  base_clock_time = os_clock()
end
l3kernel.resettimer = resettimer
local function filedump(name,offset,length)
  local file = kpse_find(name,"tex",true)
  if not file then return end
  local f = open(file,"rb")
  if not f then return end
  if offset and offset > 0 then
    f:seek("set", offset)
  end
  local data = f:read(length or 'a')
  f:close()
  return escapehex(data)
end
ltxutils.filedump = filedump
deprecated(l3kernel, "filedump", function(name, offset, length)
  local dump = filedump(name, tonumber(offset), tonumber(length))
  if dump then
    write(dump)
  end
end)
local md5_HEX = md5.HEX
if not md5_HEX then
  local md5_sum = md5.sum
  function md5_HEX(data)
    return escapehex(md5_sum(data))
  end
  md5.HEX = md5_HEX
end
local function filemd5sum(name)
  local file = kpse_find(name, "tex", true) if not file then return end
  local f = open(file, "rb") if not f then return end

  local data = f:read("*a")
  f:close()
  return md5_HEX(data)
end
ltxutils.filemd5sum = filemd5sum
deprecated(l3kernel, "filemdfivesum", function(name)
  local hash = filemd5sum(name)
  if hash then
    write(hash)
  end
end)
local filemoddate
if os_date'%z':match'^[+-]%d%d%d%d$' then
  local pattern = lpeg.Cs(16 *
      (lpeg.Cg(lpeg.S'+-' * '0000' * lpeg.Cc'Z')
    + 3 * lpeg.Cc"'" * 2 * lpeg.Cc"'"
    + lpeg.Cc'Z')
  * -1)
  function filemoddate(name)
    local file = kpse_find(name, "tex", true)
    if not file then return end
    local date = lfs_attr(file, "modification")
    if not date then return end
    return pattern:match(os_date("D:%Y%m%d%H%M%S%z", date))
  end
else
  local function filemoddate(name)
    local file = kpse_find(name, "tex", true)
    if not file then return end
    local date = lfs_attr(file, "modification")
    if not date then return end
    local d = os_date("*t", date)
    local u = os_date("!*t", date)
    local off = 60 * (d.hour - u.hour) + d.min - u.min
    if d.year ~= u.year then
      if d.year > u.year then
        off = off + 1440
      else
        off = off - 1440
      end
    elseif d.yday ~= u.yday then
      if d.yday > u.yday then
        off = off + 1440
      else
        off = off - 1440
      end
    end
    local timezone
    if off == 0 then
      timezone = "Z"
    else
      if off < 0 then
        timezone = "-"
        off = -off
      else
        timezone = "+"
      end
      timezone = format("%s%02d'%02d'", timezone, hours // 60, hours % 60)
    end
    return format("D:%04d%02d%02d%02d%02d%02d%s",
        d.year, d.month, d.day, d.hour, d.min, d.sec, timezone)
  end
end
ltxutils.filemoddate = filemoddate
deprecated(l3kernel, "filemoddate", function(name)
  local hash = filemoddate(name)
  if hash then
    write(hash)
  end
end)
local function filesize(name)
  local file = kpse_find(name, "tex", true)
  if file then
    local size = lfs_attr(file, "size")
    if size then
      return size
    end
  end
end
ltxutils.filesize = filesize
deprecated(l3kernel, "filesize", function(name)
  local size = filesize(name)
  if size then
    write(size)
  end
end)
deprecated(l3kernel, "strcmp", function (A, B)
  if A == B then
    write("0")
  elseif A < B then
    write("-1")
  else
    write("1")
  end
end)
local os_exec    = os.execute
deprecated(l3kernel, "shellescape", function(cmd)
  local status,msg = os_exec(cmd)
  if status == nil then
    write_nl("log","runsystem(" .. cmd .. ")...(" .. msg .. ")\n")
  elseif status == 0 then
    write_nl("log","runsystem(" .. cmd .. ")...executed\n")
  else
    write_nl("log","runsystem(" .. cmd .. ")...failed " .. (msg or "") .. "\n")
  end
end)
local luacmd do
  local token_create = token.create
  local set_lua = token.set_lua
  local undefined_cs = token.command_id'undefined_cs'

  if not context and not luatexbase then require'ltluatex' end
  if luatexbase then
    local new_luafunction = luatexbase.new_luafunction
    local functions = lua.get_functions_table()
    function luacmd(name, func, ...)
      local id
      local tok = token_create(name)
      if tok.command == undefined_cs then
        id = new_luafunction(name)
        set_lua(name, id, ...)
      else
        id = tok.index or tok.mode
      end
      functions[id] = func
    end
  elseif context then
    local register = context.functions.register
    local functions = context.functions.known
    function luacmd(name, func, ...)
      local tok = token.create(name)
      if tok.command == undefined_cs then
        token.set_lua(name, register(func), ...)
      else
        functions[tok.index or tok.mode] = func
      end
    end
  end
end
-- File: l3names.dtx
local minus_tok = token.new(string.byte'-', 12)
local zero_tok = token.new(string.byte'0', 12)
local one_tok = token.new(string.byte'1', 12)
luacmd('tex_strcmp:D', function()
  local first = scan_string()
  local second = scan_string()
  if first < second then
    put_next(minus_tok, one_tok)
  else
    put_next(first == second and zero_tok or one_tok)
  end
end, 'global')
local cprint = tex.cprint
luacmd('tex_Ucharcat:D', function()
  local charcode = scan_int()
  local catcode = scan_int()
  cprint(catcode, utf8_char(charcode))
end, 'global')
luacmd('tex_filesize:D', function()
  local size = filesize(scan_string())
  if size then write(size) end
end, 'global')
luacmd('tex_mdfivesum:D', function()
  local hash
  if scan_keyword"file" then
    hash = filemd5sum(scan_string())
  else
    hash = md5_HEX(scan_string())
  end
  if hash then write(hash) end
end, 'global')
luacmd('tex_filemoddate:D', function()
  local date = filemoddate(scan_string())
  if date then write(date) end
end, 'global')
luacmd('tex_filedump:D', function()
  local offset = scan_keyword'offset' and scan_int() or nil
  local length = scan_keyword'length' and scan_int()
          or not scan_keyword'whole' and 0 or nil
  local data = filedump(scan_string(), offset, length)
  if data then write(data) end
end, 'global')
-- File: l3sys.dtx
do
  local os_exec = os.execute

  local function shellescape(cmd)
    local status,msg = os_exec(cmd)
    if status == nil then
      write_nl("log","runsystem(" .. cmd .. ")...(" .. msg .. ")\n")
    elseif status == 0 then
      write_nl("log","runsystem(" .. cmd .. ")...executed\n")
    else
      write_nl("log","runsystem(" .. cmd .. ")...failed " .. (msg or "") .. "\n")
    end
  end
  luacmd("__sys_shell_now:e", function()
    shellescape(scan_string())
  end, "global", "protected")
  local whatsit_id = node.id'whatsit'
  local latelua_sub = node.subtype'late_lua'
  local node_new = node.direct.new
  local setfield = node.direct.setwhatsitfield or node.direct.setfield
  local node_write = node.direct.write

  luacmd("__sys_shell_shipout:e", function()
    local cmd = scan_string()
    local n = node_new(whatsit_id, latelua_sub)
    setfield(n, 'data', function() shellescape(cmd) end)
    node_write(n)
  end, "global", "protected")
end
  local gettimeofday = os.gettimeofday
  local epoch = gettimeofday() - os.clock()
  local write = tex.write
  local tointeger = math.tointeger
  luacmd('__sys_elapsedtime:', function()
    write(tointeger((gettimeofday() - epoch)*65536 // 1))
  end, 'global')
-- File: l3token.dtx
do
  local get_next = token.get_next
  local get_command = token.get_command
  local get_index = token.get_index
  local get_mode = token.get_mode or token.get_index
  local cmd = token.command_id
  local set_font = cmd'get_font'
  local biggest_char = token.biggest_char()

  local mode_below_biggest_char = {}
  local index_not_nil = {}
  local mode_not_null = {}
  local non_primitive = {
    [cmd'left_brace'] = true,
    [cmd'right_brace'] = true,
    [cmd'math_shift'] = true,
    [cmd'mac_param'] = mode_below_biggest_char,
    [cmd'sup_mark'] = true,
    [cmd'sub_mark'] = true,
    [cmd'endv'] = true,
    [cmd'spacer'] = true,
    [cmd'letter'] = true,
    [cmd'other_char'] = true,
    [cmd'tab_mark'] = mode_below_biggest_char,
    [cmd'char_given'] = true,
    [cmd'math_given'] = true,
    [cmd'xmath_given'] = true,
    [cmd'set_font'] = mode_not_null,
    [cmd'undefined_cs'] = true,
    [cmd'call'] = true,
    [cmd'long_call'] = true,
    [cmd'outer_call'] = true,
    [cmd'long_outer_call'] = true,
    [cmd'assign_glue'] = index_not_nil,
    [cmd'assign_mu_glue'] = index_not_nil,
    [cmd'assign_toks'] = index_not_nil,
    [cmd'assign_int'] = index_not_nil,
    [cmd'assign_attr'] = true,
    [cmd'assign_dimen'] = index_not_nil,
  }

  luacmd("__token_if_primitive_lua:N", function()
    local tok = get_next()
    local is_non_primitive = non_primitive[get_command(tok)]
    return put_next(
           is_non_primitive == true
             and false_tok
        or is_non_primitive == nil
             and true_tok
        or is_non_primitive == mode_not_null
             and (get_mode(tok) == 0 and true_tok or false_tok)
        or is_non_primitive == index_not_nil
             and (get_index(tok) and false_tok or true_tok)
        or is_non_primitive == mode_below_biggest_char
             and (get_mode(tok) > biggest_char and true_tok or false_tok))
  end, "global")
end
