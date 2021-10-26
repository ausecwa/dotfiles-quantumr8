
#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|
#

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
export ZSH="/home/sam/.oh-my-zsh"
source ~/.zinit/bin/zinit.zsh
typeset -A ZINIT

load=light

zinit $load romkatv/powerlevel10k
zinit $load junegunn/fzf
zinit $load hcgraf/zsh-sudo
zinit $load wting/autojump
zinit $load jeffreytse/zsh-vi-mode
zinit $load b4b4r07/enhancd

zinit ice silent wait!1 atload"ZINIT[COMPINIT_OPTS]=-C; zpcompinit"
zinit $load zdharma/fast-syntax-highlighting

zinit ice silent wait:1 atload:_zsh_autosuggest_start
zinit $load zsh-users/zsh-autosuggestions

plugins=(
	git
	colorize
	virtualenv
	zsh-autosuggestions
	fast-syntax-highlighting
	fzf
	zsh-sudo
	autojump
	zsh-vi-mode
	enhancd
)


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Sources
export GPG_TTY=$(tty)
export TERM="xterm-256color"
export npm_config_prefix=~/.node_modules
export PATH=$PATH:~/.node_modules/bin

# color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# Aliases for a few useful commands
alias ls='lsd'
alias lls='lsd -l'
alias lla='lsd -la'
alias lt='lsd --tree'
alias cat="bat"
alias t="todo.sh -c"
alias vim="nvim"
alias x="ranger"
alias pls="sudo !!"
alias localip="ip addr show eth1 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'"
alias publicip="curl -4 icanhazip.com"
#alias vi="nvim"
#alias neofetch="neofetch | lolcat"

# Git aliases
alias gaa='git add --all'
alias gps='git push'
alias gpl='git pull'
alias gst='git status'
alias gtp='git-ftp push'


# Show OS info when opening a new terminal
# neofetch

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f0000,underline"
ZSH_AUTOSUGESST_STRATEGY=(history completion)
POWERLEVEL9K_LEGACY_ICON_SPACING=true
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ $SSH_CLIENT =~ .*51.* ]]; then
	[[ ! -f ~/.p10k-ssh.zsh ]] || source ~/.p10k-ssh.zsh
elif [[ $GPG_TTY =~ \/dev\/tty. ]]; then
	[[ ! -f ~/.p10k-tty.zsh ]] || source ~/.p10k-tty.zsh
else
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
