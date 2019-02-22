#!/bin/bash

################################################################################
####################            PRE INSTALL SETUP           ####################
################################################################################
mkdir -p ~/configs/assets/fonts
mkdir -p ~/configs/assets/images 
mkdir -p ~/configs/
mkdir -p ~/.config/polybar
mkdir -p ~/.fonts/
mkdir ~/

###############################################################################
####################               INSTALLATION             ####################
################################################################################
if [[ $* == -*c* ]] || [[ $* == -*a* ]]; then
  touch ~/configs/log/install.log

  sudo pacman -Sy firefox \ 
	  fish  \
	  libc++ \ 
	  python-pip yay \ 
	  powerline powerline-fonts \ 
	  python-pywal \
	  polybar \ 
	  fish terminology \ 
	  neofetch \
	  xorg-xfv unzip --noconfirm &>> ~/configs/log/install.log

  sudo pacman -Sy nodejs npm \ 
	sbcl \
	ruby --noconfirm &>> ~/configs/log/install.log
  
  # Install discordi
  # tar -xvf ~/configs/installers/discord.tar.gz
  # cd ~/discord
  # echo "This wil take a while - building Discord from source"
  # makepkg -sri --noconfirm
  # cd ~ 
  #
  # OR
  # sudo yay -S discord

  # Install omf and themes - install script already in the git repo
  chmod +x ~/configs/installers/oh-my.fish
  fish -c "~/configs/installers/oh-my.fish --noninteractive -y"
  fish -c "omf install spacefish"
  fish -c "omf install agnoster";
fi 

################################################################################
####################                RETRIEVE                ####################
################################################################################
# Retrieve all of the necessary files for configurations 

if [[ $* == -*r* ]] || [[ $* == -*a* ]]; then
  # Find and download all the images
  while read -r line ; do
    echo ${$line: }
  done < <(sed -n 's/    - //p' assets/images/links.txt)
fi

################################################################################
####################                 UPDATE                 ####################
################################################################################
# Update all of the default configurations with what I want 

if [[ $* == -*u* ]]; then
  # Change resolution
  sudo xrandr -s 1680x1050

  # Copy my background over to the right place and set it and my colour scheme
  sudo cp -r ~/configs/assets/images/* /usr/share/backgrounds/
  sudo wal -i /usr/share/backgrounds/onwall.png
  sudo nitrogen --set-scaled /usr/share/backgrounds/onwall.png

  # Replace default configs
  # sudo cp ~/configs/sources/i3.conf ~/.i3/config 
  sudo cp ~/configs/sources/omf.fish ~/.config/fish/conf.d/omf.fish
  sudo cp ~/configs/sources/polybar.conf ~/.config/polybar/config
  sudo cp ~/configs/sources/compton.conf ~/.config/compton.config

  # Set my git configuration
  git config --global --add user.email "phdumaresq@gmail.com"
  git config --global --add user.name "phdumaresq"

  # Make sure FiraCode is set as a font
  sudo cp ~/configs/assets/fonts/* ~/.fonts
  sudo cp ~/configs/assets/fonts/* /usr/share/fonts
  sudo cp ~/configs/assets/fonts/* ~/.local/share/fonts/
  sudo cp ~/configs/assets/fonts/* /usr/share/terminology/fonts/ 
  sudo cp ~/configs/assets/fonts/* /usr/share/terminology/fonts/

  # Change default shell to fish
  sudo chsh -s /usr/bin/fish

  # Reinitialize conky and compton
  pkill conky
  pkill compton 
  nohup conky --config /usr/share/conky/conky_grey &
  nohup compton --config ~/.config/compton.conf &
  
  # Reinitialize polybar
  killall -q polybar 
  while pgrep -x polybar >/dev/null; do sleep 1; done
  polybar top & 
fi

################################################################################
####################                DELETION                ####################
################################################################################
# Clean up everything at the end 

if [[ $* == -*d* ]] || [[ $* == -*a* ]]; then
  sudo pacman -Rcns subversion --noconfirm
  sudo pacman -Rcns gimp --noconfirm
  sudo pacman -Rcns palemoon palemoon-bin --noconfirm
  sudo pacman -Rcns zsh --noconfirm
  sudo pacman -Rcns vlc --noconfirm

  # Remove default existing Directories
  sudo rm -rf ~/Desktop  ~/Documents ~/Downloads ~/Music
  sudo rm -rf ~/Pictures ~/Public    ~/Templates ~/Videos
fi 

################################################################################
####################              FINAL PROMPTS             ####################
################################################################################


################################################################################
####################                SUMMARY                 ####################
################################################################################
if [[ $* == -*u* ]]; then
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
  echo "INFO: i3 bar replaced by polybar"
  echo ""
  echo "NOTE: MAKE SURE TO CHANGE DATE AND TIME SETTINGS"
  echo "    $ sudo date +%Y-%m-%d -s \"YYYY-mm-dd\""
  echo "    $ sudo date +%T -s \"hr:min:sec\""
fi




