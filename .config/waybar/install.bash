#!/usr/bin/env bash
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[39m"

DEPENDENCIES=(
	"libnotify"
	"bluez"
	"bluez-utils" # bluetoothctl
	"bluetui"
	"brightnessctl"
	"fzf"
	"pacman"-contrib # checkupdates
	"pipewire-pulse"
	"ncpamixer"
	"otf-commit-mono-nerd"
	"impala"
)

main() {
	local errors=0
	echo "Installing dependencies..."

	local dependency
	for dependency in "${DEPENDENCIES[@]}"; do
		if pacman -Qi "$dependency" > /dev/null; then
			printf "[%b/%b] %s\n" "$GREEN" "$RESET" "$dependency"
		else
			printf "[ ] %s...\n" "$dependency"

			if sudo pacman -S --noconfirm "$dependency"; then
				printf "[%b+%b] %s\n" "$GREEN" "$RESET" "$dependency"
			else
				printf "[%bx%b] %s\n" "$RED" "$RESET" "$dependency"
				((errors += 1))
			fi
		fi
	done

	echo "Making scripts executable..."
	chmod -v +x ./scripts/*.bash

	echo "Restarting waybar..."
	pkill waybar
	waybar &> /dev/null &
	disown

	if ((errors > 0)); then
		printf "\nInstallation completed with %b%d errors%b\n" "$RED" "$errors" "$RESET"
	else
		echo "Installation completed successfully!"
	fi
}

main
