" Tmux
"
" Keybindings
"
" <prefix>: - enter commands
" <prefix>w - list windows
" <prefix>& - kill window
" <prefix>x - kill pane
" <prefix>$ - rename session
"
" Commands
"
" swap-window -s <old_index> -t <new_index>
" new-window -a <index>
"
" VIM
"
" Text objects
"
" iw - inside word
" it - inside tag
" i" - inside " marks
" ip - inside paragraph
" a" - around " marks
" as - around sentence
"
" Buffers
"
" :new - will create a split window with an unnamed buffer.
" :enew - will open one in the current window.
" :vnew - will open one in a vertically split window.
" :tabnew - will open one in a new tab.
"
" File Navigation
"
" H - top of screen (high)
" M - middle of screen (middle)
" L - bottom of screen (low)
"
" zt - move current line to top of screen
" zz - move current line to middle of screen
" zb - move current line to bottom of screen
"
" Ctrl+f - move screen down by 1 full screen
" Ctrl+b - move screen up by 1 full screen
"
" Ctrl+o - back to last location
" Ctrl+i - forward to next location
"
" Inline Navigation
"
" ^ - first character
" g_ - last character
" e - end of word
" ge - backwards end of word
" w - start of little word (snake_case_words)
" W - start of big word (hyphonated-words-etc)
"
" Searching
"
" * - highlight all occurances of current word
" *n - Next occurance of current word
" *N - Previous occurance of current word
" f - find occurance of next characters entered
" F - find previous occurance of next character entered
" t - find next occurance but not including it (one space before)
" T - find previous occurance but not including it (one space before)
" % - Goto matching brace/tag
"
" Markers
"
" mm - set the marker on the current word
" `m - go back to marker from anywhere else in the file
" 'm - go back to first character of marker line
"
" Folding
"
" za - Toggle code folding
" zM - fold max
" zm - fold more
" zR - unfold max (fold reduce)
" zr - unfold more
"
" Surround
"
" yss' - surround whole line with '
" cs'" - change ' to "
" ysw[ - surround word: [ test_word ]
" ysw] - surround word: [test_word]
" ysg@<div>j>> - surround line with div tag
" S" - surround highlighted text
"
" Replace with register
"
" gr{motion} = replace with clipboard
" griw - replace current word with clipboard
"
" Movement
"
" { - Up a block
" } - Down a block
"
" > - Indent
" < - Outdent
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings / mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
:let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source ~/.vimrc
nnoremap <Leader>0 :source ~/.config/nvim/init.vim<CR> <bar> :echom 'Sourced init.vim' <CR>


" Use Del key for black hole register
map <Del> "_x

" Select all
nnoremap <C-s> ggVG

" Turn off arrow keys - force HJKL
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" Clear search highlight
nnoremap <Leader>c :noh<return><esc>

" Extra save keys
nnoremap <Leader>w :w<CR>
nnoremap <C-w> :w<cr>
nnoremap :W :w<CR>
vnoremap :W :w<CR>

" Toggle Paste Mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Better Indentation
vnoremap < <gv
vnoremap > >gv

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" Copy current buffers file path
command! Bpath let @+ = expand('%:p')
nnoremap <Leader>yp :let @+=expand('%:p')<CR>

" Copy current buffer file name
command! Bname let @+=expand("%:t")
nmap<Leader>yn :let @+=expand("%:t")<CR>

" Insert lines above/below without leaving normal mode
nnoremap <silent> oo :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> OO :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete buffer
nnoremap <Leader>d :bdelete<CR>

" Close a buffer without closing the split
nnoremap <silent> <leader>bd :lclose<bar>b#<bar>bd #<CR>

" Close hidden buffers
nnoremap <silent> Q :Bdelete menu<CR>

" Buffer navigation with ctrl+lh
nnoremap <silent><Tab> :bnext<CR>
nnoremap <silent><S-Tab> :bprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>- :split<CR>

" Resize splits with alt+cursor keys
nnoremap <M-Up> :resize -2<CR>
nnoremap <M-Down> :resize +2<CR>
nnoremap <M-Left> :vertical resize -2<CR>
nnoremap <M-Right> :vertical resize +2<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open new tab
noremap tn :tabnew<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet
let g:user_emmet_leader_key='<C-em>'

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

" Remap Multiple Cursors
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'

" ## FZF Keybindings: https://github.com/junegunn/fzf.vim#commands
nnoremap <Leader>p :Files<cr>
nnoremap <Leader>g :GFiles<cr>
nnoremap <Leader>h :History<cr>
nnoremap <Leader>l :Lines<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>r :Rg<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Ensure tab completion order is top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()
nmap <silent><Leader>e :CocCommand explorer --sources=file+<CR>
nmap <Leader>ev :CocCommand explorer --preset .vim<CR>
nmap <Leader>ec :CocCommand explorer --preset cocConfig<CR>
nmap <Leader>eb :CocCommand explorer --preset buffer<CR>

" ALE
" nmap <silent> <Leader>x <Plug>(ale_next_wrap)
" nmap <silent> <Leader>z <Plug>(ale_previous_wrap)
" nnoremap <Leader>s :Startify<cr>
" imap <script> <silent> <Plug>SuperTabForward <c-r>=SuperTab('n')<cr>

" Toggle booleans
noremap <leader>t :ToggleBool<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP Saga
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

" code action
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

" hover docs
nnoremap <silent>K :Lspsaga hover_doc<CR>

" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" Signature help
nnoremap <silent> gs :Lspsaga signature_help<CR>

" reName
nnoremap <silent> gn :Lspsaga rename<CR>

" preview definition
nnoremap <silent> gd :Lspsaga preview_definition<CR>

" diagnostics
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua

" Jump diagnostics
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

" float terminal also you can pass the cli command in open_float_terminal function
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nvim trouble
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File/vim functions
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>

" LSP funtions
nnoremap <leader>ls <cmd>lsp_document_symbols<cr>
nnoremap <leader>la <cmd>lsp_code_actions<cr>
nnoremap <leader>ld <cmd>lsp_definitions<cr>

" Git functions
nnoremap <leader>gc <cmd>git_commits<cr>
nnoremap <leader>gs <cmd>git_status<cr>
nnoremap <leader>gt <cmd>git_stash<cr>


