#!/usr/bin/env bash
source ~/dotfiles/bash/colors.bash

# Waybar
if ! cd ~/dotfiles/.config/waybar/; then
	exit 1
fi

chmod -v +x ./install.bash
if ! bash ./install.bash; then
	echo -e "${RED}Error while installing waybar configuration${RESET}"
	exit 1
fi

echo -e "${GREEN}Waybar Configuration Successful${RESET}"
exit 0
