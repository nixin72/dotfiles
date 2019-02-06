# install important packages
sudo pacman -Sy firefox --noconfirm
sudo pacman -Sy code --noconfirm
sudo pacman -Sy fish --noconfirm
sudo pacman -Sy python python-pip --noconfirm
sudo pacman -Sy libc++ --noconfirm

# install powerline
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

# install omf
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf

#intall discord
wget https://aur.archlinux.org/cgit/aur.git/snapshot/discord.tar.gz
tar -xvf discord*.tar.gz
cd discord
makepkg -sri --noconfirm


