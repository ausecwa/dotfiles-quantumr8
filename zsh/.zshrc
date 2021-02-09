# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|

# Sources
export TERM="xterm-256color"

# color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias pacman='pacman --color=auto'

# Aliases for a few useful commands
alias ls='lsd'
alias lls='lsd -l'
alias lla='lsd -la'
alias lt='lsd --tree'
alias cat="bat"
alias mirrorUpdate="sudo reflector --latest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias t="tmux"
alias vim="nvim"
alias x="ranger"
alias pls="sudo !!"
alias vi="nvim"
alias neofetch="neofetch | lolcat"

# Git aliases
alias gaa='git add --all'
alias gp='git push'
alias gst='git status'
alias gtp='git-ftp push'

ZSH_THEME="powerlevel10k/powerlevel10k"

# Show OS info when opening a new terminal
# neofetch

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Plugins to load
plugins=(git colorize virtualenv zsh-autosuggestions zsh-syntax-highlighting)
export ZSH="/home/sam/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f0000,underline"
ZSH_AUTOSUGESST_STRATEGY=(history completion)
POWERLEVEL9K_LEGACY_ICON_SPACING=true

# Functions

rule () {
	print -Pn '%F{blue}'
	local columns=$(tput cols)
	for ((i=1; i<=columns; i++)); do
	   printf "\u2588"
	done
	print -P '%f'
}

function _my_clear() {
	echo
	rule
	zle clear-screen
}
zle -N _my_clear
bindkey '^l' _my_clear
bindkey '^ ' autosuggest-accept
bindkey '^]' autosuggest-toggle


# Ctrl-O opens zsh at the current location, and on exit, cd into ranger's last location.
ranger-cd() {
	tempfile=$(mktemp)
	ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
	test -f "$tempfile" &&
	if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
	cd -- "$(cat "$tempfile")"
	fi
	rm -f -- "$tempfile"
	# hacky way of transferring over previous command and updating the screen
	VISUAL=true zle edit-command-line
}
zle -N ranger-cd
bindkey '^o' ranger-cd
bindkey '^ ' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
