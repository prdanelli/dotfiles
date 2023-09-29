return {
  "Aasim-A/scrollEOF.nvim",
  event = "BufEnter",
  config = function()
    require("scrollEOF").setup()
  end,
}
