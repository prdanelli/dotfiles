-- Wrap text
return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to `main` branch for the latest features
  config = function()
    require("nvim-surround").setup()
  end,
}
