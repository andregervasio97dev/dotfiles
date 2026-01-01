#!usr/bin/env bash

source ~/dotfiles/bash/colors.bash

yay -Syu --noconfirm

basePrograms=(
	less
	more
	man-db
	man-pages
	git
	grep
	cmake
	ninja-build
	gettext
	unzip
	curl
	build-essential
	gcc
	kitty
	ripgrep
	eza
	fd
	fish
	flatpak
	bat
	wl-clipboard
	clipse
)

tuiPrograms=(
	btop
	lazygit
	impala
	bluetui
	uwufetch
	caligula
)

guiPrograms=(
	libreoffice-fresh
	obs-studio
	obsidian
	mpv
	mpvqt
	localsend
)

developmentPrograms=(
	bob
	docker
	docker-compose
	github-cli
	npm
)

fonts=(
	ttf-0xproto-nerd
)

gaming=(
	gamescope
)

hyprland=(
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
)

flatpak=(
	com.valvesoftware.Steam
)

echo -e "${GREEN}Running programs installation...${RESET}"

if ! yay -S --noconfirm "${basePrograms[@]}"; then 
	echo -e "${RED}Error while installing basePrograms${RESET}"
fi
if ! yay -S --noconfirm "${tuiPrograms[@]}"; then 
	echo -e "${RED}Error while installing tuiPrograms${RESET}"
fi
if ! yay -S --noconfirm "${guiPrograms[@]}"; then 
	echo -e "${RED}Error while installing guiPrograms${RESET}"
fi
if ! yay -S --noconfirm "${developmentPrograms[@]}"; then
	echo -e "${RED}Error while installing developmentPrograms${RESET}"
fi
if ! yay -S --noconfirm "${fonts[@]}"; then 
	echo -e "${RED}Error while installing fonts${RESET}"
fi
if ! yay -S --noconfirm "${gaming[@]}"; then 
	echo -e "${RED}Error while installing gaming${RESET}"
fi
if ! yay -S --noconfirm "${hyprland[@]}"; then 
	echo -e "${RED}Error while installing hyprland programs${RESET}"
fi

flatpak install -y flathub "${flatpak[@]}"

echo -e "${GREEN}Installation successful${RESET}"
