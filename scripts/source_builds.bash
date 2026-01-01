#!/usr/bin/env bash
source ~/dotfiles/bash/colors.bash

# Librewolf
if ! cd ~; then
	exit 1
fi
if ! git clone https://aur.archlinux.org/librewolf-bin.git && cd librewolf-bin && makepgk -si; then
	echo -e "${RED}Error while installing librewolf${RESET}"
	exit 1
fi
if cd ~; then
	rm -rf ./librewolf-bin
fi
