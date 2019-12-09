#!/bin/sh

# Directory where this script resides
# Copied from https://stackoverflow.com/a/246128
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Stop on errors
set -e

# Functions for showing comments
SEPARATOR="---------------------------------------------------"
comment()
{
  echo $SEPARATOR
  echo $@
  echo $SEPARATOR
}
next()
{
  echo
  comment $@
}

########################
  comment "Installing all necessary tools in kaplas's toolbox"
########################

########################
  next "Install tmux"
########################
brew install tmux
brew upgrade tmux

########################
  next "Configure tmux"
########################
# Instructions adapted from https://github.com/gpakosz/.tmux
rm -rf ~/.tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f .tmux/.tmux.conf ~/.tmux.conf
ln -s -f "$DOTFILES/configs/.tmux.conf.local" ~/.tmux.conf.local
ls -l ~/.tmux.conf*
