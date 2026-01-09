#!/usr/bin/env bash

source ~/dotfiles/bash/colors.bash
source ~/dotfiles/bash/sticky_text_bottom.bash

sticky_text "pacman -Syu --noconfirm"
# Program Start
echo -e "${GREEN}Updating/Upgrading base packages${RESET}"
if ! sudo pacman -Syu --noconfirm; then
	echo -e "${RED}Error while updating/upgrading system.${RESET}" >&2
	exit 1
fi

sticky_text "source_builds.bash"
# Will install packages from source if not already installed
chmod -v +x ~/dotfiles/scripts/system/packages/source_builds.bash
if ! bash ~/dotfiles/scripts/system/packages/source_builds.bash; then
	exit 1
fi

sticky_text "packages.bash"
# Runs script for installing packages
chmod -v +x ~/dotfiles/scripts/system/packages/packages.bash
if ! bash ~/dotfiles/scripts/system/packages/packages.bash; then
	exit 1
fi
echo -e "${GREEN}Complete system instalation successful.${RESET}"

sticky_text "systemd_services.bash"
# Runs script to enable systemd services
if cd ~/dotfiles/scripts/system/; then
	chmod -v +x ./systemd_services.bash
	bash ./systemd_services.bash
fi

sticky_text "symlinks_remake.bash"
# Runs script to create the symbolic links
chmod -v +x ~/dotfiles/scripts/system/symlinks_remake.bash
if ! bash ~/dotfiles/scripts/system/symlinks_remake.bash; then
	echo -e "${RED}Error while creating symlinks${RESET}"
	exit 1
fi

sticky_text "configs_install.bash"
# Runs scripts for additional configurations
if cd ~/dotfiles/scripts/system/packages/; then
	chmod -v +x ./configs_install.bash
	if ! bash ./configs_install.bash; then
		exit 1
	fi
fi

echo -e "${GREEN}Instalation successful!${RESET}"
exit 0
