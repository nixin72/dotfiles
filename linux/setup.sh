################################################################################
####################               INSTALLATION             ####################
################################################################################

sudo pacman -Sy firefox --noconfirm
# sudo pacman -Sy code --noconfirm
sudo pacman -Sy fish --noconfirm
sudo pacman -Sy python-pywal --noconfirm 
sudo pacman -Sy python-pip --noconfirm
sudo pacman -Sy libc++ --noconfirm
sudo pacman -Sy terminology --noconfirm
sudo pacman -Sy neofetch --noconfirm
# sudo pacman -Sy nodejs npm --noconfirm
# sudo pacman -Sy sbcl --noconfirm
# sudo pacman -Sy ruby --noconfirm
# sudo pacman -Sy powerline powerline-fonts --noconfirm

#install discord
# wget https://aur.archlinux.org/cgit/aur.git/snapshot/discord.tar.gz
# tar -xvf discord*.tar.gz
# cd discord
# makepkg -sri --noconfirm

#install omf and themes - install script already in the git repo
fish -c "chmod +x ~/configs/oh-my.fish; ~/configs/oh-my.fish --noninteractive -y"
fish -c "omf install spacefish; omf install agnoster";

################################################################################
####################                 REMOVAL                ####################
################################################################################
sudo pacman -Rcns subversion --noconfirm
sudo pacman -Rcns gimp --noconfirm
sudo pacman -Rcns palemoon --noconfirm
sudo pacman -Rcns zsh --noconfirm
sudo pacman -Rcns vlc --noconfirm
sudo pacman -Rcns aalib --noconfirm
sudo pacman -Rcns acpi --noconfirm
sudo pacman -Rcns acpid --noconfirm
sudo pacman -Rcns amd-ucode --noconfirm
sudo pacman -Rcns arandr --noconfirm
sudo pacman -Rcns apr --noconfirm
sudo pacman -Rcns artwork-i3 --noconfirm
sudo pacman -Rcns atool --noconfirm
sudo pacman -Rcns accountsservice --noconfirm
sudo pacman -Rcn  adapta-maia-theme --noconfirm
sudo pacman -Rcns b43-fwcutter --noconfirm
sudo pacman -Rcn  babl --noconfirm
sudo pacman -Rcns bison --noconfirm
sudo pacman -Rcns blueman --noconfirm
sudo pacman -Rcns c-ares --noconfirm
sudo pacman -Rcns calamares --noconfirm
sudo pacman -Rcns celt --noconfirm
sudo pacman -Rcns clonezilla --noconfirm
sudo pacman -Rcns chromaprint --noconfirm
sudo pacman -Rcns deluge --noconfirm
sudo pacman -Rcns dhclient --noconfirm
sudo pacman -Rcns dunst --noconfirm


################################################################################
####################      REINSTALL LOST DEPENDENCIES       ####################
################################################################################
sudo pacman -Sy xorg-xrand --noconfirm




################################################################################
####################              CONFIGURATION             ####################
################################################################################

# Copy my background over to the right place and set it and my colour scheme
sudo cp ~/configs/background.png /usr/share/backgrounds/loz.png
sudo wal -i /usr/share/backgrounds/loz.png

# Change default shell to fish
chsh -s /usr/bin/fish

# Clean up some of the default directories
rm -rf ~/Documents/ ~/Music/ ~/Pictures/ ~/Public/ ~/Templates/ ~/Videos/

# Change resolution
xrandr -s 1680x1050

# Set my git configuration
git config --global user.email = "phdumaresq@gmail.com"
git config --global user.name = "Philip"

# Make sure FiraCode is set as a font
cp ./FiraCode-Retina.otf ~/.local/share/fonts/FiraCode-Retina.otf
cp ./FiraCode-Retina.otf /usr/share/terminology/fonts/FiraCode-Retina.otf

################################################################################
####################                SUMMARY                 ####################
################################################################################

echo "INFO: Mod key has been changed to alt"
echo "INFO: Manjaro help has been changed to mod+F1"
echo "INFO: i3 direction keys have been changed to vim bindings"
echo "INFO: i3 tiling has changed from h/v to x/y axis"
echo "INFO: Default shell changed to fish"
echo "INFO: Default i3 terminal changed to terminology"
echo "INFO: Screen resolution has been to optimal size"
echo "\n"
echo "NOTE: MAKE SURE TO CHANGE DATE AND TIME SETTINGS"

