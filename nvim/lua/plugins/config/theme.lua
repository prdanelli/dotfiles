-- Gruvbox Material
-- vim.g["gruvbox_material_enable_italic"] = 1
-- vim.g["gruvbox_material_background"] = "soft"
-- vim.cmd[[colorscheme gruvbox-material]]
-- vim.cmd[[hi Search guibg=#a89984 guifg=#282828]]
-- vim.cmd[[hi IncSearch guibg=#a89984 guifg=#282828]]

local nightfox_installed, nightfox = pcall(require, "nightfox")
if nightfox_installed then
  nightfox.setup({
    options = {
      transparent = false,
      terminal_colors = true,
      dim_inactive = true,
      styles = {
        comments = "italic",
      },
    }
  })

  -- setup must be called before loading
  vim.cmd("colorscheme nordfox")

  return
end

-- Shamelessly copied from:
-- https://github.com/thanhvule0310/dotfiles/blob/main/nvim/lua/theme.lua
local onenord_loaded, onenord = pcall(require, "onenord")
if onenord_loaded then
  local _M = {}

  _M.colors = {
    bg = "#2e3440",
    fg = "#ECEFF4",
    red = "#bf616a",
    orange = "#d08770",
    yellow = "#ebcb8b",
    blue = "#5e81ac",
    green = "#a3be8c",
    cyan = "#88c0d0",
    magenta = "#b48ead",
    pink = "#FFA19F",
    grey1 = "#f8fafc",
    grey2 = "#f0f1f4",
    grey3 = "#eaecf0",
    grey4 = "#d9dce3",
    grey5 = "#c4c9d4",
    grey6 = "#b5bcc9",
    grey7 = "#929cb0",
    grey8 = "#8e99ae",
    grey9 = "#74819a",
    grey10 = "#616d85",
    grey11 = "#464f62",
    grey12 = "#3a4150",
    grey13 = "#333a47",
    grey14 = "#242932",
    grey15 = "#1e222a",
    grey16 = "#1c1f26",
    grey17 = "#0f1115",
    grey18 = "#0d0e11",
    grey19 = "#020203",
  }

  _M.init = function()
    onenord.setup {
      borders = true,
      fade_nc = false,
      styles = {
        comments = "italic",
        strings = "NONE",
        keywords = "NONE",
        functions = "italic",
        variables = "bold",
        diagnostics = "underline",
      },
      disable = {
        background = false,
        cursorline = false,
        eob_lines = true,
      },
      custom_highlights = {
        VertSplit = { fg = _M.colors.grey14 },
        BufferLineIndicatorSelected = { fg = _M.colors.cyan, bg = _M.colors.bg },
        BufferLineFill = { fg = _M.colors.fg, bg = _M.colors.grey14 },
        NvimTreeNormal = { fg = _M.colors.grey5, bg = _M.colors.grey14 },
        WhichKeyFloat = { bg = _M.colors.grey14 },
        GitSignsAdd = { fg = _M.colors.green },
        GitSignsChange = { fg = _M.colors.orange },
        GitSignsDelete = { fg = _M.colors.red },
        NvimTreeFolderIcon = { fg = _M.colors.grey9 },
        NvimTreeIndentMarker = { fg = _M.colors.grey12 },

        NormalFloat = { bg = _M.colors.grey14 },
        FloatBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },

        TelescopePromptPrefix = { bg = _M.colors.grey14 },
        TelescopePromptNormal = { bg = _M.colors.grey14 },
        TelescopeResultsNormal = { bg = _M.colors.grey15 },
        TelescopePreviewNormal = { bg = _M.colors.grey16 },

        TelescopePromptBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        TelescopeResultsBorder = { bg = _M.colors.grey15, fg = _M.colors.grey15 },
        TelescopePreviewBorder = { bg = _M.colors.grey16, fg = _M.colors.grey16 },

        TelescopePromptTitle = { fg = _M.colors.grey14 },
        TelescopeResultsTitle = { fg = _M.colors.grey15 },
        TelescopePreviewTitle = { fg = _M.colors.grey16 },

        PmenuSel = { bg = _M.colors.grey12 },
        Pmenu = { bg = _M.colors.grey14 },

        LspFloatWinNormal = { fg = _M.colors.fg, bg = _M.colors.grey14 },
        LspFloatWinBorder = { fg = _M.colors.grey14 },
        LspSagaRenameBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        LspSagaDiagnosticBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        LspSagaHoverBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        LspSagaDefPreviewBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        LspSagaCodeActionBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        LspLinesDiagBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        LspSagaSignatureHelpBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        LspSagaLspFinderBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
      },
    }
  end

  return _M
end

