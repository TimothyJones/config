#!/bin/bash
# Simple bash logging functions
# Timothy Jones, 2017
# https://github.com/TimothyJones/timbash
if [ -z "${TIMLIB_LOGGING_SH:-}" ]; then
  TIMLIB_LOGGING_SH=yes

  # Colours
  blue='\033[1;34m'
  red='\033[0;31m'
  green='\033[0;32m'
  yellow='\033[93m'
  end_colour='\033[0m'

  TB_SCRIPTNAME=$(basename "$0")

  log() {
    echo -e "${blue}   log${end_colour}     ($TB_SCRIPTNAME): $* ${end_colour}"
  }

  error() {
    echo -e "${red}✘  error${end_colour}   ($TB_SCRIPTNAME): $* ${end_colour}"
  }

  warn() {
    echo -e "${yellow}🔔 warn ${end_colour}   ($TB_SCRIPTNAME): $* ${end_colour}"
  }

  success() {
    echo -e "${green}✔  success${end_colour} ($TB_SCRIPTNAME): $* ${end_colour}"
  }

  success_banner() {
      echo -e "${green}$(banner_border "$*")${end_colour}"
      echo -e "${green}$(banner_mid    "$*")${end_colour}"
      echo -e "${green}$(banner_border "$*")${end_colour}"
  }

  fail_banner() {
      echo -e "${red}$(banner_border "$*")${end_colour}"
      echo -e "${red}$(banner_mid    "$*")${end_colour}"
      echo -e "${red}$(banner_border "$*")${end_colour}"
  }

  banner_border() {
      banner_mid "$*" | sed 's/./*/g'
  }

  # banner based on https://unix.stackexchange.com/a/250094
  banner_mid() {
      echo "* $* *"
  }

  banner() {
      banner_border "$*"
      banner_mid "$*"
      banner_border "$*"
  }
fi
