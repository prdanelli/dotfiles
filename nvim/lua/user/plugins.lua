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
  use "rmehri01/onenord.nvim"
	use "RRethy/nvim-base16"
  use "kyazdani42/nvim-web-devicons"
  use "yggdroot/indentline"
	use { "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end }
	use { "goolord/alpha-nvim", requires = { "kyazdani42/nvim-web-devicons" } }
	use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
	use "mtdl9/vim-log-highlighting"

  -----------------------------------------------------------------------------
  -- Navigation
  -----------------------------------------------------------------------------
  use "nvim-lualine/lualine.nvim"
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use "kevinhwang91/rnvimr"
	use { "nacro90/numb.nvim", config = function() require("numb").setup() end } -- Peak lines during page number nav

  -----------------------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------------------
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "folke/lsp-colors.nvim" -- Add missing LSP highlight groups
  use "nvim-lua/lsp-status.nvim" -- Used by other plugin for basic lsp info
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

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
  use "keith/rspec.vim"
  use "tpope/vim-bundler"
	use "dag/vim-fish"
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
  use { "terrortylor/nvim-comment", config = function() require('nvim_comment').setup() end } -- Comment out line / block
  use "tpope/vim-surround" -- Wrap text
  use "mg979/vim-visual-multi" -- Multiple cursors
  use "vim-scripts/ReplaceWithRegister" -- Replace with register and don"t copy
  use "machakann/vim-highlightedyank" -- Highlight yanked text
  use "sagarrakshe/toggle-bool" -- Toggle boolean values
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "editorconfig/editorconfig-vim"
	use "chentau/marks.nvim" -- Better marks
	use { "lewis6991/spellsitter.nvim", config = function() require("spellsitter").setup() end } -- Spell checking with Treesitter

  -----------------------------------------------------------------------------
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -----------------------------------------------------------------------------
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
