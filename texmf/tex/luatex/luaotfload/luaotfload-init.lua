-----------------------------------------------------------------------
--         FILE:  luaotfload-init.lua
--  DESCRIPTION:  part of luaotfload / font loader initialization
-- REQUIREMENTS:  luatex v.0.80 or later; packages lualibs
--       AUTHOR:  Philipp Gesang (Phg), <phg@phi-gamma.net>, Marcel Krüger
-----------------------------------------------------------------------

local ProvidesLuaModule = { 
    name          = "luaotfload-init",
    version       = "3.00",       --TAGVERSION
    date          = "2019-09-13", --TAGDATE
    description   = "luaotfload submodule / initialization",
    license       = "GPL v2.0"
}

if luatexbase and luatexbase.provides_module then
  luatexbase.provides_module (ProvidesLuaModule)
end  
-----------------------------------------------------------------------


local setmetatable = setmetatable
local kpsefind_file   = kpse.find_file
local lfsisdir     = lfs.isdir

--[[doc--

  Initialization phases:

      - Load Lualibs from package
      - Set up the logger routines
      - Load Fontloader
          - as package specified in configuration
          - from Context install
          - (optional: from raw unpackaged files distributed with
            Luaotfload)

  The initialization of the Lualibs may be made configurable in the
  future as well allowing to load both the files and the merged package
  depending on a configuration setting. However, this would require
  separating out the configuration parser into a self-contained
  package, which might be problematic due to its current dependency on
  the Lualibs itself.

--doc]]--

local log        --- filled in after loading the log module
local logreport  --- filled in after loading the log module

--[[doc--

    \subsection{Preparing the Font Loader}
    We treat the fontloader as a semi-black box so behavior is
    consistent between formats.
    We load the fontloader code directly in the same fashion as the
    Plain format \identifier{luatex-fonts} that is part of Context.
    How this is executed depends on the presence on the
    \emphasis{merged font loader code}.
    In \identifier{luaotfload} this is contained in the file
    \fileent{luaotfload-merged.lua}.
    If this file cannot be found, the original libraries from \CONTEXT
    of which the merged code was composed are loaded instead.
    Since these files are not shipped with Luaotfload, an installation
    of Context is required.
    (Since we pull the fontloader directly from the Context minimals,
    the necessary Context version is likely to be more recent than that
    of other TeX distributions like Texlive.)
    The imported font loader will call \luafunction{callback.register}
    once while reading \fileent{font-def.lua}.
    This is unavoidable unless we modify the imported files, but
    harmless if we make it call a dummy instead.
    However, this problem might vanish if we decide to do the merging
    ourselves, like the \identifier{lualibs} package does.
    With this step we would obtain the freedom to load our own
    overrides in the process right where they are needed, at the cost
    of losing encapsulation.
    The decision on how to progress is currently on indefinite hold.

--doc]]--

local init_early = function ()

  local store                  = { }
  config                       = config or { } --- global
  config.luaotfload            = config.luaotfload or { }
  config.lualibs               = config.lualibs    or { }
  config.lualibs.verbose       = false
  config.lualibs.prefer_merged = true
  config.lualibs.load_extended = true
  fonts                        = fonts or { }

  require "lualibs"

  if not lualibs    then error "this module requires Luaotfload" end
  if not luaotfload then error "this module requires Luaotfload" end

  --[[doc--

    The logger needs to be in place prior to loading the fontloader due
    to order of initialization being crucial for the logger functions
    that are swapped.

  --doc]]--

  luaotfload.loaders.luaotfload "log"
  log       = luaotfload.log
  logreport = log.report
  log.set_loglevel (default_log_level)

  logreport ("log", 4, "init", "Concealing callback.register().")
  store.trapped_register = callback.register

  callback.register = function (id)
    logreport ("log", 4, "init",
               "Dummy callback.register() invoked on %s.",
               id)
  end

  --[[doc--

    By default, the fontloader requires a number of \emphasis{private
    attributes} for internal use.
    These must be kept consistent with the attribute handling methods
    as provided by \identifier{luatexbase}.
    Our strategy is to override the function that allocates new
    attributes before we initialize the font loader, making it a
    wrapper around \luafunction{luatexbase.new_attribute}.\footnote{%
        Many thanks, again, to Hans Hagen for making this part
        configurable!
    }
    The attribute identifiers are prefixed “\fileent{luaotfload@}” to
    avoid name clashes.

  --doc]]--

  local new_attribute    = luatexbase.new_attribute
  local the_attributes   = luatexbase.attributes

  attributes = attributes or { } --- this writes a global, sorry

  attributes.private = function (name)
    local attr   = "luaotfload@" .. name --- used to be: “otfl@”
    local number = the_attributes[attr]
    if not number then number = new_attribute(attr) end
    return number
  end

  luaotfload.loaders.fontloader "basics-gen"

  return store
end --- [init_early]

--[[doc--

    These next lines replicate the behavior of
    \fileent{luatex-fonts.lua}.

--doc]]--

local push_namespaces = function ()
    logreport ("log", 4, "init", "push namespace for font loader")
    local normalglobal = { }
    for k, v in next, _G do
        normalglobal[k] = v
    end
    return normalglobal
end

local pop_namespaces = function (normalglobal,
                                 isolate,
                                 context_environment)
    if normalglobal then
        local _G = _G
        local mode = "non-destructive"
        if isolate then mode = "destructive" end
        logreport ("log", 4, "init", "pop namespace from font loader -- " .. mode)
        for k, v in next, _G do
            if not normalglobal[k] then
                context_environment[k] = v
                if isolate then
                    _G[k] = nil
                end
            end
        end
        for k, v in next, normalglobal do
            _G[k] = v
        end
        -- just to be sure:
        setmetatable(context_environment, _G)
    else
        logreport ("both", 0, "init",
                   "irrecoverable error during pop_namespace: no globals to restore")
        os.exit ()
    end
end

--- below paths are relative to the texmf-context
local ltx = "tex/generic/context/luatex"
local ctx = { "tex/context/base/mkiv", "tex/context/base" }

local context_modules = {

  --- Since 2.6 those are directly provided by the Lualibs package.
  { false, "l-lua"      },
  { false, "l-lpeg"     },
  { false, "l-function" },
  { false, "l-string"   },
  { false, "l-table"    },
  { false, "l-io"       },
  { false, "l-file"     },
  { false, "l-boolean"  },
  { false, "l-math"     },
  { false, "l-unicode"  }, -- NEW UF 19.09.2018
  { false, "util-str"   },
  { false, "util-fil"   },

  --- These constitute the fontloader proper.
  { ltx,   "luatex-basics-gen" },
  { ctx,   "data-con"          },
  { ltx,   "luatex-basics-nod" },
  { ltx,   "luatex-basics-chr" }, -- NEW UF 14.12.2018
  { ctx,   "font-ini"          },
  { ltx,   "luatex-fonts-mis"  }, -- NEW UF 19.09.2018
  { ctx,   "font-con"          },
  { ltx,   "luatex-fonts-enc"  },
  { ctx,   "font-cid"          },
  { ctx,   "font-map"          },
--  { ltx,   "luatex-fonts-syn"  }, -- ignore??
  { ctx,   "font-vfc"          }, -- NEW UF 19.09.2018
  { ctx,   "font-oti"          },
  { ctx,   "font-otr"          },
  { ctx,   "font-ott"          }, 
  { ctx,   "font-cff"          },
  { ctx,   "font-ttf"          },
  { ctx,   "font-dsp"          },
  { ctx,   "font-oup"          },
  { ctx,   "font-otl"          },
  { ctx,   "font-oto"          },
  { ctx,   "font-otj"          },
  { ctx,   "font-ota"          },
  { ctx,   "font-ots"          },
  { ctx,   "font-osd"          },
  { ctx,   "font-ocl"          },
  { ctx,   "font-otc"          },
  { ctx,   "font-onr"          },
  { ctx,   "font-one"          },
  { ctx,   "font-afk"          },
  { ctx,   "luatex-fonts-tfm"  },
  { ctx,   "font-lua"          },
  { ctx,   "font-def"          },
  { ltx,   "luatex-fonts-def"  },  
  { ltx,   "luatex-fonts-ext"  },
  { ctx,   "font-imp-tex"      },
  { ctx,   "font-imp-ligatures"},
  { ctx,   "font-imp-italics"  },
  { ctx,   "font-imp-effects"  },
  { ltx,   "luatex-fonts-lig"  },
  { ltx,   "luatex-fonts-gbn"  },
  

} --[[context_modules]]

local load_context_modules = function (pth)

  local load_module   = luaotfload.loaders.context
  local ignore_module = luaotfload.loaders.ignore

  logreport ("both", 2, "init",
             "Loading fontloader components from context.")
  local n = #context_modules
  for i = 1, n do
    local sub, spec = unpack (context_modules [i])
    if sub == false then
      ignore_module (spec)
    else
      local tsub = type (sub)
      if not pth then
        load_module (spec)
      elseif tsub == "string" then
        load_module (spec, file.join (pth, sub))
      elseif tsub == "table" then
        local pfx
        local nsub = #sub
        for j = 1, nsub do
          local full = file.join (pth, sub [j])
          if lfsisdir (full) then --- pick the first real one
            pfx = full
            break
          end
        end
        if pfx then
          load_module (spec, pfx)
        else
          logreport ("both", 0, "init",
                     "None of the %d search paths for module %q exist; \z
                      falling back to default path.",
                     nsub, tostring (spec))
          load_module (spec) --- maybe we’ll get by after all?
        end
      else
        logreport ("both", 0, "init",
                   "Internal error, please report. \z
                    This is not your fault.")
        os.exit (-1)
      end
    end
  end

end

local init_adapt = function ()

  local context_environment  = { }
  local our_environment      = push_namespaces ()

  --[[doc--

      The font loader requires that the attribute with index zero be
      zero. We happily oblige.
      (Cf. \fileent{luatex-fonts-nod.lua}.)

  --doc]]--

  tex.attribute[0] = 0

  return our_environment, context_environment

end --- [init_adapt]

--[[doc--

  In Context, characters.data is where the data from char-def.lua
  resides. The file is huge (>4.4 MB as of 2016) and only a stripped
  down version is part of the isolated font loader. Nevertheless, we
  include an excerpt generated by the mkcharacters script that contains
  a subset of the fields of each character defined and some extra
  metadata.

  Currently, these are (compare the mkcharacters script!)

    · "direction"
    · "mirror"
    · "category"
    · "textclass"

  The directional information is required for packages like Simurgh [0]
  to work correctly. In an early stage [1] it was necessary to load
  further files from Context directly, including the full blown version
  of char-def.  Since we have no use for most of the so imported
  functionality, the required parts have been isolated and are now
  instated along with luaotfload-characters.lua. We can extend the set
  of imported features easily should it not be enough.

  [0] https://github.com/persian-tex/simurgh
  [1] http://tex.stackexchange.com/a/132301/14066

--doc]]--

--[[--14.12.2018disable characters 
--characters         = characters or { } --- should be created in basics-gen
--characters.data    = nil
--local chardef      = "luaotfload-characters"
--
--do
--  local setmetatableindex = function (t, f)
--    local mt = getmetatable (t)
--    if mt then
--      mt.__index = f
--    else
--      setmetatable (t, { __index = f })
--    end
--  end
--
--  --- there are some special tables for each field that provide access
--  --- to fields of the character table by means of a metatable
--
--  local mkcharspecial = function (characters, tablename, field)
--
--    local chardata = characters.data
--
--    if chardata then
--      local newspecial        = { }
--      characters [tablename]  = newspecial --> e.g. “characters.data.mirrors”
--
--      local idx = function (t, char)
--        local c = chardata [char]
--        if c then
--          local m = c [field] --> e.g. “mirror”
--          if m then
--            t [char] = m
--            return m
--          end
--        end
--        newspecial [char] = false
--        return char
--      end
--
--      setmetatableindex (newspecial, idx)
--    end
--
--  end
--
--  local mkcategories = function (characters) -- different from the others
--
--    local chardata         = characters.data
--    local categories       = characters.categories or { }
--    characters.categories  = categories
--
--    setmetatable (categories, { __index = function (t, char)
--      if char then
--        local c = chardata [char]
--        c = c.category or char
--        t [char] = c
--        return c
--      end
--    end})
--
--  end
--
--  local load_failed = false
--  local chardata --> characters.data; loaded on demand
--
--  local load_chardef = function ()
--
--    logreport ("both", 1, "aux", "Loading character metadata from %s.", chardef)
--    chardata = dofile (kpse.find_file (chardef, "lua"))
--
--    if chardata == nil then
--      logreport ("both", 0, "aux",
--                 "Could not load %s; continuing with empty character table.",
--                 chardef)
--      chardata    = { }
--      load_failed = true
--    end
--
--    characters             = { } --- nuke metatable
--    characters.data        = chardata
--    characters.classifiers = chardata.classifiers
--    chardata.classifiers   = nil
--
--    --- institute some of the functionality from char-ini.lua
--
--    mkcharspecial (characters, "mirrors",     "mirror")
--    mkcharspecial (characters, "directions",  "direction")
--    mkcharspecial (characters, "textclasses", "textclass")
--    mkcategories  (characters)
--
--  end
--
--  local charindex = function (t, k)
--    if chardata == nil and load_failed ~= true then
--      load_chardef ()
--    end
--
--    return rawget (characters, k)
--  end
--
--  setmetatableindex (characters, charindex)
--
--end
--]] --14.12.2018disable characters 

local init_main = function ()

  --[[doc--

      First save a copy of font.each in order to also catch old-style fonts

  --doc]]--

  font.originaleach = font.each

  local load_fontloader_module = luaotfload.loaders.fontloader
  local ignore_module          = luaotfload.loaders.ignore

  --[[doc--

      Now that things are sorted out we can finally load the
      fontloader.

  --doc]]--

  local fontloader = config.luaotfload and config.luaotfload.run.fontloader
                                        or "reference"
  fontloader = tostring (fontloader)

  if fontloader == "reference" then
    logreport ("log", 0, "init", "Using reference fontloader.")
    load_fontloader_module (luaotfload.fontloader_package)

  elseif fontloader == "default" then
    --- Same as above but loader name not correctly replaced by the file name
    --- of our fontloader package. Perhaps something’s wrong with the status
    --- file which contains the datestamped filename? In any case, it can’t
    --- hurt reporting it as a bug.
    logreport ("both", 0, "init", "Fontloader substitution failed, got “default”.")
    logreport ("log",  4, "init", "Falling back to reference fontloader.")
    load_fontloader_module (luaotfload.fontloader_package)

  elseif fontloader == "unpackaged" then
    logreport ("log", 0, "init",
               "Loading fontloader components individually.")
    --- The loading sequence is known to change, so this might have to be
    --- updated with future updates. Do not modify it though unless there is
    --- a change to the upstream package!

    --- Since 2.6 those are directly provided by the Lualibs package.
    ignore_module "l-lua"
    ignore_module "l-lpeg"
    ignore_module "l-function"
    ignore_module "l-string"
    ignore_module "l-table"
    ignore_module "l-io"
    ignore_module "l-file"
    ignore_module "l-boolean"
    ignore_module "l-math"
    ignore_module "util-str"
    ignore_module "util-fil"
    ignore_module "luatex-basics-gen"

    load_fontloader_module "data-con"
    load_fontloader_module "basics-nod"
    load_fontloader_module "basics-chr"
    load_fontloader_module "font-ini"
    load_fontloader_module "fonts-mis"
    load_fontloader_module "font-con"
    load_fontloader_module "fonts-enc"
    load_fontloader_module "font-cid"
    load_fontloader_module "font-map"
--    load_fontloader_module "fonts-syn" -- ignore?
    load_fontloader_module "font-vfc"
    load_fontloader_module "font-otr"
    load_fontloader_module "font-oti"    
    load_fontloader_module "font-ott"
    load_fontloader_module "font-cff"
    load_fontloader_module "font-ttf"
    load_fontloader_module "font-dsp"
    load_fontloader_module "font-oup"
    load_fontloader_module "font-otl"
    load_fontloader_module "font-oto"
    load_fontloader_module "font-otj"
    load_fontloader_module "font-ota"
    load_fontloader_module "font-ots"
    load_fontloader_module "font-osd"
    load_fontloader_module "font-ocl"
    load_fontloader_module "font-otc"
    load_fontloader_module "font-onr"
    load_fontloader_module "font-one"
    load_fontloader_module "font-afk"
    load_fontloader_module "fonts-tfm"
    load_fontloader_module "font-lua"
    load_fontloader_module "font-def"
    load_fontloader_module "fonts-def"
    load_fontloader_module "fonts-ext"
    load_fontloader_module "font-imp-tex"
    load_fontloader_module "font-imp-ligatures"
    load_fontloader_module "font-imp-italics"
    load_fontloader_module "font-imp-effects"
    load_fontloader_module "fonts-lig"
    load_fontloader_module "fonts-gbn"

  elseif fontloader == "context" then
    logreport ("log", 0, "init",
               "Loading Context modules in lookup path.")
    load_context_modules ()

  elseif lfsisdir (fontloader) then
    logreport ("log", 0, "init",
               "Loading Context files under prefix “%s”.",
               fontloader)
    load_context_modules (fontloader)

  elseif lfs.isfile (fontloader) then
    logreport ("log", 0, "init",
               "Loading fontloader from absolute path “%s”.",
               fontloader)
    local _void = require (fontloader)

  elseif kpsefind_file (fontloader) then
    local path = kpsefind_file (fontloader)
    logreport ("log", 0, "init",
               "Loading fontloader “%s” from kpse-resolved path “%s”.",
               fontloader, path)
    local _void = require (path)

  elseif kpsefind_file (("fontloader-%s.lua"):format(fontloader)) then
    logreport ("log", 0, "init",
               "Using predefined fontloader “%s”.",
               fontloader)
    load_fontloader_module (fontloader)

  else
    logreport ("both", 0, "init",
               "No match for requested fontloader “%s”.",
               fontloader)
    fontloader = luaotfload.fontloader_package
    logreport ("both", 0, "init",
               "Defaulting to predefined fontloader “%s”.",
               fontloader)
    load_fontloader_module (fontloader)
  end

  ---load_fontloader_module "font-odv.lua" --- <= Devanagari support from Context

  logreport ("log", 0, "init",
             "Context OpenType loader version “%s”",
             fonts.handlers.otf.version)
end --- [init_main]

local init_cleanup = function (store)
  --- reinstate all the stuff we had to move out of the way to
  --- accomodate the loader

  --[[doc--

      Here we adjust the globals created during font loader
      initialization. If the second argument to
      \luafunction{pop_namespaces()} is \verb|true| this will restore the
      state of \luafunction{_G}, eliminating every global generated since
      the last call to \luafunction{push_namespaces()}. At the moment we
      see no reason to do this, and since the font loader is considered
      an essential part of \identifier{luatex} as well as a very well
      organized piece of code, we happily concede it the right to add to
      \luafunction{_G} if needed.

  --doc]]--

  pop_namespaces (store.our_environment,
                  false,
                  store.context_environment)

  --[[doc--

      \subsection{Callbacks}
        After the fontloader is ready we can restore the callback trap
        from \identifier{luatexbase}.

  --doc]]--

  logreport ("log", 4, "init",
             "Restoring original callback.register().")
  callback.register = store.trapped_register
end --- [init_cleanup]

local init_post_install_callbacks = function ()
  --[[doc--

    we do our own callback handling with the means provided by
    luatexbase.
    note: \luafunction{pre_linebreak_filter} and
    \luafunction{hpack_filter} are coupled in \context in the
    concept of \emphasis{node processor}.

  --doc]]--

  -- MK Pass current text direction to simple_font_handler
  local handler = nodes.simple_font_handler
  local callback = function(head, groupcode, _, _, direction)
    if not direction then
      direction = tex.get'textdir'
    end
    domultiscript(head, nil, nil, nil, direction)
    return handler(head, groupcode, nil, nil, direction)
  end
  luatexbase.add_to_callback("pre_linebreak_filter",
                             callback,
                             "luaotfload.node_processor",
                             1)
  luatexbase.add_to_callback("hpack_filter",
                             callback,
                             "luaotfload.node_processor",
                             1)
  -- /MK
end

local init_post_load_agl = function ()

  --[[doc--

      Adobe Glyph List.
      -----------------------------------------------------------------

      Context provides a somewhat different font-age.lua from an
      unclear origin. Unfortunately, the file name it reads from is
      hard-coded in font-enc.lua, so we have to replace the entire
      table.

      This shouldn’t cause any complications. Due to its implementation
      the glyph list will be loaded upon loading a OTF or TTF for the
      first time during a TeX run. (If one sticks to TFM/OFM then it is
      never read at all.) For this reason we can install a metatable
      that looks up the file of our choosing and only falls back to the
      Context one in case it cannot be found.

  --doc]]--

  local encodings = fonts.encodings

  if not encodings then
    --- Might happen during refactoring; we continue graciously but in
    --- a somewhat defect state.
    logreport ("log", 0, "init",
               "preconditions unmet, skipping the Adobe Glyph List; "
               .. "this is a Luaotfload bug.")
    return
  end

  if next (fonts.encodings.agl) then
      --- unnecessary because the file shouldn’t be loaded at this time
      --- but we’re just making sure
      fonts.encodings.agl = nil
      collectgarbage"collect"
  end

  local agl_init = { }      --- start out empty, fill on demand
  encodings.agl  = agl_init --- ugh, replaced again later

  setmetatable (agl_init, { __index = function (t, k)

    if k ~= "unicodes" then
      return nil
    end

    local glyphlist = kpsefind_file "luaotfload-glyphlist.lua"
    if glyphlist then
      logreport ("log", 1, "init", "loading the Adobe glyph list")
    else
      glyphlist = kpsefind_file "font-age.lua"
      logreport ("both", 0, "init",
                 "loading the extended glyph list from ConTeXt")
    end

    if not glyphlist then
      logreport ("both", 4, "init",
                 "Adobe glyph list not found, please check your installation.")
      return nil
    end
    logreport ("both", 4, "init",
               "found Adobe glyph list file at ``%s``, using that.",
               glyphlist)

    local unicodes = dofile(glyphlist)
    encodings.agl  = { unicodes = unicodes }
    return unicodes
  end })

end

--- (unit -> unit) list
local init_post_actions = {
  init_post_install_callbacks,
  init_post_load_agl,
}

--- unit -> size_t
local init_post = function ()
  --- hook for actions that need to take place after the fontloader is
  --- installed

  local n = #init_post_actions
  for i = 1, n do
    local action = init_post_actions[i]
    local taction = type (action)
    if not action or taction ~= "function" then
      logreport ("both", 1, "init",
                 "post hook WARNING: action %d not a function but %s/%s; ignoring.",
                 i, action, taction)
    else
      --- call closure
      action ()
    end
  end

  return n
end --- [init_post]

return {
  early = init_early,
  main = function (store)
    local starttime = os.gettimeofday ()
    store.our_environment, store.context_environment = init_adapt ()
    init_main ()
    init_cleanup (store)
    logreport ("both", 1, "init",
               "fontloader loaded in %0.3f seconds",
               os.gettimeofday() - starttime)
    local n = init_post ()
    logreport ("both", 5, "init", "post hook terminated, %d actions performed", n)
    return true
  end
}

-- vim:tw=79:sw=2:ts=2:expandtab
