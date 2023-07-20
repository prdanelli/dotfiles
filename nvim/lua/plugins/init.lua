local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, plugin = pcall(require, "lazy")
if not status_ok then return end

local plugins = {
  -----------------------------------------------------------------------------
  -- Look & feel
  -----------------------------------------------------------------------------
  {
    "kyazdani42/nvim-web-devicons",
    config = function() require("plugins.config.nvim_web_devicons") end,
  },

  {
    "goolord/alpha-nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    },
    config = function() require("plugins.config.alpha") end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("plugins.config.colorizer") end,
  },

  {
    "petertriho/nvim-scrollbar",
    config = function() require("scrollbar").setup() end,
    event = "BufReadPre",
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function() require("plugins.config.lualine") end,
    event = "VimEnter",
  },

  {
    "rmehri01/onenord.nvim",
    config = function() require("plugins.config.theme") end,
  },

  -- Add better vertical lines
  {
    "lukas-reineke/virt-column.nvim",
    config = function() require("virt-column").setup() end,
    event = "BufReadPre",
  },

  -----------------------------------------------------------------------------
  -- Navigation
  -----------------------------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("plugins.config.neo-tree")
    end,
  },

  {
    "kevinhwang91/rnvimr",
    config = function() require("plugins.config.rnvimr") end,
    event = "BufEnter",
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function() require("plugins.config.nvim_tree") end,
    event = "BufEnter",
  },

  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function() require("plugins.config.whichkey").setup() end,
  },

  {
    "jinh0/eyeliner.nvim",
    config = function() require("plugins.config.eyeliner") end
  },

  {
    "luukvbaal/statuscol.nvim",
    config = function() require("plugins.config.statuscol") end,
  },

  -----------------------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------------------
  { "folke/lsp-colors.nvim" },    -- Add missing LSP highlight groups
  { "nvim-lua/lsp-status.nvim" }, -- Used by other plugins for basic lsp info

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function() require("lsp").setup() end,
    build = ":MasonUpdate",
  },

  {
    "mihyaeru21/nvim-lspconfig-bundler",
    dependencies = {
      "neovim/nvim-lspconfig"
    },
    config = function() require('lspconfig-bundler').setup() end,
  },

  -- LSP progress indicator
  {
    "j-hui/fidget.nvim",
    config = function() require("plugins.config.fidget") end,
    event = "BufReadPre",
    tag = "legacy",
  },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function() require("plugins.config.trouble") end,
    event = "BufEnter",
  },

  -----------------------------------------------------------------------------
  -- Completions
  -----------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",                   -- Buffer completions
      "hrsh7th/cmp-path",                     -- Path completions
      "hrsh7th/cmp-cmdline",                  -- Cmdline completions
      "hrsh7th/cmp-nvim-lsp",                 -- LSP completions
      "hrsh7th/cmp-nvim-lsp-document-symbol", -- For textDocument/documentSymbol

      -- Snippets
      "saadparwaiz1/cmp_luasnip",     -- snippet completions
      "L3MON4D3/LuaSnip",             --snippet engine
      "rafamadriz/friendly-snippets", -- a bunch of snippets to

      -- Misc
      "lukas-reineke/cmp-under-comparator", -- Tweak completion order
      "f3fora/cmp-spell",
    },
    config = function() require("plugins.config.cmp") end,
    event = "BufEnter",
  },

  -----------------------------------------------------------------------------
  -- Treesitter
  -----------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("plugins.config.treesitter") end,
    event = "BufReadPre",
  },

  {
    "m-demare/hlargs.nvim",
    config = function() require("hlargs").setup() end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -----------------------------------------------------------------------------
  -- Telescope
  -----------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    config = function() require("plugins.config.telescope") end,
    event = "BufEnter",
  },

  -----------------------------------------------------------------------------
  -- Syntax, Languages & Code
  -----------------------------------------------------------------------------
  { "ekalinin/Dockerfile.vim" },
  { "cespare/vim-toml" },
  { "tpope/vim-rails" },
  { "vim-ruby/vim-ruby" },
  { "mtdl9/vim-log-highlighting" },
  { "folke/neodev.nvim" },

  -- Comment lines/blocks
  {
    "terrortylor/nvim-comment",
    config = function() require("plugins.config.comment") end,
    event = "BufEnter",
  },

  {
    "cuducos/yaml.nvim",
    ft = { "yaml" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    },
    config = function() require("plugins.config.neotest") end,
    event = "BufEnter",
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },

  -----------------------------------------------------------------------------
  -- Git
  -----------------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("plugins.config.gitsigns") end,
    event = "BufReadPre",
  },

  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("plugins.config.diffview") end,
    cmd = "DiffviewOpen",
  },

  {
    "akinsho/git-conflict.nvim",
    config = function() require("plugins.config.git_conflict") end
  },

  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("gitlinker").setup() end,
  },

  {
    "aaronhallaert/advanced-git-search.nvim",
    config = function() require("telescope").load_extension("advanced_git_search") end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- to show diff splits and open commits in browser
      "tpope/vim-fugitive",
    },
  },

  -----------------------------------------------------------------------------
  -- Tmux
  -----------------------------------------------------------------------------
  { "tmux-plugins/vim-tmux" },
  { "tmux-plugins/vim-tmux-focus-events" },
  { "christoomey/vim-tmux-navigator" },

  -----------------------------------------------------------------------------
  -- Misc
  -----------------------------------------------------------------------------

  -- Better quick list
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf"
  },

  -- Wrap text
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to `main` branch for the latest features
    config = function() require("nvim-surround").setup() end
  },

  -- Replace with register and don"t copy
  {
    "vim-scripts/ReplaceWithRegister",
    event = "BufEnter",
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function() require("plugins.config.sessions") end,
  },

  -- Delete buffers but maintain layout
  {
    "famiu/bufdelete.nvim",
    event = "BufEnter",
  },

  {
    "akinsho/toggleterm.nvim",
    config = function() require("plugins.config.toggleterm") end,
  },

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  },

  -- Vim motion suggestions
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    opts = {}
  },
}

local opts = {
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
  },
  lockfile = vim.fn.stdpath("config") .. "/.lazy-lock.json",
  concurrency = 50,
  install = {
    missing = true,              -- install missing plugins on startup.
    colorscheme = { "onenord" }, -- try to load one of these colorschemes when installation
  },
  ui = {
    size = {
      width = 0.7,
      height = 0.7
    },
  },
  performance = {
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

plugin.setup(plugins, opts)
