"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set ttyfast           " Send more characters to the terminal at once
set encoding=UTF-8
set regexpengine=1
set lazyredraw
set synmaxcol=200
set updatetime=300 " Make Vim update the swap file faster

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look / Colours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 24-bit colour mode, disable if terminal not compatible
set termguicolors

" set vim-specific sequences for rgb colors - without these, vim colors don't
" work inside of tmux.
let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
set background=dark

" this line must come after the colors scheme settings above
colorscheme nord

" Character line limits
set colorcolumn=80,120

" Highlight the current line
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behaviour
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search recurively
set path+=**

" Menu autocomplete
set wildmenu
set wildmode=longest:full,full

" How should backspace be used
set backspace=indent,eol,start

" Enable mouse selection
set mouse=niv

" Word wrap but don't cut words
set linebreak

" Enable Hidden Buffers - means you can switch between buffers without saving
set hidden

" Use System Clipboard
set clipboard=unnamedplus

" Indentation
set smartindent
set autoindent

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Turn line numbers on by default, and set relative
set number
set relativenumber

" Always show gutter so Gitgutter doesn't jump
set signcolumn=yes
"
" Line number width
set numberwidth=3

" Highlight search terms
set hlsearch

" Highlight terms as search is typed
set incsearch

" Swap / Persistent directories
set swapfile
set backupdir=.backup/,~/.vim/.backup,/tmp//
set directory=.swp/,~/.vim/.vim/.swapfiles/,/tmp//
set undodir=.undo/,~/.vim/.undo/,/tmp//
set undofile

" Set universal ignore
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor/**/*,*/.cache,*/node_modules/**/*,*/docker/**/*

" Code folding
set foldmethod=indent
set nofoldenable
" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Omnicomplete
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Airline
let g:airlineTheme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['mri']

" Vim Sneak
let g:sneak#label = 1

