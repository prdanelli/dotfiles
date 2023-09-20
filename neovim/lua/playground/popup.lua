local popup = require("plenary.popup")

-- Default
local function default_popup()
  local win_id = popup.create({
    "item 1",
    "item 2",
  }, {})
  print(win_id)
end

vim.cmd [[highlight PopupColor ctermbg=black ctermfg=blue guifg=blue guibg=green]]

local function highlight_popup()
  local win_id = popup.create({
    "item 1",
    "item 2",
    "item 3",
  }, {
    line = 15,
    col = 45,
    minwidth = 20,
    border = true,
    hightlight = "PopupColor"
  })
  print(win_id)
end

local function create_border_popup(borderchars)
  local _, config = popup.create("popup with custom border", {
    line = 8,
    col = 55,
    padding = { 0, 3, 0, 3 },
    borderchars = borderchars,
  })

  local border_id = config.border.win_id
  local border_bufnr = vim.api.nvim_win_get_buf(border_id)

  print(border_id)
  print(border_bufnr)
end
-- create_border_popup { "=" }

