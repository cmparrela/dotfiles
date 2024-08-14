#!/bin/bash

# Import functions
source ./functions.sh

# List of apps to install
apps=(
	raycast
	whatsapp
	notion
	google-chrome
	# docker Removed to install manually cast version
	microsoft-excel
	visual-studio-code
	arc
	todoist
	shottr
	postman
	mongodb-compass
	spotify
	warp
	betterdisplay
	aldente
	kubectl
	lens
	pyenv
	zsh
	1password
	coreutils # Dependencies for asdf
	curl      # Dependencies for asdf
	asdf
	appcleaner
	openjdk
	rectangle
)

write "🚀 starting to set up your mac"

# Check and install dependencies
check_homebrew
check_gum_cli

# Display all apps with their installation status
display_apps "${apps[@]}"

# Confirmation of installation
if confirm "Do you want to install all these apps?"; then
	install_apps "${apps[@]}"
fi

if confirm "Do you want to install fira code font??"; then
	install_font
fi

if confirm "Do you want to install terraform??"; then
	install_terraform
fi

if confirm "Do you want to create symlinks for dotfiles?"; then
	create_symlinks
fi

write "🚀 setup completed!"
