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

" Reload config
nnoremap <Leader>r :source ~/.vimrc<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete buffer
nnoremap <Leader>d :bdelete<CR>

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
nmap <Leader>e :CocCommand explorer --sources=buffer+,file+<CR>
nmap <Leader>ev :CocCommand explorer --preset .vim<CR>
nmap <Leader>ec :CocCommand explorer --preset cocConfig<CR>
nmap <Leader>eb :CocCommand explorer --preset buffer<CR>

" ALE
nmap <silent> <Leader>x <Plug>(ale_next_wrap)
nmap <silent> <Leader>z <Plug>(ale_previous_wrap)
nnoremap <Leader>s :Startify<cr>
imap <script> <silent> <Plug>SuperTabForward <c-r>=SuperTab('n')<cr>

