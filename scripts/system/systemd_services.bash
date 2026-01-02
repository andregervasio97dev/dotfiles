#!/usr/bin/env bash
source ~/dotfiles/bash/colors.bash

services_enable() {
	local services=(
		bluetooth.service
		NetworkManager.service
	)
	
	for service in "${services[@]}"; do
		echo -e "${GREEN}Enabling ${service}..."
		if ! sudo systemctl enable "${service}"; then
			echo -e "${RED}Error on enabling ${service}\n${RESET}"
			return 1
		fi
	done
	return 0
}

services_enable
