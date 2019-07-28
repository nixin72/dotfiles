#!/bin/bash

# starship ~/.cargo/bin/

################################################################################
#############################      FUNCTIONS     ###############################
################################################################################
function resource () {
    cp -r $ELVES/.bashrc ~/.bashrc
    source ~/.bashrc
}

function project-get-type () {
    if test -f package.json; then
        return "node"
    elif test -f cargo.toml; then
        return "rust"
    else
        return false
    fi
}

function lint-project () {
    $type=project-get-type
    if [ $type == "node" ]; then
        "${get-linter}"
    fi
}

############################################################ FILES
function backup-file () {
    cp $1 $1".bak";
}

function list-tree () {
    tree -a -I $IGNORE_PATHS
}

function make-and-change-dir () {
    mkdir $1;
    cd $1;
}

function change-and-list-dir () {
    cd $1;
    ls -la;
}

function rm-except () {
    find . ! -name $1 -type f -exec rm -rf {} +;
}

function swap-file-names () {
    mv $1 $1".tmp"
    mv $2 $1
    mv $1".tmp" $2
}

############################################################ GIT
source ./functions/git.bash

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
alias bak="backup-file"
alias lr="list-recursive"
alias mcd="make-and-change-dir"
alias cl="change-and-list-dir"
