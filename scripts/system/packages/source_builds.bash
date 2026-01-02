#!/usr/bin/env bash
source ~/dotfiles/bash/colors.bash

# Basic dependencies
deps_installation() {

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
}

# Yay
yay_installation() {

	if yay --version; then
		echo -e "${GREEN}Yay already installed!${RESET}"
		return 0
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

# Librewolf
librewolf_installation() {

	if librewolf --version; then
		echo -e "${GREEN}Librewolf already installed!${RESET}"
		return 0
	fi

	if ! cd ~; then
		return 1
	fi
	if ! git clone https://aur.archlinux.org/librewolf-bin.git && cd librewolf-bin && makepgk -si; then
		echo -e "${RED}Error while installing librewolf${RESET}"
		return 1
	fi
	if cd ~; then
		rm -rf ./librewolf-bin
	fi
}

main() {
	deps_installation 
	yay_installation 
	librewolf_installation 
}

main
