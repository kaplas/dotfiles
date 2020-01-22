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

# Helpers for combining the above
brew_install()
{
	next "Install $@"
	brew install $1
	brew upgrade $1
}

########################
  comment "Installing all necessary tools in kaplas's toolbox"
########################

########################
  next "Install some development tools..."
########################

brew_install tmux "for window management"
brew_install asdf "for managing versions of different programming environments"

########################
  next "Configure tmux"
########################
# Instructions adapted from https://github.com/gpakosz/.tmux
rm -rf ~/.tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f .tmux/.tmux.conf ~/.tmux.conf
ln -s -f "$DOTFILES/configs/.tmux.conf.local" ~/.tmux.conf.local
ls -l ~/.tmux.conf*

########################
  next "Install development languages..."
########################

brew_install elm

########################
  #next "Install erlang and elixir using asdf"
########################
#asdf plugin-add erlang
#asdf plugin-add elixir
#asdf install erlang 22.2
#asdf install elixir 1.9

########################
  next "Install work environment related tools..."
########################

brew_install defaultbrowser "for setting default browser for work days"
