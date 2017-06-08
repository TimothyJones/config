#!/bin/bash

echo "[ ] Installing .vimrc"
ln -s `pwd`/.vimrc ~/.vimrc
echo "[ ] Installing .profile"
ln -s `pwd`/.profile ~/.profile

echo "[ ] Configuring git"
git config --global url."git@github.com:".insteadOf "https://github.com/"
