#!/bin/bash

rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.vim ~/.vim
ln -s $PWD/.vimrc ~/.vimrc

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh .vim/dein
