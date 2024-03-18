-----------------------------------------------------------------------
--         FILE:  luaotfload-arabic.lua
--  DESCRIPTION:  part of luaotfload / arabic specific support
-----------------------------------------------------------------------

assert(luaotfload_module, "This is a part of luaotfload and should not be loaded independently") { 
    name          = "luaotfload-arabic",
    version       = "3.28",       --TAGVERSION
    date          = "2024-02-14", --TAGDATE
    description   = "luaotfload submodule / features",
    license       = "GPL v2.0",
    author        = "Marcel Krüger",
    copyright     = "The LaTeX Project",
}

local unicode = require'luaotfload-unicode'
local ccc = unicode.ccc

local node_new = node.direct.new
local setlink = node.direct.setlink
local is_char = node.direct.is_char
local getnext = node.direct.getnext

-- Mark combining marks
local mcm = {
    [0x0654] = true, -- ARABIC HAMZA ABOVE
    [0x0655] = true, -- ARABIC HAMZA BELOW
    [0x0658] = true, -- ARABIC MARK NOON GHUNNA
    [0x06DC] = true, -- ARABIC SMALL HIGH SEEN
    [0x06E3] = true, -- ARABIC SMALL LOW SEEN
    [0x06E7] = true, -- ARABIC SMALL HIGH YEH
    [0x06E8] = true, -- ARABIC SMALL HIGH NOON
    [0x08CA] = true, -- ARABIC SMALL HIGH FARSI YEH
    [0x08CB] = true, -- ARABIC SMALL HIGH YEH BARREE WITH TWO DOTS BELOW
    [0x08CD] = true, -- ARABIC SMALL HIGH ZAH
    [0x08CE] = true, -- ARABIC LARGE ROUND DOT ABOVE
    [0x08CF] = true, -- ARABIC LARGE ROUND DOT BELOW
    [0x08D3] = true, -- ARABIC SMALL LOW WAW
    [0x08F3] = true, -- ARABIC SMALL HIGH WAW 
}

-- Implement AMTRA from UTR #53.
-- This assumes that the text is already normalized according to NFD. For most
-- fonts, normalizing to NFC should be good enough.
local function reorder_amtra(head, f)
    local n = head
    while n do
        local base, prev = n
        prev, n = n, getnext(n)
        while true do
            local char = is_char(n, f) -- is_char(nil, f) == is_char(0, f) == nil
            local this_ccc = ccc[char]
            if not this_ccc then break end -- ! This `break` is the hot path
            if this_ccc == 33 then
                local after_33, tail_33 = n
                repeat
                    tail_33 = after_33
                    after_33 = getnext(tail_33)
                    local char = is_char(after_33, f)
                    local after_ccc = ccc[char]
                until after_ccc ~= 33
                setlink(prev, after_33)
                setlink(tail_33, getnext(base))
                setlink(base, n)
                if prev == base then
                    prev = tail_33
                end
                n = after_33
            elseif this_ccc == 220 then
                local after_220, tail_220, found = n
                repeat
                    tail_220 = after_220
                    after_220 = getnext(tail_220)
                    local char = is_char(after_220, f)
                    if mcm[char] then found = true end
                    local after_ccc = ccc[char]
                until after_ccc ~= 220
                if found then
                    setlink(prev, after_220)
                    setlink(tail_220, getnext(base))
                    setlink(base, n)
                    if prev == base then
                        prev = tail_220
                    end
                    n = after_220
                    base = tail_220 -- Because ccc230 should get inserted after this
                else
                    prev, n = tail_220, after_220
                end
            elseif this_ccc == 230 then
                local after_230, tail_230, found = n
                repeat
                    tail_230 = after_230
                    after_230 = getnext(tail_230)
                    local char = is_char(after_230, f)
                    if mcm[char] then found = true end
                    local after_ccc = ccc[char]
                until after_ccc ~= 230
                if found then
                    setlink(prev, after_230)
                    setlink(tail_230, getnext(base))
                    setlink(base, n)
                    if prev == base then
                        prev = tail_230
                    end
                    n = after_230
                else
                    prev, n = tail_220, after_220
                end
            else
                prev, n = n, getnext(n)
            end
        end
    end
    return n
end

-- We need to run after normalize and ideally directly afterwards. So try to insert after normalize
-- or default to the start of the list such that normalize can insert itself before us later.
local normalize_index = 0
for i, manipulator in ipairs(fonts.constructors.features.otf.processors.node) do
  if manipulator.name == 'normalize' then
    normalize_index = i
  end
end
fonts.constructors.features.otf.register {
    name = 'amtra',
    default = 'auto',
    description = 'Apply Unicode Arabic Mark Rendering',
    initializers = {
        node = function(fonttable, value, features)
            if values == 'auto' then
                features.amtra = fonttable.properties.script == 'arab'
            end
        end,
    },
    processors = {
        position = normalize_index + 1,
        node = function(head, f)
            return reorder_amtra(head, f)
        end,
    },
}
