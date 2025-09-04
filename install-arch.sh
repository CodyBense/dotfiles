#!/bin/bash

echo "Do you want to use zsh of bash"
read shell

sudo pacman -S --needed base-devel
cd ~
git clone https://aur.archlinux.org/paru.git ~/paru
cd paru
makepkg -si

# Install pacman packages
echo "Installing packages"
packages=(
    bat
    bemenu
    brightnessctl
    btop
    cifs-utils
    cmake
    direnv
    docker-compose
    dolphin
    fastfetch
    firefox
    fzf
    gcc
    ghostty
    git
    github-cli
    go
    hyprland
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
    kicad
    kitty
    lazygit
    libnewt
    libnotify
    man-db
    man-pages
    neovim
    networkmanager
    niri
    obsidian
    openssh
    pavucontrol
    power-profiles-daemon
    psmisc
    python
    ripgrep
    rofi-wayland
    rsync
    rust
    starship
    stow
    swayimg
    swaync
    swww
    tmux
    trash-cli
    tree
    unzip
    uv
    uwsm
    waybar
    wf-recorder
    wget
    wl-clipboard
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    yad
    yazi
    zellij
    zoxide
    zsh
)
echo "Installing pacman packages"
for package in "${packages[@]}"
do
    sudo pacman -S ${package} --noconfirm
done

# Install AUR packages
aurpackages=(
    arduino-ide
    kanata
    spotify
    timeshift-systemd-timer
    wlogout
    zen-browser-bin
)
echo "Installing aur packages"
for aurpackage in "${aurpackages[@]}"
do
    paru -S ${aurpackage}
done

echo "Installing fonts"
fonts=(
    ttf-cascadia-code-nerd
    awesome-terminal-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ttf-jetbrains-mono-nerd
    nodejs-material-design-icons
    ttf-terminus-nerd
    )

echo "Creating directories"
if [ ! -d ~/workspaces/github/CodyBense ]; then
    mkdir -p ~/workspaces/github/CodyBense
fi

if [ ! -d ~/workspaces/Projects ]; then
    mkdir -p ~/workspaces/Projects
fi

# Stow commands for dotfiles
echo "Using stow to source dotfiles"
cd ~/dotfiles
dirs=(
    emoji
    ghostty
    git
    hypr
    niri
    nvim
    rofi
    scripts
    starship
    swaync
    tmux
    wallpapers
    waybar
    wlogout
    zellij
    zsh
)

for dir in "${dirs[@]}"
do
    stow ${dir}
done

echo "Arduino: adding user to dialout group"
sudo usermod -a -G dialout $USER
