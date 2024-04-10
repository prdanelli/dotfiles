-- Local pretty_print
_G.dump = function(...)
  local objects = {}
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, "\n"))
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

_G.contains = function(list, x)
  for _, v in pairs(list) do
    if v == x then
      return true
    end
  end

  return false
end

_G.is_empty = function(s)
  return s == nil or s == ""
end
