#!/bin/bash

################################################################################
#############################      Aliases      ################################
################################################################################
alias pip="pip3"
alias py="python3"
alias e="emacs"
alias el="emacs"
alias edit="emacs"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gl="git pull"
alias glm="git pull origin master"
alias gb="git checkout"
alias gbm="git checkout master"
alias gbn="git checkout -b"

################################################################################
#############################      FUNCTIONS     ###############################
################################################################################
function bak () { cp $1 $1".bak"; }          # Copy a file into a backup
function lr () { tree -a -I $IGNORE_PATHS }  # Show tree ignoring some dirs
function mcd () { mkdir $1; cd $1 }          # Make dir and cd into it
function cl () { cd $1; ls -la }             # Change dir and list contents
function gacp () { ga $1; gcm $2 }           # Add a file and commit it to git

# Swap the name of two files
function swap () {
    mv $1 $1".tmp"
    mv $2 $1
    mv $1".tmp" $2
}

# Resource ~/.bashrc
function rs () {
    cp -r $ELVES/.bashrc ~/.bashrc
    source ~/.bashrc
}
