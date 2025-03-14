#!/bin/bash
cd ~

if [ -h ./.zshrc ]; then
	rm ./.zshrc
fi
ln -s ~/dotfiles/zshrc/zshrc .zshrc

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

