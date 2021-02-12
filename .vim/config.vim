"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible      " We're running Vim, not Vi!
set ttyfast           " Send more characters to the terminal at once
set encoding=UTF-8
set fileencoding=utf-8
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set regexpengine=1
set lazyredraw
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='nord'
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

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

" ALE
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let b:ale_linters = { 'ruby': ['solograph'] }

if has('nvim')
  " Ranger
  "
  " Make Ranger replace Netrw and be the file explorer
  let g:rnvimr_enable_ex = 1

  " Make Ranger to be hidden after picking a file
  let g:rnvimr_enable_picker = 1

  " Disable a border for floating window
  let g:rnvimr_draw_border = 0

  " Hide the files included in gitignore
  let g:rnvimr_hide_gitignore = 1

  " Change the border's color
  let g:rnvimr_border_attr = {'fg': 15, 'bg': -1}

  " Make Neovim wipe the buffers corresponding to the files deleted by Ranger
  let g:rnvimr_enable_bw = 1

  " Add a shadow window, value is equal to 100 will disable shadow
  let g:rnvimr_shadow_winblend = 40

  " Draw border with both
  let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'

  " Link CursorLine into RnvimrNormal highlight in the Floating window
  highlight link RnvimrNormal CursorLine
  "
  " Add views for Ranger to adapt the size of floating window
  let g:rnvimr_ranger_views = [
  \ {'minwidth': 90, 'ratio': []},
  \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
  \ {'maxwidth': 49, 'ratio': [1]}
  \ ]

  " Customize the initial layout
  let g:rnvimr_layout = {
  \ 'relative': 'editor',
  \ 'width': float2nr(round(0.7 * &columns)),
  \ 'height': float2nr(round(0.7 * &lines)),
  \ 'col': float2nr(round(0.15 * &columns)),
  \ 'row': float2nr(round(0.15 * &lines)),
  \ 'style': 'minimal'
  \ }

  " Customize multiple preset layouts
  " '{}' represents the initial layout
  let g:rnvimr_presets = [
  \ {'width': 0.600, 'height': 0.600},
  \ {},
  \ {'width': 0.800, 'height': 0.800},
  \ {'width': 0.950, 'height': 0.950},
  \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0},
  \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0.5},
  \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0},
  \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0.5},
  \ {'width': 0.500, 'height': 1.000, 'col': 0, 'row': 0},
  \ {'width': 0.500, 'height': 1.000, 'col': 0.5, 'row': 0},
  \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0},
  \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0.5}
  \ ]
endif

" Startify
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
