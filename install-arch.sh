#!/usr/bin/env bash

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

while read -r line; do
    echo ""
    echo "----------------------------------"
    echo "-----Installing ${package} package------"
    echo "----------------------------------"
    echo ""
    sleep 1
    sudo pacman -S "$line" --noconfirm
done < install/packages-arch.txt

echo ""
echo "----------------------------------"
echo "---------Installing Paru----------"
echo "----------------------------------"
echo ""
sleep 1

rustup default stable
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git ${HOME}/paru
cd ${HOME}/paru
makepkg -si

echo ""
echo "----------------------------------"
echo "-----Installing AUR packages------"
echo "----------------------------------"
echo ""
sleep 1

while read -r line; do
    echo ""
    echo "----------------------------------"
    echo "-----Installing ${aurpackage} package------"
    echo "----------------------------------"
    echo ""
    sleep 1
    paru -S "$line"
done < install/packages-aur.txt

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

if [ ! -d ${HOME}/workspaces ]; then
    mkdir -p ${HOME}/workspaces/github/CodyBense
    mkdir -p ${HOME}/workspaces/projects
fi

if [ ! -d ${HOME}/Desktop ]; then
    mkdir ${HOME}/Desktop
fi

if [ ! -d ${HOME}/Documents ]; then
    mkdir ${HOME}/Documents
fi


if [ ! -d ${HOME}/Downloads ]; then
    mkdir ${HOME}/Downloads
fi

if [ ! -d ${HOME}/Music ]; then
    mkdir ${HOME}/Music
fi


if [ ! -d ${HOME}/Public ]; then
    mkdir ${HOME}/Public
fi

if [ ! -d ${HOME}/Pictures ]; then
    mkdir ${HOME}/Pictures
fi

if [ ! -d ${HOME}/Videos ]; then
    mkdir ${HOME}/Videos
fi

echo ""
echo "----------------------------------"
echo "---------Source dotfiles----------"
echo "----------------------------------"
echo ""
sleep 1

cd ${HOME}/dotfiles

dirs=(
    bash
    colors
    emoji
    ghostty
    git
    hypr
    kanata
    niri
    noctalia
    nvim
    profile
    rofi
    scripts
    starship
    swaync
    systemd-user
    tmux
    wallpapers
    waybar
    wlogout
    yazi
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

sudo cp systemd/kanata.service /lib/systemd/system/kanata.service
sleep 1

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

sudo groupadd dialout
sudo usermod -a -G dialout $USER
sudo usermod -a -G uinput $USER

kanata --cfg ${HOME}/.config/kanata/kanata.kdb

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
