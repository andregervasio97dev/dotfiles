#!usr/bin/env bash

source ~/dotfiles/bash/colors.bash

# This script moves to the .config directory, creating it if it doesn't exist; then
# makes the symbolic links between the location the programs use to get the configurations
# and the directories on this repository.
#
# The -h flag checks if a file exists and is a symbolic link
# The -d flag checks if a file exists and is a directory 

create_symbolic_links() {
	cd ~

	echo -e "${GREEN}Creating link to ~/dotfiles/bash/.bashrc with name .bashrc...${RESET}"
	if [[ -h ./.bashrc || -f ./.bashrc ]]; then
		rm ./.bashrc
	elif [[ -d ./.bashrc ]]; then
		rm -rf ./.bashrc
	fi
	ln -s ~/dotfiles/bash/.bashrc .bashrc


	if [[ ! -d ./.config ]]; then
		mkdir .config
	fi
	cd ~/.config

	local dir
	local basename_dir
	for dir in ~/dotfiles/.config/*/; do
		basename_dir="${dir##*/.config/}"
		basename_dir="${basename_dir:0:-1}"
		echo -e "${GREEN}Creating link to ${dir} with name ${basename_dir}...${RESET}"

		if [[ -h ./"${basename_dir}" ]]; then
			rm ./"${basename_dir}"
		elif [[ -d ./"${basename_dir}" ]]; then
			rm -rf ./"${basename_dir}"
		fi
		ln -s "${dir}" "${basename_dir}"
	done
}
test(){
cd ~


# Kitty
if [[ -h ./kitty ]]; then
	rm ./kitty
elif [[ -d ./kitty ]]; then
	rm -rf ./kitty
fi
ln -s ~/dotfiles/.config/kitty kitty

# Fish
# if [[ -h ./fish ]]; then
# 	rm ./fish
# elif [[ -d ./fish ]]; then
# 	rm -rf ./fish
# fi
# ln -s ~/dotfiles/.config/fish fish

if [[ -h ./dunst ]]; then
	rm ./dunst
elif [[ -d ./dunst ]]; then
	rm -rf ./dunst
fi
ln -s ~/dotfiles/.config/dunst/ dunst

# Hyprland and addons
if [[ -h ./hypr ]]; then
	rm ./hypr
elif [[ -d ./hypr ]]; then
	rm -rf ./hypr
fi
ln -s ~/dotfiles/.config/hypr/ hypr

# Waybar
if [[ -h ./waybar ]]; then
	rm ./waybar
elif [[ -d ./waybar ]]; then
	rm -rf ./waybar
fi
ln -s ~/dotfiles/.config/waybar/ waybar
}

create_symbolic_links 
