#!/bin/bash

# Path to your dotfiles directory
DOTFILES_DIR="$HOME/dotfiles/"

# Array of packages (subdirectories) in dotfiles directory
PACKAGES=(
    ".bashrc"
    ".config/alacritty"
    ".config/bspwm"
    ".config/dunst"
    ".config/fish"
    ".config/lazygit"
    ".config/neofetch"
    ".config/nitrogen"
    ".config/nvim"
    ".config/picom"
    ".config/polybar"
    ".config/sxhkd"
    ".config/Thunar"
    ".config/viewnior"
    ".config/zathura"
    ".gitconfig"
    ".tmux.conf"
)

# Function to install dotfiles using stow
install_dotfiles() {
    local stow_cmd="stow -vt $HOME"
    for package in "${PACKAGES[@]}"; do
        $stow_cmd -d "$DOTFILES_DIR" "$package"
    done
}

# Main execution
echo "Installing dotfiles..."
install_dotfiles
echo "Dotfiles installation complete."
