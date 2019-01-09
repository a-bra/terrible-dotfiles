"Various generic vim settings
set nocompatible
set number
set relativenumber
set noet ci pi sts=0 sw=2 ts=2
set autoindent
set incsearch
colorscheme tokyo-metro

"Install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Duh, plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
" Plug 'https://github.com/gregsexton/gitv.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
call plug#end()

"Airline settings
let g:airline_powerline_fonts=1
let g:airline_theme='jellybeans'
set laststatus=2
set updatetime=250

"GitGutter remaps
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

"Full text search remap
nnoremap <silent> <Leader>ag :Ag 
xnoremap <silent> <Leader>ag y:Ag <C-R>"<CR>

"SLIMV configs
"let g:slimv_impl='mit'
"let g:slimv_lisp='/usr/bin/scheme'
"let g:scheme_builtin_swank='true'
"let g:slimv_swank_cmd="! screen -X eval 'title swank' 'screen scheme --eval \"(let loop () (start-swank) (loop))\"' 'select swank' &"
"
"ALE configs
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
au BufRead,BufNewFile *.template.yaml set ft=cloudformation.yaml
