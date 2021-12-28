local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
	vim.notify("Could not find OneNord colorscheme")
	return
end

onenord.setup({
  borders = true,
  italics = {
    comments = true,
    strings = false,
    keywords = true,
    functions = false,
    variables = false,
  },
  disable = {
    background = false,
    cursorline = false,
    eob_lines = true,
  },
  custom_highlights = {},
})
