if not modules then modules = { } end modules ['font-ota'] = {
    version   = 1.001,
    comment   = "companion to font-ini.mkiv",
    author    = "Hans Hagen, PRAGMA-ADE, Hasselt NL",
    copyright = "PRAGMA ADE / ConTeXt Development Team",
    license   = "see context related readme files"
}

-- context only

local type = type

if not trackers then trackers = { register = function() end } end

----- trace_analyzing = false  trackers.register("otf.analyzing",  function(v) trace_analyzing = v end)

local fonts, nodes, node = fonts, nodes, node

local allocate            = utilities.storage.allocate

local otf                 = fonts.handlers.otf

local analyzers           = fonts.analyzers
local initializers        = allocate()
local methods             = allocate()

analyzers.initializers    = initializers
analyzers.methods         = methods

local a_state             = attributes.private('state')

local nuts                = nodes.nuts
local tonut               = nuts.tonut

local getnext             = nuts.getnext
local getprev             = nuts.getprev
local getprev             = nuts.getprev
local getprop             = nuts.getprop
local setprop             = nuts.setprop
local getsubtype          = nuts.getsubtype
local getchar             = nuts.getchar
local ischar              = nuts.ischar

local end_of_math         = nuts.end_of_math

local nodecodes           = nodes.nodecodes
----- glyph_code          = nodecodes.glyph
local disc_code           = nodecodes.disc
local math_code           = nodecodes.math

local fontdata            = fonts.hashes.identifiers
local categories          = characters and characters.categories or { } -- sorry, only in context
local chardata            = characters and characters.data

local otffeatures         = fonts.constructors.features.otf
local registerotffeature  = otffeatures.register

--[[ldx--
<p>Analyzers run per script and/or language and are needed in order to
process features right.</p>
--ldx]]--

-- never use these numbers directly

local s_init = 1    local s_rphf =  7
local s_medi = 2    local s_half =  8
local s_fina = 3    local s_pref =  9
local s_isol = 4    local s_blwf = 10
local s_mark = 5    local s_pstf = 11
local s_rest = 6

local states = allocate {
    init = s_init,
    medi = s_medi,
    med2 = s_medi,
    fina = s_fina,
    fin2 = s_fina,
    fin3 = s_fina,
    isol = s_isol,
    mark = s_mark,
    rest = s_rest,
    rphf = s_rphf,
    half = s_half,
    pref = s_pref,
    blwf = s_blwf,
    pstf = s_pstf,
}

local features = allocate {
    init = s_init,
    medi = s_medi,
    med2 = s_medi,
    fina = s_fina,
    fin2 = s_fina,
    fin3 = s_fina,
    isol = s_isol,
 -- mark = s_mark,
 -- rest = s_rest,
    rphf = s_rphf,
    half = s_half,
    pref = s_pref,
    blwf = s_blwf,
    pstf = s_pstf,
}

analyzers.states          = states
analyzers.features        = features
analyzers.useunicodemarks = false

-- todo: analyzers per script/lang, cross font, so we need an font id hash -> script
-- e.g. latin -> hyphenate, arab -> 1/2/3 analyze -- its own namespace

-- done can go away as can tonut

function analyzers.setstate(head,font)
    local useunicodemarks  = analyzers.useunicodemarks
    local tfmdata = fontdata[font]
    local descriptions = tfmdata.descriptions
    local first, last, current, n, done = nil, nil, head, 0, false -- maybe make n boolean
    current = tonut(current)
    while current do
        local char, id = ischar(current,font)
        if char and not getprop(current,a_state) then
            done = true
            local d = descriptions[char]
            if d then
                if d.class == "mark" then
                    done = true
                    setprop(current,a_state,s_mark)
                elseif useunicodemarks and categories[char] == "mn" then
                    done = true
                    setprop(current,a_state,s_mark)
                elseif n == 0 then
                    first, last, n = current, current, 1
                    setprop(current,a_state,s_init)
                else
                    last, n = current, n+1
                    setprop(current,a_state,s_medi)
                end
            else -- finish
                if first and first == last then
                    setprop(last,a_state,s_isol)
                elseif last then
                    setprop(last,a_state,s_fina)
                end
                first, last, n = nil, nil, 0
            end
        elseif char == false then
            -- other font
            if first and first == last then
                setprop(last,a_state,s_isol)
            elseif last then
                setprop(last,a_state,s_fina)
            end
            first, last, n = nil, nil, 0
            if id == math_code then
                current = end_of_math(current)
            end
        elseif id == disc_code then
            -- always in the middle .. it doesn't make much sense to assign a property
            -- here ... we might at some point decide to flag the components when present
            -- but even then it's kind of bogus
            setprop(current,a_state,s_medi)
            last = current
        else -- finish
            if first and first == last then
                setprop(last,a_state,s_isol)
            elseif last then
                setprop(last,a_state,s_fina)
            end
            first, last, n = nil, nil, 0
            if id == math_code then
                current = end_of_math(current)
            end
        end
        current = getnext(current)
    end
    if first and first == last then
        setprop(last,a_state,s_isol)
    elseif last then
        setprop(last,a_state,s_fina)
    end
    return head, done
end

-- in the future we will use language/script attributes instead of the
-- font related value, but then we also need dynamic features which is
-- somewhat slower; and .. we need a chain of them

local function analyzeinitializer(tfmdata,value) -- attr
    local script, language = otf.scriptandlanguage(tfmdata) -- attr
    local action = initializers[script]
    if not action then
        -- skip
    elseif type(action) == "function" then
        return action(tfmdata,value)
    else
        local action = action[language]
        if action then
            return action(tfmdata,value)
        end
    end
end

local function analyzeprocessor(head,font,attr)
    local tfmdata = fontdata[font]
    local script, language = otf.scriptandlanguage(tfmdata,attr)
    local action = methods[script]
    if not action then
        -- skip
    elseif type(action) == "function" then
        return action(head,font,attr)
    else
        action = action[language]
        if action then
            return action(head,font,attr)
        end
    end
    return head, false
end

registerotffeature {
    name         = "analyze",
    description  = "analysis of character classes",
    default      = true,
    initializers = {
        node     = analyzeinitializer,
    },
    processors = {
        position = 1,
        node     = analyzeprocessor,
    }
}

-- latin

methods.latn = analyzers.setstate
-------.dflt = analyzers.setstate % can be an option or just the default

local arab_warned = { }

local function warning(current,what)
    local char = getchar(current)
    if not arab_warned[char] then
        log.report("analyze","arab: character %C has no %a class",char,what)
        arab_warned[char] = true
    end
end

local mappers = allocate {
    l = s_init, -- left
    d = s_medi, -- double
    c = s_medi, -- joiner
    r = s_fina, -- right
    u = s_isol, -- nonjoiner
}

-- we can also use this trick for devanagari

local classifiers = characters.classifiers

if not classifiers then

    local f_arabic,  l_arabic  = characters.blockrange("arabic")
    local f_syriac,  l_syriac  = characters.blockrange("syriac")
    local f_mandiac, l_mandiac = characters.blockrange("mandiac")
    local f_nko,     l_nko     = characters.blockrange("nko")
    local f_ext_a,   l_ext_a   = characters.blockrange("arabicextendeda")

    classifiers = table.setmetatableindex(function(t,k)
        if type(k) == "number" then
            local c = chardata[k]
            local v = false
            if c then
                local arabic = c.arabic
                if arabic then
                    v = mappers[arabic]
                    if not v then
                        log.report("analyze","error in mapping arabic %C",k)
                        --  error
                        v = false
                    end
                elseif (k >= f_arabic  and k <= l_arabic)  or
                       (k >= f_syriac  and k <= l_syriac)  or
                       (k >= f_mandiac and k <= l_mandiac) or
                       (k >= f_nko     and k <= l_nko)     or
                       (k >= f_ext_a   and k <= l_ext_a)   then
                    if categories[k] == "mn" then
                        v = s_mark
                    else
                        v = s_rest
                    end
                end
            end
            t[k] = v
            return v
        end
    end)

    characters.classifiers = classifiers

end

function methods.arab(head,font,attr)
    local first, last, c_first, c_last
    local current = head
    local done    = false
    current = tonut(current)
    while current do
        local char, id = ischar(current,font)
        if char and not getprop(current,a_state) then
            done = true
            local classifier = classifiers[char]
            if not classifier then
                if last then
                    if c_last == s_medi or c_last == s_fina then
                        setprop(last,a_state,s_fina)
                    else
                        warning(last,"fina")
                        setprop(last,a_state,s_error)
                    end
                    first, last = nil, nil
                elseif first then
                    if c_first == s_medi or c_first == s_fina then
                        setprop(first,a_state,s_isol)
                    else
                        warning(first,"isol")
                        setprop(first,a_state,s_error)
                    end
                    first = nil
                end
            elseif classifier == s_mark then
                setprop(current,a_state,s_mark)
            elseif classifier == s_isol then
                if last then
                    if c_last == s_medi or c_last == s_fina then
                        setprop(last,a_state,s_fina)
                    else
                        warning(last,"fina")
                        setprop(last,a_state,s_error)
                    end
                    first, last = nil, nil
                elseif first then
                    if c_first == s_medi or c_first == s_fina then
                        setprop(first,a_state,s_isol)
                    else
                        warning(first,"isol")
                        setprop(first,a_state,s_error)
                    end
                    first = nil
                end
                setprop(current,a_state,s_isol)
            elseif classifier == s_medi then
                if first then
                    last = current
                    c_last = classifier
                    setprop(current,a_state,s_medi)
                else
                    setprop(current,a_state,s_init)
                    first = current
                    c_first = classifier
                end
            elseif classifier == s_fina then
                if last then
                    if getprop(last,a_state) ~= s_init then
                        setprop(last,a_state,s_medi)
                    end
                    setprop(current,a_state,s_fina)
                    first, last = nil, nil
                elseif first then
                 -- if getprop(first,a_state) ~= s_init then
                 --     -- needs checking
                 --     setprop(first,a_state,s_medi)
                 -- end
                    setprop(current,a_state,s_fina)
                    first = nil
                else
                    setprop(current,a_state,s_isol)
                end
            else -- classifier == s_rest
                setprop(current,a_state,s_rest)
                if last then
                    if c_last == s_medi or c_last == s_fina then
                        setprop(last,a_state,s_fina)
                    else
                        warning(last,"fina")
                        setprop(last,a_state,s_error)
                    end
                    first, last = nil, nil
                elseif first then
                    if c_first == s_medi or c_first == s_fina then
                        setprop(first,a_state,s_isol)
                    else
                        warning(first,"isol")
                        setprop(first,a_state,s_error)
                    end
                    first = nil
                end
            end
        else
            if last then
                if c_last == s_medi or c_last == s_fina then
                    setprop(last,a_state,s_fina)
                else
                    warning(last,"fina")
                    setprop(last,a_state,s_error)
                end
                first, last = nil, nil
            elseif first then
                if c_first == s_medi or c_first == s_fina then
                    setprop(first,a_state,s_isol)
                else
                    warning(first,"isol")
                    setprop(first,a_state,s_error)
                end
                first = nil
            end
            if id == math_code then -- a bit duplicate as we test for glyphs twice
                current = end_of_math(current)
            end
        end
        current = getnext(current)
    end
    if last then
        if c_last == s_medi or c_last == s_fina then
            setprop(last,a_state,s_fina)
        else
            warning(last,"fina")
            setprop(last,a_state,s_error)
        end
    elseif first then
        if c_first == s_medi or c_first == s_fina then
            setprop(first,a_state,s_isol)
        else
            warning(first,"isol")
            setprop(first,a_state,s_error)
        end
    end
    return head, done
end

methods.syrc = methods.arab
methods.mand = methods.arab
methods.nko  = methods.arab

directives.register("otf.analyze.useunicodemarks",function(v)
    analyzers.useunicodemarks = v
end)
