#!/bin/zsh

# link lazyvim config
rm -rf $HOME/.config/nvim
ln -s $PWD/lazyvim $HOME/.config/nvim

cd $REPOS_HOME

# remove existing installation
rm -rf neovim

# clone neovim repo
git clone https://github.com/neovim/neovim.git

# checkout nightly
cd neovim
git checkout nightly

# build neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
