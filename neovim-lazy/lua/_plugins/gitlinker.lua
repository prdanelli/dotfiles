return {
  "ruifm/gitlinker.nvim",
  event = "VeryLazy",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("gitlinker").setup()
  end,
}
