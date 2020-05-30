#!/bin/zsh
# created by quantumr8
# Custom install script to get my normal looking terminal and programs


# Help flag
if [ ${#@} -ne 0 ] && [ "${@#"--help"}" = "" ]; then
  printf -- '...help...\n';
  exit 0;
fi;

# Init pacman
#./pacman.sh

# Install dependencies
#sudo pacman -S --needed --noconfirm - < pkglist.txt




# Stow config files


# Done
figlet 'Done' | lolcat