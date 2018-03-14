# This file contains everything related to interactive bash usage,
# for example editor, aliases etc. It's loaded when opening a new
# bash shell

# Coloured ls
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GF'

# Coloured cat
if ccat_loc="$(type -p "ccat")" || [ -z "$ccat_loc" ]; then
  alias cat='ccat --bg=dark'
fi

# Default editor is vim
export EDITOR=vim


if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  export GIT_PROMPT_THEME=Custom
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
else 
  # Set up a pretty coloured prompt:
  # login@machine working/directory$
  export PS1="\[\033[38;5;033m\]\u\[\033[m\]@\[\033[38;5;075m\]\h:\[\033[38;5;021m\]\w\[\033[m\]\$ "
fi

