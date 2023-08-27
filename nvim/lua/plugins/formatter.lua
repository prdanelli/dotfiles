return {
  "mhartington/formatter.nvim",
  config = function()
    local loaded, formatter = pcall(require, "formatter")
    if not loaded then
      return
    end

    local util = require("formatter.util")

    vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("_formatter", { clear = true }),
      pattern = "*",
      command = "FormatWrite",
    })

    -- Provides the following commands:
    -- Format, FormatWrite, FormatLock, FormatWriteLock
    formatter.setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        ruby = {
          -- require("formatter.filetypes.ruby").rubocop,
          function()
            return {
              exe = "rubocop",
              args = {
                "--fix-layout",
                "--autocorrect-all",
                "--stdin",
                util.escape_path(util.get_current_buffer_file_name()),
                "--format",
                "files",
                "--stderr",
              },
              stdin = true,
            }
          end,
        },
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })
  end,
}
