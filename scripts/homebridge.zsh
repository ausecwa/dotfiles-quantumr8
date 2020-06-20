#!/bin/zsh
# homebridge.zsh
# Created by quantumr8
# Short script for my homebridge setup intended for me only. NOT FOR PUBLIC USE.

# Default values of arguments
SHOULD_UNINSTALL=0
HELP_MSG_DISPLAY=0
OTHER_ARGUMENTS=()

# Error clean up
handle_exit_code() {
  ERROR_CODE="$?";
  if [ ${ERROR_CODE} -gt 0 ]; then
    printf -- "an error occurred. cleaning up now... ";
    # ... cleanup code ...
    uninstall;
    printf -- "DONE.\nExiting with error code ${ERROR_CODE}.\n";
    exit ${ERROR_CODE};
  fi
}
trap "handle_exit_code" EXIT;

# Help message function
help_msg () {
  echo ""
  echo -e "---\e[34m homebridge setup help \e[0m---";
  echo ""
  echo -e "Syntax: \e[36m./homebridge.zsh [-h|r]\e[0m";
  echo  "Options:"
  echo -e "\e[32mh  --help\e[0m          Print this help."
  echo -e "\e[32mr  --uninstall\e[0m     Uninstall homebridge."
  echo "\nIntended for quantumr8 only, not for public use."
  echo -e "\e[93mEnjoy!";
  exit 0;
}

# Uninstall
uninstall () {
  echo "Uninstalling homebridge...";
  sudo hb-service uninstall;
  sudo npm uninstall -g homebridge homebridge-config-ui-x;
}

# Loop through arguments and process them
for arg in "$@"
do
  case $arg in
    -r|--uninstall)
    SHOULD_UNINSTALL=1
    shift
    ;;
    -h|--help)
    HELP_MSG_DISPLAY=1
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
# Install
if [ "$SHOULD_INSTALL" -eq "1" ]; then
  uninstall;
else
  echo "Installing homebridge..."
  sudo pacman --needed --noconfirm -S nodejs npm gcc
  sudo npm install -g --unsafe-perm homebridge homebridge-config-ui-x
  sudo hb-service install --user homebridge
fi

# Done
echo -e "\e[32mDone."
figlet 'Homebridge' | lolcat
