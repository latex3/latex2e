local nest = tex.nest

local properties = node.get_properties_table()

local mark_environment = {
  data = {
  },
}
do
  local _ENV = mark_environment
  function consume_label(label, fn)
    local mathml = data.mathml[label]
    data.mathml[label] = nil
    if fn then fn(mathml) end
    return mathml
  end
end

local function annotate()
  local annotation, err = load( 'return {'
      .. token.scan_argument()
    .. '}', nil, 't', mark_environment)
  if not annotation then
    tex.error('Error while parsing LuaMML annotation', {err})
    return 0
  end
  annotation = annotation()
  local nesting = nest.top
  local props = properties[nesting.head]
  local current = props and props.luamml__annotate_context
  if current then
    current, props.luamml__annotate_context = current.head, current.prev
  else
    tex.error('Mismatched LuaMML annotation',
      {'Something odd happened. Maybe you forgot braces around an annotated symbol in a subscript or superscript?'})
    return 0
  end
  local after = nesting.tail
  local count, offset = 0, annotation.offset
  local marked
  if current == after then
    tex.error'Empty LuaMML annotation'
  else
    repeat
      current = current.next
      count = count + 1
      if count == offset then
        marked = current
      elseif offset or current ~= after then
        local props = properties[current]
        if not props then
          props = {}
          properties[current] = props
        end
        props.mathml_table, props.mathml_core = nil, false
      end
    until current == after
    if offset and not marked then
      tex.error'Invalid offset in LuaMML annotation'
    end
    marked = marked or current
    if annotation.nucleus then
      marked = marked.nucleus
    end
    if marked then
      local props = properties[marked]
      if not props then
        props = {}
        properties[marked] = props
      end
      if annotation.core ~= nil then
        props.mathml_core = annotation.core
      end
      if annotation.struct ~= nil then
        local saved = props.mathml_filter
        local struct = annotation.struct
        function props.mathml_filter(mml, core)
          mml[':struct'] = struct
          if saved then
            return saved(mml, core)
          else
            return mml, core
          end
        end
      end
    else
      tex.error'Unable to annotate nucleus of node without nucleus'
    end
  end
  return count
end

local funcid = luatexbase.new_luafunction'__luamml_annotate_begin:'
token.set_lua('__luamml_annotate_begin:', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  local top = nest.top
  local temp = top.head
  local props = properties[temp]
  if not props then
    props = {}
    properties[temp] = props
  end
  props.luamml__annotate_context = {
    prev = props.luamml__annotate_context,
    head = top.tail,
  }
end

funcid = luatexbase.new_luafunction'__luamml_annotate_end:we'
token.set_lua('__luamml_annotate_end:we', funcid, 'protected')
lua.get_functions_table()[funcid] = function()
  local count = token.scan_int()
  local real_count = annotate()
  if count ~= real_count then
    tex.error('Incorrect count in LuaMML annotation', {
        'A LuaMML annotation was discovered with an explicit count \z
        which was not the same as the number of top-level nodes annotated.',
        string.format('This can be fixed by changing the supplied count from %i to %i \z
          or by omitting the count value entirely.', count, real_count)
    })
  end
end

funcid = luatexbase.new_luafunction'__luamml_annotate_end:e'
token.set_lua('__luamml_annotate_end:e', funcid, 'protected')
lua.get_functions_table()[funcid] = annotate

return mark_environment
