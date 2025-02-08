local write_xml = require'luamml-xmlwriter'
local make_root = require'luamml-convert'.make_root
local save_result = require'luamml-tex'.save_result

local properties = node.get_properties_table()

local glue_id = node.id'glue'
local tabskip_sub = 12
assert(node.subtypes'glue'[tabskip_sub] == 'tabskip')

local function store_get_row()
  local row_temp
  for i=tex.nest.ptr-1, 0, -1 do
    local head = tex.nest[i].head
    local glue = head.next
    if glue and glue.id == glue_id and glue.subtype == tabskip_sub then
      row_temp = head
      break
    end
  end
  if not row_temp then
    error[[luamml_table's store function called outside of table]]
  end
  local props = properties[row_temp]
  if not props then
    props = {}
    properties[row_temp] = props
  end
  local mml_row = props.mathml_row
  if not mml_row then
    mml_row = {[0] = 'mtr'}
    props.mathml_row  = mml_row
  end
  return mml_row
end

local function store_column_xml(mml, display)
  if mml[0] ~= 'mtd' then
    if display and mml[0] == 'mstyle' and mml.displaystyle == true then
      mml[0], mml.displaystyle, mml.scriptlevel = 'mtd', nil, nil
    else
      if display and mml[0] ~= 'mstyle' then
        mml = {[0] = 'mstyle', displaystyle = false, mml}
      end
      mml = {[0] = 'mtd', mml}
    end
  end
  table.insert(store_get_row(), mml)
  return mml
end

local function store_column(startmath)
  local props = properties[startmath]
  if not props then return end
  local mml = props.saved_mathml_table or props.saved_mathml_core
  if mml then return store_column_xml(mml) end
end

local function store_tag(xml)
  local mml_row = store_get_row()
  xml.intent = ':equationlabel'
  table.insert(mml_row, 1, xml)
  last_tag = nil
end

local function store_notag(xml)
  local mml_row = store_get_row()
  xml.intent = ':noequationlabel'
  table.insert(mml_row, 1, xml)  
end

local function set_row_attribute(name, value)
  local mml_row = store_get_row()
  mml_row[name] = value
end

luatexbase.add_to_callback('hpack_filter', function(_, group)
  if group ~= 'fin_row' then return true end

  local temp = tex.nest.top.head
  local props = properties[temp]
  if not props then return true end
  local mml_row = props.mathml_row
  if not mml_row then return true end
  props.mathml_row = nil

  props = properties[tex.lists.align_head]
  if not props then
    props = {}
    properties[tex.lists.align_head] = props
  end
  local mml_table = props.mathml_table_node_table
  if not mml_table then
    mml_table = {[0] = 'mtable'}
    props.mathml_table_node_table = mml_table
  end
  table.insert(mml_table, mml_row)
  return true
end, 'mathml amsmath processing')

local function get_table()
  -- TODO: Error handling etc
  local props = properties[tex.lists.align_head]
  if not props then return end
  local mml_table = props.mathml_table_node_table
  props.mathml_table_node_table = nil
  return mml_table
end

return {
  store_column = store_column,
  store_column_xml = store_column_xml,
  store_tag = store_tag,
  store_notag = store_notag,
  set_row_attribute = set_row_attribute,
  get_table = get_table,
}
