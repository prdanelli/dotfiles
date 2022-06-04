local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
  return
end

local colors = require("colors").colors

local prompt = colors.grey14
local results = colors.grey14
local preview = colors.grey14

onenord.setup {
  borders = true,
  fade_nc = false,
  styles = {
    comments = "italic",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "italic",
  },
  disable = {
    background = false,
    cursorline = false,
    eob_lines = true,
  },
  custom_highlights = {
    Folded = { fg = colors.grey10 },
    VertSplit = { fg = colors.lblue },

    -- Color columns
    VirtColumn = { bg = colors.bg, fg = colors.grey13 },

    BufferLineIndicatorSelected = { fg = colors.cyan, bg = colors.bg },
    BufferLineFill = { fg = colors.fg, bg = colors.grey14 },

    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.yellow },
    GitSignsDelete = { fg = colors.red },

    NvimTreeNormal = { fg = colors.grey6, bg = preview },
    NvimTreeFolderIcon = { fg = colors.grey10 },
    NvimTreeIndentMarker = { fg = colors.grey10 },

    NormalFloat = { bg = colors.grey14 },
    FloatBorder = { bg = colors.grey14, fg = colors.grey14 },

    TelescopeMatching = { fg = colors.blue },
    TelescopeNormal = { fg = colors.grey4 },
    TelescopePreviewBorder = { bg = preview, fg = preview },
    TelescopePreviewNormal = { bg = preview },
    TelescopePreviewTitle = { fg = preview },
    TelescopePromptBorder = { bg = prompt, fg = prompt },
    TelescopePromptNormal = { bg = prompt },
    TelescopePromptPrefix = { bg = prompt },
    TelescopePromptTitle = { fg = prompt },
    TelescopeResultsBorder = { bg = results, fg = results },
    TelescopeResultsNormal = { bg = results },
    TelescopeResultsTitle = { fg = results },
  }
}
