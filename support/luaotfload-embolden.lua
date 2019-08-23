-----------------------------------------------------------------------
--         FILE:  luaotfload-embolden.lua
--  DESCRIPTION:  part of luaotfload / embolden
-----------------------------------------------------------------------

local ProvidesLuaModule = { 
    name          = "luaotfload-embolden",
    version       = "2.991",       --TAGVERSION
    date          = "2019-08-11", --TAGDATE
    description   = "luaotfload submodule / color",
    license       = "GPL v2.0",
    author        = "Marcel Krüger"
}

if luatexbase and luatexbase.provides_module then
  luatexbase.provides_module (ProvidesLuaModule)
end  

local otffeatures        = fonts.constructors.newfeatures "otf"

local function setembolden(tfmdata, factor)
  tfmdata.embolden = factor
end

local function enableembolden(tfmdata)
  tfmdata.mode, tfmdata.width = 2, tfmdata.size*tfmdata.unscaled.embolden/6578.176
end

otffeatures.register {
  name        = "embolden",
  description = "embolden",
  initializers = {
    base = setembolden,
    node = setembolden,
  },
  manipulators = {
    base = enableembolden,
    node = enableembolden,
  }
}

--- vim:sw=2:ts=2:expandtab:tw=71
