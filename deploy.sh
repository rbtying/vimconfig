#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Removing old vim configuration"
rm -rf .vim .vimrc

echo "Creating symlinks"
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR ~/.vim

git submodule init
git submodule update
