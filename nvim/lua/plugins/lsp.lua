return {
  { "nvim-lua/lsp-status.nvim" }, -- Used by other plugins for basic lsp info

  {
    "williamboman/mason.nvim",
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
