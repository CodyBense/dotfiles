#!/usr/bin/env bash

echo ""
echo "----------------------------------"
echo "--Do you want to use zsh of bash--"
echo "----------------------------------"
echo ""
read shell

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git ~/paru
cd ~/paru
makepkg -si

# Install pacman packages
echo ""
echo "----------------------------------"
echo "-------Installing packages--------"
echo "----------------------------------"
echo ""
sleep 1

echo ""
echo "----------------------------------"
echo "----Installing pacman packages----"
echo "----------------------------------"
echo ""
sleep 1

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
    gimp
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
    socat
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
    vlc
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

for package in "${packages[@]}"
do
    sudo pacman -S ${package} --noconfirm
done

echo ""
echo "----------------------------------"
echo "-----Installing AUR packages------"
echo "----------------------------------"
echo ""
sleep 1

aurpackages=(
    arduino-ide
    kanata
    spotify
    timeshift-systemd-timer
    wlogout
    zen-browser-bin
)


for aurpackage in "${aurpackages[@]}"
do
    paru -S ${aurpackage}
done

echo ""
echo "----------------------------------"
echo "---------Installing fonts---------"
echo "----------------------------------"
echo ""
sleep 1

fonts=(
    ttf-cascadia-code-nerd
    awesome-terminal-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ttf-jetbrains-mono-nerd
    nodejs-material-design-icons
    ttf-terminus-nerd
    )

echo ""
echo "----------------------------------"
echo "-------Creating directories-------"
echo "----------------------------------"
echo ""
sleep 1

if [ ! -d ~/workspaces ]; then
    mkdir -p ~/workspaces/github/CodyBense
    mkdir -p ~/workspaces/Projects
fi

if [ ! -d ~/Desktop ]; then
    mkdir ~/Desktop
fi

if [ ! -d ~/Documents ]; then
    mkdir ~/Documents
fi


if [ ! -d ~/Downloads ]; then
    mkdir ~/Downloads
fi

if [ ! -d ~/Music ]; then
    mkdir ~/Music
fi


if [ ! -d ~/Public ]; then
    mkdir ~/Public
fi


if [ ! -d ~/Videos ]; then
    mkdir ~/Videos
fi

echo ""
echo "----------------------------------"
echo "---------Source dotfiles----------"
echo "----------------------------------"
echo ""
sleep 1

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
    systemd-user
    wallpapers
    waybar
    wlogout
)

for dir in "${dirs[@]}"
do
    stow ${dir}
done


echo ""
echo "----------------------------------"
echo "-----Copying systemd services-----"
echo "----------------------------------"
echo ""
sleep 1

echo ""
echo "----------------------------------"
echo "--------------Kanata--------------"
echo "----------------------------------"
echo ""
sleep 1

cp systemd/kanata.service /usr/lib/systemd/systemd/

echo ""
echo "----------------------------------"
echo "---------System Services----------"
echo "----------------------------------"
echo ""
sleep 1

sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

sudo systemctl enable kanata.service
sudo systemctl start kanata.service

systemctl --user enable gammastep-off.service
systemctl --user enable gammastep-on.service
systemctl --user start gammastep-off.service
systemctl --user start gammastep-on.service

echo ""
echo "----------------------------------"
echo "---Adding user to dialout group---"
echo "----------------------------------"
echo ""
sleep 1

sudo usermod -a -G dialout $USER

echo ""
echo "----------------------------------"
echo "-------Exporting variables--------"
echo "----------------------------------"
echo ""
sleep 1

echo ""
echo "----------------------------------"
echo "------------Niri socket-----------"
echo "----------------------------------"
echo ""
sleep 1

export NIRI_SOCKET=/run/user/$(id -u)/niri*.sock
