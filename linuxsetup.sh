# install important packages
sudo pacman -Sy firefox --noconfirm
sudo pacman -Sy code --noconfirm
sudo pacman -Sy fish --noconfirm
sudo pacman -Sy python python-pip --noconfirm
sudo pacman -Sy libc++ --noconfirm

git config --global user.email = "phdumaresq@gmail.com"
git config --global user.name = "Philip"

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

#intall discord
wget https://aur.archlinux.org/cgit/aur.git/snapshot/discord.tar.gz
tar -xvf discord*.tar.gz
cd discord
makepkg -sri --noconfirm

#install omf
curl -L https://get.oh-my.fish >  oh-my.fish
fish -c "chmod +x ./oh-my.fish; ./oh-my.fish --noninteractive -y"

#install fish themes
fish -c "omf install agnoster"
