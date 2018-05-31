#!/bin/bash -eu
SCRIPT_DIR=`cd $(dirname "$0"); pwd` # Script can now run from anywhere
. "$SCRIPT_DIR"/timbash/lib/lib-logging.sh       # Set up logging

trap 'error "Installation failed"' 0

# local settings
function timconfig_contents {
  cat <<- EOM
  # This file contains local config settings for the timconfig repo
  export TIMCONFIG_HOME=$SCRIPT_DIR
EOM
}
TIMCONFIG_LOCATION=~/.timconfig

if [ -f $TIMCONFIG_LOCATION ] ; then
  if [ "`echo "$(timconfig_contents)" | diff - $TIMCONFIG_LOCATION | cat`" != "" ] ; then
    error "Local config '$TIMCONFIG_LOCATION' is different to autogenerated one"
    error "^ Generated home is '$SCRIPT_DIR'"
  fi
else
  log "Creating ~/.timconfig local settings"
  echo "$(timconfig_contents)" > ~/.timconfig 
fi

log "Installing..."

function inst {
  if [ -f ~/"$1" ] ; then
    DIFF=$(diff ~/"$1" "$SCRIPT_DIR"/master-config/"$1" | cat)
    if [ "$DIFF" != "" ] ; then
      warn "Skipping ~/$1,  because there's a different local version"
    else 
      log "Already installed: $1"
    fi
  else 
    log "Installing $1"
    ln -s "$SCRIPT_DIR"/master-config/"$1" ~/"$1"
  fi
}

# Todo: Extract these files to a separate list
for f in .vimrc .bashrc .profile .bash_profile .gitignore_global .git-prompt-colors.sh ; do
  inst $f
done

if [ "$(uname)" == "Darwin" ]; then
  log "OSX specific installation..."
  if ! brew_loc="$(type -p "brew")" || [ -z "$brew_loc" ]; then
    warn "Homebrew appears not to be installed, skipping installation of packages"
  else
    # Todo: Extract homebrew packages - maybe this whole thing should be a homebrew package?
    for f in ccat wget bash-git-prompt grep; do 
      log "Installing $f"
      brew install $f || brew upgrade $f
    done
    brew install --with-default-names grep || brew upgrade --with-default-names grep
  fi
fi

log "Ensuring ~/.local_env exists"
touch ~/.local_env

log "Configuring git to always use ssh, use gitignore_global, to allow git git git, and to rebase on pull" 
# Use ssh (which allows private repos in Go, among other things)
git config --global url."git@github.com:".insteadOf "https://github.com/" 
# Use a global gitignore for files that are unlikely to be committed
git config --global core.excludesfile ~/.gitignore_global           
# Do rebases on pulls to avoid unnecessary merge commits, and keep the tree clean
git config --global pull.rebase true      
# Autostash on rebase, (coupled with pull.rebase, this allows pulls with local changes)
git config --global rebase.autoStash true
# Allow git to understand the command `git`, so you can type 'git git git git stash'
git config --global alias.git '!exec git'
# Let git push branches that origin doesn't know about
git config --global push.default current

trap 'log "Install success"' 0
