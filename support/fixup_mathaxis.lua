local hlist_id = node.id'hlist'
local vlist_id = node.id'vlist'
local function recurse(h)
  for n, id, sub in node.traverse(h) do
    if id == hlist_id or id == vlist_id then
      if sub == 13 and (not n.head) and n.shift == 0 then
        n.shift = -tex.getmath("axis", "text")
      end
      recurse(n.head)
    end
  end
  return true
end
luatexbase.add_to_callback('post_mlist_to_hlist_filter', recurse, 'l3build.shift')
