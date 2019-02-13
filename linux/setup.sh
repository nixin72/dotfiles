# Commenting out unimportant things for now since my VM for testing doesn't have enough space to install everything right away. 

# install important packages
# sudo pacman -Sy firefox --noconfirm
# sudo pacman -Sy code --noconfirm
sudo pacman -Sy fish --noconfirm
sudo pacman -Sy python-pywal --noconfirm 
sudo pacman -Sy python-pip --noconfirm
# sudo pacman -Sy libc++ --noconfirm
# sudo pacman -Sy nodejs npm --noconfirm
# sudo pacman -Sy sbcl --noconfirm
# sudo pacman -Sy ruby --noconfirm

git config --global user.email = "phdumaresq@gmail.com"
git config --global user.name = "Philip"

# install powerline fonts
# sudo pacman -Sy powerline powerline-fonts --noconfirm

#intall discord
# wget https://aur.archlinux.org/cgit/aur.git/snapshot/discord.tar.gz
# tar -xvf discord*.tar.gz
# cd discord
# makepkg -sri --noconfirm

#install omf
# curl -L https://get.oh-my.fish >  oh-my.fish
fish -c "chmod +x ~/configs/oh-my.fish; ~/configs/oh-my.fish --noninteractive -y"

#install fish themes
fish -c "omf install spacefish; omf install agnoster";

# rm -rf ~/Documents/ ~/Downloads/ ~/Music/ ~/Pictures/ ~/Public/ ~/Templates/ ~/Videos/

sudo cp ~/configs/background.png /usr/share/backgrounds/loz.png
sudo wal -i /usr/share/backgrounds/loz.png


echo "INFO: Mod key has been changed to alt"
echo "INFO: Manjaro help has been changed to mod+F1"
echo "INFO: i3 direction keys have been changed to vim bindings"
echo "INFO: i3 tiling has changed from h/v to x/y axis"
