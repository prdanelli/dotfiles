local status_ok, eyeliner = pcall(require, "eyeliner")
if not status_ok then return end

local colors = require("colors").colors

eyeliner.setup()

vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = colors.yellow, bold = true, underline = false })
vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = colors.orange, underline = false })
