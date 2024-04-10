return {
  {
    "j-hui/fidget.nvim",
    event = "BufReadPre",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "pipe",
          done = "✔",
          commenced = "Started",
          completed = "Completed",
        },
        align = {
          bottom = true,
          right = true,
        },
        window = {
          relative = "win",
          blend = 0,
          zindex = nil,
          border = "none",
        },
      })
    end,
    tag = "legacy",
  },
}
