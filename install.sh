#!/bin/bash
###############################################################################
####################               INSTALLATION             ####################
################################################################################
if [[ $* == -*i* ]]; then 
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
  sudo pacman -Sy yay --noconfirm
  sudo pacman -Sy xorg-xfd --noconfirm
  sudo pacman -Sy unzip --noconfirm

  # Install discordi
  # tar -xvf ~/configs/installers/discord.tar.gz
  # cd ~/configs/installers/discord
  # makepkg -sri --noconfirm
  # cd ~ 

  # Install SpaceVim
  chmod +x ~/configs/installers/spacevim.sh
  ~/configs/installers/spacevim.sh

  # Install omf and themes - install script already in the git repo
  chmod +x ~/configs/installers/oh-my.fish
  fish -c "~/configs/installers/oh-my.fish --noninteractive -y"
  fish -c "omf install spacefish"
  fish -c "omf install agnoster";

  # Install zsh themes and packages
  # git clone https://github.com/eendroroy/alien.git
  # cd alien 
  # git submodule update --init --recursive 
  # sudo pacman -Sy zsh-autosuggestions

fi 

################################################################################
####################                 REMOVAL                ####################
################################################################################

if [[ $* == -*d* ]]; then
  sudo pacman -Rcns subversion --noconfirm
  sudo pacman -Rcns gimp --noconfirm
  sudo pacman -Rcns palemoon --noconfirm
  sudo pacman -Rcns zsh --noconfirm
  sudo pacman -Rcns vlc --noconfirm
fi 

################################################################################
####################              CONFIGURATION             ####################
################################################################################

if [[ $* == -*r* ]]; then
  # Change resolution
  sudo xrandr -s 1680x1050

  # Copy my background over to the right place and set it and my colour scheme
  sudo cp -r ~/configs/assets/images/* /usr/share/backgrounds/
  sudo wal -i /usr/share/backgrounds/onwall.png
  sudo nitrogen --set-scaled /usr/share/backgrounds/onwall.png

  # Replace default configs 
  sudo cp ~/configs/sources/i3.conf ~/.i3/config 
  sudo cp ~/configs/sources/omf.fish ~/.config/fish/conf.d/omf.fish
  sudo cp ~/configs/sources/polybar.conf ~/.config/polybar/config
  sudo cp ~/configs/sources/compton.conf ~/.config/compton.conf

  # Clean up some of the default directories
  sudo rm -rf ~/Documents/ ~/Music/ ~/Pictures/ ~/Public/ ~/Templates/ ~/Videos/

  # Set my git configuration
  git config --global user.email = "phdumaresq@gmail.com"
  git config --global user.name = "Philip"

  # Make sure FiraCode is set as a font
  sudo cp ~/configs/assets/fonts/* ~/.local/share/fonts/
  sudo cp ~/configs/assets/fonts/* /usr/share/terminology/fonts/ 
  sudo cp ~/configs/assets/fonts/* /usr/share/terminology/fonts/

  # Change default shell to fish
  sudo chsh -s /usr/bin/fish

  # Reinitialize conky and compton
  pkill conky
  pkill compton 
  conky --config /usr/share/conky/conky_grey & 
  compton --config ~/.config/compton.conf & 
  
  # Reinitialize polybar 
  killall -q polybar 
  while pgrep -x polybar >/dev/null; do sleep 1; done
  polybar top & 
fi

if [[ $* == -*p* ]] && [[ $* != -*r* ]]; then
  sudo cp ~/configs/sources/polybar.conf ~/.config/polybar/config
  
  killall -q polybar 
  while pgrep -x polybar >/dev/null; do sleep 1; done
  polybar top & 
fi 

################################################################################
####################                SUMMARY                 ####################
################################################################################

if [[ $* == -*r* ]]; then
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
