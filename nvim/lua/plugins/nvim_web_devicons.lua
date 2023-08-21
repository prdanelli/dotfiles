local plugin_loaded, dev_icons = pcall(require, "nvim-web-devicons")
if not plugin_loaded then return end

dev_icons.setup {
  -- https://github.com/nvim-tree/nvim-web-devicons/blob/master/lua/nvim-web-devicons.lua
  override = {},
  color_icons = false,
}

