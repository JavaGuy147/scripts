" ~/.vim/sessions/temp.vim:
" Vim session script.
" Created by session.vim 2.4.9 on 22 November 2013 at 20:43:03.
" Open this file in Vim and run :source % to restore your session.

set guioptions=aegimrLtT
silent! set guifont=
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 0 | filetype indent off | endif
if &background != 'light'
	set background=light
endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /home/pennpanda/github/xen
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1503 xen/common/page_alloc.c
" args xen/common/page_alloc.c
edit xen/common/page_alloc.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 89) / 179)
exe '2resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 148 + 89) / 179)
exe '3resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 49 + 89) / 179)
exe '4resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 4resize ' . ((&columns * 49 + 89) / 179)
exe '5resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 5resize ' . ((&columns * 48 + 89) / 179)
" argglobal
enew
" file __Tag_List__
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9999
setlocal fml=0
setlocal fdn=20
setlocal fen
wincmd w
" argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1497 - ((16 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1497
normal! 0
wincmd w
" argglobal
edit xen/common/page_alloc.c
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1503 - ((19 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1503
normal! 013l
wincmd w
" argglobal
edit xen/common/page_alloc.c
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1503 - ((15 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1503
normal! 013l
wincmd w
" argglobal
edit xen/common/page_alloc.c
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1497 - ((15 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1497
normal! 0
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 89) / 179)
exe '2resize ' . ((&lines * 26 + 28) / 56)
exe 'vert 2resize ' . ((&columns * 148 + 89) / 179)
exe '3resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 3resize ' . ((&columns * 49 + 89) / 179)
exe '4resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 4resize ' . ((&columns * 49 + 89) / 179)
exe '5resize ' . ((&lines * 27 + 28) / 56)
exe 'vert 5resize ' . ((&columns * 48 + 89) / 179)
tabnext 1
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

tabnext 1
1wincmd w
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
Tlist
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 54|vert 1resize 30|2resize 26|vert 2resize 148|3resize 27|vert 3resize 49|4resize 27|vert 4resize 49|5resize 27|vert 5resize 48|
tabnext 1
3wincmd w
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
