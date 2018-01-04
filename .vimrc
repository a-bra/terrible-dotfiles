set nocompatible
set number
set relativenumber
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
" Plug 'https://github.com/gregsexton/gitv.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" filetype indent plugin on
set noet ci pi sts=0 sw=2 ts=2
set autoindent
let g:airline_powerline_fonts=1
let g:airline_theme='jellybeans'
set laststatus=2
set updatetime=400
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
