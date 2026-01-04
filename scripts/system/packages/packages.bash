#!usr/bin/env bash
source ~/dotfiles/bash/colors.bash

base_apps() {
	yay -Syu --noconfirm
	
	local apps=(
		# Base Programs #
		less
		man-db
		man-pages
		git
		grep
		cmake
		gettext
		unzip
		curl
		gcc
		kitty
		ripgrep
		eza
		fd
		flatpak
		bat
		wl-clipboard
		clipse
		bluez
		bluez-utils
	
		# TUI #
		btop
		impala
		bluetui
		ncpamixer
		uwufetch
		caligula
	
		# GUI #
		libreoffice-fresh
		obs-studio
		obsidian
		mpv
		mpvqt
		localsend
	
		# Development #
		bob
		docker
		docker-compose
		github-cli
		npm
		lazygit
		lazydocker
		
		# Fonts #
		ttf-0xproto-nerd
		
		# Gaming #
		gamescope
		
		# Hyprland #
		pipewire
		wireplumber
		qt5-wayland
		qt6-wayland
		xdg-desktop-portal-hyprland
		xdg-desktop-portal-gtk
		hyprpolkitagent
		hyprpaper
		hyprshot
		hyprlauncher
		hyprpicker
		waybar
	)
	
	local flatpak=(
		com.valvesoftware.Steam
		com.stremio.Stremio
	)
	
	echo -e "${GREEN}Running programs installation...${RESET}"
	
	local app
	for app in "${apps[@]}"; do
		if ! yay -Qi "${app}" > /dev/null; then
			if ! yay -S --noconfirm "${app}"; then
				echo -e "${RED}Error while installing ${app}${RESET}"
			fi
		fi
	done
	
	local flatpak_app
	for flatpak_app in "${flatpak[@]}"; do
		if ! flatpak install -y flathub "${flatpak_app}"; then
			echo -e "${RED}Error while installing flatpak_app ${flatpak_app}${RESET}"
		fi
	done
	
	
	echo -e "${GREEN}Installation successful${RESET}"
}

base_apps 
