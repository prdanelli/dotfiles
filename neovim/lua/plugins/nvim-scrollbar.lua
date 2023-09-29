return {
  "petertriho/nvim-scrollbar",
  event = "BufReadPre",
  config = function()
    require("scrollbar").setup()
  end,
}
