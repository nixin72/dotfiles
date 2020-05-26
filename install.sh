#!/bin/bash

if [ ! -d ~/dotfiles ]; then
    git clone git@github.com:nixin72/dotfiles.git ~
fi

###############################################################################
####################           SETUP ENVIRONMENT           ####################
###############################################################################
sudo mkdir -p ~/.fonts
sudo mkdir -p /usr/share/fonts
sudo mkdir -p ~/.local/share/fonts/
sudo mkdir -p /usr/share/terminology/fonts/
sudo mkdir -p /usr/share/terminology/fonts/
sudo mkdir -p ~/configs/log/
sudo mkdir -p ~/.config/polybar/
sudo mkdir -p ~/.i3
sudo mkdir -p ~/clones

################################################################################
####################            INSTALL PACKAGES            ####################
################################################################################

ansible install.yaml

# Install omf and starship theme
curl -L https://get.oh-my.fish | fish
curl -fsSL https://starship.rs/install.sh | bash

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install icons in terminal
git clone https://github.com/sebastiencs/icons-in-terminal.git ~/clones
sudo chmod +x ~/clones/icons-in-terminal/install.sh 
~/clones/icons-in-terminal/install.sh 

################################################################################
####################           SET CONFIGURATIONS           ####################
################################################################################

sudo xrandr -s 1680x1050

# Copy my background over to the right place and set it and my colour scheme
sudo cp -r ~/configs/assets/images/* /usr/share/backgrounds/
sudo wal -i /usr/share/backgrounds/iconic.jpg
sudo nitrogen --set-scaled /usr/share/backgrounds/iconic.jpg

# Replace default configs
sudo cp ~/configs/sources/i3.conf.bak ~/.i3/config
sudo cp ~/configs/sources/omf.fish ~/.config/fish/conf.d/omf.fish
sudo cp ~/configs/sources/polybar.conf ~/.config/polybar/config
sudo cp ~/configs/sources/compton.conf ~/.config/compton.conf
sudo cp ~/configs/sources/vimrc ~/.vimrc
sudo cp ~/configs/sources/Xresources ~/.Xresources

# Make sure FiraCode is set as a font
sudo cp ~/configs/assets/fonts/* ~/.fonts
sudo cp ~/configs/assets/fonts/* /usr/share/fonts
sudo cp ~/configs/assets/fonts/* ~/.local/share/fonts/
sudo cp ~/configs/assets/fonts/* /usr/share/terminology/fonts/
sudo cp ~/configs/assets/fonts/* /usr/share/terminology/fonts/

# Symlink files to here
sudo ln -s ~/.config/fish ./config/fish
sudo ln -s ~/.config/alacritty/ ./.config/alacritty/
sudo ln -s ~/.gitconfig ./.gitconfig 
sudo ln -s ~/.Xmodmap ./.Xmodmap 

################################################################################
####################              FINAL PROMPTS             ####################
################################################################################

git pull
sudo chsh -s /usr/bin/fish

