#!/bin/bash

function inst {
  if [ -f ~/.$1 ] ; then
    DIFF=$(diff ~/.$1 .$1)
    if [ "$DIFF" != "" ] ;
    then
      echo "[x] Skipping $1, because there's a different local version"
    fi
  else 
    echo "[ ] Installing $1"
    ln -s `pwd`/.$1 ~/.$1
  fi
}  

inst vimrc
inst profile
inst gitignore_global

echo "[ ] Configuring git to always use ssh and use gitignore_global"
git config --global url."git@github.com:".insteadOf "https://github.com/"
git config --global core.excludesfile ~/.gitignore_global
