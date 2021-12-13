""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look and Feel
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'yggdroot/indentline'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kevinhwang91/rnvimr'
Plug 'ap/vim-css-color'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treesitter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'folke/lsp-colors.nvim' " Add missing LSP highlight groups
Plug 'nvim-lua/lsp-status.nvim' " Used by other plugin for basic lsp info
Plug 'folke/trouble.nvim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'hrsh7th/nvim-cmp' " Completion engine
Plug 'hrsh7th/cmp-buffer' " Install the buffer completion source
Plug 'hrsh7th/cmp-path' " Install the buffer completion source
Plug 'hrsh7th/cmp-nvim-lua' " vim-cmp source for neovim builtin LSP client
Plug 'hrsh7th/cmp-nvim-lsp' " vim-cmp source for neovim builtin LSP client

Plug 'L3MON4D3/LuaSnip' " Snippets
Plug 'saadparwaiz1/cmp_luasnip' " Snippet source for CMP
Plug 'onsails/lspkind-nvim' " Pictograms and type of completion

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlghting/Features
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ekalinin/Dockerfile.vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/rspec.vim'
Plug 'tpope/vim-bundler'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmux
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'ervandew/supertab' " Tab complete
Plug 'tpope/vim-commentary' " Comment out line / block
Plug 'tpope/vim-endwise' " Automatic end and closing brackets
Plug 'tpope/vim-surround' " Wrap text
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors
Plug 'Raimondi/delimitMate' " Automatically close quotes/brackets
Plug 'tpope/vim-eunuch' " File related functionality
Plug 'vim-scripts/ReplaceWithRegister' " Replace with register and don't copy
Plug 'justinmk/vim-sneak' " Search for text
Plug 'adelarsq/vim-matchit' " Expand % so that tags are included, not just brackets
Plug 'sickill/vim-pasta' " Indentation aware pasting
Plug 'Asheq/close-buffers.vim' " Help closing hidden buffers
Plug 'mhinz/vim-startify' " Start up page
Plug 'machakann/vim-highlightedyank' " Highlight yanked text
Plug 'sagarrakshe/toggle-bool' " Toggle boolean values
Plug 'jghauser/mkdir.nvim'
Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'
