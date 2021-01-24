" Actions
"
" > - Indent
" < - Outdent
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
" Example:
" Lzz - make last line on the screen centered
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
" za - Toggle code folding / Shift+Tab
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
"
" Replace with register
"
" gr{motion} = replace with clipboard
" griw - replace current word with clipboard
"
" Movement
" { - Up a block
" } - Down a block

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings / mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
:let mapleader = ","

" RANDOM
"
" Reload config
nnoremap <Leader>r :source ~/.vimrc<CR>
" Use Del key for black hole register
map <Del> "_x

" # BUFFERS
"
" Use <Tab> to switch buffers, not ctrl+w
map <Tab> <C-W>W:cd %:p:h<CR>:<CR>

" Remap buffer navigation
nnoremap <Leader>m :bNext<CR>
nnoremap <Leader>n :bprevious<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>b :Buffers<cr>
nnoremap gf <C-^>

" Turn off arrow keys - force HJKL
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" Clear search highlight
nnoremap <Leader>c :noh<return><esc>

" Window Splits
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>- :split<CR>

nnoremap <Leader>w :w<CR>
nnoremap :W :w<CR>

" Toggle Paste Mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Folding
"
" Toggle current block fold Shift+Tab
nnoremap <s-tab> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

noremap tn :tabnew<CR>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" Open new tab
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet
let g:user_emmet_leader_key='<C-a>'

" Remap Omnicomplete shortcuts
inoremap <C-,> <C-x><C-o>
inoremap <C-@> <C-,>

" Remap Multiple Cursors
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'

" ## FZF Keybindings: https://github.com/junegunn/fzf.vim#commands
nnoremap <Leader>p :Files<cr>
nnoremap <Leader>g :GFiles<cr>

" Ensure tab completion order is top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

