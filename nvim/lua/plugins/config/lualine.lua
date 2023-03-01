local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

lualine.setup({
  options = {
    icons_enabled = true,
    -- theme = 'gruvbox-material',
    component_separators = { left = "\\", right = "/" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree", "alpha", "Ranger" },
    globalstatus = true,
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { 'branch' },
    lualine_c = { 'diff', require("lsp-status").status },
    lualine_x = {
      "filename",
      "filetype"
    },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})

