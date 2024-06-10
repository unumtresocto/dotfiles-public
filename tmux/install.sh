#!/bin/zsh

# link config
rm $HOME/.tmux.conf
rm -rf $HOME/.tmux
ln -s $PWD/.tmux.conf $HOME/.tmux.conf

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install tmux
else
  cd $REPOS_HOME
  # remove existing installation
  rm -rf tmux

  # clone neovim repo
  git clone https://github.com/tmux/tmux.git

  # checkout 3.4
  cd tmux
  git checkout tags/3.4

  # generate config
  sh autogen.sh
  ./configure

  # build tmux
  make && sudo make install

  # install tpm
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
