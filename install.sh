#!/bin/bash

# Install yay
sudo pacman -S --needed git base-devel
cd ~
git clone https://aur.archlinux.org/yay.git
cd ~/yay
makepkg -si

# Install pacman packages
yes | sudo pacman -S arduino-cli arduino-ide bat brightnessctl cmake direnv discord dmenu docker fastfetch firefox fzf go hypridle hyprlock lazygit lf libnotify neovim network-manager-applet nerd-fonts noto-fonts-cjk noto-fonts-emoji pavucontrol pipewire-pulse ripgrep rofi-wayland starship stow swayimg swaync swww tlp tmux tree ttf-font-awesome unzip wakeonlan waybar wl-clipboard yad zoxide zsh

# Install yay packages
yay -S rustmon-git spotify tlpui trashy ttf-material-icons-git wlogout zen-browser-bin

# Make some directories
mkdir -p ~/workspaces/github.com/CodyBense
mkdir -p ~/workspaces/Projects

# Stow commands for dotfiles
cd ~/dotfiles
stow emoji
stow git
stow hypr
stow kitty
stow lf
stow nvim
stow rofi
stow scripts
stow starship
stow swaync
stow tmux
stow wallpapers
stow waybar
stow wlogout
stow zsh
