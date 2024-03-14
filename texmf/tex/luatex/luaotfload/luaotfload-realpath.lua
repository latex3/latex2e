-- Helper to resolve symlinks in paths

local sub = string.sub
local symlinkattributes = lfs.symlinkattributes
local attributes = lfs.attributes
local currentdir = lfs.currentdir
local concat = table.concat
local move = table.move
local newtable = lua.newtable
local setmetatable = setmetatable

-- Windows should just adapt reasonable path conventions like every other operating system.
-- But some people like to do their own thing, so we need lots of special casing here.
local windows_style_paths = os.type ~= 'unix'

-- Marker key for elements of result_tree to indicate the path components entry and the file mode
local path_components, file_mode = {}, {}
local tree_root

local split_path do
  local l = lpeg
  local separator = windows_style_paths and l.S'/\\' or l.S'/'
  -- We do not allow empty segments here because they get ignored.
  local segment = l.C((1 - separator)^1)
  -- Duplicate and trailing separators are dropped.
  local unc = windows_style_paths and separator * separator * l.Cg(l.P(1)^0 * -1, 'unc') or l.P(false)
  local drive_letter = windows_style_paths and l.Cg(l.R('az', 'AZ') * ':', 'drive') or l.P(false)
  local path_pat = l.Ct(unc + drive_letter^-1 * (l.Cc'' * separator^1)^-1 * (segment * separator^1)^0 * segment^-1 * -1)
  function split_path(path)
    local splitted = path_pat:match(path)
    if not splitted then
      error'Invalid path rejected'
    elseif splitted.unc then
      error'Unsupported UNC path encountered'
    elseif splitted.drive and splitted[1] ~= '' then
      error'Unsupported relative path with drive letter encountered'
    end
    return splitted
  end
end

local function recombine_path(components)
  local joined = concat(components, '/')
  if components.drive then
    joined = components.drive .. joined
  end
  return joined
end

local function lookup_split_path_in_tree(components, tree)
  if components[1] == '' then
    if windows_style_paths then
      tree = tree_root[components.drive or tree[path_components].drive]
    else
      tree = tree_root
    end
  end
  for i=1, #components do
    local next_tree = tree[components[i]]
    if not next_tree then
      return nil, string.format("Unable to find %q in %q", components[i], recombine_path(tree[path_components]))
    end
    tree = next_tree
  end
  return tree
end

local tree_meta
tree_meta = {
  __index = function(parent, component)
    local parent_components = parent[path_components]
    local depth = #parent_components
    local components = move(parent_components, 1, depth, 1, newtable(depth + 1, 1))
    components.drive, components[depth + 1] = parent_components.drive, component
    local path = recombine_path(components)

    local mode = symlinkattributes(path, 'mode')
    if not mode then
      parent[component] = false
      return false
    end
    if mode == 'link' then
      local target = symlinkattributes(path, 'target')
      local splitted_target = split_path(target)
      local target_tree = lookup_split_path_in_tree(splitted_target, parent) or false
      parent[component] = target_tree
      return target_tree
    end

    local child = {
      [path_components] = components,
      [file_mode] = mode,
    }
    if mode == 'directory' then
      setmetatable(child, tree_meta)
      child['.'] = child
      child['..'] = parent
    end
    parent[component] = child
    return child
  end,
}

-- We assume that the directory structure does not change during our run.
function build_root_dir(drive)
  local root_dir = setmetatable({
    [path_components] = {'', drive = drive},
    [file_mode] = 'directory', -- "If [your root is not a directory] you are having a bad problem and you will not go to space today".
  }, tree_meta)
  root_dir['.'] = root_dir
  root_dir['..'] = root_dir
  return {[''] = root_dir}
end
tree_root = windows_style_paths and setmetatable({}, {__index = function(t, drive)
  local root_dir = build_root_dir(drive)
  t[drive] = root_dir
  return root_dir
end}) or build_root_dir()

local function resolve_path_to_tree(path)
  local splitted = split_path(path)
  if splitted[1] == '' and (not windows_style_paths or splitted.drive) then -- Optimization to avoid currentdir lookup.
    return lookup_split_path_in_tree(splitted, tree_root)
  else
    local splitted_currentdir = split_path(currentdir())
    local current_tree = assert(lookup_split_path_in_tree(splitted_currentdir, tree_root))
    return lookup_split_path_in_tree(splitted, current_tree)
  end
end

local function resolve_path(path)
  local tree, err = resolve_path_to_tree(path)
  if not tree then return tree, err end
  return recombine_path(tree[path_components]), tree[file_mode]
end

return {
  realpath = resolve_path,
}
