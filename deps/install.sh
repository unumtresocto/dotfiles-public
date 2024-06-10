#!/bin/zsh

if [[ $OSTYPE == "darwin"* ]]; then
  # neovim deps
  brew install ninja cmake gettext curl
  # ovim deps
  brew install stow
else
  # linking tool
  sudo apt install stow
  # tmux deps
  sudo apt install libevent-dev ncurses-dev build-essential bison pkg-config autotools-dev automake
  # neovim deps
  sudo apt install ninja-build gettext cmake unzip curl
fi
