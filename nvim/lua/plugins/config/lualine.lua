local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

local highlight = require("lualine.highlight")
local colors = require("config.colors").colors
local custom_fname = require("lualine.components.filename"):extend()

local default_options = {
  symbols = {
    modified = "[+]",
    readonly = "[-]",
    unnamed = "[No Name]",
    newfile = "[New]",
  }
}
local saved_config = { bg = colors.green, fg = colors.bg }
local modified_config = { bg = colors.red, fg = colors.fg }

function custom_fname:init(options)
  custom_fname.super.init(self, options)

  self.status_colors = {
    saved = highlight.create_component_highlight_group(saved_config, "filename_status_saved", self.options),
    modified = highlight.create_component_highlight_group(modified_config, "filename_status_modified", self.options)
  }

  self.options = vim.tbl_deep_extend("force", self.options or {}, default_options)

  if self.options.color == nil then
    self.options.color = ""
  end
end

function custom_fname:update_status()
  local data = custom_fname.super.update_status(self)

  data = highlight.component_format_highlight(
    vim.bo.modified and self.status_colors.modified or self.status_colors.saved
  ) .. data

  return data
end

lualine.setup({
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree", "alpha", "Ranger", "Telescope" },
    globalstatus = true,
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { custom_fname, require("lsp-status").status },
    lualine_x = { "diff" },
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {
    -- lualine_a = {},
    -- lualine_b = {},
    -- lualine_c = {},
    -- lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {}
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
})

