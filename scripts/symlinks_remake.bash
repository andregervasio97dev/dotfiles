#!usr/bin/env bash

# This script moves to the .config directory, creating it if it doesn't exist; then
# makes the symbolic links between the location the programs use to get the configurations
# and the directories on this repository.
#
# The -h flag checks if a file exists and is a symbolic link
# The -d flag checks if a file exists and is a directory 

cd ~

if [[ ! -d ./.config ]]; then
	mkdir .config
fi
cd ~/.config

# Kitty
if [[ -h ./kitty ]]; then
	rm ./kitty
elif [[ -d ./kitty ]]; then
	rm -rf ./kitty
fi
ln -s ~/dotfiles/.config/kitty kitty

# Fish
if [[ -h ./fish ]]; then
	rm ./fish
elif [[ -d ./fish ]]; then
	rm -rf ./fish
fi
ln -s ~/dotfiles/.config/fish fish

# Hyprland and addons
if [[ -h ./hypr ]]; then
	rm ./hypr
elif [[ -d ./hypr ]]; then
	rm -rf ./hypr
fi
ln -s ~/dotfiles/.config/hypr/ hypr
