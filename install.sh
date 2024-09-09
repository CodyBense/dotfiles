#!/bin/zsh

# Install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git ~/Downloads
cd ~/Downloads/yay
mkpkg -si

# Install pacman packages
sudo pacman -S arduino-cli arduino-ide bat brighnessctl cmake dolphin direnv dmenu docker fastfetch firefox fzf go hypridle hyprland hyprlock kitty lazygit lf libnotify neovim network-manager-applet nerd-fonts noto-fonts-cjk noto-fonts-emoji pavucontrol pipewire-pulse ripgrep rofi-wayland starship stow swayimg swaync swww tlp tmux tree ttf-font-awesome unzip wl-clipboard yad zoxide zsh

# Install yay packages
yay -S rustmon-git tlpui trashy ttf-material-icons-git wlogout zen-browser-bin
