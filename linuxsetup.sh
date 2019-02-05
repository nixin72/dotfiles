# install important packages
# sudo pacman -Sy firefox
# sudo pacman -Sy code
sudo pacman -Sy fish


# install powerline
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

curl -L https://get.oh-my.fish | fish -c exit
