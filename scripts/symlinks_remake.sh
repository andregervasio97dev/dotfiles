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

if [ -h ./nvim ]; then
	rm ./nvim
elif [ -d ./nvim ]; then
	rm -rf ./nvim
fi
ln -s ~/dotfiles/nvim nvim

if [ -h ./i3 ]; then
	rm ./i3
elif [ -d ./i3 ]; then
	rm -rf ./i3
fi
ln -s ~/dotfiles/i3 i3

if [ -h ./kitty ]; then
	rm ./kitty
elif [ -d ./kitty ]; then
	rm -rf ./kitty
fi
ln -s ~/dotfiles/kitty kitty

