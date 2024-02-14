# -----------------------------------------------------------------------------------------
# PROMPT

# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# PROMPT="[%B%F{cyan}%*%f%b] %K{black}%F{green}%n%f%k%K{black}%F{green}@%f%k%K{black}%F{green}%M%f%k%K{black} %F{cyan}%d%f%k%B%F{cyan} > %f%b"
# PROMPT="[%F{cyan}%*%f] %F{green}%n%f%F{green}@%f%F{green}%M%f:%F{cyan}%~%B%F{blue} \$vcs_info_msg_0_ > %f%b"

# -------------------------------------------
#  With git [!] SLOWS

# PROMPT="%F{cyan}%*%f #%F{green}%n%f %F{cyan}%3~%B%F{blue} \$vcs_info_msg_0_ > %f%b"
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%f'

# -------------------------------------------
# Without git

# PROMPT="%F{cyan}%*%f %F{blue}✡%f%F{green}%n%f %F{cyan}%3~%B%F{blue} > %f%b"

# -------------------------------------------
# With github.com/woefe/git-prompt.zsh plugin

# Name: [Pure](https://github.com/sindresorhus/pure) clone
# Description:
#  This clone of the Pure prompt has support for Python virtualenvs, but none of the timing
#  features or a vi mode. If you are using [fzf](https://github.com/junegunn/fzf), source the
#  example after sourcing fzf's keybindings.
#
#  If you want to try other examples again after sourcing the Pure example, you might have to
#  restart your shell, because this prompt will always print a newline between prompts.

ZSH_GIT_PROMPT_FORCE_BLANK=1
ZSH_GIT_PROMPT_SHOW_UPSTREAM="no"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_no_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_no_bold[magenta]%}"
# ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
# ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
# ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
# ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_no_bold[cyan]%}↓"
# ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_no_bold[cyan]%}↑"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
# ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
# ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
# ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# In the second line of the prompt $psvar[12] is read
# PROMPT=$'%F{blue}%~%f %F{242}$(gitprompt)%f
# %(12V.%F{242}%12v%f .)%(?.%F{magenta}.%F{red})❯%f '

PROMPT=$'%(12V.%F{242}%12v%f .)%(?.%F{magenta}.%F{red})%F{cyan}%*%f %F{blue}✡%f%F{green}%n%f %F{cyan}%3~%f $(gitprompt)%B%F{blue}> %f%b'
RPROMPT=''

setup() {
    [[ -n $_PROMPT_INITIALIZED ]] && return
    _PROMPT_INITIALIZED=1

    # Prevent Python virtualenv from modifying the prompt
    export VIRTUAL_ENV_DISABLE_PROMPT=1

    # Set $psvar[12] to the current Python virtualenv
    function _prompt_update_venv() {
        psvar[12]=
        if [[ -n $VIRTUAL_ENV ]] && [[ -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
            psvar[12]="${VIRTUAL_ENV:t}"
        fi
    }
    add-zsh-hook precmd _prompt_update_venv

    # Draw a newline between every prompt
    # function _prompt_newline(){
    #     if [[ -z "$_PROMPT_NEWLINE" ]]; then
    #         _PROMPT_NEWLINE=1
    #     elif [[ -n "$_PROMPT_NEWLINE" ]]; then
    #         echo
    #     fi
    # }
    # add-zsh-hook precmd _prompt_newline

    # To avoid glitching with fzf's alt+c binding we override the fzf-redraw-prompt widget.
    # The widget by default reruns all precmd hooks, which prints the newline again.
    # We therefore run all precmd hooks except _prompt_newline.
    # function fzf-redraw-prompt() {
    #     local precmd
    #     for precmd in ${precmd_functions:#_prompt_newline}; do
    #         $precmd
    #     done
    #     zle reset-prompt
    # }
}
setup

# -----------------------------------------------------------------------------------------
# MY ENVIRONMENT VARIABLES

BAT_THEME="ansi"
PASS_DB="~/my/Passwords.kbdx"
EDITOR="micro"

# Rust cargo apps
export PATH="$PATH:~/.cargo/bin"

# -----------------------------------------------------------------------------------------
# MY ALIASES

# Basic
alias l='exa -lhg --icons --git --ignore-glob="*.pyc"'
alias ll="exa -alhg --icons --git"
alias llr="exa -alhg --icons --git --recurse"
alias tree='exa -lhg --icons --tree --git --ignore-glob="*.pyc"'
alias rg='rg -.'

# Terminal & Shells
alias kcl='clone-in-kitty'
alias src-act='source bin/activate'
alias conda-start="~/miniconda3/etc/profile.d/conda.sh"
alias ipy="ipython"

# SSH
alias kit-ssh='kitty +kitten ssh'

# Tools
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan'
alias json_viewer="jless"

# Applications
alias code-low-scale='code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland'

# Power management
alias power-sleep='systemctl suspend'
alias power-hibernate='systemctl hibernate'
alias power-shutdown='systemctl poweroff'
alias power-reboot='systemctl reboot'
alias lock-session='loginctl lock-session'

# Drives
alias mount-win='sudo mount /dev/nvme0n1p3 /media/windows'
alias mount-toshiba-680='sudo mount /dev/$(lsblk | grep -o "sd\w" | tail -1)2 /ext_drv/toshiba-680gb'

# -----------------------------------------------------------------------------------------
# MY FUNCS
function backitup() {
	cur_dtm=$(date +%Y-%m-%d_%H-%M-%S)
	bck_nme="${1}.backup_${cur_dtm}"
	cp $1 $bck_nme
}

function litexl() {
	lit_opt=$1
	nohup lite-xl $lit_opt > /dev/null & disown %1
}

# function screen_brightness_increase() {
# 	relative_step=0.05
# 	current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
# 	max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
# 	absolute_step=$(($max_brightness*$relative_step))
# 	new_brightness=$(($current_brightness+absolute_step))
# 	echo $new_brightness > /sys/class/backlight/intel_backlight/brightness
# }
# 
# function screen_brightness_decrease() {
# 	relative_step=0.05
# 	current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
# 	max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
# 	absolute_step=$(($max_brightness*$relative_step))
# 	new_brightness=$(($current_brightness-absolute_step))
# 	echo $new_brightness > /sys/class/backlight/intel_backlight/brightness
# }
