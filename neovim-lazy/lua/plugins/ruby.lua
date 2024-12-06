return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ruby",
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- "solargraph",
        "ruby-lsp",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- solargraph = {
        --   root_dir = function(fname)
        --     return require("lspconfig").util.root_pattern("Gemfile", ".git")(fname) or vim.fn.getcwd()
        --   end,
        -- },
        ruby_lsp = {
          -- mason = false,
          cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern("Gemfile", ".git")(fname) or vim.fn.getcwd()
          end,
          formatter = "none",
        },
      },
    },
  },

  {
    "RRethy/nvim-treesitter-endwise",
    event = "InsertEnter",
  },
}
