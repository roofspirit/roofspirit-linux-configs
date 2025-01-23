# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

# MY ZSH-SYNTAX-HIGHLIGHTING
typeset -A ZSH_HIGHLIGHT_STYLES

# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[comment]='fg=magenta,bold'

source $ZSH/oh-my-zsh.sh
autoload -Uz compinit && compinit
source <(fx --comp zsh)

# zsh completions
autoload -U compinit && compinit -u
