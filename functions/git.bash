#!/bin/bash

function git-add () {
    git add $@
}

function git-commit () {
    if "${project-get-type}" == node; then
        echo node
    fi
}

function git-add-commit () {
    git-add $1;
    git-commit $2;
}

function git-pull () {
    git pull;
}

function git-push () {
    git push;
}

function git-add-commit-push () {
    git-add-commit $1 $2;
    git-push;
}

function git-pull-push () {
    git-pull;
    git-push;
}

function git-add-commit-pull-push () {
    git-add-commit $1 $2;
    git-pull-push;
}
