################################################################################
########## aliases #############################################################
################################################################################
alias wifioff="nmcli radio wifi off"
alias wifion="nmcli radio wifi on"

alias vim=nvim
alias yay=paru
alias ls="exa"
alias ll="ls -lah"
alias la="ls -la"
alias bb="rlwrap bb"

alias cbl="cd $ME/work/Character-Based-Leadership"
alias nisdd="cd $ME/Documents/work/nisd-dashboard"
alias nisda="cd $ME/Documents/work/NISD-Alert-App"

alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gtfo="git fetch origin"
alias gca="git commit --amend"
alias gc="git commit"
alias gaa="git add ."
alias gp="git push"
alias gpf="git push -f"
alias gpl="git pull"
alias gplr="git pull --rebase"
alias gl="git log --oneline"
alias grh="git reset --hard"

alias reload="source ~/.zshrc"

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

################################################################################
########## zsh options #########################################################
################################################################################
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt autocd

################################################################################
########## useful functions ####################################################
################################################################################
cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

ssh-create() {
    if [ ! -z "$1" ]; then
        ssh-keygen -f $HOME/.ssh/$1 -t rsa -N '' -C "$1"
        chmod 700 $HOME/.ssh/$1*
    fi
}

repos() {
  cd "$ME/repos/$1"
}

cursor_mode

################################################################################
########## prompt ##############################################################
################################################################################
eval "$(starship init zsh)"

################################################################################
########## plugins and other useful stuff to make available ####################
################################################################################
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/nvm/init-nvm.sh
export NODE_PATH="$HOME/.nvm/versions/node/$(nvm version)/lib/node_modules"
source "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
