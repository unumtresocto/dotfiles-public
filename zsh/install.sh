#!/bin/zsh

# install oh-my-zsh
rm -rf $HOME/.oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash

rm $HOME/.zshrc
ln -s $PWD/.zshrc $HOME/.zshrc
rm $HOME/.zshenv
ln -s $PWD/.zshenv $HOME/.zshenv

# link custom oh-my-zsh configs
rm -rf $HOME/.oh-my-zsh/custom
ln -s $PWD/custom $HOME/.oh-my-zsh/custom
