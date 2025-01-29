return {
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    config = function()
      local colors = require("config.colors").colors

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
          cursorline = false,
          eob_lines = true,
        },
        custom_highlights = {
          -- Examples
          -- LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
          -- ["@text.uri"] = { fg = colors.cyan, style = "underline" },
          -- Todo = { fg = colors.yellow, bg = colors.none, style = "bold,italic" },
          -- DiagnosticError = { link = "LspDiagnosticsDefaultError" },

          -- Blink
          BlinkCmpMenuBorder = { fg = colors.magenta },
          BlinkCmpMenu = { bg = colors.bg },
          BlinkCmpMenuSelection = { bg = colors.grey12 },
          BlinkCmpKind = { fg = colors.grey9 },

          SnacksDashboardTitle = { fg = colors.cyan },
          FidgetTask = { link = "Comment" },

          -- FZF Lua
          FzfLuaHeaderText = { link = "Comment" },
          FzfLuaFzfBorder = { fg = colors.magenta },
          FzfLuaBorder = { fg = colors.magenta },
          FzfLuaHelpBorder = { fg = colors.magenta },
          FzfLuaPreviewBorder = { fg = colors.magenta },

          NormalFloat = { fg = colors.magenta },

          -- Snack Dashboard
          SnacksDashboardHeader = { link = "Comment" },
          SnacksDashboardFooter = { link = "Comment" },
          SnacksDashboardDesc = { link = "Comment" },
          SnacksDashboardIcon = { link = "Comment" },
          SnacksDashboardFile = { link = "Comment" },
          SnacksDashboardSpecial = { link = "Comment" },
          SnacksDashboardKey = { link = "Comment" },

          SnacksPickerDir = { link = "Comment" },

          -- Snack index line scope
          SnacksIndentScope = { fg = colors.grey11 },

          -- QuickFix
          QuickFixLineNr = { fg = colors.grey10 },
          QuickFixHeaderHard = { fg = colors.grey10 },
          QuickFixHeaderSoft = { fg = colors.grey10 },
          Delimiter = { fg = colors.grey10 },

          -- Nvim Core
          Folded = { fg = colors.grey10 },

          -- LSP Document Highlights
          LspReferenceText = { bg = colors.grey11, style = "none" },
          LspReferenceRead = { link = "LspReferenceText", style = "none" },
          LspReferenceWrite = { link = "LspReferenceText", style = "none" },

          -- Better Quick List
          BqfPreviewFloat = { bg = colors.bg },
          BqfPreviewBorder = { bg = colors.bg, fg = colors.magenta },
          BqfPreviewTitle = { bg = colors.bg, fg = colors.magenta },

          -- Whichkey
          WhichKeyFloat = { bg = colors.grey14 },
          WhichKey = { fg = colors.yellow },
          WhichKeyGroup = { fg = colors.grey7 },
          WhichKeySeparator = { link = "Comment" },
          WhichKeyDesc = { fg = colors.grey7 },
          WhichKeyValue = { fg = colors.grey7 },
          WhichKeyBorder = { fg = colors.magenta, bg = colors.bg },

          -- Color columns
          VirtColumn = { bg = colors.bg, fg = colors.grey14 },
          VirtColumnNonText = { fg = colors.grey13 },

          --
          IblIndent = { fg = colors.grey13 },

          -- Git Signs
          GitSignsAdd = { fg = colors.green },
          GitSignsChange = { fg = colors.yellow },
          GitSignsDelete = { fg = colors.red },

          -- Git Conflict
          GitConflictCurrent = { bg = colors.green, fg = colors.fg },
          GitConflictCurrentLabel = { bg = colors.green, fg = colors.fg },
          GitConflictIncoming = { bg = colors.red, fg = colors.bg },
          GitConflictIncomingLabel = { bg = colors.red, fg = colors.bg },

          -- Lualine
          StatusLine = { bg = colors.bg },
          StatusLineNC = { bg = colors.bg },
          StatusLineTerm = { bg = colors.bg },
        },
      })
    end,
  },
}
