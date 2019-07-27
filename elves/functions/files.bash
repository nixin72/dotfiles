#!/bin/bash

################################################## CREATE
function file-create-new () {
    for file in "$@"
    do
        "" > $file
    done
}

function file-create-backup () {
    for file in "$@"
    do
        cp $file $file".bak"
    done
}

################################################## RENAME
function file-rename-swap ()  {
    mv $1 $1".tmp"
    mv $2 $1
    mv $1".tmp" $2
}

function file-rename-backup () {
    for file in "$@"
    do
        mv $file $file".bak"
    done
}

################################################## REMOVE
function file-remove-except () {
    find . ! -name $1 -type f -exec rm -rf {} +
}

#####################

function file-list-tree () {
    tree -a -I $IGNORE_PATHS
}

function file-dir-create-change () {
    mkdir $1;
    cd $1;
}
