local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

vim.api.nvim_create_augroup("_packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "_packer_user_config",
  pattern = "*/plugins/init.lua",
  callback = function()
    vim.cmd("source <afile>")
    vim.cmd("PackerSync")
  end
})

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
    prompt_border = "single"
  },
  git = { clone_timeout = 600, },
  auto_clean = true,
  ensure_dependencies = true,
}

return packer.startup(function(use)
  -- Make packer manage itself
  use "wbthomason/packer.nvim"

  -----------------------------------------------------------------------------
  -- Look & feel
  -----------------------------------------------------------------------------
  use {
    "rmehri01/onenord.nvim",
    config = function() require("plugins.config.theme") end,
  }

  use "yggdroot/indentline"

  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require("plugins.config.colorizer") end
  }

  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function() require("plugins.config.alpha") end,
  }

  use {
    "petertriho/nvim-scrollbar",
    config = function () require("scrollbar").setup() end
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = function() require("plugins.config.lualine") end,
  }

  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    after = { "nvim-web-devicons", "onenord.nvim" },
    config = function() require("plugins.config.bufferline") end,
  }

  use {
    "lukas-reineke/virt-column.nvim",
    config = function() require("virt-column").setup() end,
  }

  -----------------------------------------------------------------------------
  -- Navigation
  -----------------------------------------------------------------------------
  use {
    "kevinhwang91/rnvimr",
    config = function() require("plugins.config.rnvimr") end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function() require("plugins.config.nvim_tree") end,
  }

  -----------------------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------------------
  use {
    "williamboman/nvim-lsp-installer",
    requires = {
      "neovim/nvim-lspconfig",
      "folke/lsp-colors.nvim", -- Add missing LSP highlight groups
      "nvim-lua/lsp-status.nvim", -- Used by other plugins for basic lsp info
    },
    config = function() require("lsp.init") end,
  }

  use {
    "j-hui/fidget.nvim",
    config = function() require("plugins.config.fidget") end,
  } -- LSP progress indicator

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("plugins.config.trouble") end,
  }

  -----------------------------------------------------------------------------
  -- Completions
  -----------------------------------------------------------------------------
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer", -- Buffer completions
      "hrsh7th/cmp-path", -- Path completions
      "hrsh7th/cmp-cmdline", -- Cmdline completions
      "hrsh7th/cmp-nvim-lua", -- API completions
      "hrsh7th/cmp-nvim-lsp", -- LSP completions
      "hrsh7th/cmp-nvim-lsp-document-symbol", -- For textDocument/documentSymbol

      -- Snippets
      "saadparwaiz1/cmp_luasnip", -- snippet completions
      "L3MON4D3/LuaSnip", --snippet engine
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use

      -- Misc
      "lukas-reineke/cmp-under-comparator", -- Tweak completion order
    },
    config = function() require("plugins.config.cmp") end,
  }

  -----------------------------------------------------------------------------
  -- Treesitter
  -----------------------------------------------------------------------------
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "RRethy/nvim-treesitter-textsubjects",
    },
    run = ":TSUpdate",
    config = function() require("plugins.config.treesitter") end,
  }
  -----------------------------------------------------------------------------
  -- Telescope
  -----------------------------------------------------------------------------
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function() require("plugins.config.telescope") end,
  }

  -----------------------------------------------------------------------------
  -- Syntax & code
  -----------------------------------------------------------------------------
  use "ekalinin/Dockerfile.vim"
  use "cespare/vim-toml"
  use "tpope/vim-rails"
  use "vim-ruby/vim-ruby"
  use "mtdl9/vim-log-highlighting"
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use {
    'stevearc/aerial.nvim',
    config = function() require('plugins.config.aerial') end,
    requires = { "nvim-treesitter/nvim-treesitter" }
  }

  -----------------------------------------------------------------------------
  -- Git
  -----------------------------------------------------------------------------
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function() require('gitsigns').setup() end,
  }


  use {
    "sindrets/diffview.nvim",
    config = function() require("plugins.config.diffview") end,
    requires = "nvim-lua/plenary.nvim"
  }

  -----------------------------------------------------------------------------
  -- Tmux
  -----------------------------------------------------------------------------
  use "tmux-plugins/vim-tmux"
  use "tmux-plugins/vim-tmux-focus-events"
  use "christoomey/vim-tmux-navigator"

  -----------------------------------------------------------------------------
  -- Misc
  -----------------------------------------------------------------------------

  -- Better quick list
  use { "kevinhwang91/nvim-bqf", ft = "qf" }

  -- Wrap text
  use "tpope/vim-surround"

  -- Replace with register and don"t copy
  use "vim-scripts/ReplaceWithRegister"

  -- Highlight yanked text
  use {
    "machakann/vim-highlightedyank",
    config = function() require("plugins.config.highlighted_yank") end,
  }

  -- Editor config integration
  use "editorconfig/editorconfig-vim"

  -- Record open files etc in sessions
  use {
    "rmagatti/auto-session",
    config = function() require("plugins.config.auto_session") end,
  }

  -- Delete buffers but maintain layout
  use "famiu/bufdelete.nvim"

  -- Pretty notifications
  use {
    "rcarriga/nvim-notify",
    config = function () require("plugins.config.notify") end
  }

  -- Comment lines/blocks
  use {
    'numToStr/Comment.nvim',
    config = function() require("plugins.config.comment") end,
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter",
    },
  }

  -- Use faster version of filetypes configuration
  use "nathom/filetype.nvim"

  -- Persistant buffer only available on keymap press
  use {
    "FraserLee/ScratchPad",
    config = function() require("plugins.config.scratchpad") end,
  }

  -- Try to prevent opening buffers in temp buffers like Aerial
  use {
    "stevearc/stickybuf.nvim",
    config = function() require("stickybuf").setup() end,
  }

  -- Profiling and Performance
  use "dstein64/vim-startuptime"
  use "lewis6991/impatient.nvim"

  -----------------------------------------------------------------------------
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -----------------------------------------------------------------------------
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

