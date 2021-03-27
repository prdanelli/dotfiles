set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

" Ensure Coc and Ale place nice together
let g:ale_disable_lsp = 1

source ~/.vimrc
