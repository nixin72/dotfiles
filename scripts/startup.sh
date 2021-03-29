#!/bin/sh

source ~/.zshrc

# xss-lock grabs a logind suspend inhibit lock and will 
# use i3lock to lock the screen before suspend. 
# Use loginctl lock-session to lock your screen.
xss-lock --transfer-sleep-lock -- betterlockscreen --nofork

monitors=$(xrandr | grep " connected" | wc -l)

if [ $monitors -gt 1 ]; then
	xrandr --output DVI-I-1-1 --auto --output DVI-I-2-2 --right-of DVI-I-1-1;
fi

# Sleep a little to ensure the monitors are ready
sleep 4;

eww daemon
sleep 0.5
eww open-many bar bar1

nitrogen --restore
picom --experimental-backends --config ~/.config/compton.conf

dunst

nm-applet
