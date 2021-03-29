#!/bin/bash

ASPELL_DIR=/usr/lib/aspell-0.60
ENGLISH_DICT="$ASPELL_DIR/en_CA.multi"
MY_DICT_NAME="my-dict"
MY_DICT_SRC="/s/repos/dotfiles/$MY_DICT_NAME.txt"
MY_DICT_DEST="$ASPELL_DIR/$MY_DICT_NAME.rws"

if [ "$EUID" -ne 0 ]; then
    echo "You must execute this script as root."
    exit -1;
fi

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else
    if ! grep -q "$MY_DICT_NAME.rws" "$ENGLISH_DICT" ; then
        echo "add $MY_DICT_NAME.rws" >> "$ENGLISH_DICT"
        echo "Adding $MY_DICT_DEST to $ENGLISH_DICT"
    fi

    echo "$1" >> "$MY_DICT_SRC"
    echo "Adding '$1' to English dictionary $MY_DICT_SRC"

    sudo aspell --lang=en create master "$MY_DICT_DEST" < "$MY_DICT_SRC"
fi


