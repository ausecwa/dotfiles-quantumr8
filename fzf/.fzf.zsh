# Setup fzf
# ---------
if [[ ! "$PATH" == */home/sam/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/sam/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/sam/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/sam/.fzf/shell/key-bindings.zsh"
