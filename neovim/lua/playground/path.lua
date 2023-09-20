local Path = require "plenary.path"
local path = Path.path

local p = Path:new("/Users/paul/Personal/Repos/dotfiles/nvim/lua/utils/path.lua")

print(vim.inspect.inspect(p:expand()))
