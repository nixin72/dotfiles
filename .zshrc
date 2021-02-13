# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/nixin72/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-autosuggestions /home/nixin72/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

plugins=(
	git
	dnf
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh

function lg () {
	exa -lha --git
}

alias wifioff=nmcli radio wifi off
alias wifion=nmcli radio wifi on

alias demacs=emacs --daemon
alias temacs=emacsclient -t
alias wemacs=emacsclient -c -F '((width . 1000) (height . 500) (font . "Fira Code-12"))'

function work { cd /s/work/$1 }
function repos { cd /s/repos/$1 }

alias vim=nvim

alias gra=git rebase --abort
alias grc=git rebase --continue
alias gtfo=git fetch origin
alias gca=git commit --amend
alias gc=git commit
alias gaa=git add .
alias gp=git push
alias gpf=git push -f
alias gpl=git pull
alias gplr=git pull --rebase
alias gl=git log --oneline
alias grh=git reset --hard

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

export NODE_PATH=$HOME/.npm-packages/lib/node_modules
export ANDROID_HOME=$HOME/Android/Sdk
export GRAALVM_HOME=/opt/graalvm
export JAVA_HOME=$GRAALVM_HOME
export LLVM_TOOLCHAIN=$($GRAALVM_HOME/bin/lli --print-toolchain-path)

export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$JAVA_HOME/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"

if [ -e /home/nixin72/.nix-profile/etc/profile.d/nix.sh ]; then . /home/nixin72/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
