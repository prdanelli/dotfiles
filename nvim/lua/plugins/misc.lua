return {
  -----------------------------------------------------------------------------
  -- Look & feel
  -----------------------------------------------------------------------------
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
    event = "BufReadPre",
  },

  -- Add better vertical lines
  {
    "lukas-reineke/virt-column.nvim",
    config = function()
      require("virt-column").setup()
    end,
    event = "BufReadPre",
  },

  -----------------------------------------------------------------------------
  -- Navigation
  -----------------------------------------------------------------------------
  -- {
  --   "chrisgrieser/nvim-spider",
  --   config = function()
  --     require("plugins.config.spider")
  --   end,
  -- },
  --
  ,

  -----------------------------------------------------------------------------
  -- Syntax, Languages & Code
  -----------------------------------------------------------------------------
  { "ekalinin/Dockerfile.vim" },
  { "cespare/vim-toml" },
  { "tpope/vim-rails" },
  { "vim-ruby/vim-ruby" },
  { "mtdl9/vim-log-highlighting" },
  { "folke/neodev.nvim" },

  {
    "cuducos/yaml.nvim",
    ft = { "yaml" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -----------------------------------------------------------------------------
  -- Misc
  -----------------------------------------------------------------------------

  -- Better quick list
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  -- Wrap text
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to `main` branch for the latest features
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Replace with register and don"t copy
  {
    "vim-scripts/ReplaceWithRegister",
    event = "BufEnter",
  },

  -- Delete buffers but maintain layout
  {
    "famiu/bufdelete.nvim",
    event = "BufEnter",
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Vim motion suggestions
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    opts = {
      -- Add "oil" to the disabled_filetypes
      disabled_filetypes = require("config.excluded_filetypes"),
    },
  },
}
