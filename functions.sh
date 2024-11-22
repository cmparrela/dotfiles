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

create_symlinks() {
	write "🔄 creating symlinks for dotfiles"

	# Enable hidden files expansion in Zsh
	shopt -s dotglob

	touch ~/.zshrc-private
	touch ~/.zshrc-function

	install_zsh

	# Add source lines to ~/.zshrc if not already present
	if ! grep -q "source \$HOME/.zshrc-private" "$HOME/.zshrc"; then
		echo '\nsource $HOME/.zshrc-private' >> "$HOME/.zshrc"
	fi

	if ! grep -q "source \$HOME/.zshrc-function" "$HOME/.zshrc"; then
		echo '\nsource $HOME/.zshrc-function' >> "$HOME/.zshrc"
	fi

	# Create symlinks for dotfiles
	for file in ./dotfiles/*; do
		filename=$(basename "$file")
		ln -sf "$(realpath "$file")" "$HOME/$filename"
		write "✅ created symlink $file..."
	done
}
