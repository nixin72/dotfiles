# Preferred software
export TERM='alacritty'
export EDITOR='nvim'
export VISUAL='nvim'
export BROWSER='/usr/bin/firefox'
export ME="$HOME/Documents"
export DOTFILES="$ME/repos/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export ZSH_PLUGINS="$HOME/.local/share/zsh"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Paths
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export SCRIPTS=/s/repos/dotfiles/scripts

export JAVA_HOME=/usr/lib/jvm/default
export GRAALVM_HOME=$JAVA_HOME
export LLVM_TOOLCHAIN="($GRAALVM_HOME/bin/lli --print-toolchain-path)"

export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:$HOME/.npm-packages/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$SCRIPTS
export PATH=$PATH:$HOME/.emacs.d/bin
export PATH=$PATH:$HOME/.nix-profile/bin

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# XDG preferences
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export NIXPKGS_ALLOW_UNFREE=1
