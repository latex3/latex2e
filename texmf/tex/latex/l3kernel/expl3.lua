--
-- This is file `expl3.lua',
-- generated with the docstrip utility.
--
-- The original source files were:
--
-- l3luatex.dtx  (with options: `package,lua')
-- 
-- Copyright (C) 1990-2020 The LaTeX3 Project
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
local unicode  = unicode
local abs        = math.abs
local byte       = string.byte
local floor      = math.floor
local format     = string.format
local gsub       = string.gsub
local lfs_attr   = lfs.attributes
local md5_sum    = md5.sum
local open       = io.open
local os_clock   = os.clock
local os_date    = os.date
local os_exec    = os.execute
local setcatcode = tex.setcatcode
local sprint     = tex.sprint
local cprint     = tex.cprint
local write      = tex.write
local write_nl   = texio.write_nl
local utf8_char = (utf8 and utf8.char) or (utf and utf.char) or unicode.utf8.char
local kpse_find = (resolvers and resolvers.findfile) or kpse.find_file
local function escapehex(str)
  write((gsub(str, ".",
    function (ch) return format("%02X", byte(ch)) end)))
end
local charcat
function charcat(charcode, catcode)
  cprint(catcode, utf8_char(charcode))
end
l3kernel.charcat = charcat
local base_time = 0
local function elapsedtime()
  local val = (os_clock() - base_time) * 65536 + 0.5
  if val > 2147483647 then
    val = 2147483647
  end
  write(format("%d",floor(val)))
end
l3kernel.elapsedtime = elapsedtime
local function resettimer()
  base_time = os_clock()
end
l3kernel.resettimer = resettimer
local function filedump(name,offset,length)
  local file = kpse_find(name,"tex",true)
  if file then
    local length = tonumber(length) or lfs_attr(file,"size")
    local offset = tonumber(offset) or 0
    local f = open(file,"rb")
    if f then
      if offset > 0 then
        f:seek("set",offset)
      end
      local data = f:read(length)
      escapehex(data)
      f:close()
    end
  end
end
l3kernel.filedump = filedump
local function filemdfivesum(name)
  local file =  kpse_find(name, "tex", true)
  if file then
    local f = open(file, "rb")
    if f then
      local data = f:read("*a")
      escapehex(md5_sum(data))
      f:close()
    end
  end
end
l3kernel.filemdfivesum = filemdfivesum
local function filemoddate(name)
  local file =  kpse_find(name, "tex", true)
  if file then
    local date = lfs_attr(file, "modification")
    if date then
      local d = os_date("*t", date)
      if d.sec >= 60 then
        d.sec = 59
      end
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
        local hours = floor(off / 60)
        local mins  = abs(off - hours * 60)
        timezone = format("%+03d", hours)
          .. "'" .. format("%02d", mins) .. "'"
      end
      write("D:"
        .. format("%04d", d.year)
        .. format("%02d", d.month)
        .. format("%02d", d.day)
        .. format("%02d", d.hour)
        .. format("%02d", d.min)
        .. format("%02d", d.sec)
        .. timezone)
    end
  end
end
l3kernel.filemoddate = filemoddate
local function filesize(name)
  local file =  kpse_find(name, "tex", true)
  if file then
    local size = lfs_attr(file, "size")
    if size then
      write(size)
    end
  end
end
l3kernel.filesize = filesize
local function strcmp(A, B)
  if A == B then
    write("0")
  elseif A < B then
    write("-1")
  else
    write("1")
  end
end
l3kernel.strcmp = strcmp
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
l3kernel.shellescape = shellescape
