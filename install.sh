#!/bin/bash

# Import functions
source ./functions.sh

# List of apps to install
apps=(
  raycast
  whatsapp
  notion
  google-chrome
  docker
  microsoft-excel
  visual-studio-code
  arc
  todoist
  shottr
  insomnia
  postman
  mongodb-compass
  spotify
  warp
  betterdisplay
  aldente
  kubectl
  lens
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

if confirm "Do you want to create symlinks for dotfiles?"; then
    write "🔄 creating symlinks for dotfiles"

    # Enable hidden files expansion in Zsh
    shopt -s dotglob

    # Create symlinks for dotfiles
    for file in ./dotfiles/*; do
        filename=$(basename "$file")
        ln -sf "$(realpath "$file")" "$HOME/$filename"
        write "✅ created symlink $file..."
    done

fi

write "🚀 setup completed!"
