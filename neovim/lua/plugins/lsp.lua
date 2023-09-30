return {
  {
    "nvim-lua/lsp-status.nvim",
    event = "BufReadPre",
  }, -- Used by other plugins for basic lsp info

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

  {
    "williamboman/mason.nvim",
    event = "BufReadPre",
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
    event = "BufReadPre",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lspconfig-bundler").setup()
    end,
  },
}
