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

function _G.set_terminal_keymaps()
  local opts = { noremap = true }

  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

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
