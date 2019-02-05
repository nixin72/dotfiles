# install important packages
# sudo pacman -Sy firefox
# sudo pacman -Sy code
sudo pacman -Sy fish --noconfirm


# install powerline
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

# install omf
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf


