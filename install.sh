#!/bin/bash

# Function to check if Homebrew is installed and install it if necessary
check_homebrew() {
    if ! command -v brew &>/dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(homebrew/bin/brew shellenv)"
    fi
}

# Stylings using Gum CLI
write() {
    gum style --border double --margin "1" --padding "1" "$1"
}

# Function to display a list of apps with their installation status
display_apps() {
    local apps=("${@}")
    for app in "${apps[@]}"; do
        printf "%s\n" "$app"
    done
}

# Function to check if an app is installed
is_installed() {
    local app="$1"
    local type="$2"
    if [ "$type" == "cask" ]; then
        brew list --cask "$app" &>/dev/null
    else
        brew list "$app" &>/dev/null
    fi
}

# Function to install apps
install_apps() {
    local type="$1"
    local apps=("${@:2}")
    for app in "${apps[@]}"; do
        if ! is_installed "$app" "$type"; then
            echo -e "📥 Installing $app...\n"
            if [ "$type" == "cask" ]; then
                brew install --cask "$app"
            else
                brew install "$app"
            fi
            if [ $? -eq 0 ]; then
                echo -e "\n✅ Finished installing $app.\n"
            else
                echo -e "\n❌ Failed to install $app."
            fi
        else
            echo "✅ $app is already installed, skipping installation."
        fi
    done
}

# Check and install Homebrew
check_homebrew

# Install Gum CLI
brew install gum

# Stylings using Gum CLI
write "🚀 Starting to set up your Mac..."

# List of apps to install
apps_cast=(
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
)

apps=(
    python3
    pnpm
    coreutils
    curl
    asdf
)
# Display all apps with their installation status
display_apps "${apps_cast[@]}"
display_apps "${apps[@]}"

# Confirmation of app installation
if gum confirm "Do you want to install these apps?"; then
    write "🔄 Preparing to install apps..."

    # Install apps
    install_apps "cask" "${apps_cast[@]}"
    install_apps "normal" "${apps[@]}"
fi

# Install Fira Code font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# Confirmation of dotfiles usage
if gum confirm "Do you want to use dotfiles?"; then
    write "🔄 Creating symlinks for dotfiles"

    # Enable hidden files expansion in Zsh
    shopt -s dotglob

    # Create symlinks for dotfiles
    for file in ./dotfiles/*; do
        echo -e "📥 Creating symlink $file...\n"
        filename=$(basename "$file")
        ln -sf "$(realpath "$file")" "$HOME/$filename"
    done

fi

# Stylings using Gum CLI
write "✅ Setup completed!"
