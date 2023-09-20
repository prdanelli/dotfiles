return {
  { "nvim-lua/lsp-status.nvim" }, -- Used by other plugins for basic lsp info

  {
    "j-hui/fidget.nvim",
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
    event = "BufReadPre",
    tag = "legacy",
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lsp").setup()
    end,
    build = ":MasonUpdate",
  },

  {
    "mihyaeru21/nvim-lspconfig-bundler",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lspconfig-bundler").setup()
    end,
  },
}
