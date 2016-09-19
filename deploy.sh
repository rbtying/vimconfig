#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Removing old vim configuration"
rm -rf .vim .vimrc

echo "Downloading vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Creating vimrc symlink"
ln -s $DIR/vimrc ~/.vimrc

echo "installing plugins"
vim +PlugInstall +PlugClean! +q +q

echo "You might want to run the following command to install YCM correctly"
echo "cd ~/.vim/plugged/YouCompleteMe && ./install.sh --all"
