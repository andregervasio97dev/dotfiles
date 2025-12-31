#!/usr/bin/env bash

source ~/dotfiles/bash/colors.bash

yay_installation() {

	local DEPENDENCIES=(
		git
		curl
		base-devel
	)

	echo -e "${GREEN}Installing Dependencies...${RESET}"
	if ! sudo pacman -S --needed --noconfirm "${DEPENDENCIES[@]}"; then
		echo -e "${RED}Error while installing Dependencies.${RESET}" >&2
		return 1
	fi

	echo -e "${GREEN}Installing yay${RESET}"
	if ! cd ~; then
		echo -e "${RED}Could not reach home directory${RESET}" >&2
		return 1
	fi

	if ! git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si; then
		echo -e "${RED}Error during yay installation${RESET}" >&2
		return 1
	fi

	echo -e "${GREEN}Running base yay configuration${RESET}"
	if ! yay -Y --gendb && yay -Y --devel --save; then
		echo -e "${RED}Error while configuring yay${RESET}" >&2
		return 1
	fi

	echo -e "${GREEN}Yay instalation successful.${RESET}"
	return 0
}

# Program Start
echo -e "${GREEN}Updating/Upgrading base packages${RESET}"
if ! sudo pacman -Syu --noconfirm; then
	echo -e "${RED}Error while updating/upgrading system.${RESET}" >&2
	exit 1
fi

# Will install yay if not already installed
if  ! yay --version; then
	if ! yay_installation; then
		exit 1
	fi
fi

# Runs script for installing packages
if ! chmod +x ./yay_base_install.bash && bash ./yay_base_install.bash; then
	exit 1
fi

echo -e "${GREEN}Complete system instalation successful.${RESET}"
