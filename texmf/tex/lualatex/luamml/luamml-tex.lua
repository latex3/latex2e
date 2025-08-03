--[[
   This file defines the luafunctions
   * \RegisterFamilyMapping
   * \RegisterTextFamily
   * \luamml_get_last_mathml_stream:e
   * \luamml_begin_single_file:
   * \luamml_end_single_file:
   * \__luamml_register_output_hook:N
   * \__luamml_disable_output_hook:N
   
   It returns
   * save_result = save_result, (function)
   * labelled = labelled_mathml (a table containing labelled mathml pieces)
   
   It adds a function to the callback
   * pre_mlist_to_hlist_filter
--]]

-- load needed functions
local mlist_to_mml = require'luamml-convert'
local process_mlist = mlist_to_mml.process
local make_root = mlist_to_mml.make_root
local register_family = mlist_to_mml.register_family

local mappings = require'luamml-legacy-mappings'
local write_xml = require'luamml-xmlwriter'
local write_struct = require'luamml-structelemwriter'

local filename_token = token.create'l__luamml_filename_tl'
local label_token = token.create'l__luamml_label_tl'
local left_brace = token.new(string.byte'{', 1)
local right_brace = token.new(string.byte'}', 2)

local output_hook_token
local global_text_families = {}

-- ????
local text_families_meta = {__index = function(t, fam)
  if fam == nil then return nil end
  local assignment = global_text_families[fam]
  if assignment == nil then
    local fid = node.family_font(fam)
    local fontdir = font.getfont(fid)
    if not fontdir then
      -- FIXME(?): If there is no font...
      error'Please load your fonts?!?'
    end
    assignment = not (fontdir.MathConstants and next(fontdir.MathConstants))
  end
  t[fam] = assignment
  return assignment
end}

local properties = node.get_properties_table()

-- retrieve the mode numbers for math, horizontal and vertical mode.
local mmode, hmode, vmode do
  local result, input = {}, tex.getmodevalues()
  for k,v in next, tex.getmodevalues() do
    if v == 'math' then mmode = k
    elseif v == 'horizontal' then hmode = k
    elseif v == 'vertical' then vmode = k
    else assert(v == 'unset')
    end
  end
  assert(mmode and hmode and vmode)
end

--[[ Documentation for luafunction \RegisterFamilyMapping
    Two argument \RegisterFamilyMapping{<family>}{<encoding>}
    Example usage: \RegisterFamilyMapping\symsymbols{oms}
    The mappings are defined in luamml-legacy-mappings.lua.
    Currently only oml, oms, omx known. 
    The remapping function register_family is in luamml-convert (=register_remap)
    TODO: document in luamml.dtx
--]]

local funcid = luatexbase.new_luafunction'RegisterFamilyMapping'
token.set_lua('RegisterFamilyMapping', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  local fam = token.scan_int()
  local mapping = token.scan_string()
  if mappings[mapping] then
    register_family(fam, mappings[mapping])
    if global_text_families[fam] == nil then
      global_text_families[fam] = false
    end
  else
    tex.error(string.format('Unknown font mapping %q', mapping))
  end
end

--[[ Documentation for luafunction \RegisterTextFamily
    Two arguments \RegisterTextFamily{<family>}{<????>}
    There is no example (and logging name was wrong)
--]]

local funcid = luatexbase.new_luafunction'RegisterTextFamily'
token.set_lua('RegisterTextFamily', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  local fam = token.scan_int()
  local _kind = token.scan_string()
  global_text_families[fam] = true
end


-- A helper function to copy a table. 

local function shallow_copy(t)
  local tt = {}
  for k,v in next, t do
    tt[k] = v
  end
  return tt
end

--[[ Documentation for flag \l__luamml_flag_int
    Possible flag values of \l__luamml_flag_int:
      0: Skip
      1: Generate MathML, but only save it for later usage in startmath node
      3: Normal (This is the only supported one in display mode) ?? what is display mode? display math?
     11: Generate MathML structure elements
   
     More generally, \l__luamml_flag_int: is a bitfield with the defined bits:
       Bit 5-7: See Bit 4
       Bit 4: Overwrite mathstyle with bit 9-11
       Bit 3: Generate MathML structure elements
       Bit 2: Change root element name for saved element
       Bit 1: Save MathML as a fully converted formula
       Bit 0: Save MathML for later usage in startmath node. Ignored for display math.
--]]

local out_file

local mlist_result

local undefined_cmd = token.command_id'undefined_cs'
local call_cmd = token.command_id'call'

local labelled_mathml = {}
local labelled_mathml_core = {}

--[[ Documentation for function save_result
    Core function, exported as save_result. 
   
    Used in the callback when math is saved in the startmath node.
    
    loaded in luamml-amsmath.lua, luamml-array.lua, luamml-table.lua but 
    used only in luamml-amsmath.lua in \__luamml_amsmath_finalize_table:n
   
    Three arguments: xml, display, structelem
    Argument xml is the table, display a number. If display<2 it is a display math.
    ?? Argument structelem is not used ??
   
    make_root is defined in luamml-convert.lua (=to_math). It either converts the
    top level mrow to math or adds a math element. 
   
    out_file is set by \luamml_begin_single_file:
   
    write_xml is from luamml_xmlwriter. It takes a "mathml-tree" as first argument
    and writes it out as xml. The second argument is a boolean and decides if the xml uses
    pretty indentation. It is calculated here from \l__luamml_pretty_int with a bitwise AND.
   
    output_hook_token is set by \__luamml_register_output_hook:N, typically this should save
    the result into a command or write it into a file, see latex-lab-math.dtx for an example.
    
    write_struct is defined in luamml-stuctelemwriter.lua (called write_elem there). It writes
    out the tree together with structure element commands. 
--]]

local function save_result(xml, display, structelem)
  mlist_result = make_root(xml, display and 0 or 2)
  if out_file then
    out_file:write(write_xml(mlist_result, tex.count.l__luamml_pretty_int & 1 == 1):sub(2) .. '\n')
  else
    token.put_next(filename_token)
    local filename = token.scan_argument()
    if filename ~= '' then
      assert(io.open(filename, 'w'))
        :write(write_xml(mlist_result, tex.count.l__luamml_pretty_int & 1 == 1):sub(2) .. '\n')
        :close()
    end
  end
  local tracing = tex.count.tracingmathml > 1
  if tracing then
    texio.write_nl(write_xml(mlist_result, tex.count.l__luamml_pretty_int & 2 == 2) .. '\n')
  end
  if output_hook_token then
    tex.runtoks(function()
      tex.sprint(-2, output_hook_token, left_brace, write_xml(mlist_result, tex.count.l__luamml_pretty_int & 4 == 4), right_brace)
    end)
  end
  if tex.count.l__luamml_flag_int & 8 == 8 then
    write_struct(mlist_result)
  end
  return mlist_result
end


luatexbase.add_to_callback('pre_mlist_to_hlist_filter', function(mlist, style)
  if tex.nest.top.mode == mmode then -- This is a equation label generated with \eqno
    return true
  end
  local flag = tex.count.l__luamml_flag_int
  if flag & 3 == 0 then
    return true
  end
  local display = style == 'display'
  local startmath = tex.nest.top.tail -- Must come before any write_struct calls which adds nodes
  style = flag & 16 == 16 and flag>>5 & 0x7 or display and 0 or 2
  -- process_mlist==mlist_to_mml.process from luamml_convert.
  local xml, core = process_mlist(mlist, style, setmetatable({}, text_families_meta))
  -- bit 1 set
  if flag & 2 == 2 then
    xml = save_result(shallow_copy(xml), display)
  end
  -- bit 2 set, change root element if \l__luamml_root_tl is different to mrow. 
  if flag & 4 == 4 then
    local element_type = token.get_macro'l__luamml_root_tl'
    if element_type ~= 'mrow' then
      if xml[0] == 'mrow' then
        xml[0] = element_type
      else
        xml = {[0] = element_type, xml}
      end
    end
  end
  -- bit 0 set
  if not display and flag & 1 == 1 then
    local props = properties[startmath]
    if not props then
      props = {}
      properties[startmath] = props
    end
    props.saved_mathml_table, props.saved_mathml_core = xml, core
    token.put_next(label_token)
    local label = token.scan_argument()
    if label ~= '' then
      if labelled_mathml[label] then
        tex.error('MathML Label already in use', {
            'A MathML expression has a label which is already used by another \z
             formula. If you do not want to label this formula with a unique \z
             label, set a empty label instead.'})
      else
        labelled_mathml[label], labelled_mathml_core[label] = xml, core
      end
    end
    -- bit 3 set and bit 1 unset.
    if flag & 10 == 8 then
      write_struct(xml, true) -- This modifies xml in-place to reference the structure element
    end
  end
  return true
end, 'dump_list')

--[[ Documentation of luafunction luamml_get_last_mathml_stream:e
    this creates a stream object with mathml from the last equation. It should be used after
    the equation. As it nils then the list it can be used only once.
    The return value is an object number which can then be used for example to create a
    filespec dictionary or to reference the stream in some other place.
    It takes an argument: additional dictionary keys for the stream object, e.g. 
    /Type /EmbeddedFile or /Params. 
    see luamml-demo for an example use.
    TODO: document in luamml.dtx
--]]
funcid = luatexbase.new_luafunction'luamml_get_last_mathml_stream:e'
token.set_lua('luamml_get_last_mathml_stream:e', funcid)
lua.get_functions_table()[funcid] = function()
  if not mlist_result then
    tex.error('No current MathML data', {
        "I was asked to provide MathML code for the last formula, but there weren't any new formulas since you last asked."
      })
  end
  local mml = write_xml(mlist_result, tex.count.l__luamml_pretty_int & 8 == 8)
  if tex.count.tracingmathml == 1 then
    texio.write_nl(mml .. '\n')
  end
  tex.sprint(-2, tostring(pdf.immediateobj('stream', mml, '/Subtype/application#2Fmathml+xml' .. token.scan_argument(true))))
  mlist_result = nil
end

--[[ Documentation of luafunctions luamml_begin_single_file:,luamml_end_single_file:
    This opens and closes out_file used in save_result. 
    The filename (stored in filename_token=\l__luamml_filename_tl)
    is expanded in the begin function.   
--]]   
funcid = luatexbase.new_luafunction'luamml_begin_single_file:'
token.set_lua('luamml_begin_single_file:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  token.put_next(filename_token)
  local filename = token.scan_argument()
  if filename ~= '' then
    out_file = assert(io.open(filename, 'w'))
  end
end

funcid = luatexbase.new_luafunction'luamml_end_single_file:'
token.set_lua('luamml_end_single_file:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  if out_file then
    out_file:close()
    out_file = nil
  end
end

--[[ Documentation of luafunctions __luamml_register_output_hook:N,
    and __luamml_disable_output_hook:N
    This fills/clears the output_hook_token used in save_result. 
    TODO currently clashing uses in luamml.dtx and latex-lab-math.
--]]  
funcid = luatexbase.new_luafunction'__luamml_register_output_hook:N'
token.set_lua('__luamml_register_output_hook:N', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  output_hook_token = token.get_next()
end

funcid = luatexbase.new_luafunction'__luamml_disable_output_hook:'
token.set_lua('__luamml_disable_output_hook:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  output_hook_token = nil
end

-- ??
local annotate_context = require'luamml-tex-annotate'
annotate_context.data.mathml = labelled_mathml
annotate_context.data.mathml_core = labelled_mathml_core

return {
  save_result = save_result,
  labelled = labelled_mathml,
  labelled_core = labelled_mathml_core,
}
