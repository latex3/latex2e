if not modules then modules = { } end modules ['l-os'] = {
    version   = 1.001,
    comment   = "companion to luat-lib.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

-- This file deals with some operating system issues. Please don't bother me
-- with the pros and cons of operating systems as they all have their flaws
-- and benefits. Bashing one of them won't help solving problems and fixing
-- bugs faster and is a waste of time and energy.
--
-- path separators: / or \ ... we can use / everywhere
-- suffixes       : dll so exe <none> ... no big deal
-- quotes         : we can use "" in most cases
-- expansion      : unless "" are used * might give side effects
-- piping/threads : somewhat different for each os
-- locations      : specific user file locations and settings can change over time
--
-- os.type     : windows | unix (new, we already guessed os.platform)
-- os.name     : windows | msdos | linux | macosx | solaris | .. | generic (new)
-- os.platform : extended os.name with architecture

-- os.sleep() => socket.sleep()
-- math.randomseed(tonumber(string.sub(string.reverse(tostring(math.floor(socket.gettime()*10000))),1,6)))

local os = os
local date, time = os.date, os.time
local find, format, gsub, upper, gmatch = string.find, string.format, string.gsub, string.upper, string.gmatch
local concat = table.concat
local random, ceil, randomseed = math.random, math.ceil, math.randomseed
local rawget, rawset, type, getmetatable, setmetatable, tonumber, tostring = rawget, rawset, type, getmetatable, setmetatable, tonumber, tostring

-- This check needs to happen real early on. Todo: we can pick it up from the commandline
-- if we pass --binpath= (which is useful anyway)

do
    local selfdir = os.selfdir
    if selfdir == "" then
        selfdir = nil
    end
    if not selfdir then
        -- We need a fallback plan so let's see what we get.
        if arg then
            -- passed by mtx-context ... saves network access
            for i=1,#arg do
                local a = arg[i]
                if find(a,"^%-%-[c:]*texmfbinpath=") then
                    selfdir = gsub(a,"^.-=","")
                    break
                end
            end
        end
        if not selfdir then
            selfdir = os.selfbin or "luatex"
            if find(selfdir,"[/\\]") then
                selfdir = gsub(selfdir,"[/\\][^/\\]*$","")
            elseif os.getenv then
                local path = os.getenv("PATH")
                local name = gsub(selfdir,"^.*[/\\][^/\\]","")
                local patt = "[^:]+"
                if os.type == "windows" then
                    patt = "[^;]+"
                    name = name .. ".exe"
                end
                local isfile
                if lfs then
                    -- we're okay as lfs is assumed present
                    local attributes = lfs.attributes
                    isfile = function(name)
                        local a = attributes(name,"mode")
                        return a == "file" or a == "link" or nil
                    end
                else
                    -- we're not okay and much will not work as we miss lfs
                    local open = io.open
                    isfile = function(name)
                        local f = open(name)
                        if f then
                            f:close()
                            return true
                        end
                    end
                end
                for p in gmatch(path,patt) do
                    -- possible speedup: there must be tex in 'p'
                    if isfile(p .. "/" .. name) then
                        selfdir = p
                        break
                    end
                end
            end
        end
        -- let's hope we're okay now
        os.selfdir = selfdir or "."
    end
end
-- print(os.selfdir) os.exit()

-- The following code permits traversing the environment table, at least in luatex. Internally all
-- environment names are uppercase.

-- The randomseed in Lua is not that random, although this depends on the operating system as well
-- as the binary (Luatex is normally okay). But to be sure we set the seed anyway. It will be better
-- in Lua 5.4 (according to the announcements.)

math.initialseed = tonumber(string.sub(string.reverse(tostring(ceil(socket and socket.gettime()*10000 or time()))),1,6))

randomseed(math.initialseed)

if not os.__getenv__ then

    os.__getenv__ = os.getenv
    os.__setenv__ = os.setenv

    if os.env then

        local osgetenv  = os.getenv
        local ossetenv  = os.setenv
        local osenv     = os.env      local _ = osenv.PATH -- initialize the table

        function os.setenv(k,v)
            if v == nil then
                v = ""
            end
            local K = upper(k)
            osenv[K] = v
            if type(v) == "table" then
                v = concat(v,";") -- path
            end
            ossetenv(K,v)
        end

        function os.getenv(k)
            local K = upper(k)
            local v = osenv[K] or osenv[k] or osgetenv(K) or osgetenv(k)
            if v == "" then
                return nil
            else
                return v
            end
        end

    else

        local ossetenv  = os.setenv
        local osgetenv  = os.getenv
        local osenv     = { }

        function os.setenv(k,v)
            if v == nil then
                v = ""
            end
            local K = upper(k)
            osenv[K] = v
        end

        function os.getenv(k)
            local K = upper(k)
            local v = osenv[K] or osgetenv(K) or osgetenv(k)
            if v == "" then
                return nil
            else
                return v
            end
        end

        local function __index(t,k)
            return os.getenv(k)
        end
        local function __newindex(t,k,v)
            os.setenv(k,v)
        end

        os.env = { }

        setmetatable(os.env, { __index = __index, __newindex = __newindex } )

    end

end

-- end of environment hack

local execute = os.execute
local iopopen = io.popen

local function resultof(command)
    local handle = iopopen(command,"r") -- already has flush
    if handle then
        local result = handle:read("*all") or ""
        handle:close()
        return result
    else
        return ""
    end
end

os.resultof = resultof

function os.pipeto(command)
    return iopopen(command,"w") -- already has flush
end

if not io.fileseparator then
    if find(os.getenv("PATH"),";",1,true) then
        io.fileseparator, io.pathseparator, os.type = "\\", ";", os.type or "windows"
    else
        io.fileseparator, io.pathseparator, os.type = "/" , ":", os.type or "unix"
    end
end

os.type = os.type or (io.pathseparator == ";"       and "windows") or "unix"
os.name = os.name or (os.type          == "windows" and "mswin"  ) or "linux"

if os.type == "windows" then
    os.libsuffix, os.binsuffix, os.binsuffixes = 'dll', 'exe', { 'exe', 'cmd', 'bat' }
else
    os.libsuffix, os.binsuffix, os.binsuffixes = 'so', '', { '' }
end

local launchers = {
    windows = "start %s",
    macosx  = "open %s",
    unix    = "xdg-open %s &> /dev/null &",
}

function os.launch(str)
    local command = format(launchers[os.name] or launchers.unix,str)
    -- todo: pcall
--     print(command)
    execute(command)
end

local gettimeofday = os.gettimeofday or os.clock
os.gettimeofday    = gettimeofday

local startuptime = gettimeofday()

function os.runtime()
    return gettimeofday() - startuptime
end

-- print(os.gettimeofday()-os.time())
-- os.sleep(1.234)
-- print (">>",os.runtime())
-- print(os.date("%H:%M:%S",os.gettimeofday()))
-- print(os.date("%H:%M:%S",os.time()))

-- no need for function anymore as we have more clever code and helpers now
-- this metatable trickery might as well disappear

local resolvers = os.resolvers or { }
os.resolvers    = resolvers

setmetatable(os, { __index = function(t,k)
    local r = resolvers[k]
    return r and r(t,k) or nil -- no memoize
end })

-- we can use HOSTTYPE on some platforms

local name, platform = os.name or "linux", os.getenv("MTX_PLATFORM") or ""

-- local function guess()
--     local architecture = resultof("uname -m") or ""
--     if architecture ~= "" then
--         return architecture
--     end
--     architecture = os.getenv("HOSTTYPE") or ""
--     if architecture ~= "" then
--         return architecture
--     end
--     return resultof("echo $HOSTTYPE") or ""
-- end

-- os.bits = 32 | 64

-- os.uname()
--     sysname
--     machine
--     release
--     version
--     nodename

if platform ~= "" then

    os.platform = platform

elseif os.type == "windows" then

    -- we could set the variable directly, no function needed here

    -- PROCESSOR_ARCHITECTURE : binary platform
    -- PROCESSOR_ARCHITEW6432 : OS platform

    -- mswin-64 is now win64

    function resolvers.platform(t,k)
        local architecture = os.getenv("PROCESSOR_ARCHITECTURE") or ""
        local platform     = ""
        if find(architecture,"AMD64",1,true) then
            platform = "win64"
        else
            platform = "mswin"
        end
        os.setenv("MTX_PLATFORM",platform)
        os.platform = platform
        return platform
    end

elseif name == "linux" then

    function resolvers.platform(t,k)
        -- we sometimes have HOSTTYPE set so let's check that first
        local architecture = os.getenv("HOSTTYPE") or resultof("uname -m") or ""
        local platform     = os.getenv("MTX_PLATFORM") or ""
        local musl         = find(os.selfdir or "","linuxmusl")
        if platform ~= "" then
            -- we're done
        elseif find(architecture,"x86_64",1,true) then
            platform = musl and "linuxmusl" or "linux-64"
        elseif find(architecture,"ppc",1,true) then
            platform = "linux-ppc"
        else
            platform = musl and "linuxmusl" or "linux"
        end
        os.setenv("MTX_PLATFORM",platform)
        os.platform = platform
        return platform
    end

elseif name == "macosx" then

    --[[
        Identifying the architecture of OSX is quite a mess and this
        is the best we can come up with. For some reason $HOSTTYPE is
        a kind of pseudo environment variable, not known to the current
        environment. And yes, uname cannot be trusted either, so there
        is a change that you end up with a 32 bit run on a 64 bit system.
        Also, some proper 64 bit intel macs are too cheap (low-end) and
        therefore not permitted to run the 64 bit kernel.
      ]]--

    function resolvers.platform(t,k)
     -- local platform     = ""
     -- local architecture = os.getenv("HOSTTYPE") or ""
     -- if architecture == "" then
     --     architecture = resultof("echo $HOSTTYPE") or ""
     -- end
        local architecture = resultof("echo $HOSTTYPE") or ""
        local platform     = ""
        if architecture == "" then
         -- print("\nI have no clue what kind of OSX you're running so let's assume an 32 bit intel.\n")
            platform = "osx-intel"
        elseif find(architecture,"i386",1,true) then
            platform = "osx-intel"
        elseif find(architecture,"x86_64",1,true) then
            platform = "osx-64"
        else
            platform = "osx-ppc"
        end
        os.setenv("MTX_PLATFORM",platform)
        os.platform = platform
        return platform
    end

elseif name == "sunos" then

    function resolvers.platform(t,k)
        local architecture = resultof("uname -m") or ""
        local platform     = ""
        if find(architecture,"sparc",1,true) then
            platform = "solaris-sparc"
        else -- if architecture == 'i86pc'
            platform = "solaris-intel"
        end
        os.setenv("MTX_PLATFORM",platform)
        os.platform = platform
        return platform
    end

elseif name == "freebsd" then

    function resolvers.platform(t,k)
        local architecture = resultof("uname -m") or ""
        local platform     = ""
        if find(architecture,"amd64",1,true) then
            platform = "freebsd-amd64"
        else
            platform = "freebsd"
        end
        os.setenv("MTX_PLATFORM",platform)
        os.platform = platform
        return platform
    end

elseif name == "kfreebsd" then

    function resolvers.platform(t,k)
        -- we sometimes have HOSTTYPE set so let's check that first
        local architecture = os.getenv("HOSTTYPE") or resultof("uname -m") or ""
        local platform     = ""
        if find(architecture,"x86_64",1,true) then
            platform = "kfreebsd-amd64"
        else
            platform = "kfreebsd-i386"
        end
        os.setenv("MTX_PLATFORM",platform)
        os.platform = platform
        return platform
    end

else

    -- platform = "linux"
    -- os.setenv("MTX_PLATFORM",platform)
    -- os.platform = platform

    function resolvers.platform(t,k)
        local platform = "linux"
        os.setenv("MTX_PLATFORM",platform)
        os.platform = platform
        return platform
    end

end

os.newline = name == "windows" and "\013\010" or "\010" -- crlf or lf

function resolvers.bits(t,k)
    local bits = find(os.platform,"64",1,true) and 64 or 32
    os.bits = bits
    return bits
end

-- beware, we set the randomseed

-- from wikipedia: Version 4 UUIDs use a scheme relying only on random numbers. This algorithm sets the
-- version number as well as two reserved bits. All other bits are set using a random or pseudorandom
-- data source. Version 4 UUIDs have the form xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx with hexadecimal
-- digits x and hexadecimal digits 8, 9, A, or B for y. e.g. f47ac10b-58cc-4372-a567-0e02b2c3d479.
--
-- as we don't call this function too often there is not so much risk on repetition

local t = { 8, 9, "a", "b" }

function os.uuid()
    return format("%04x%04x-4%03x-%s%03x-%04x-%04x%04x%04x",
        random(0xFFFF),random(0xFFFF),
        random(0x0FFF),
        t[ceil(random(4))] or 8,random(0x0FFF),
        random(0xFFFF),
        random(0xFFFF),random(0xFFFF),random(0xFFFF)
    )
end

local d

function os.timezone(delta)
    d = d or tonumber(tonumber(date("%H")-date("!%H")))
    if delta then
        if d > 0 then
            return format("+%02i:00",d)
        else
            return format("-%02i:00",-d)
        end
    else
        return 1
    end
end

local timeformat = format("%%s%s",os.timezone(true))
local dateformat = "!%Y-%m-%d %H:%M:%S"
local lasttime   = nil
local lastdate   = nil

function os.fulltime(t,default)
    t = t and tonumber(t) or 0
    if t > 0 then
        -- valid time
    elseif default then
        return default
    else
        t = time()
    end
    if t ~= lasttime then
        lasttime = t
        lastdate = format(timeformat,date(dateformat))
    end
    return lastdate
end

local dateformat = "%Y-%m-%d %H:%M:%S"
local lasttime   = nil
local lastdate   = nil

function os.localtime(t,default)
    t = t and tonumber(t) or 0
    if t > 0 then
        -- valid time
    elseif default then
        return default
    else
        t = time()
    end
    if t ~= lasttime then
        lasttime = t
        lastdate = date(dateformat,t)
    end
    return lastdate
end

function os.converttime(t,default)
    local t = tonumber(t)
    if t and t > 0 then
        return date(dateformat,t)
    else
        return default or "-"
    end
end

local memory = { }

local function which(filename)
    local fullname = memory[filename]
    if fullname == nil then
        local suffix = file.suffix(filename)
        local suffixes = suffix == "" and os.binsuffixes or { suffix }
        for directory in gmatch(os.getenv("PATH"),"[^" .. io.pathseparator .."]+") do
            local df = file.join(directory,filename)
            for i=1,#suffixes do
                local dfs = file.addsuffix(df,suffixes[i])
                if io.exists(dfs) then
                    fullname = dfs
                    break
                end
            end
        end
        if not fullname then
            fullname = false
        end
        memory[filename] = fullname
    end
    return fullname
end

os.which = which
os.where = which

function os.today()
    return date("!*t") -- table with values
end

function os.now()
    return date("!%Y-%m-%d %H:%M:%S") -- 2011-12-04 14:59:12
end

-- if not os.sleep and socket then
--     os.sleep = socket.sleep
-- end

if not os.sleep then
    local socket = socket
    function os.sleep(n)
        if not socket then
            -- so we delay ... if os.sleep is really needed then one should also
            -- be sure that socket can be found
            socket = require("socket")
        end
        socket.sleep(n)
    end
end

-- print(os.which("inkscape.exe"))
-- print(os.which("inkscape"))
-- print(os.which("gs.exe"))
-- print(os.which("ps2pdf"))

-- These are moved from core-con.lua (as I needed them elsewhere).

local function isleapyear(year) -- timed for bram's cs practicum
 -- return (year % 400 == 0) or (year % 100 ~= 0 and year % 4 == 0) -- 3:4:1600:1900 = 9.9 : 8.2 : 5.0 :  6.8 (29.9)
    return (year % 4 == 0) and (year % 100 ~= 0 or year % 400 == 0) -- 3:4:1600:1900 = 5.1 : 6.5 : 8.1 : 10.2 (29.9)
 -- return (year % 4 == 0) and (year % 400 == 0 or year % 100 ~= 0) -- 3:4:1600:1900 = 5.2 : 8.5 : 6.8 : 10.1 (30.6)
end

os.isleapyear = isleapyear

-- nicer:
--
-- local days = {
--     [false] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 },
--     [true]  = { 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
-- }
--
-- local function nofdays(year,month)
--     return days[isleapyear(year)][month]
--     return month == 2 and isleapyear(year) and 29 or days[month]
-- end
--
-- more efficient:

local days = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }

local function nofdays(year,month)
    if not month then
        return isleapyear(year) and 365 or 364
    else
        return month == 2 and isleapyear(year) and 29 or days[month]
    end
end

os.nofdays = nofdays

function os.weekday(day,month,year)
    return date("%w",time { year = year, month = month, day = day }) + 1
end

function os.validdate(year,month,day)
    -- we assume that all three values are set
    -- year is always ok, even if lua has a 1970 time limit
    if month < 1 then
        month = 1
    elseif month > 12 then
        month = 12
    end
    if day < 1 then
        day = 1
    else
        local max = nofdays(year,month)
        if day > max then
            day = max
        end
    end
    return year, month, day
end

local osexit   = os.exit
local exitcode = nil

function os.setexitcode(code)
    exitcode = code
end

function os.exit(c)
    if exitcode ~= nil then
        return osexit(exitcode)
    end
    if c ~= nil then
        return osexit(c)
    end
    return osexit()
end
