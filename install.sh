#!/bin/bash

if [[ $* == "" ]]; then
  echo "usage: "
  echo "-i   Install packages"
  echo "-c   Set configurations"
  echo "-d   Cleanup at the end"
  echo -"A   Do everything"
fi

################################################################################
####################            INSTALL PACKAGES            ####################
################################################################################

stdPackages=0
aurPackages=0
if [[ $* == -*i* ]] || [[ $* == -*A* ]]; then
  touch ~/configs/log/install.log
  echo "" > ~/configs/log/install.log

  pacman=(
    fish 
    python-pywal 
    powerline
    powerline-fonts 
    polybar 
    neofetch 
    unzip 
    yay 
    terminology
    xorg-xft
  )
  pacman+=(
    #firefox
    #python-pip
    #rust
    #ruby
    #sbcl
    #nodejs npm
  )

  for p in "${pacman[@]}"; do
    echo "Installing" $p"..."
    sudo pacman -Sy $p --noconfirm >> ~/configs/log/install.log

    let "stdPackages++"
  done

  yay=(
    discord
  )

  for p in "${yay[@]}"; do
    echo "Installing" $p"..."
    #sudo yay -Sy" $p "--noconfirm >> ~/confirm/log/install.log

    let "aurPackages++"
  done

  # Install omf and themes - install script already in the git repo
  chmod +x ~/configs/installers/oh-my.fish >> ~/configs/log/install.log
  fish -c "~/configs/installers/oh-my.fish --noninteractive -y" >> ~/configs/log/install.log
  fish -c "omf install spacefish agnoster" >> ~/configs/log/install.log


  grep -P "Total Installed Size:" ~/configs/log/install.log
fi 

################################################################################
####################           SET CONFIGURATIONS           ####################
################################################################################

if [[ $* == -*c* ]] || [[ $* == -*A* ]]; then
  sudo xrandr -s 1680x1050

  # Copy my background over to the right place and set it and my colour scheme
  sudo cp -r ~/configs/assets/images/* /usr/share/backgrounds/
  sudo wal -i /usr/share/backgrounds/onwall.png
  sudo nitrogen --set-scaled /usr/share/backgrounds/onwall.png

  # Replace default configs
  sudo cp ~/configs/sources/i3.conf ~/.i3/config 
  sudo cp ~/configs/sources/omf.fish ~/.config/fish/conf.d/omf.fish
  sudo cp ~/configs/sources/polybar.conf ~/.config/polybar/config
  sudo cp ~/configs/sources/compton.conf ~/.config/compton.config

  # Set my git configuration
  git config --global --add user.email "phdumaresq@gmail.com"
  git config --global --add user.name "phdumaresq"
  git config --global --add credential.helper store

  # Make sure FiraCode is set as a font
  sudo cp ~/configs/assets/fonts/* ~/.fonts
  sudo cp ~/configs/assets/fonts/* /usr/share/fonts
  sudo cp ~/configs/assets/fonts/* ~/.local/share/fonts/
  sudo cp ~/configs/assets/fonts/* /usr/share/terminology/fonts/ 
  sudo cp ~/configs/assets/fonts/* /usr/share/terminology/fonts/

  # Reinitialize conky and compton
  pkill conky
  pkill compton 
  conky --config /usr/share/conky/conky_grey &>> ~/configs/log/conky.log
  compton --config ~/.config/compton.conf &>> ~/configs/log/compton.log
  
  # Reinitialize polybar
  killall -q polybar 
  while pgrep -x polybar >/dev/null; do sleep 1; done
  polybar top & 
fi

################################################################################
####################           CLEARNUP AT THE END          ####################
################################################################################

if [[ $* == -*d* ]] || [[ $* == -*A* ]]; then
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

if [[ $* == -*c* ]] || [[ $* == -*A* ]]; then
  # git pull 
  sudo chsh -s /usr/bin/fish
fi

################################################################################
####################                SUMMARY                 ####################
################################################################################

echo "################################################################################"
echo "####################                SUMMARY                 ####################"
echo "################################################################################"

if [[ $* == -*i* ]] || [[ $* == -*A* ]]; then
  echo ""
  echo "Installation changes:"
  echo "    Installed" $stdPackages "from pacman"
  echo "    Installed" $aurPackages "from AUR"
fi

if [[ $* == -*c* ]] || [[ $* == -*A* ]]; then
  echo ""
  echo "i3 Changes: "
  echo "    Mod key has been changed to alt"
  echo "    Manjaro help has been changed to mod+F1"
  echo "    Naviagtion keys have been changed to vim bindings"
  echo "    Setting panels to tabbed has been changed to mod+t"
  echo "    Floating a window has been set to mod+Shift+f"
  echo "    Tiling has changed from h/v to x/y axis"
  echo "    Completely changed keybindings for resizing panels. Consult i3 config"
  echo "    Default shell changed to fish"
  echo "    Default i3 terminal changed to terminology"
  echo "    Screen resolution has been to optimal size"
  echo "    i3 bar replaced by polybar"
  echo ""
  echo "NOTE: MAKE SURE TO CHANGE DATE AND TIME SETTINGS"
  echo "    $ sudo date +%Y-%m-%d -s \"YYYY-mm-dd\""
  echo "    $ sudo date +%T -s \"hr:min:sec\""
fi

if [[ $* == -*d* ]] || [[ $* == -*A* ]]; then
  echo ""
  echo "Removed" $removed "packages"
fi
