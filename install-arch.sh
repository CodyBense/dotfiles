#!/usr/bin/env bash

echo ""
echo "----------------------------------"
echo "--Do you want to use zsh of bash--"
echo "----------------------------------"
echo ""
read shell

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
    bemenu-wayland
    brightnessctl
    btop
    cifs-utils
    cmake
    direnv
    docker-compose
    dolphin
    dosfstools
    fastfetch
    flatpak
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
    kio-admin
    kitty
    lazygit
    libnewt
    libnotify
    man-db
    man-pages
    neovim
    networkmanager
    niri
    openssh
    pavucontrol
    power-profiles-daemon
    polkit-kde-agent
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
    xdg-desktop-portal-kde
    xwayland-satellite
    yad
    yazi
    zellij
    zoxide
    zsh
)

for package in "${packages[@]}"
do
    echo ""
    echo "----------------------------------"
    echo "-----Installing ${package} package------"
    echo "----------------------------------"
    echo ""
    sleep 1
    sudo pacman -S ${package} --noconfirm
done

echo ""
echo "----------------------------------"
echo "---------Installing Paru----------"
echo "----------------------------------"
echo ""
sleep 1

rustup default stable
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git ~/paru
cd ~/paru
makepkg -si

echo ""
echo "----------------------------------"
echo "-----Installing AUR packages------"
echo "----------------------------------"
echo ""
sleep 1

aurpackages=(
    kanata
    spotify
    timeshift-systemd-timer
    wlogout
    zen-browser-bin
)

for aurpackage in "${aurpackages[@]}"
do
    echo ""
    echo "----------------------------------"
    echo "-----Installing ${aurpackage} package------"
    echo "----------------------------------"
    echo ""
    sleep 1
    paru -S ${aurpackage}
done

echo ""
echo "----------------------------------"
echo "-------Installing Flatpaks--------"
echo "----------------------------------"
echo ""
sleep 1

flatpaks=(
    cc.arduino.IDE2
    md.obsidian.Obsidian
    flathub com.github.tchx84.Flatseal
)

for flatpak in "${flatpaks[@]}"
do
    echo ""
    echo "----------------------------------"
    echo "-----Installing ${flatpak} package------"
    echo "----------------------------------"
    echo ""
    sleep 1
    flatpak install flathub "${flatpak}"
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

for font in "${fonts[@]}"
do
    sudo pacman -S "${font}" --noconfirm
done

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
rm ~/.bash_profile
rm ~/.bashrc

dirs=(
    colors
    emoji
    ghostty
    git
    hypr
    kanata
    niri
    nvim
    profile
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

# echo ""
# echo "----------------------------------"
# echo "--------------Kanata--------------"
# echo "----------------------------------"
# echo ""
# sleep 1

# sudo cp systemd/kanata.service /usr/lib/systemd/system/

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


sudo groupadd uinput

echo ""
echo "----------------------------------"
echo "------Adding user to groups-------"
echo "----------------------------------"
echo ""
sleep 1

sudo usermod -a -G dialout $USER
sudo usermod -a -G uinput $USER

kanata --cfg ~/.config/kanata/kanata.kdb

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
