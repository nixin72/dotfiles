#!/bin/bash
################################################################################
####################               INSTALLATION             ####################
################################################################################

# sudo pacman -Sy firefox --noconfirm
sudo pacman -Sy fish --noconfirm
sudo pacman -Sy python-pywal --noconfirm
sudo pacman -Sy python-pip --noconfirm
sudo pacman -Sy libc++ --noconfirm
sudo pacman -Sy terminology --noconfirm
sudo pacman -Sy neofetch --noconfirm
# sudo pacman -Sy nodejs npm --noconfirm
# sudo pacman -Sy sbcl --noconfirm
# sudo pacman -Sy ruby --noconfirm
sudo pacman -Sy powerline powerline-fonts --noconfirm
sudo pacman -Sy polybar --noconfirm

# Install discordi
# tar -xvf ~/configs/linux/installers/discord.tar.gz
# cd ~/configs/linux/installers/discord
# makepkg -sri --noconfirm
# cd ~ 

# Install SpaceVim
chmod +x ~/configs/linux/installers/spacevim.sh
~/configs/linux/installers/spacevim.sh

# Install omf and themes - install script already in the git repo
chmod +x ~/configs/linux/installers/oh-my.fish
fish -c "~/configs/linux/installers/oh-my.fish --noninteractive -y"
fish -c "omf install spacefish"
fish -c "omf install agnoster";

# Install zsh themes and packages
# git clone https://github.com/eendroroy/alien.git
# cd alien 
# git submodule update --init --recursive 
# sudo pacman -Sy zsh-autosuggestions



################################################################################
####################                 REMOVAL                ####################
################################################################################
sudo pacman -Rcns subversion --noconfirm
sudo pacman -Rcns gimp --noconfirm
sudo pacman -Rcns palemoon --noconfirm
sudo pacman -Rcns zsh --noconfirm
sudo pacman -Rcns vlc --noconfirm

################################################################################
####################              CONFIGURATION             ####################
################################################################################

# Copy my background over to the right place and set it and my colour scheme
sudo cp -r ~/configs/linux/backgrounds/* /usr/share/backgrounds/
sudo wal -i /usr/share/backgrounds/onwall.png
sudo nitrogen --set-scaled ~/configs/linux/backgrounds/onwall.png

# Replace default i3 config with my own
sudo cp ~/configs/linux/sources/i3.conf ~/.i3/config

# Copy Fish config file 
sudo cp ~/configs/linux/sources/omf.fish ~/.config/fish/conf.d/omf.fish

# Clean up some of the default directories
sudo rm -rf ~/Documents/ ~/Music/ ~/Pictures/ ~/Public/ ~/Templates/ ~/Videos/

# Change resolution
sudo xrandr -s 1680x1050

# Set my git configuration
git config --global user.email = "phdumaresq@gmail.com"
git config --global user.name = "Philip"

# Make sure FiraCode is set as a font
sudo cp ~/configs/linux/sources/FiraCode-Retina.otf ~/.local/share/fonts/FiraCode-Retina.otf
sudo cp ~/configs/linux/sources/FiraCode-Retina.otf /usr/share/terminology/fonts/FiraCode-Retina.otf
sudo cp ~/configs/linux/sources/FiraCode-Retina.otf /usr/share/terminology/fonts/FiraCode-Retina.otf

# Change default shell to fish
sudo chsh -s /usr/bin/fish

# Reinitialize conky and compton
pkill conky
pkill compton 
conky --config /usr/share/conky/conky_grey
compton --config ~/.config/compton.conf & 

################################################################################
####################                SUMMARY                 ####################
################################################################################

echo ""
echo "################################################################################"
echo "####################                SUMMARY                 ####################"
echo "################################################################################"
echo "INFO: Mod key has been changed to alt"
echo "INFO: Manjaro help has been changed to mod+F1"
echo "INFO: i3 direction keys have been changed to vim bindings"
echo "INFO: Setting panels to tabbed has been changed to mod+t"
echo "INFO: Floating a window has been set to mod+Shift+f"
echo "INFO: i3 tiling has changed from h/v to x/y axis"
echo "INFO: Completely changed keybindings for resizing panels. Consult i3 config"
echo "INFO: Default shell changed to fish"
echo "INFO: Default i3 terminal changed to terminology"
echo "INFO: Screen resolution has been to optimal size"
echo ""
echo "NOTE: MAKE SURE TO CHANGE DATE AND TIME SETTINGS"
echo "    $ sudo date +%Y-%m-%d -s \"YYYY-mm-dd\""
echo "    $ sudo date +%T -s \"hr:min:sec\""

