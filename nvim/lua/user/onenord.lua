local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
	vim.notify("Could not find OneNord colorscheme")
	return
end

local colors = require("onenord.colors")

onenord.setup({
  borders = true,
  italics = {
    comments = true,
    strings = false,
    keywords = true,
    functions = false,
    variables = false,
  },
  styles = {
    comments = "italic",
	},
  disable = {
    background = false,
    cursorline = false,
    eob_lines = true,
  },
  custom_highlights = {
		Folded = { fg = colors.gray },
	},
})
