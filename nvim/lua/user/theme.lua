-- Gruvbox Material
-- vim.g["gruvbox_material_enable_italic"] = 1
-- vim.g["gruvbox_material_background"] = "soft"
-- vim.cmd[[colorscheme gruvbox-material]]
-- vim.cmd[[hi Search guibg=#a89984 guifg=#282828]]
-- vim.cmd[[hi IncSearch guibg=#a89984 guifg=#282828]]

local status_ok, lualine = pcall(require, "nightfox")
if not status_ok then
  return
end
-- Nightfox
-- Default options
require('nightfox').setup({
  options = {
    transparent = false,
    terminal_colors = true,
    dim_inactive = true,
    styles = {
      comments = "italic",
    },
  }
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")
