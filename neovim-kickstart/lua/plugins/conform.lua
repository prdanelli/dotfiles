return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format()
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    default_format_opts = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_format = "fallback", -- not recommended to change
    },
    formatters_by_ft = {
      sh = { "shfmt" },
      lua = { "stylua" },
      ruby = { "rubocop" },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
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
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt

      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = "never"
      else
        lsp_format_opt = "fallback"
      end

      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
  },
}
