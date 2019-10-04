if not modules then modules = { } end modules ['font-ocl'] = {
    version   = 1.001,
    comment   = "companion to font-ini.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

-- todo : user list of colors

local tostring, tonumber, next = tostring, tonumber, next
local round, max = math.round, math.round
local sortedkeys, sortedhash = table.sortedkeys, table.sortedhash
local setmetatableindex = table.setmetatableindex

local formatters   = string.formatters
local tounicode    = fonts.mappings.tounicode

local helpers      = fonts.helpers

local charcommand  = helpers.commands.char
local rightcommand = helpers.commands.right
local leftcommand  = helpers.commands.left
local downcommand  = helpers.commands.down

local otf          = fonts.handlers.otf

local f_color      = formatters["%.3f %.3f %.3f rg"]
local f_gray       = formatters["%.3f g"]

if context then

    local startactualtext = nil
    local stopactualtext  = nil

    function otf.getactualtext(s)
        if not startactualtext then
            startactualtext = backends.codeinjections.startunicodetoactualtextdirect
            stopactualtext  = backends.codeinjections.stopunicodetoactualtextdirect
        end
        return startactualtext(s), stopactualtext()
    end

else

    local tounicode = fonts.mappings.tounicode16

    function otf.getactualtext(s)
        return
            "/Span << /ActualText <feff" .. s .. "> >> BDC",
            "EMC"
    end

end

local sharedpalettes = { }

local hash = setmetatableindex(function(t,k)
    local v = { "pdf", "direct", k }
    t[k] = v
    return v
end)

if context then

    -- \definefontcolorpalette [emoji-r] [emoji-red,emoji-gray,textcolor] -- looks bad
    -- \definefontcolorpalette [emoji-r] [emoji-red,emoji-gray]           -- looks okay

    local colors          = attributes.list[attributes.private('color')] or { }
    local transparencies  = attributes.list[attributes.private('transparency')] or { }

    function otf.registerpalette(name,values)
        sharedpalettes[name] = values
        local color          = lpdf.color
        local transparency   = lpdf.transparency
        local register       = colors.register
        for i=1,#values do
            local v = values[i]
            if v == "textcolor" then
                values[i] = false
            else
                local c = nil
                local t = nil
                if type(v) == "table" then
                    c = register(name,"rgb",
                        max(round((v.r or 0)*255),255)/255,
                        max(round((v.g or 0)*255),255)/255,
                        max(round((v.b or 0)*255),255)/255
                    )
                else
                    c = colors[v]
                    t = transparencies[v]
                end
                if c and t then
                    values[i] = hash[color(1,c) .. " " .. transparency(t)]
                elseif c then
                    values[i] = hash[color(1,c)]
                elseif t then
                    values[i] = hash[color(1,t)]
                end
            end
        end
    end

else -- for generic

    function otf.registerpalette(name,values)
        sharedpalettes[name] = values
        for i=1,#values do
            local v = values[i]
            if v then
                values[i] = hash[f_color(
                    max(round((v.r or 0)*255),255)/255,
                    max(round((v.g or 0)*255),255)/255,
                    max(round((v.b or 0)*255),255)/255
                )]
            end
        end
    end

end

-- We need to force page first because otherwise the q's get outside the font switch and
-- as a consequence the next character has no font set (well, it has: the preceding one). As
-- a consequence these fonts are somewhat inefficient as each glyph gets the font set. It's
-- a side effect of the fact that a font is handled when a character gets flushed. Okay, from
-- now on we can use text as literal mode.

local function convert(t,k)
    local v = { }
    for i=1,#k do
        local p = k[i]
        local r, g, b = p[1], p[2], p[3]
        if r == g and g == b then
            v[i] = hash[f_gray(r/255)]
        else
            v[i] = hash[f_color(r/255,g/255,b/255)]
        end
    end
    t[k] = v
    return v
end

local start = { "pdf", "mode", "font" } -- force text mode (so get q Q right)
----- stop  = { "pdf", "mode", "page" } -- force page mode (else overlap)
local push  = { "pdf", "page", "q" }
local pop   = { "pdf", "page", "Q" }

-- -- This one results in color directives inside BT ET but has less q Q pairs. It
-- -- only shows the first glyph in acrobat and nothing more. No problem with other
-- -- renderers.
--
-- local function initialize(tfmdata,kind,value) -- hm, always value
--     if value then
--         local resources = tfmdata.resources
--         local palettes  = resources.colorpalettes
--         if palettes then
--             --
--             local converted = resources.converted
--             if not converted then
--                 converted = setmetatableindex(convert)
--                 resources.converted = converted
--             end
--             local colorvalues = sharedpalettes[value] or converted[palettes[tonumber(value) or 1] or palettes[1]] or { }
--             local classes     = #colorvalues
--             if classes == 0 then
--                 return
--             end
--             --
--             local characters   = tfmdata.characters
--             local descriptions = tfmdata.descriptions
--             local properties   = tfmdata.properties
--             --
--             properties.virtualized = true
--             tfmdata.fonts = {
--                 { id = 0 }
--             }
--             --
--             local getactualtext = otf.getactualtext
--             local default       = colorvalues[#colorvalues]
--             local b, e          = getactualtext(tounicode(0xFFFD))
--             local actualb       = { "pdf", "page", b } -- saves tables
--             local actuale       = { "pdf", "page", e } -- saves tables
--             --
--             for unicode, character in next, characters do
--                 local description = descriptions[unicode]
--                 if description then
--                     local colorlist = description.colors
--                     if colorlist then
--                         local u = description.unicode or characters[unicode].unicode
--                         local w = character.width or 0
--                         local s = #colorlist
--                         local goback = w ~= 0 and leftcommand[w] or nil -- needs checking: are widths the same
--                         local t = {
--                             start,
--                             not u and actualb or { "pdf", "page", (getactualtext(tounicode(u))) }
--                         }
--                         local n = 2
--                         local l = nil
--                         n = n + 1 t[n] = push
--                         for i=1,s do
--                             local entry = colorlist[i]
--                             local v = colorvalues[entry.class] or default
--                             if v and l ~= v then
--                                 n = n + 1 t[n] = v
--                                 l = v
--                             end
--                             n = n + 1 t[n] = charcommand[entry.slot]
--                             if s > 1 and i < s and goback then
--                                 n = n + 1 t[n] = goback
--                             end
--                         end
--                         n = n + 1 t[n] = pop
--                         n = n + 1 t[n] = actuale
--                         n = n + 1 t[n] = stop
--                         character.commands = t
--                     end
--                 end
--             end
--         end
--     end
-- end
--
-- -- Here we have no color change in BT .. ET and  more q Q pairs but even then acrobat
-- -- fails displaying the overlays correctly. Other renderers do it right.

local function initialize(tfmdata,kind,value)
    if value then
        local resources = tfmdata.resources
        local palettes  = resources.colorpalettes
        if palettes then
            --
            local converted = resources.converted
            if not converted then
                converted = setmetatableindex(convert)
                resources.converted = converted
            end
            local colorvalues = sharedpalettes[value]
            local default     = false -- so the text color (bad for icon overloads)
            if colorvalues then
                default = colorvalues[#colorvalues]
            else
                colorvalues = converted[palettes[tonumber(value) or 1] or palettes[1]] or { }
            end
            local classes = #colorvalues
            if classes == 0 then
                return
            end
            --
            local characters   = tfmdata.characters
            local descriptions = tfmdata.descriptions
            local properties   = tfmdata.properties
            --
            properties.virtualized = true
            tfmdata.fonts = {
                { id = 0 }
            }
            --
            local getactualtext = otf.getactualtext
            local b, e          = getactualtext(tounicode(0xFFFD))
            local actualb       = { "pdf", "page", b } -- saves tables
            local actuale       = { "pdf", "page", e } -- saves tables
            --
            for unicode, character in next, characters do
                local description = descriptions[unicode]
                if description then
                    local colorlist = description.colors
                    if colorlist then
                        local u = description.unicode or characters[unicode].unicode
                        local w = character.width or 0
                        local s = #colorlist
                        local goback = w ~= 0 and leftcommand[w] or nil -- needs checking: are widths the same
                        local t = {
                            start, -- really needed
                            not u and actualb or { "pdf", "page", (getactualtext(tounicode(u))) }
                        }
                        local n = 2
                        local l = nil
                        local f = false
                        for i=1,s do
                            local entry = colorlist[i]
                            local v = colorvalues[entry.class] or default
                            if v and l ~= v then
                                if f then
                                    n = n + 1 t[n] = pop
                                end
                                n = n + 1 t[n] = push
                                f = true
                                n = n + 1 t[n] = v
                                l = v
                            else
                                if f then
                                    n = n + 1 t[n] = pop
                                end
                                f = false
                                l = nil
                            end
                            n = n + 1 t[n] = charcommand[entry.slot]
                            if s > 1 and i < s and goback then
                                n = n + 1 t[n] = goback
                            end
                        end
                        if f then
                            n = n + 1 t[n] = pop
                        end
                        n = n + 1 t[n] = actuale
                     -- n = n + 1 t[n] = stop -- not needed
                        character.commands = t
                    end
                end
            end
        end
    end
end

fonts.handlers.otf.features.register {
    name         = "colr",
    description  = "color glyphs",
    manipulators = {
        base = initialize,
        node = initialize,
    }
}

do

    local nofstreams = 0
    local f_name     = formatters[ [[pdf-glyph-%05i]] ]
    local f_used     = context and formatters[ [[original:///%s]] ] or formatters[ [[%s]] ]
    local hashed     = { }
    local cache      = { }

    local openpdf = pdfe.new
    ----- prefix  = "data:application/pdf,"

    function otf.storepdfdata(pdf)
        local done = hashed[pdf]
        if not done then
            nofstreams = nofstreams + 1
            local f = f_name(nofstreams)
            local n = openpdf(pdf,#pdf,f)
            done = f_used(n)
            hashed[pdf] = done
        end
        return done
    end

end

-- I'll probably make a variant for context as we can do it more efficient there than in
-- generic.

local function pdftovirtual(tfmdata,pdfshapes,kind) -- kind = png|svg
    if not tfmdata or not pdfshapes or not kind then
        return
    end
    --
    local characters = tfmdata.characters
    local properties = tfmdata.properties
    local parameters = tfmdata.parameters
    local hfactor    = parameters.hfactor
    --
    properties.virtualized = true
    --
    tfmdata.fonts = {
        { id = 0 } -- not really needed
    }
        --
    local getactualtext = otf.getactualtext
    local storepdfdata  = otf.storepdfdata
    --
    local b, e          = getactualtext(tounicode(0xFFFD))
    local actualb       = { "pdf", "page", b } -- saves tables
    local actuale       = { "pdf", "page", e } -- saves tables
    --
    local vfimage = lpdf and lpdf.vfimage or function(wd,ht,dp,data,name)
        -- needed for generic (if used there at all)
        local name = storepdfdata(data)
        return { "image", { filename = name, width = wd, height = ht, depth = dp } }
    end
    --
    for unicode, character in sortedhash(characters) do  -- sort is nicer for svg
        local index = character.index
        if index then
            local pdf  = pdfshapes[index]
            local typ  = type(pdf)
            local data = nil
            local dx   = nil
            local dy   = nil
            if typ == "table" then
                data = pdf.data
                dx   = pdf.dx or 0
                dy   = pdf.dy or 0
            elseif typ == "string" then
                data = pdf
                dx   = 0
                dy   = 0
            end
            if data then
                -- We can delay storage by a lua function in commands: but then we need to
                -- be able to provide our own mem stream name (so that we can reserve it).
                -- Anyway, we will do this different in a future version of context.
                local bt = unicode and getactualtext(unicode)
                local wd = character.width  or 0
                local ht = character.height or 0
                local dp = character.depth  or 0
                -- The down and right will change too (we can move that elsewhere).
                character.commands = {
                    not unicode and actualb or { "pdf", "page", (getactualtext(unicode)) },
                    downcommand[dp + dy * hfactor],
                    rightcommand[dx * hfactor],
                    vfimage(wd,ht,dp,data,name),
                    actuale,
                }
                character[kind] = true
            end
        end
    end
end

local otfsvg   = otf.svg or { }
otf.svg        = otfsvg
otf.svgenabled = true

do

    local report_svg = logs.reporter("fonts","svg conversion")

    local loaddata   = io.loaddata
    local savedata   = io.savedata
    local remove     = os.remove

    if context and xml.convert then

        local xmlconvert = xml.convert
        local xmlfirst   = xml.first

        function otfsvg.filterglyph(entry,index)
            local svg  = xmlconvert(entry.data)
            local root = svg and xmlfirst(svg,"/svg[@id='glyph"..index.."']")
            local data = root and tostring(root)
         -- report_svg("data for glyph %04X: %s",index,data)
            return data
        end

    else

        function otfsvg.filterglyph(entry,index) -- can be overloaded
            return entry.data
        end

    end

    local runner = sandbox and sandbox.registerrunner {
        name     = "otfsvg",
        program  = "inkscape",
        method   = "pipeto",
        template = "--shell > temp-otf-svg-shape.log",
        reporter = report_svg,
    }

    if not runner then
        --
        -- poor mans variant for generic:
        --
        runner = function()
            return io.open("inkscape --shell > temp-otf-svg-shape.log","w")
        end
    end

    function otfsvg.topdf(svgshapes)
        local pdfshapes = { }
        local inkscape  = runner()
        if inkscape then
            local nofshapes   = #svgshapes
            local f_svgfile   = formatters["temp-otf-svg-shape-%i.svg"]
            local f_pdffile   = formatters["temp-otf-svg-shape-%i.pdf"]
            local f_convert   = formatters["%s --export-pdf=%s\n"]
            local filterglyph = otfsvg.filterglyph
            local nofdone     = 0
            report_svg("processing %i svg containers",nofshapes)
            statistics.starttiming()
            for i=1,nofshapes do
                local entry = svgshapes[i]
                for index=entry.first,entry.last do
                    local data = filterglyph(entry,index)
                    if data and data ~= "" then
                        local svgfile = f_svgfile(index)
                        local pdffile = f_pdffile(index)
                        savedata(svgfile,data)
                        inkscape:write(f_convert(svgfile,pdffile))
                        pdfshapes[index] = true
                        nofdone = nofdone + 1
                        if nofdone % 100 == 0 then
                            report_svg("%i shapes processed",nofdone)
                        end
                    end
                end
            end
            inkscape:write("quit\n")
            inkscape:close()
            report_svg("processing %i pdf results",nofshapes)
            for index in next, pdfshapes do
                local svgfile = f_svgfile(index)
                local pdffile = f_pdffile(index)
                pdfshapes[index] = loaddata(pdffile)
                remove(svgfile)
                remove(pdffile)
            end
            statistics.stoptiming()
            if statistics.elapsedseconds then
                report_svg("svg conversion time %s",statistics.elapsedseconds() or "-")
            end
        end
        return pdfshapes
    end

end

local function initializesvg(tfmdata,kind,value) -- hm, always value
    if value and otf.svgenabled then
        local svg       = tfmdata.properties.svg
        local hash      = svg and svg.hash
        local timestamp = svg and svg.timestamp
        if not hash then
            return
        end
        local pdffile   = containers.read(otf.pdfcache,hash)
        local pdfshapes = pdffile and pdffile.pdfshapes
        if not pdfshapes or pdffile.timestamp ~= timestamp then
            local svgfile   = containers.read(otf.svgcache,hash)
            local svgshapes = svgfile and svgfile.svgshapes
            pdfshapes = svgshapes and otfsvg.topdf(svgshapes) or { }
            containers.write(otf.pdfcache, hash, {
                pdfshapes = pdfshapes,
                timestamp = timestamp,
            })
        end
        pdftovirtual(tfmdata,pdfshapes,"svg")
    end
end

fonts.handlers.otf.features.register {
    name         = "svg",
    description  = "svg glyphs",
    manipulators = {
        base = initializesvg,
        node = initializesvg,
    }
}

-- This can be done differently e.g. with ffi and gm and we can share code anway. Using
-- batchmode in gm is not faster and as it accumulates we would need to flush all
-- individual shapes. But ... in context lmtx (and maybe the backport) we will use
-- a different and more efficient method anyway. I'm still wondering if I should
-- keep color code in generic. Maybe it should be optional.

local otfpng   = otf.png or { }
otf.png        = otfpng
otf.pngenabled = true

do

    local report_png = logs.reporter("fonts","png conversion")

    local loaddata   = io.loaddata
    local savedata   = io.savedata
    local remove     = os.remove

    local runner = sandbox and sandbox.registerrunner {
        name     = "otfpng",
        program  = "gm",
        template = "convert -quality 100 temp-otf-png-shape.png temp-otf-png-shape.pdf > temp-otf-svg-shape.log",
     -- reporter = report_png,
    }

    if not runner then
        --
        -- poor mans variant for generic:
        --
        runner = function()
            return os.execute("gm convert -quality 100 temp-otf-png-shape.png temp-otf-png-shape.pdf > temp-otf-svg-shape.log")
        end
    end

    -- Alternatively we can create a single pdf file with -adjoin and then pick up pages from
    -- that file but creating thousands of small files is no fun either.

    function otfpng.topdf(pngshapes)
        local pdfshapes  = { }
        local pngfile    = "temp-otf-png-shape.png"
        local pdffile    = "temp-otf-png-shape.pdf"
        local nofdone    = 0
        local indices    = sortedkeys(pngshapes) -- can be sparse
        local nofindices = #indices
        report_png("processing %i png containers",nofindices)
        statistics.starttiming()
        for i=1,nofindices do
            local index = indices[i]
            local entry = pngshapes[index]
            local data  = entry.data -- or placeholder
            local x     = entry.x
            local y     = entry.y
            savedata(pngfile,data)
            runner()
            pdfshapes[index] = {
                x     = x ~= 0 and x or nil,
                y     = y ~= 0 and y or nil,
                data  = loaddata(pdffile),
            }
            nofdone = nofdone + 1
            if nofdone % 100 == 0 then
                report_png("%i shapes processed",nofdone)
            end
        end
        report_png("processing %i pdf results",nofindices)
        remove(pngfile)
        remove(pdffile)
        statistics.stoptiming()
        if statistics.elapsedseconds then
            report_png("png conversion time %s",statistics.elapsedseconds() or "-")
        end
        return pdfshapes
    end

end

-- This will change in a future version of context. More direct.

local function initializepng(tfmdata,kind,value) -- hm, always value
    if value and otf.pngenabled then
        local png       = tfmdata.properties.png
        local hash      = png and png.hash
        local timestamp = png and png.timestamp
        if not hash then
            return
        end
        local pdffile   = containers.read(otf.pdfcache,hash)
        local pdfshapes = pdffile and pdffile.pdfshapes
        if not pdfshapes or pdffile.timestamp ~= timestamp then
            local pngfile   = containers.read(otf.pngcache,hash)
            local pngshapes = pngfile and pngfile.pngshapes
            pdfshapes = pngshapes and otfpng.topdf(pngshapes) or { }
            containers.write(otf.pdfcache, hash, {
                pdfshapes = pdfshapes,
                timestamp = timestamp,
            })
        end
        --
        pdftovirtual(tfmdata,pdfshapes,"png")
    end
end

fonts.handlers.otf.features.register {
    name         = "sbix",
    description  = "sbix glyphs",
    manipulators = {
        base = initializepng,
        node = initializepng,
    }
}

fonts.handlers.otf.features.register {
    name         = "cblc",
    description  = "cblc glyphs",
    manipulators = {
        base = initializepng,
        node = initializepng,
    }
}
