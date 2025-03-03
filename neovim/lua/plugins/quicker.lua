return {
  "stevearc/quicker.nvim",
  event = "FileType qf",
  opts = {},
  config = function()
    require("quicker").setup({
      borders = {
        vert = " ┃ ",
        strong_header = "━",
        strong_cross = "╋",
        strong_end = "┫",
        soft_header = "╌",
        soft_cross = "╂",
        soft_end = "┨",
      },
    })
  end,
}
