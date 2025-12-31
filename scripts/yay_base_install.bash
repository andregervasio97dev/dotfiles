#!usr/bin/env bash

yes "" | yay -Syu

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
	steam
)

flatpak=(
	net.waterfox.waterfox
)

yes "" | yay -S "${basePrograms[@]}"
yes "" | yay -S "${tuiPrograms[@]}"
yes "" | yay -S "${guiPrograms[@]}"
yes "" | yay -S "${developmentPrograms[@]}"
yes "" | yay -S "${fonts[@]}"
yes "" | yay -S "${gaming[@]}"
yes "" | flatpak install flathub "${flatpak[@]}"


