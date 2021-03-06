#!/usr/bin/env bash

echo -e "\e[32m"
echo "  ______      _                  ";
echo " |  ____|    | |                 ";
echo " | |__  __  _| |_ _ __ __ _ ___  ";
echo " |  __| \ \/ / __| '__/ _\` / __|";
echo " | |____ >  <| |_| | | (_| \__ \\";
echo " |______/_/\_\\__|_|  \__,_|___/ ";
echo "                                 ";
echo "                                 ";
echo -e "\e[0m"

extras=(                                      \
	firefox thunderbird                   \
	evince nautilus sxiv                  \
	qbittorrent                           \
	zip unzip                             \
	openssh openvpn sshfs                 \
	arandr xorg-xprop                     \
	dmenu bash-completion                 \
	bc htop ctags cdrtools                \
	bluez bluez-utils                     \
	cups system-config-printer            \
	networkmanager network-manager-applet \
	)

for util in ${extras[@]}
do
	sudo pacman -S "$util" --noconfirm
done

sudo systemctl enable bluetooth.service
sudo systemctl enable org.cups.cupsd.service
sudo systemctl enable NetworkManager.service

echo "blacklist pcspkr" | sudo tee --append /etc/modprobe.d/nobeep.conf
