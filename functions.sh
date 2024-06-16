#!/bin/bash

check_homebrew() {
    if ! command -v brew &>/dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(homebrew/bin/brew shellenv)"
    fi
}

check_gum_cli() {
    if ! command -v gum &>/dev/null; then
        brew install gum
    fi
}

write() {
    echo -e "# $1\n" | gum format
}

confirm() {
    echo ""
    gum confirm "$1"
}

display_apps() {
    local apps=("${@}")
    local formatted_apps="list of apps"
    for app in "${apps[@]}"; do
        formatted_apps+="\n- $app"
    done
    write "$formatted_apps"
}

is_installed() {
    local app="$1"
    brew list "$app" &>/dev/null
}

install_apps() {
    local apps=("${@:2}")
    for app in "${apps[@]}"; do
        if ! is_installed "$app"; then
            write "🔄 installing $app..."
            brew install "$app"

            if [ $? -eq 0 ]; then
                write "✅ finished installing $app."
            else
                write "❌ failed to install $app."
            fi
        else
            write "✅ $app is already installed, skipping installation."
        fi
    done
}

install_font() {
    local tap="homebrew/cask-fonts"
    local app="font-fira-code"

    if ! brew tap | grep -q "^${tap}\$"; then
        brew tap "$tap"
    fi

    if ! brew list "$app" &>/dev/null; then
        brew install "$app"
    fi
}

install_terraform() {
    local tap="hashicorp/tap"
    local app="hashicorp/tap/terraform"

    if ! brew tap | grep -q "^${tap}\$"; then
        brew tap "$tap"
    fi

    if ! brew list "$app" &>/dev/null; then
        brew install "$app"
    fi

    # terraform -install-autocomplete -> already in .zshrc
}

create_symlinks() {
    write "🔄 creating symlinks for dotfiles"

    # Enable hidden files expansion in Zsh
    shopt -s dotglob

    # Ensure ZSH_CUSTOM is set
    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    # Dependencies of symlinks
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi

    if [ ! -d "$HOME/.fzf" ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
        "$HOME/.fzf/install" --all
    fi

    # Create symlinks for dotfiles
    for file in ./dotfiles/*; do
        filename=$(basename "$file")
        ln -sf "$(realpath "$file")" "$HOME/$filename"
        write "✅ created symlink $file..."
    done
}