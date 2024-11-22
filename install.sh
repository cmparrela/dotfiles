#!/bin/bash

# Import functions
source ./functions.sh

# List of apps to install
apps=(
	raycast
	# whatsapp
	notion
	google-chrome
	arc
	microsoft-excel
	todoist
	shottr
	spotify
	warp
	zsh
	aldente
	1password
	appcleaner
	# openjdk
	rectangle
	# DEV TOOLS
	visual-studio-code
	postman
	mongodb-compass
	kubectl
	lens
	pyenv
	coreutils # Dependencies for asdf
	curl      # Dependencies for asdf
	asdf
	# docker Removed to install manually cast version
	dbeaver-community
)

write "🚀 starting to set up your mac"

# Check and install dependencies
check_homebrew
check_gum_cli

# Display all apps with their installation status
display_apps "${apps[@]}"

if confirm "Do you want to install all these apps?"; then
	install_apps "${apps[@]}"
fi

if confirm "Do you want to install fira code font??"; then
	install_font
fi

if confirm "Do you want to create symlinks for dotfiles?"; then
	create_symlinks
fi

write "🚀 setup completed!"
