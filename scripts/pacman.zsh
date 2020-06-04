#!/bin/zsh
# Created by quantumr8
# Configure pacman after fresh install of arch linux

# Init keys & populate
sudo pacman-key --init
sudo pacman-key --populate

# Install reflector and update mirror list
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed reflector
sudo reflector --country 'United States' --latest 30 --age 24 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syu --noconfirm

# Automate reflector
sudo mkdir -p /etc/pacman.d/hook
sudo cp $WORK_DIR/other/mirrorupgrade.hook /etc/pacman.d/hook/mirrorupgrade.hook