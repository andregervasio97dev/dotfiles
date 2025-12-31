#!/usr/bin/env bash

yay_installation() {

	local DEPENDENCIES=(
		git
		curl
		base-devel
	)

	echo "Installing Dependencies"
	if ! sudo pacman -S --needed --noconfirm "${DEPENDENCIES[@]}"; then
		echo "Error while installing Dependencies." >&2
		return 1
	fi

	echo "Installing yay"
	if ! cd ~; then
		echo "Could not reach home directory" >&2
		return 1
	fi

	if ! git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si; then
		echo "Error during yay installation" >&2
		return 1
	fi

	echo "Running base yay configuration"
	if ! yay -Y --gendb && yay -Y --devel --save; then
		echo "Error while configuring yay" >&2
		return 1
	fi

	echo "Yay instalation successful."
	return 0
}

# Program Start
echo "Updating/Upgrading base packages"
if ! sudo pacman -Syu --noconfirm; then
	echo "Error while updating/upgrading system." >&2
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

echo "Complete system instalation successful."
