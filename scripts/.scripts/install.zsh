#!/bin/zsh
# install.zsh
# Created by quantumr8
# Custom install script to get my normal looking terminal and programs

# Default values of arguments
SHOULD_INITIALIZE=0
SKIP_OHMYZSH=1
SKIP_PACKAGES=1
HELP_MSG_DISPLAY=0
QUIET_MODE=0
WORK_DIR=$HOME/.dotfiles
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
  echo ""
  echo -e "---\e[34m Dotfiles install script help \e[0m---";
  echo "note: use -d=<path> if dotfiles folder is somehting other than ~/.dotfiles" 
  echo ""
  echo -e "Syntax: \e[36m./install.zsh [-h|d|i|p|q|z]\e[0m";
  echo  "Options:"
  echo -e "\e[32mh  --help\e[0m     Print this help."
  echo -e "\e[32md= --DIR=\e[0m     Path to dotfiles."
  echo -e "\e[32mi  --init\e[0m     Initialize pacman keys and mirrors."
  echo -e "\e[32mp  --packages\e[0m Skip installing required packages."
  echo -e "\e[32mq\e[0m             Quiet mode.(WIP)"
  echo -e "\e[32mz  --skipzsh\e[0m  Skip installing oh-my-zsh."
  echo "\nThank you for using quantumr8's dotfiles."
  echo -e "\e[93mEnjoy!";
  exit 0;
}

# Pacman init keys and mirrors
install_ohmyzsh() {
  echo "installing oh-my-zsh..."
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
    SKIP_OHMYZSH=0
    shift
    ;;
    -p|--packages)
    SKIP_PACKAGES=0
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
    -d=*|--DIR=*)
    WORK_DIR="${arg#*=}"
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
# Stow config files
echo "Stowing config files..."
stow -v --target=$HOME --dir="${WORK_DIR}" bashtop fzf git neofetch ranger scripts vim zsh
echo "Stowing done."
# Init pacman
if [ "$SHOULD_INITIALIZE" -eq "1" ]; then
  echo "Running pacman.zsh..."
  source "$WORK_DIR"/scripts/.scripts/pacman.zsh;
fi
if [ "$SKIP_PACKAGES" -eq "1" ]; then
  echo "Installing packages...";
  sudo pacman -S --needed --noconfirm - < "$WORK_DIR"/scripts/.scripts/pkglist.txt;
fi
# Install oh-my-zsh
if [ "$SKIP_OHMYZSH" -eq "1" ]; then
  install_ohmyzsh;
fi

# Done
echo -e "\e[32mDone."
figlet 'Enjoy!' | lolcat
