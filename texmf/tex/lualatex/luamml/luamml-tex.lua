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

local funcid = luatexbase.new_luafunction'RegisterFamilyMapping'
token.set_lua('RegisterTextFamily', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  local fam = token.scan_int()
  local _kind = token.scan_string()
  global_text_families[fam] = true
end

local function shallow_copy(t)
  local tt = {}
  for k,v in next, t do
    tt[k] = v
  end
  return tt
end

-- Possible flag values:
--   0: Skip
--   1: Generate MathML, but only save it for later usage in startmath node
--   3: Normal (This is the only supported one in display mode)
--  11: Generate MathML structure elements
--
--  More generally, flags is a bitfield with the defined bits:
--    Bit 5-7: See Bit 4
--    Bit 4: Overwrite mathstyle with bit 9-11
--    Bit 3: Generate MathML structure elements
--    Bit 2: Change root element name for saved element
--    Bit 1: Save MathML as a fully converted formula
--    Bit 0: Save MathML for later usage in startmath node. Ignored for display math.

local out_file

local mlist_result

local undefined_cmd = token.command_id'undefined_cs'
local call_cmd = token.command_id'call'

local labelled_mathml = {}

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
  local xml, core = process_mlist(mlist, style, setmetatable({}, text_families_meta))
  if flag & 2 == 2 then
    xml = save_result(shallow_copy(xml), display)
  end
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
        labelled_mathml[label] = xml
      end
    end
    if flag & 10 == 8 then
      write_struct(xml, true) -- This modifies xml in-place to reference the struture element
    end
  end
  return true
end, 'dump_list')

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

funcid = luatexbase.new_luafunction'luamml_register_output_hook:N'
token.set_lua('__luamml_register_output_hook:N', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  output_hook_token = token.get_next()
end

funcid = luatexbase.new_luafunction'luamml_disable_output_hook:'
token.set_lua('__luamml_disable_output_hook:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  output_hook_token = nil
end

local annotate_context = require'luamml-tex-annotate'
annotate_context.data.mathml = labelled_mathml

return {
  save_result = save_result,
  labelled = labelled_mathml,
}
