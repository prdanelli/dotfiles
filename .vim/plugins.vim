""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look and Feel
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline-themes'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlghting/Features
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ekalinin/Dockerfile.vim'
Plug 'cespare/vim-toml'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby/Rails
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/rspec.vim'
Plug 'tpope/vim-bundler'

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
" Code
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctag management
Plug 'ludovicchabant/vim-gutentags'
" Linting
Plug 'dense-analysis/ale'
" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab complete
Plug 'ervandew/supertab'
" Comment out line / block
Plug 'tpope/vim-commentary'
" Automatic end and closing brackets
Plug 'tpope/vim-endwise'
" Wrap text
Plug 'tpope/vim-surround'
" Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Automatically close quotes/brackets
Plug 'Raimondi/delimitMate'
" File related functionality
Plug 'tpope/vim-eunuch'
" Replace with register and don't copy
Plug 'vim-scripts/ReplaceWithRegister'
" Search for text
Plug 'justinmk/vim-sneak'
" Expand % so that tags are included, not just brackets
Plug 'adelarsq/vim-matchit'
" Indentation aware pasting
Plug 'sickill/vim-pasta'
" File explorer
" Plug 'francoiscabrol/ranger.vim'
Plug 'kevinhwang91/rnvimr'
" Prevent vim from changing directory when using cd
" Plug 'airblade/vim-rooter'
" Help closing hidden buffers
Plug 'Asheq/close-buffers.vim'

Plug 'mhinz/vim-startify'

" Colour scheme debugging
" Plug 'cocopon/inspecthi.vim'
" Plug 'cocopon/colorswatch.vim'
