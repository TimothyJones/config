# This file contains everything related to interactive bash usage,
# for example editor, aliases etc. It's loaded when opening a new
# bash shell

# Coloured ls
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GF'

# Default editor is vim
export EDITOR=vim

# Set up a pretty coloured prompt:
# login@machine working/directory$
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
