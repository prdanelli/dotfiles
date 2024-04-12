return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = { "rubocop" },
    },
    formatters = {
      rubocop = function()
        return {
          command = "rubocop",
          args = {
            "--server",
            "--fix-layout",
            "--autocorrect-all",
            "--format",
            "files",
            "--stderr",
            "--stdin",
            "$FILENAME",
          },
          stdin = true,
        }
      end,
    },
  },
}
