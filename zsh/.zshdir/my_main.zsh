# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
# MY ZSH-SYNTAX-HIGHLIGHTING
typeset -A ZSH_HIGHLIGHT_STYLES
# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[comment]='fg=magenta,bold'

# Prompts for zsh
setopt PROMPT_SUBST
PROMPT="[%B%F{cyan}%*%f%b] %K{black}%F{green}%n%f%k%K{black}%F{green}@%f%k%K{black}%F{green}%M%f%k%K{black} %F{cyan}%d%f%k%B%F{cyan} > %f%b"
# PROMPT="[%B%F{cyan}%*%f%b] %K{black}%F{green}%n%f%k%K{black}%F{green}@%f%k%K{black}%F{green}%M%f%k%K{black}%F{cyan}%d%f%k ${vcs_info_msg_0} %B%F{cyan} > %f%b"
#PROMPT="[%B%F{73}%T%f%b] %K{24}%n%k%K{24}@%k%K{24}%M%k%K{56}%d%k%B%F{cyan} > %f%b"
#PROMPT="[%B%F{105}%T%f%b] %K{90}%F{200}%n%f%k%K{90}@%k%K{90}%M%k%K{56}%d%k%B%F{199} > %f%b"
# RPROMPT="git: $(git_current_branch)" 

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

fpath+=~/.zfunc
autoload -Uz compinit && compinit
