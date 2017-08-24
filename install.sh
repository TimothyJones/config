#!/bin/bash -eu
SCRIPT_DIR=`cd $(dirname "$0"); pwd` # Script can now run from anywhere
. "$SCRIPT_DIR"/timbash/lib/lib-logging.sh       # Set up logging

log "Creating ~/.timconfig local settings"
cat > ~/.timconfig <<- EOM
# This file contains local config settings for the timconfig repo
export TIMCONFIG_HOME=$SCRIPT_DIR
EOM

function inst {
  if [ -f ~/."$1" ] ; then
    DIFF=$(diff ~/."$1" "$SCRIPT_DIR"/master-config/."$1")
    if [ "$DIFF" != "" ] ;
    then
      error "Skipping $1, because there's a different local version"
    else
      warn "Already installed or otherwise identical: '$1'"
    fi 
  else 
    log "Installing $1"
    ln -s "$SCRIPT_DIR"/master-config/."$1" ~/."$1"
  fi
}

inst vimrc
inst bashrc
inst profile
inst bash_profile
inst gitignore_global

log "Configuring git to always use ssh and use gitignore_global" 
git config --global url."git@github.com:".insteadOf "https://github.com/" # This allows private repos in Go, among other things
git config --global core.excludesfile ~/.gitignore_global
