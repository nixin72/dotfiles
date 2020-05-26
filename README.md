# Dotfiles

This is where my configs are for my Linux setup. 

## Basics:
- OS: Manjaro Linux
- DE: KDE Plasma 
- Shell: Fish
- Editor: Emacs
- Terminal Emulator: Alacritty

## Development tools:
- Fish shell
- Emacs
- Alacritty

## Theme
- Atom-One Dark theme all around
- Fish theme: Spaceship|Agnoster
- Fira Code 

## Installing

**NOTE:** This won't work yet

To install on Linux or MacOS, just run 
```bash
curl -fsSL https://raw.githubusercontent.com/nixin72/dotfiles/master/install.sh | sh
```

To install on Windows: 
- First install git
```
git clone git@github.com:nixin72/dotfiles.git
```
And then copy whatever you're looking for. Things that work on Windows:
- Emacs
- Alacritty
- VSCode 
- Fish (when in WSL)
- git configs
- Custom browser homepage

## TODO
- Merge the i3 configs since I have no idea what happend, but there's things I want from both
- Put i3 (i3.conf, polybar and compton) files into the correct subdirectories - need to use i3 again to know where that is
- Bootstrap `install.sh`
