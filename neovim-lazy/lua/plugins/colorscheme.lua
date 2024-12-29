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
          SnacksDashboardTitle = { fg = colors.cyan },
          FidgetTask = { link = "Comment" },

          FzfLuaHeaderText = { link = "Comment" },
          FzfLuaFzfBorder = { fg = colors.magenta },
          FzfLuaBorder = { fg = colors.magenta },
          FzfLuaHelpBorder = { fg = colors.magenta },
          FzfLuaPreviewBorder = { fg = colors.magenta },

          -- Snack Dashboard
          SnacksDashboardHeader = { link = "Comment" },
          SnacksDashboardFooter = { link = "Comment" },
          SnacksDashboardDesc = { link = "Comment" },
          SnacksDashboardIcon = { link = "Comment" },
          SnacksDashboardFile = { link = "Comment" },
          SnacksDashboardSpecial = { link = "Comment" },
          SnacksDashboardKey = { link = "Comment" },

          -- Snack index line scope
          SnacksIndentScope = { fg = colors.grey11 },

          -- NormalFloat = { fg = colors.fg },
          -- BlinkCmpSource = { fg = colors.fg },

          -- BlinkCmpMenuBorder = { fg = colors.yellow, bg = colors.green },
          -- BlinkCmpScrollBarGutter = { fg = colors.magenta },
          -- BlinkCmpLabel = { fg = colors.magenta },
          -- BlinkCmpKind = { fg = colors.green },
          -- BlinkCmpDoc = { fg = colors.magenta },
          -- BlinkCmpGhostText = { link = "Comment" },

          -- BlinkCmpMenu	Pmenu	The completion menu window
          -- BlinkCmpMenuBorder	Pmenu	The completion menu window border
          -- BlinkCmpMenuSelection	PmenuSel	The completion menu window selected item
          -- BlinkCmpScrollBarThumb	PmenuThumb	The scrollbar thumb
          -- BlinkCmpScrollBarGutter	PmenuSbar	The scrollbar gutter
          -- BlinkCmpLabel	Pmenu	Label of the completion item
          -- BlinkCmpLabelDeprecated	NonText	Deprecated label of the completion item
          -- BlinkCmpLabelMatch	Pmenu	(Currently unused) Label of the completion item when it matches the query
          -- BlinkCmpLabelDetail	NonText	Label description of the completion item
          -- BlinkCmpLabelDescription	NonText	Label description of the completion item
          -- BlinkCmpKind	Special	Kind icon/text of the completion item
          -- BlinkCmpKind<kind>	Special	Kind icon/text of the completion item
          -- BlinkCmpSource	NonText	Source of the completion item
          -- BlinkCmpGhostText	NonText	Preview item with ghost text
          -- BlinkCmpDoc	NormalFloat	The documentation window
          -- BlinkCmpDocBorder	NormalFloat	The documentation window border
          -- BlinkCmpDocSeparator	NormalFloat	The documentation separator between doc and detail
          -- BlinkCmpDocCursorLine	Visual	The documentation window cursor line
          -- BlinkCmpSignatureHelp	NormalFloat	The signature help window
          -- BlinkCmpSignatureHelpBorder	NormalFloat	The signature help window border
          -- BlinkCmpSignatureHelpActiveParameter

          -- Examples
          -- LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
          -- ["@text.uri"] = { fg = colors.cyan, style = "underline" },
          -- Todo = { fg = colors.yellow, bg = colors.none, style = "bold,italic" },
          -- DiagnosticError = { link = "LspDiagnosticsDefaultError" },
          QuickFixLineNr = { fg = colors.grey10 },
          QuickFixHeaderHard = { fg = colors.grey10 },
          QuickFixHeaderSoft = { fg = colors.grey10 },
          Delimiter = { fg = colors.grey10 },

          -- Nvim Core
          Folded = { fg = colors.grey10 },
          -- VertSplit = { fg = colors.lblue },
          -- MsgArea = { fg = colors.grey7 },
          -- NormalFloat = { bg = colors.grey14 },
          -- FloatBorder = { bg = colors.grey14, fg = colors.grey14 },
          -- IncSearch = { style = "reverse" },

          -- LSP Document Highlights
          LspReferenceText = { bg = colors.grey11, style = "none" },
          LspReferenceRead = { link = "LspReferenceText", style = "none" },
          LspReferenceWrite = { link = "LspReferenceText", style = "none" },

          -- Better Quick List
          BqfPreviewFloat = { bg = colors.bg },
          BqfPreviewBorder = { bg = colors.bg, fg = colors.magenta },
          BqfPreviewTitle = { bg = colors.bg, fg = colors.magenta },
          -- BqfPreviewThumb
          -- BqfPreviewSbar
          -- BqfPreviewCursor
          -- BqfPreviewCursorLine
          -- BqfPreviewRange
          -- BqfPreviewBufLabel

          -- Whichkey
          WhichKeyFloat = { bg = colors.grey14 },
          WhichKey = { fg = colors.magenta },
          WhichKeyGroup = { fg = colors.grey7 },
          WhichKeySeparator = { fg = colors.grey12 },
          WhichKeyDesc = { fg = colors.grey7 },
          WhichKeyValue = { fg = colors.grey7 },

          -- Color columns
          VirtColumn = { bg = colors.bg, fg = colors.grey13 },
          NonText = { fg = colors.grey13 },

          --
          IblIndent = { fg = colors.grey13 },

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
        },
      })
    end,
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onenord",
    },
  },
}
