if not modules then modules = { } end modules ['l-gzip'] = {
    version   = 1.001,
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

if not gzip then

    -- no fallback yet

    return

end

local suffix, suffixes = file.suffix, file.suffixes

function gzip.load(filename)
    local f = io.open(filename,"rb")
    if not f then
        -- invalid file
    elseif suffix(filename) == "gz" then
        f:close()
        local g = gzip.open(filename,"rb")
        if g then
            local str = g:read("*all")
            g:close()
            return str
        end
    else
        local str = f:read("*all")
        f:close()
        return str
    end
end

function gzip.save(filename,data)
    if suffix(filename) ~= "gz" then
        filename = filename .. ".gz"
    end
    local f = io.open(filename,"wb")
    if f then
        local s = zlib.compress(data or "",9,nil,15+16)
        f:write(s)
        f:close()
        return #s
    end
end

function gzip.suffix(filename)
    local suffix, extra = suffixes(filename)
    local gzipped = extra == "gz"
    return suffix, gzipped
end
