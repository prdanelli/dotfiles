""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible      " We're running Vim, not Vi!
set ttyfast           " Send more characters to the terminal at once
set encoding=UTF-8
set fileencoding=utf-8
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set regexpengine=1

" set lazyredraw

set synmaxcol=200
set updatetime=300 " Make Vim update the swap file faster
set timeoutlen=500
set shell=bash " Use bash by default, or ranger file explorer won't work
set ruler

if !has('nvim')
	set ttymouse=xterm2
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look / Colours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set background=dark

" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" We need to set Nord first, then base-16ocean, otherwise
" the nord airline-theme won't work and we will see errors
colorscheme nord
colorscheme base16-ocean

highlight Normal guifg=NONE guibg=#2E3440

" Character line limits
set colorcolumn=80,120

" Highlight the current line
set cursorline

" Show status line always
set laststatus=2

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

" Airline
" set this. airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='nord'

" Vim Sneak
let g:sneak#label = 1

" FZF
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = { 'up' :'~90%', 'window': { 'width': 0.95, 'height': 0.9 } }
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

" Coc Explorer - file browser
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" ALE
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let b:ale_linters = { 'ruby': ['solograph'] }

" Startify
let g:startify_custom_header =[]
let g:startify_change_to_dir=0

function! s:gitModified()
	let files = systemlist('git ls-files -m 2>/dev/null')
	return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_bookmarks = ['~/.vim/config.vim', '~/.vim/plugins.vim', '~/.vim/keymap.vim']
let g:startify_enable_special = 0
let g:startify_lists = [
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
	\ { 'type': 'files',     'header': ['   Recent'] },
	\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
	\ { 'type': 'sessions',  'header': ['   Sessions'] },
	\ { 'type': function('s:gitModified'),  'header': ['   Modified'] },
	\ { 'type': 'commands',  'header': ['   Commands'] },
	\ ]

