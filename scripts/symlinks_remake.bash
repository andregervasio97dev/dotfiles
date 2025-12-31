#!usr/bin/env bash
cd ~

if [ ! -d ./.config ]; then
	mkdir .config
fi
cd ~/.config

if [ -h ./kitty ]; then
	rm ./kitty
elif [ -d ./kitty ]; then
	rm -rf ./kitty
fi
ln -s ~/dotfiles/kitty kitty

if [ -h ./fish ]; then
	rm ./fish
elif [ -d ./fish ]; then
	rm -rf ./fish
fi
ln -s ~/dotfiles/fish fish
