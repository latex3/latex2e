if not luaotfload.set_transparent_colorstack then return end
local l = lpeg
local spaces = l.P' '^0
local digit16 = l.R('09', 'af', 'AF')

local octet = digit16 * digit16 / function(s) return string.format('%.3g ', tonumber(s, 16) / 255) end
local htmlcolor = l.Cs(octet * octet * octet * -1 * l.Cc'rg')
local color_export = {
  token.create'endlocalcontrol',
  token.create'tex_hpack:D',
  token.new(0, 1),
  token.create'color_export:nnN',
  token.new(0, 1),
  '',
  token.new(0, 2),
  token.new(0, 1),
  'backend',
  token.new(0, 2),
  token.create'l_tmpa_tl',
  token.create'exp_after:wN',
  token.create'__color_select:nn',
  token.create'l_tmpa_tl',
  token.new(0, 2),
}
local group_end = token.create'group_end:'
local value = (1 - l.P'}')^0
luatexbase.add_to_callback('luaotfload.parse_color', function (value)
  local html = htmlcolor:match(value)
  if html then return html end

  tex.runtoks(function()
    token.get_next()
    color_export[6] = value
    tex.sprint(-2, color_export)
  end)
  local list = token.scan_list()
  if not list.head or list.head.next or list.head.subtype ~= node.subtype'pdf_colorstack' then
    error'Unexpected backend behavior'
  end
  local cmd = list.head.data
  node.free(list)
  return cmd
end, 'l3color')

-- Let's also integrate l3opacity

luaotfload.set_transparent_colorstack(token.create'c__opacity_backend_stack_int'.index)

local transparent_register = {
  token.create'pdfmanagement_add:nnn',
  token.new(0, 1),
    'Page/Resources/ExtGState',
  token.new(0, 2),
  token.new(0, 1),
    '',
  token.new(0, 2),
  token.new(0, 1),
    '<</ca ',
    '',
    '/CA ',
    '',
    '>>',
  token.new(0, 2),
}
luatexbase.add_to_callback('luaotfload.parse_transparent', function(value)
  value = (octet * -1):match(value)
  if not value then
    tex.error'Invalid transparency value'
    return
  end
  value = value:sub(1, -2)
  local result = 'opacity' .. value
  tex.runtoks(function()
    transparent_register[6], transparent_register[10], transparent_register[12] = result, value, value
    tex.sprint(-2, transparent_register)
  end)
  return '/' .. result .. ' gs'
end, 'l3opacity')
