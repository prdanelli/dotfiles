local status_ok, onenord = pcall(require, "onenord")
if not status_ok then return end

local colors = require("config.colors").colors

local prompt = colors.grey14
local results = colors.grey14
local preview = colors.grey14

local window_bg = colors.grey14

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
    -- Rnvimr
    RnvimrNormal = { bg = prompt },

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
    WhichKeyFloat = { bg = window_bg },
    WhichKey = { fg = colors.magenta },
    WhichKeyGroup = { fg = colors.grey7 },
    WhichKeySeparator = { fg = colors.grey12 },
    WhichKeyDesc = { fg = colors.grey7 },
    WhichKeyValue = { fg = colors.grey7 },

    Folded = { fg = colors.grey10 },
    VertSplit = { fg = colors.lblue },
    MsgArea = { fg = colors.grey7 },

    -- Color columns
    VirtColumn = { bg = colors.bg, fg = colors.grey13 },

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

    NvimTreeNormal = { fg = colors.grey6, bg = preview },
    NvimTreeFolderIcon = { fg = colors.grey10 },
    NvimTreeIndentMarker = { fg = colors.grey10 },

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
    TelescopeMatching = { fg = colors.blue },
    TelescopeNormal = { fg = colors.grey8 },
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
    -- The current item
    TelescopeSelection = { fg = colors.magenta_dark, bg = results },
    TelescopeSelectionCaret = { fg = colors.magenta_dark, bg = results },
  }
}
