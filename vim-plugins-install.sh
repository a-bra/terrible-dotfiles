#!/bin/bash
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/airblade/vim-gitgutter.git
git clone git://github.com/vim-airline/vim-airline.git
git clone git://github.com/vim-airline/vim-airline-themes.git
git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q
# copy custom jellybean theme
cd -
cp jellybeans.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/jellybeans.vim
