let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Personal/Repos/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 nvim/lua/plugins/init.lua
badd +16 ~/Dev/api/app/controllers/api_controller.rb
badd +46 nvim/lua/plugins/config/treesitter.lua
argglobal
%argdel
edit nvim/lua/plugins/init.lua
argglobal
balt nvim/lua/plugins/config/treesitter.lua
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=20
setlocal fml=1
setlocal fdn=20
setlocal fen
20
normal! zo
97
normal! zo
107
normal! zo
115
normal! zo
124
normal! zo
132
normal! zo
139
normal! zo
151
normal! zo
163
normal! zo
174
normal! zo
183
normal! zo
195
normal! zo
222
normal! zo
231
normal! zo
248
normal! zo
267
normal! zo
281
normal! zo
290
normal! zo
304
normal! zo
312
normal! zo
321
normal! zo
330
normal! zo
339
normal! zo
346
normal! zo
354
normal! zo
384
normal! zo
398
normal! zo
413
normal! zo
420
normal! zo
let s:l = 104 - ((39 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 104
normal! 0
lcd ~/Dev/api/app/models/users
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
