vim.notifier = require("utils.notifier")

-- Local pretty_print
_G.dump = function(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

_G.prequire = function(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end

  return nil
end

_G.exists = function(list, val)
  local set = {}
  for _, l in ipairs(list) do
    set[l] = true
  end

  return set[val]
end

_G.is_empty = function(s)
  return s == nil or s == ""
end

local notify_loaded, notify = pcall(require, "notify")
if notify_loaded then
  vim.notify = notify
end

