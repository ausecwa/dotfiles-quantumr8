#!/bin/sh
# Created by quantumr8
# Configure pacman after fresh install of arch linux

# Init keys & populate
sudo pacman-key --init
sudo pacman-key --populate

# Install reflector and update mirror list
sudo pacman -Syu --noconfirm
sudo pacman -S reflector
sudo reflector --country 'United States' -p https -l 10 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syu

# Automate reflector on boot
sudo cp ../../other/reflector.service /etc/systemd/system/reflector.service
sudo systemctl enable reflector
sudo systemctl start reflector