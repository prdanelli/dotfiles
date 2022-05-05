local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to reload neovim whenever plugins.lua is saved
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Make packer manage itself
  use "wbthomason/packer.nvim"

  -----------------------------------------------------------------------------
  -- Look & feel
  -----------------------------------------------------------------------------
  -- use "sainnhe/gruvbox-material"
  use "EdenEast/nightfox.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "yggdroot/indentline"
  use { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end }
  use { "goolord/alpha-nvim", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "rcarriga/nvim-notify", config = function() vim.notify = require("notify") end }

  -----------------------------------------------------------------------------
  -- Navigation
  -----------------------------------------------------------------------------
  use "nvim-lualine/lualine.nvim"
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use "kevinhwang91/rnvimr"

  -----------------------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------------------
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "folke/lsp-colors.nvim" -- Add missing LSP highlight groups
  use "nvim-lua/lsp-status.nvim" -- Used by other plugin for basic lsp info
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use { "j-hui/fidget.nvim", config = function() require("fidget").setup() end } -- LSP progress indicator

  -----------------------------------------------------------------------------
  -- Completions
  -----------------------------------------------------------------------------
  use "hrsh7th/nvim-cmp" -- The completion plugin

  -- Completions
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-cmdline" -- Cmdline completions
  use "hrsh7th/cmp-nvim-lua" -- API completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "hrsh7th/cmp-nvim-lsp-document-symbol" -- For textDocument/documentSymbol
  --
  -- Snippets
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Misc
  use "lukas-reineke/cmp-under-comparator" -- Tweak completion order

  -----------------------------------------------------------------------------
  -- Treesitter
  -----------------------------------------------------------------------------
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "nvim-treesitter/nvim-treesitter-textobjects"

  -----------------------------------------------------------------------------
  -- Telescope
  -----------------------------------------------------------------------------
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -----------------------------------------------------------------------------
  -- Syntax & code
  -----------------------------------------------------------------------------
  use "ekalinin/Dockerfile.vim"
  use "cespare/vim-toml"
  use "tpope/vim-rails"
  use "vim-ruby/vim-ruby"
  use "mtdl9/vim-log-highlighting"

  -----------------------------------------------------------------------------
  -- Git
  -----------------------------------------------------------------------------
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }

  -----------------------------------------------------------------------------
  -- Tmux
  -----------------------------------------------------------------------------
  use "tmux-plugins/vim-tmux"
  use "tmux-plugins/vim-tmux-focus-events"
  use "christoomey/vim-tmux-navigator"

  -----------------------------------------------------------------------------
  -- Misc
  -----------------------------------------------------------------------------
  use { "terrortylor/nvim-comment", config = function() require("nvim_comment").setup() end } -- Comment out line / block
  use "tpope/vim-surround" -- Wrap text
  use "vim-scripts/ReplaceWithRegister" -- Replace with register and don"t copy
  use "machakann/vim-highlightedyank" -- Highlight yanked text
  use "editorconfig/editorconfig-vim" -- Editor config integration
  use "rmagatti/auto-session" -- Record open files etc in sessions
  use "famiu/bufdelete.nvim" -- Delete buffers but maintain layout
  use {"kevinhwang91/nvim-bqf", ft = "qf" } -- Better Quickfix lists

  -----------------------------------------------------------------------------
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -----------------------------------------------------------------------------
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
