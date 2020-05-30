#!/bin/zsh
# install.zsh
# Created by quantumr8
# Custom install script to get my normal looking terminal and programs

# Default values of arguments
SHOULD_INITIALIZE=0
SKIP_OHMYZSH=0
WORK_DIRECTORY="~/.dotfiles"
HELP_MSG_DISPLAY=0
QUIET_MODE=0
OTHER_ARGUMENTS=()

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

# Help message function
help_msg () {
  echo -e "---\e[34m Dotfiles install script help \e[0m---";
  echo -e "Syntax: \e[36m./install.zsh [-h|i|q|z]\e[0m";
  echo  "Options:"
  echo -e "\e[32mh  --help\e[0m     Print this help."
  echo -e "\e[32mi  --init\e[0m     Initialize pacman keys and mirrors."
  echo -e "\e[32mq\e[0m             Quiet mode."
  echo -e "\e[32mz  --skipzsh\e[0m  Skip installing oh-my-zsh."
  echo "\nThank you for using quantumr8's dotfiles."
  echo -e "\e[93mEnjoy!";
  exit 0;
}

# Pacman init keys and mirrors
install_ohmyzsh() {
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
}

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
    HELP_MSG_DISPLAY=1
    shift
    ;;
    -q)
    QUIET_MODE=1
    shift
    ;;
    *)
    OTHER_ARGUMENTS+=("$1")
    shift
    ;;
  esac
done

### Run functions
# Help message
if [ "$HELP_MSG_DISPLAY" -eq "1" ]; then
  help_msg;
fi
# Init pacman
if [ "$SHOULD_INITIALIZE" -eq "1" ]; then
  sudo pacman -S --needed --noconfirm - < pkglist.txt;
fi
#
if [ "$SKIP_OHMYZSH" -ne "1" ]; then
  install_ohmyzsh;
fi


# Stow config files


# Done
echo -e "\e[32mDone."
figlet 'Enjoy!' | lolcat
