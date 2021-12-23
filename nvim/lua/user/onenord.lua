require('onenord').setup({
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
