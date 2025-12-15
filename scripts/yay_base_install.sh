#!/bin/bash

yes "" | yay -Syu

basePrograms=(
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
	flatpak
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
)

gaming=(
	steam
)

yes "" | yay -S "${basePrograms[@]}"
yes "" | yay -S "${tuiPrograms[@]}"
yes "" | yay -S "${guiPrograms[@]}"
yes "" | yay -S "${developmentPrograms[@]}"
yes "" | yay -S "${gaming[@]}"
