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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings / mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
:let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
nnoremap :W :w<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" New buffer
nnoremap bn <C-^>

" Delete buffer
nnoremap <Leader>d :bdelete<CR>

" Close hidden buffers
nnoremap <silent> Q :Bdelete menu<CR>

" Buffer navigation with ctrl+lh
nnoremap <silent><C-Right> :bnext<CR>
nnoremap <silent><C-Left> :bprevious<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Emmet
let g:user_emmet_leader_key='<C-a>'

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
nnoremap <Leader>t :Tags<cr>

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

nmap <Leader>e :CocCommand explorer --sources=buffer+,file+<CR>
nmap <Leader>ev :CocCommand explorer --preset .vim<CR>
nmap <Leader>ec :CocCommand explorer --preset cocConfig<CR>
nmap <Leader>eb :CocCommand explorer --preset buffer<CR>

" ALE
nmap <silent> <Leader>x <Plug>(ale_next_wrap)
nmap <silent> <Leader>z <Plug>(ale_previous_wrap)

" Ranger modal
nnoremap <silent><Leader>f :RnvimrToggle<cr>
let g:rnvimr_action = {
  \ '<C-t>': 'NvimEdit tabedit',
  \ '<C-x>': 'NvimEdit split',
  \ '<C-v>': 'NvimEdit vsplit',
  \ 'gw': 'JumpNvimCwd',
  \ 'yw': 'EmitRangerCwd'
  \ }

nnoremap <Leader>s :Startify<cr>
