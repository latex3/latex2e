if not modules then modules = { } end modules ['l-md5'] = {
    version   = 1.001,
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

-- This also provides file checksums and checkers.

if not md5 then
    md5 = optionalrequire("md5")
end

if not md5 then
    md5 = {
        sum     = function(str) print("error: md5 is not loaded (sum     ignored)") return str end,
        sumhexa = function(str) print("error: md5 is not loaded (sumhexa ignored)") return str end,
    }
end

local md5, file = md5, file
local gsub = string.gsub

-- local gsub, format, byte = string.gsub, string.format, string.byte
--
-- local function convert(str,fmt)
--     return (gsub(md5sum(str),".",function(chr) return format(fmt,byte(chr)) end))
-- end
--
-- if not md5.HEX then function md5.HEX(str) return convert(str,"%02X") end end
-- if not md5.hex then function md5.hex(str) return convert(str,"%02x") end end
-- if not md5.dec then function md5.dec(str) return convert(str,"%03i") end end

do

    local patterns = lpeg and lpeg.patterns

    if patterns then

        local bytestoHEX = patterns.bytestoHEX
        local bytestohex = patterns.bytestohex
        local bytestodec = patterns.bytestodec

        local lpegmatch = lpeg.match
        local md5sum    = md5.sum

        if not md5.HEX then function md5.HEX(str) if str then return lpegmatch(bytestoHEX,md5sum(str)) end end end
        if not md5.hex then function md5.hex(str) if str then return lpegmatch(bytestohex,md5sum(str)) end end end
        if not md5.dec then function md5.dec(str) if str then return lpegmatch(bytestodec,md5sum(str)) end end end

        md5.sumhexa = md5.hex
        md5.sumHEXA = md5.HEX

    end

end

function file.needsupdating(oldname,newname,threshold) -- size modification access change
    local oldtime = lfs.attributes(oldname,"modification")
    if oldtime then
        local newtime = lfs.attributes(newname,"modification")
        if not newtime then
            return true -- no new file, so no updating needed
        elseif newtime >= oldtime then
            return false -- new file definitely needs updating
        elseif oldtime - newtime < (threshold or 1) then
            return false -- new file is probably still okay
        else
            return true -- new file has to be updated
        end
    else
        return false -- no old file, so no updating needed
    end
end

file.needs_updating = file.needsupdating

function file.syncmtimes(oldname,newname)
    local oldtime = lfs.attributes(oldname,"modification")
    if oldtime and lfs.isfile(newname) then
        lfs.touch(newname,oldtime,oldtime)
    end
end

function file.checksum(name)
    if md5 then
        local data = io.loaddata(name)
        if data then
            return md5.HEX(data)
        end
    end
    return nil
end

function file.loadchecksum(name)
    if md5 then
        local data = io.loaddata(name .. ".md5")
        return data and (gsub(data,"%s",""))
    end
    return nil
end

function file.savechecksum(name,checksum)
    if not checksum then checksum = file.checksum(name) end
    if checksum then
        io.savedata(name .. ".md5",checksum)
        return checksum
    end
    return nil
end
