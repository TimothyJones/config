#!/bin/bash
# Robust bash
# Timothy Jones, 2018
# Similar to https://gist.github.com/TimothyJones/74be211b740227e737b54ff3a1c0ec9b

if [ -z "${TIMLIB_BASH_SH:-}" ]; then
  TIMLIB_BASH_SH=yes

  function set_TIMBASH_DIR {
    SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
      DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
      SOURCE="$(readlink "$SOURCE")"
      [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    TIMBASH_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  }

  set_TIMBASH_DIR
  . "$TIMBASH_DIR"/lib-logging.sh

  # Check to see that we have a required binary on the path
  function require_binary {
    if [ -z "${1:-}" ]; then 
      error "${FUNCNAME[0]} requires an argument"
      exit 1
    fi

    if ! [ -x "$(command -v "$1")" ]; then
      error "$1 is not on the path."
      exit 1
    fi
  }

  # Check to see that a required environment variable is set.
  # Use it without the $, as in:
  #   require_env_var VARIABLE_NAME
  # or 
  #   require_env_var VARIABLE_NAME "Some description of the variable printed when it is missing"
  function require_env_var {
    var_name="${1:-}"
    if [ -z "${!var_name:-}" ]; then
      error "The required environment variable ${var_name} is empty"
      if [ ! -z "${2:-}" ]; then
        echo "  - $2"
      fi
      exit 1
    fi
  }

fi
