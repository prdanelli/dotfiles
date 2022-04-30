-- Gruvbox Material
-- vim.g["gruvbox_material_enable_italic"] = 1
-- vim.g["gruvbox_material_background"] = "soft"
-- vim.cmd[[colorscheme gruvbox-material]]
-- vim.cmd[[hi Search guibg=#a89984 guifg=#282828]]
-- vim.cmd[[hi IncSearch guibg=#a89984 guifg=#282828]]

local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  return
end

nightfox.setup({
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

-- local status_ok, onenord = pcall(require, "onenord")
-- if not status_ok then
-- 	vim.notify("Could not find OneNord colorscheme")
-- 	return
-- end
--
-- local colors = require("onenord.colors")
--
-- onenord.setup({
--   borders = true,
--   italics = {
--     comments = true,
--     strings = false,
--     keywords = true,
--     functions = false,
--     variables = false,
--   },
--   styles = {
--     comments = "italic",
-- 	},
--   disable = {
--     background = false,
--     cursorline = false,
--     eob_lines = true,
--   },
--   custom_highlights = {
-- 		Folded = { fg = colors.gray },
-- 	},
-- })
