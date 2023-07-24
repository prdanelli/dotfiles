local loaded, nordic = pcall(require, "nordic")
if not loaded then
  return
end

local colors = require("config.colors").colors

nordic.load()
nordic.setup({
  on_palette = function(palette)
    return palette
  end,
  bold_keywords = false,
  italic_comments = true,
  transparent_bg = false,
  bright_border = true,
  reduced_blue = true, -- Reduce the overall amount of blue in the theme (diverges from base Nord).
  swap_backgrounds = true, -- Swap the dark background with the normal one.
  cursorline = {
    bold = false,
    bold_number = true,
    theme = "dark",
    blend = 0.7,
  },
  noice = {
    style = "flat",
  },
  telescope = {
    style = "flat",
  },
  leap = {
    dim_backdrop = false,
  },
  ts_context = {
    dark_background = true,
  },
  override = {
    Search = { bg = colors.grey12, underline = false },

    -- Rnvimr
    RnvimrNormal = { bg = colors.grey20 },

    -- Neotree
    NeoTreeNormal = { bg = colors.grey20 },
    NeoTreeNormal = { bg = colors.grey20 },

    -- Neotest
    NeotestAdapterName = { fg = colors.grey10 },
    NeotestFile = { fg = colors.grey6 },
    NeotestNamespace = { fg = colors.magenta },
    NeotestDir = { fg = colors.blue },
    NeotestTest = { fg = colors.grey3 },
    NeotestFocused = { fg = colors.cyan },
    NeotestMarked = { fg = colors.orange },
    -- Neotest - Borders
    NeotestIndent = { fg = colors.grey11 },
    NeotestBorder = { fg = colors.grey11 },
    NeotestExpandMarker = { fg = colors.grey11 },
    -- Neotest - test state
    NeotestRunning = { fg = colors.yellow },
    NeotestSkipped = { fg = colors.organge },
    NeotestPassed = { fg = colors.green },
    NeotestFailed = { fg = colors.red },
    NeotestWinSelect = { fg = colors.red, bg = colors.cyan }, -- ?

    -- Whichkey
    WhichKeyFloat = { bg = colors.grey20 },
    WhichKeyBorder = { bg = colors.grey20 },
    WhichKey = { fg = colors.magenta },
    WhichKeyGroup = { fg = colors.grey7 },
    WhichKeySeparator = { fg = colors.grey12 },
    WhichKeyDesc = { fg = colors.grey7 },
    WhichKeyValue = { fg = colors.grey7 },

    Folded = { fg = colors.grey10 },
    VertSplit = { fg = colors.lblue },
    MsgArea = { fg = colors.grey7 },

    -- Color columns
    VirtColumn = { bg = colors.bg, fg = colors.grey15 },

    -- Buffer Line
    BufferLineIndicatorSelected = { fg = colors.cyan, bg = colors.bg },
    BufferLineFill = { fg = colors.fg, bg = colors.grey14 },

    -- Mini Tab Line
    MiniTablineHidden = { fg = colors.grey10, bg = colors.bg },
    MiniTablineCurrent = { fg = colors.grey5, bg = colors.grey12 },
    -- MiniTablineVisible
    -- MiniTablineTabpagesection
    MiniTablineModifiedHidden = { fg = colors.magenta_dark, bg = colors.bg },
    MiniTablineModifiedCurrent = { fg = colors.magenta, bg = colors.grey12 },
    MiniTablineModifiedVisible = { fg = colors.magenta_dark, bg = colors.grey13 },
    -- TabLine = { fg = colors.fg, bg = colors.grey14 },
    -- TabLineSel = { fg = colors.fg, bg = colors.grey14 },
    -- TabLineFill = { fg = colors.fg, bg = colors.grey14 },

    -- Git Signs
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.yellow },
    GitSignsDelete = { fg = colors.red },

    -- NvimTreeNormal = { fg = colors.grey6, bg = colors.grey20 },
    -- NvimTreeFolderIcon = { fg = colors.grey10 },
    -- NvimTreeIndentMarker = { fg = colors.grey10 },
    --
    NormalFloat = { bg = colors.grey14 },
    FloatBorder = { bg = colors.grey14, fg = colors.grey14 },

    GitConflictCurrent = { bg = colors.green, fg = colors.fg },
    GitConflictCurrentLabel = { bg = colors.green, fg = colors.fg },
    GitConflictIncoming = { bg = colors.red, fg = colors.bg },
    GitConflictIncomingLabel = { bg = colors.red, fg = colors.bg },
    -- GitConflictAncestor = { bg = colors.green, fg = colors.fg },
    -- GitConflictAncestorLabel = { bg = colors.green, fg = colors.fg },

    -- Telescope
    -- https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.lua
    -- TelescopeMatching = { fg = colors.blue },
    TelescopeNormal = { fg = colors.grey20 },
    TelescopeBorder = { fg = colors.grey20, bg = colors.grey20 },

    -- -- The current item
    TelescopeSelection = { fg = colors.magenta_dark, bg = colors.grey20 },
    TelescopeSelectionCaret = { fg = colors.magenta_dark, bg = colors.grey20 },

    TelescopePromptTitle = { fg = colors.grey20, bg = colors.grey20 },
    TelescopePromptBorder = { bg = colors.grey20, fg = colors.grey20 },
    TelescopePromptNormal = { bg = colors.grey20 },
    TelescopePromptPrefix = { bg = colors.grey20 },

    TelescopePreviewTitle = { fg = colors.grey20, bg = colors.grey20 },
    TelescopePreviewBorder = { fg = colors.grey20, bg = colors.grey20 },
    TelescopePreviewNormal = { bg = colors.grey20 },

    TelescopeResultsTitle = { fg = colors.grey20, bg = colors.grey20 },
    TelescopeResultsBorder = { fg = colors.grey20, bg = colors.grey20 },
    TelescopeResultsNormal = { bg = colors.grey20 },

    --Toggle Term
    ToggleTerm1FloatBorder = { bg = colors.grey20 },
    ToggleTermFloatBorder = { bg = colors.grey20 },
  },
})