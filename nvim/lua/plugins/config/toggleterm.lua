local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then return end

toggleterm.setup()

local Terminal = require("toggleterm.terminal").Terminal
local colors = require("colors").colors
local defaults = {
  direction = "float",
  float_opts = {
    border = "single",
  },
  shade_terminals = false,
  highlights = {
    Normal = {
      guibg = colors.grey14,
    },
    FloatBorder = {
      guibg = colors.grey14,
      guifg = colors.grey14,
    },
  },
}

local lazygit = Terminal:new(vim.tbl_deep_extend("force", {
  cmd = "lazygit -ucd ~/.config/lazygit/",
  dir = "git_dir",
  hidden = true,
}, defaults))

function _toggle_lazygit()
  lazygit:toggle()
end

local irb = Terminal:new(vim.tbl_deep_extend("force", {
  cmd = "irb --noautocomplete",
}, defaults))

function _toggle_irb()
  irb:toggle()
end

local console = Terminal:new(vim.tbl_deep_extend("force", {
  cmd = "bundle exec rails console",
  dir = "git_dir",
}, defaults))

function _toggle_console()
  console:toggle()
end

local htop = Terminal:new(vim.tbl_deep_extend("force", {
  cmd = "htop",
}, defaults))

function _toggle_htop()
  htop:toggle()
end
