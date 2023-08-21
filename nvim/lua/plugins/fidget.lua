return {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup()
  end,
  event = "BufReadPre",
  tag = "legacy",
}
