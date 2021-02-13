#!/bin/bash

if [ ! -d ~/dotfiles ]; then
    git clone git@github.com:nixin72/dotfiles.git ~
fi

#############################################################
########### SETUP ENVIRONMENT ###############################
#############################################################
sudo mkdir -p ~/configs/log/
mkdir ~/dotfiles.nvim
sudo pacman -S base-devel yay

################################################################################
####################            INSTALL PACKAGES            ####################
################################################################################
 
# Setup GraalVM, which includes my JDK and JRE
# Not using the GraalVM package from AUR cause that wasn't working for me for
# some reason.
cd /opt
curl https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.0.0.2/graalvm-ce-java8-linux-amd64-21.0.0.2.tar.gz
tar -xzf graalvm-ce-java8-linux-amd64-21.0.0.2.tar.gz 

# Install Doom Emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

packages=(
  # Editors 
  emacs
  neovim-nightly-bin
  code
  # Languages and build tools
  make cmake
  racket sbcl leiningen
  nvm python
  mysql
  cargo
  # Utilities
  zsh starship
  fzf tree
  perf hyperfine
  htop neofetch
  wakatime
  flameshot
  babashka-bin
  dmenu
  gzip
  # Fonts
  ttf-fira-code
  ttf-dejavu
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  # Programs
  okular
  libreoffice
  firefox
  discord
  spotify
  gimp
  # Games
  minecraft
  steam
  dolphin-emu
)

android_shit=(
    android-emulator
    android-platform
    android-sdk
    android-sdk-build-tools
    android-sdk-platfrom-tools
    android-studio
    android-udev
    gradle
)

i3_only=(
    i3-gaps
    picom
    nitrogen
    polybar
)

pacman -S --needed - < $packages
pacman -S --needed - < $android_shit
pacman -S --needed - < $i3_only

#############################################################
########### SYMLINK SOME SHIT ###############################
#############################################################
ln -s ~/dotfiles/.zshrc ~/
ln -s ~/dotfiles/.doom.d ~/
ln -s ~/dotfiles/.vimrc ~/
ln -s ~/dotfiles/.gitconfig ~/
ln -s ~/dotfiles/.gitignore_global ~/
ln -s ~/dotfiles/.racketrc ~/
ln -s ~/dotfiles/.sbclrc ~/
ln -s ~/dotfiles/.vimrc ~/dotfiles/nvim/init.vim
ln -s ~/dotfiles/.config/nvim ~/.config
ln -s ~/dotfiles/.config/alacritty ~/.config
ln -s ~/dotfiles/.config/i3 ~/.config
ln -s ~/dotfiles/compton.conf ~/.config
ln -s ~/dotfiles/polybar ~/.config
ln -s ~/dotfiles/compton.conf ~/.config
ln -s ~/dotfiles/vscode.json ~/.config/Code - OSS/User/settings.json

############################################################
########### FINAL SETUP ####################################
############################################################

nvm install node
sudo chsh -s /usr/bin/zsh
source ~/.zshrc

