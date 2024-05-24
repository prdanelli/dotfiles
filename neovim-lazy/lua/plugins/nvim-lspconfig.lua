return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = require("lazyvim.config").icons.diagnostics.Error,
          [vim.diagnostic.severity.WARN] = require("lazyvim.config").icons.diagnostics.Warn,
          [vim.diagnostic.severity.HINT] = require("lazyvim.config").icons.diagnostics.Hint,
          [vim.diagnostic.severity.INFO] = require("lazyvim.config").icons.diagnostics.Info,
        },
      },
    },
    inlay_hints = {
      enabled = true,
    },
    codelens = {
      enabled = false,
    },
    capabilities = {},
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              globals = { "vim", "LazyVim" },
            },
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      },
    },
    setup = {},
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = { "gd", vim.lsp.buf.definition }
  end,
}
