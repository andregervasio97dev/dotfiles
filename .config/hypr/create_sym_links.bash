#!/usr/bin/bash

if [[ -h ./hyprlauncher.conf ]] || [[ -f ./hyprlauncher.conf ]]; then
	rm ./hyprlauncher.conf
fi
ln -s ~/dotfiles/.config/hypr/addons/hyprlauncher/hyprlauncher.conf hyprlauncher.conf

if [[ -h ./hyprpaper.conf ]] || [[ -f ./hyprpaper.conf ]]; then
	rm ./hyprpaper.conf
fi
ln -s ~/dotfiles/.config/hypr/addons/hyprpaper/hyprpaper.conf hyprpaper.conf
