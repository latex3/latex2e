if not modules then modules = { } end modules ['data-con'] = {
    version   = 1.100,
    comment   = "companion to luat-lib.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

local format, lower, gsub = string.format, string.lower, string.gsub

local trace_cache      = false  trackers.register("resolvers.cache",      function(v) trace_cache      = v end)
local trace_containers = false  trackers.register("resolvers.containers", function(v) trace_containers = v end)
local trace_storage    = false  trackers.register("resolvers.storage",    function(v) trace_storage    = v end)

--[[ldx--
<p>Once we found ourselves defining similar cache constructs
several times, containers were introduced. Containers are used
to collect tables in memory and reuse them when possible based
on (unique) hashes (to be provided by the calling function).</p>

<p>Caching to disk is disabled by default. Version numbers are
stored in the saved table which makes it possible to change the
table structures without bothering about the disk cache.</p>

<p>Examples of usage can be found in the font related code.</p>
--ldx]]--

containers          = containers or { }
local containers    = containers
containers.usecache = true

local report_containers = logs.reporter("resolvers","containers")

local allocated = { }

local mt = {
    __index = function(t,k)
        if k == "writable" then
            local writable = caches.getwritablepath(t.category,t.subcategory) or { "." }
            t.writable = writable
            return writable
        elseif k == "readables" then
            local readables = caches.getreadablepaths(t.category,t.subcategory) or { "." }
            t.readables = readables
            return readables
        end
    end,
    __storage__ = true
}

function containers.define(category, subcategory, version, enabled)
    if category and subcategory then
        local c = allocated[category]
        if not c then
            c  = { }
            allocated[category] = c
        end
        local s = c[subcategory]
        if not s then
            s = {
                category    = category,
                subcategory = subcategory,
                storage     = { },
                enabled     = enabled,
                version     = version or math.pi, -- after all, this is TeX
                trace       = false,
             -- writable    = caches.getwritablepath  and caches.getwritablepath (category,subcategory) or { "." },
             -- readables   = caches.getreadablepaths and caches.getreadablepaths(category,subcategory) or { "." },
            }
            setmetatable(s,mt)
            c[subcategory] = s
        end
        return s
    end
end

function containers.is_usable(container,name)
    return container.enabled and caches and caches.is_writable(container.writable, name)
end

function containers.is_valid(container,name)
    if name and name ~= "" then
        local storage = container.storage[name]
        return storage and storage.cache_version == container.version
    else
        return false
    end
end

function containers.read(container,name)
    local storage = container.storage
    local stored = storage[name]
    if not stored and container.enabled and caches and containers.usecache then
        stored = caches.loaddata(container.readables,name,container.writable)
        if stored and stored.cache_version == container.version then
            if trace_cache or trace_containers then
                report_containers("action %a, category %a, name %a","load",container.subcategory,name)
            end
        else
            stored = nil
        end
        storage[name] = stored
    elseif stored then
        if trace_cache or trace_containers then
            report_containers("action %a, category %a, name %a","reuse",container.subcategory,name)
        end
    end
    return stored
end

function containers.write(container, name, data)
    if data then
        data.cache_version = container.version
        if container.enabled and caches then
            local unique, shared = data.unique, data.shared
            data.unique, data.shared = nil, nil
            caches.savedata(container.writable, name, data)
            if trace_cache or trace_containers then
                report_containers("action %a, category %a, name %a","save",container.subcategory,name)
            end
            data.unique, data.shared = unique, shared
        end
        if trace_cache or trace_containers then
            report_containers("action %a, category %a, name %a","store",container.subcategory,name)
        end
        container.storage[name] = data
    end
    return data
end

function containers.content(container,name)
    return container.storage[name]
end

function containers.cleanname(name)
 -- return (gsub(lower(name),"[^%w]+","-"))
    return (gsub(lower(name),"[^%w\128-\255]+","-")) -- more utf friendly
end
