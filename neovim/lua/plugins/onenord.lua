return {
  "rmehri01/onenord.nvim",
  lazy = false,
  config = function()
    local colors = require("config.colors").colors

    local prompt = colors.grey14
    local results = colors.grey14
    local preview = colors.grey14
    local window_bg = colors.grey14

    require("onenord").setup({
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
        background = true,
        cursorline = false,
        eob_lines = true,
      },
      custom_highlights = {
        -- Examples
        -- LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
        -- ["@text.uri"] = { fg = colors.cyan, style = "underline" },
        -- Todo = { fg = colors.yellow, bg = colors.none, style = "bold,italic" },
        -- DiagnosticError = { link = "LspDiagnosticsDefaultError" },

        -- Nvim Core
        Folded = { fg = colors.grey10 },
        VertSplit = { fg = colors.lblue },
        MsgArea = { fg = colors.grey7 },
        NormalFloat = { bg = colors.grey14 },
        FloatBorder = { bg = colors.grey14, fg = colors.grey14 },

        -- LSP Document Highlights
        LspReferenceText = { link = "Search" },
        LspReferenceRead = { link = "Search" },
        LspReferenceWrite = { link = "Search" },

        -- Better Quick List
        BqfPreviewBorder = { fg = window_bg },
        -- BqfPreviewFloat = { bg = window_bg },

        -- Notify
        NotifyBackground = { bg = prompt },

        -- Color Column
        NonText = { fg = colors.grey13 },

        -- Rnvimr
        RnvimrNormal = { bg = prompt },

        -- Neotree
        NeoTreeNormal = { bg = prompt },

        -- Whichkey
        WhichKeyFloat = { bg = window_bg },
        WhichKey = { fg = colors.magenta },
        WhichKeyGroup = { fg = colors.grey7 },
        WhichKeySeparator = { fg = colors.grey12 },
        WhichKeyDesc = { fg = colors.grey7 },
        WhichKeyValue = { fg = colors.grey7 },

        -- Color columns
        VirtColumn = { bg = colors.bg, fg = colors.grey13 },

        -- Buffer Line
        BufferLineIndicatorSelected = { fg = colors.cyan, bg = colors.bg },
        BufferLineFill = { fg = colors.fg, bg = colors.grey14 },

        -- Git Signs
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.yellow },
        GitSignsDelete = { fg = colors.red },

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
      },
    })
  end,
}
