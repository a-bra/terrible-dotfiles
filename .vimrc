set nocompatible
set number
set relativenumber
syntax on
execute pathogen#infect()
filetype indent plugin on
set noet ci pi sts=0 sw=2 ts=2
set autoindent
let g:airline_powerline_fonts=1
let g:airline_theme='jellybeans'
set laststatus=2
set updatetime=400
set wildmenu
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual
"let g:slimv_impl='mit'
"let g:slimv_lisp='/usr/bin/scheme'
"let g:scheme_builtin_swank='true'
"let g:slimv_swank_cmd="! screen -X eval 'title swank' 'screen scheme --eval \"(let loop () (start-swank) (loop))\"' 'select swank' &"
