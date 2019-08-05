#!/bin/bash
######
#
# Author: Philip Dumaresq
#
######

DOT=$PWD
ELF=$DOT/elves
DWARF=$DOT/dwarves
MEN=$DOT/men
EDIT=vim

DOTS=(
  [emacs]=$ELF/.emacs.d/init.el
  [bash]=$ELF/.bashrc
)

function init {
  echo "initializing"
}

function help {
  echo "help"
}

function get_dotfile {
  return ${DOTS}
}

function edit_dotfile {
  $EDIT get_dotfile $1
}

function pia {
    echo "Weather:"
    curl wttr.in/?0pq

    echo "Calendar:"


    echo "School:"
}

if [[ "$@" == "" ]]; then
  echo help
elif [[ $# -ne 1 ]]; then
  echo "Too many args"
else
  "$@"
fi

ln -s $DOT/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
