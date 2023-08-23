return {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      -- https://github.com/nvim-tree/nvim-web-devicons/blob/master/lua/nvim-web-devicons.lua
      override = {},
      color_icons = false,
    })
  end,
}
