#!/bin/zsh
# install.zsh
# Created by quantumr8
# Custom install script to get my normal looking terminal and programs

# Error clean up
handle_exit_code() {
  ERROR_CODE="$?";
  if [ ${ERROR_CODE} -gt 0 ]; then
    printf -- "an error occurred. cleaning up now... ";
    # ... cleanup code ...
    printf -- "DONE.\nExiting with error code ${ERROR_CODE}.\n";
    exit ${ERROR_CODE};
  fi
}
trap "handle_exit_code" EXIT;

# Default values of arguments
SHOULD_INITIALIZE=0
SKIP_OHMYZSH=0
WORK_DIRECTORY="~/.dotfiles"
HELP_MSG=0
OTHER_ARGUMENTS=()

# Loop through arguments and process them
for arg in "$@"
do
  case $arg in
    -i|--init)
    SHOULD_INITIALIZE=1
    shift
    ;;
    -z|--skipzsh)
    SKIP_OHMYZSH=1
    shift
    ;;
    -h|--help)
    HELP_MSG=1
    shift;;
    *)
    OTHER_ARGUMENTS+=("$1")
    shift
    ;;
  esac
done

# Help message
if [ "$HELP_MSG" -eq "1" ]; then
  echo -e "---\e[34m Dotfiles install script help \e[0m---";
  echo -e "Syntax: \e[36m./install.zsh [-h|i|q|z]\e[0m";
  echo  "Options:"
  echo -e "h  --help     Print this help."
  echo -e "i  --init     Initialize pacman keys and mirrors."
  echo -e "q             Quiet mode."
  echo -e "z  --skipzsh  Skip installing oh-my-zsh."
  echo "\nThank you for using quantumr8's dotfiles."
  echo -e "\e[93mEnjoy!";
  exit 0;
fi

# Init pacman
#./pacman.sh

# Install dependencies
#sudo pacman -S --needed --noconfirm - < pkglist.txt
# Install oh-my-zsh
#sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"



# Stow config files


# Done
figlet 'Done' | lolcat
