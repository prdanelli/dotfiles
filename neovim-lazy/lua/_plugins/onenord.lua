return {
  "rmehri01/onenord.nvim",
  lazy = false,
  config = function()
    local colors = require("config.colors").colors

    local prompt = colors.grey14
    local results = colors.grey14
    local preview = colors.grey14
    local float_bg = colors.grey14

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
        -- Folded = { fg = colors.grey10 },
        -- VertSplit = { fg = colors.lblue },
        -- MsgArea = { fg = colors.grey7 },
        -- NormalFloat = { bg = colors.grey14 },
        -- FloatBorder = { bg = colors.grey14, fg = colors.grey14 },
        -- IncSearch = { style = "reverse" },

        -- LSP Document Highlights
        -- gui=bold guifg=#81a1c1 guibg=#4c566a
        LspReferenceText = { bg = colors.grey11, style = "none" },
        LspReferenceRead = { link = "LspReferenceText", style = "none" },
        LspReferenceWrite = { link = "LspReferenceText", style = "none" },

        -- Better Quick List
        -- BqfPreviewBorder = { fg = float_bg },
        -- BqfPreviewFloat = { bg = float_bg },

        -- Notify
        -- NotifyBackground = { bg = float_bg },

        -- Color Column
        NonText = { fg = colors.grey13 },

        -- Neotree
        -- NeoTreeNormal = { bg = float_bg },

        -- Whichkey
        -- WhichKeyFloat = { bg = float_bg },
        -- WhichKey = { fg = colors.magenta },
        -- WhichKeyGroup = { fg = colors.grey7 },
        -- WhichKeySeparator = { fg = colors.grey12 },
        -- WhichKeyDesc = { fg = colors.grey7 },
        -- WhichKeyValue = { fg = colors.grey7 },

        -- Color columns
        VirtColumn = { bg = colors.bg, fg = colors.grey13 },

        -- Buffer Line
        -- BufferLineIndicatorSelected = { fg = colors.cyan, bg = colors.bg },
        -- BufferLineFill = { fg = colors.fg, bg = colors.grey14 },

        -- Git Signs
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.yellow },
        GitSignsDelete = { fg = colors.red },

        GitConflictCurrent = { bg = colors.green, fg = colors.fg },
        GitConflictCurrentLabel = { bg = colors.green, fg = colors.fg },
        GitConflictIncoming = { bg = colors.red, fg = colors.bg },
        GitConflictIncomingLabel = { bg = colors.red, fg = colors.bg },

        -- Lualine
        StatusLine = { bg = colors.bg },
        StatusLineNC = { bg = colors.bg },
        StatusLineTerm = { bg = colors.bg },

        -- Telescope
        -- https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.lua
        -- TelescopeMatching = { fg = colors.blue },
        -- TelescopeNormal = { fg = colors.grey8 },
        -- TelescopePreviewBorder = { bg = preview, fg = preview },
        -- TelescopePreviewNormal = { bg = preview },
        -- TelescopePreviewTitle = { fg = preview },

        -- TelescopePromptNormal = { bg = prompt },
        -- TelescopePromptBorder = { bg = prompt, fg = prompt },
        -- TelescopePromptPrefix = { bg = prompt },
        -- TelescopePromptTitle = { fg = prompt },

        -- TelescopeResultsBorder = { bg = results, fg = results },
        -- TelescopeResultsNormal = { bg = results },
        -- TelescopeResultsTitle = { fg = results },
        -- -- The current item
        -- TelescopeSelection = { fg = colors.magenta_dark, bg = results },
        -- TelescopeSelectionCaret = { fg = colors.magenta_dark, bg = results },
      },
    })
  end,
}
