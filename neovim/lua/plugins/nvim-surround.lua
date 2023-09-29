-- Wrap text
return {
  "kylechui/nvim-surround",
  event = "BufReadPre",
  version = "*", -- Use for stability; omit to `main` branch for the latest features
  config = function()
    require("nvim-surround").setup()
  end,
}
