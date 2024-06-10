#!/bin/zsh

export DOTFILES=$PWD

COMPONENTS_STR="deps zsh neovim tmux completions fnm bin"

update_core_variables() {
  echo "export DOTFILES=${PWD}\n" | cat - "${DOTFILES}/zsh/custom/_core.zsh.tmpl" >"${DOTFILES}/zsh/custom/_core.zsh"
}

install() {
  cd $DOTFILES/$1
  ./install.sh
  cd -
}

select_and_install() {
  output_file="./temp"

  ./assets/menu.sh $COMPONENTS_STR $output_file

  selected_cmps=$(cat $output_file)
  rm $output_file

  for cmp in ${(s/ /)selected_cmps}; do
    install "${cmp}"
  done
}

update_core_variables
select_and_install
