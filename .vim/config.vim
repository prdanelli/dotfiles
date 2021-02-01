"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look / Colours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set vim-specific sequences for rgb colors - without these, vim colors don't
" work inside of tmux.
let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
set background=dark

let g:nord_cursor_line_number_background = 1
let g:nord_bold = 0
let g:nord_italic = 1
let g:nord_italic_comments = 0
let g:nord_uniform_status_lines = 0

" this line must come after the colors scheme settings above
colorscheme nord

" NOTE:
" To edit the theme, use the colour numbers below:
"
" rubyConstant - nord7_term
" rubySymbol - nord6_term
" rubyAttribute
" rubyBlockParameterList
" rubyInterpolationDelimiter
" rubyKeywordAsMethod
" rubyLocalVariableOrMethod
" rubyPseudoVariable
" rubyRegexp
"
" nord1_term = "0"
" nord3_term = "8"
" nord5_term = "7"
" nord6_term = "15"
" nord7_term = "14"
" nord8_term = "6"
" nord9_term = "4"
" nord10_term = "12"
" nord11_term = "1"
" nord12_term = "11"
" nord13_term = "3"
" nord14_term = "2"
" nord15_term = "5"

" Override symbol colours for Ruby as bold white was not distinct enough
hi rubySymbol ctermfg=5

" Character line limits
set colorcolumn=80,120

" Highlight the current line
set cursorline

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
set fileencoding=utf-8
set regexpengine=1
set lazyredraw
set synmaxcol=200
set updatetime=300 " Make Vim update the swap file faster
set timeoutlen=500
set shell=bash " Use bash by default, or ranger file explorer won't work
set ruler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behaviour
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set conceallevel=0

" Tab / space behaviour
set tabstop=2
set smarttab
set expandtab

" Don't show -- INSERT--
set noshowmode

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

set nobackup
set nowritebackup

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

" Vim Sneak
let g:sneak#label = 1

" FZF
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = { 'up' :'~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5 } }
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Boolean'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

" ALE
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

