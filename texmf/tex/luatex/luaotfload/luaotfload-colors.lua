-----------------------------------------------------------------------
--         FILE:  luaotfload-colors.lua
--  DESCRIPTION:  part of luaotfload / font colors
-----------------------------------------------------------------------

local ProvidesLuaModule = { 
    name          = "luaotfload-colors",
    version       = "3.00",       --TAGVERSION
    date          = "2019-09-13", --TAGDATE
    description   = "luaotfload submodule / color",
    license       = "GPL v2.0",
    author        = "Khaled Hosny, Elie Roux, Philipp Gesang, Dohyun Kim, David Carlisle",
    copyright     = "Luaotfload Development Team"
    }

if luatexbase and luatexbase.provides_module then
  luatexbase.provides_module (ProvidesLuaModule)
end  


--[[doc--

buggy coloring with the pre_output_filter when expansion is enabled
    · tfmdata for different expansion values is split over different objects
    · in ``initializeexpansion()``, chr.expansion_factor is set, and only
      those characters that have it are affected
    · in constructors.scale: chr.expansion_factor = ve*1000 if commented out
      makes the bug vanish

explanation: http://tug.org/pipermail/luatex/2013-May/004305.html

--doc]]--

local logreport             = luaotfload and luaotfload.log.report or print

local nodedirect            = node.direct
local newnode               = nodedirect.new
local insert_node_before    = nodedirect.insert_before
local insert_node_after     = nodedirect.insert_after
local todirect              = nodedirect.todirect
local tonode                = nodedirect.tonode
local setfield              = nodedirect.setfield
local getid                 = nodedirect.getid
local getfont               = nodedirect.getfont
local getlist               = nodedirect.getlist
local getsubtype            = nodedirect.getsubtype
local getnext               = nodedirect.getnext
local nodetail              = nodedirect.tail
local getattribute          = nodedirect.has_attribute
local setattribute          = nodedirect.set_attribute

local stringformat          = string.format
local identifiers           = fonts.hashes.identifiers

local add_color_callback --[[ this used to be a global‽ ]]

--[[doc--
This converts a single octet into a decimal with three digits of
precision. The optional second argument limits precision to a single
digit.
--doc]]--

--- string -> bool? -> string
local hex_to_dec = function (hex,one) --- one isn’t actually used anywhere ...
    if one then
        return stringformat("%.1g", tonumber(hex, 16)/255)
    else
        return stringformat("%.3g", tonumber(hex, 16)/255)
    end
end

--[[doc--
Color string validator / parser.
--doc]]--

local lpeg           = require"lpeg"
local lpegmatch      = lpeg.match
local C, Cg, Ct, P, R, S = lpeg.C, lpeg.Cg, lpeg.Ct, lpeg.P, lpeg.R, lpeg.S

local digit16        = R("09", "af", "AF")
local opaque         = S("fF") * S("fF")
local octet          = C(digit16 * digit16)

local p_rgb          = octet * octet * octet
local p_rgba         = p_rgb * (octet - opaque)
local valid_digits   = C(p_rgba + p_rgb) -- matches eight or six hex digits

local p_Crgb         = Cg(octet/hex_to_dec, "red") --- for captures
                     * Cg(octet/hex_to_dec, "green")
                     * Cg(octet/hex_to_dec, "blue")
local p_Crgba        = p_Crgb * Cg(octet/hex_to_dec, "alpha")
local extract_color  = Ct(p_Crgba + p_Crgb)

--- string -> (string | nil)
local sanitize_color_expression = function (digits)
    digits = tostring(digits)
    local sanitized = lpegmatch(valid_digits, digits)
    if not sanitized then
        logreport("both", 0, "color",
                  "%q is not a valid rgb[a] color expression",
                  digits)
        return nil
    end
    return sanitized
end

--- something is carried around in ``res``
--- for later use by color_handler() --- but what?

local res = nil

--- float -> unit
local function pageresources(alpha)
    res = res or {}
    res[alpha] = true
end

--- we store results of below color handler as tuples of
--- push/pop strings
local color_cache = { } --- (string, (string * string)) hash_t

--- string -> (string * string)
local hex_to_rgba = function (digits)
    if not digits then
        return
    end

    --- this is called like a thousand times, so some
    --- memoizing is in order.
    local cached = color_cache[digits]
    if not cached then
        local push, pop
        local rgb = lpegmatch(extract_color, digits)
        if rgb.alpha then
            pageresources(rgb.alpha)
            push = stringformat(
                        "/TransGs%g gs %s %s %s rg",
                        rgb.alpha,
                        rgb.red,
                        rgb.green,
                        rgb.blue)
            pop  = "0 g /TransGs1 gs"
        else
            push = stringformat(
                        "%s %s %s rg",
                        rgb.red,
                        rgb.green,
                        rgb.blue)
            pop  = "0 g"
        end
        color_cache[digits] = { push, pop }
        return push, pop
    end

    return cached[1], cached[2]
end

--- Luatex internal types

local nodetype          = node.id
local glyph_t           = nodetype("glyph")
local hlist_t           = nodetype("hlist")
local vlist_t           = nodetype("vlist")
local whatsit_t         = nodetype("whatsit")
local disc_t            = nodetype("disc")
local pdfliteral_t      = node.subtype("pdf_literal")
local colorstack_t      = node.subtype("pdf_colorstack")
local mlist_to_hlist    = node.mlist_to_hlist

local color_callback
local color_attr        = luatexbase.new_attribute("luaotfload_color_attribute")

-- (node * node * string * bool * (bool | nil)) -> (node * node * (string | nil))
local color_whatsit
color_whatsit = function (head, curr, color, push, tail)
    local pushdata  = hex_to_rgba(color)
    local colornode = newnode(whatsit_t, colorstack_t)
    setfield(colornode, "stack", 0)
    setfield(colornode, "command", push and 1 or 2) -- 1: push, 2: pop
    setfield(colornode, "data", push and pushdata or nil)
    if tail then
        head, curr = insert_node_after (head, curr, colornode)
    else
        head = insert_node_before(head, curr, colornode)
    end
    if not push and color:len() > 6 then
        local colornode = newnode(whatsit_t, pdfliteral_t)
        setfield(colornode, "mode", 2)
        setfield(colornode, "data", "/TransGs1 gs")
        if tail then
            head, curr = insert_node_after (head, curr, colornode)
        else
            head = insert_node_before(head, curr, colornode)
        end
    end
    color = push and color or nil
    return head, curr, color
end

-- number -> string | nil
local get_font_color = function (font_id)
    local tfmdata    = identifiers[font_id]
    local font_color = tfmdata and tfmdata.properties and tfmdata.properties.color
    return font_color
end

--[[doc--
While the second argument and second returned value are apparently
always nil when the function is called, they temporarily take string
values during the node list traversal.
--doc]]--

--- (node * (string | nil)) -> (node * (string | nil))
local node_colorize
node_colorize = function (head, toplevel, current_color)
    local n = head
    while n do
        local n_id = getid(n)

        if n_id == hlist_t or n_id == vlist_t then
            local n_list = getlist(n)
            if getattribute(n_list, color_attr) then
                if current_color then
                    head, n, current_color = color_whatsit(head, n, current_color, false)
                end
            else
                n_list, current_color = node_colorize(n_list, false, current_color)
                if current_color and getsubtype(n) == 1 then -- created by linebreak
                    n_list, _, current_color = color_whatsit(n_list, nodetail(n_list), current_color, false, true)
                end
                setfield(n, "head", n_list)
            end

        elseif n_id == glyph_t then
            --- colorization is restricted to those fonts
            --- that received the “color” property upon
            --- loading (see ``setcolor()`` above)
            local font_color = get_font_color(getfont(n))
            if font_color ~= current_color then
                if current_color then
                    head, n, current_color = color_whatsit(head, n, current_color, false)
                end
                if font_color then
                    head, n, current_color = color_whatsit(head, n, font_color, true)
                end
            end

            if current_color and color_callback == "pre_linebreak_filter" then
                local nn = getnext(n)
                while nn and getid(nn) == glyph_t do
                    local font_color = get_font_color(getfont(nn))
                    if font_color == current_color then
                        n = nn
                    else
                        break
                    end
                    nn = getnext(nn)
                end
                if getid(nn) == disc_t then
                    head, n, current_color = color_whatsit(head, nn, current_color, false, true)
                else
                    head, n, current_color = color_whatsit(head, n, current_color, false, true)
                end
            end

        elseif n_id == whatsit_t then
            if current_color then
                head, n, current_color = color_whatsit(head, n, current_color, false)
            end

        end

        n = getnext(n)
    end

    if toplevel and current_color then
        head, _, current_color = color_whatsit(head, nodetail(head), current_color, false, true)
    end

    setattribute(head, color_attr, 1)
    return head, current_color
end

local getpageres = pdf.getpageresources or function() return pdf.pageresources end
local setpageres = pdf.setpageresources or function(s) pdf.pageresources = s end
local catat11    = luatexbase.registernumber("catcodetable@atletter")
local gettoks, scantoks = tex.gettoks, tex.scantoks
local pgf = { bye = "pgfutil@everybye", extgs = "\\pgf@sys@addpdfresource@extgs@plain" }

--- node -> node
local color_handler = function (head)
    head = todirect(head)
    head = node_colorize(head, true)
    head = tonode(head)

    -- now append our page resources
    if res then
        res["1"]  = true
        if scantoks and pgf.bye and not pgf.loaded then
            pgf.loaded = token.create(pgf.bye).cmdname == "assign_toks"
            pgf.bye    = pgf.loaded and pgf.bye
        end
        local tpr = pgf.loaded and gettoks(pgf.bye) or getpageres() or ""

        local t   = ""
        for k in pairs(res) do
            local str = stringformat("/TransGs%s<</ca %s>>", k, k) -- don't touch stroking elements
            if not tpr:find(str) then
                t = t .. str
            end
        end
        if t ~= "" then
            if pgf.loaded then
                scantoks("global", pgf.bye, catat11, stringformat("%s{%s}%s", pgf.extgs, t, tpr))
            else
                local tpr, n = tpr:gsub("/ExtGState<<", "%1"..t)
                if n == 0 then
                    tpr = stringformat("%s/ExtGState<<%s>>", tpr, t)
                end
                setpageres(tpr)
            end
        end
        res = nil -- reset res
    end
    return head
end

local color_callback_name      = "luaotfload.color_handler"
local color_callback_activated = 0
local add_to_callback          = luatexbase.add_to_callback

--- unit -> bool
local mlist_to_hlist_initial = function ()
    local cdesc = luatexbase.callback_descriptions "mlist_to_hlist"
    return cdesc and cdesc[1] == color_callback_name
end

--- unit -> unit
add_color_callback = function ( )
    color_callback = config.luaotfload.run.color_callback
    if not color_callback then
        color_callback = "post_linebreak_filter"
    end

    if color_callback_activated == 0 then
        add_to_callback(color_callback,
                        color_handler,
                        color_callback_name)
        add_to_callback("hpack_filter",
                        function (head, groupcode)
                            if  groupcode == "hbox"          or
                                groupcode == "adjusted_hbox" or
                                groupcode == "align_set"     then
                                head = color_handler(head)
                            end
                            return head
                        end,
                        color_callback_name)
        add_to_callback("mlist_to_hlist",
                        function (head, display_type, need_penalties)
                            if mlist_to_hlist_initial () then
                                head = mlist_to_hlist(head, display_type, need_penalties)
                            end
                            if display_type == "text" then
                                return head
                            end
                            return color_handler(head)
                        end,
                        color_callback_name)
        color_callback_activated = 1
    end
end

--[[doc--
``setcolor`` modifies tfmdata.properties.color in place
--doc]]--

--- fontobj -> string -> unit
---
---         (where “string” is a rgb value as three octet
---         hexadecimal, with an optional fourth transparency
---         value)
---
local setcolor = function (tfmdata, value)
    local sanitized  = sanitize_color_expression(value)
    local properties = tfmdata.properties

    if sanitized then
        properties.color = sanitized
        add_color_callback()
    end
end

return function ()
    logreport = luaotfload.log.report
    if not fonts then
        logreport ("log", 0, "color",
                   "OTF mechanisms missing -- did you forget to \z
                   load a font loader?")
        return false
    end
    fonts.handlers.otf.features.register {
        name        = "color",
        description = "color",
        initializers = {
            base = setcolor,
            node = setcolor,
        }
    }
    return true
end

-- vim:tw=71:sw=4:ts=4:expandtab

