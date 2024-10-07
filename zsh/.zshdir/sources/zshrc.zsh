# -----------------------------------------------------------------------------------------
# MY DIRECTORIES
mkdir -p $HOME/.Trash

# MY ENVIRONMENT VARIABLES

export BAT_THEME="ansi"
export PASS_DB="~/my/Passwords.kbdx"
export PASSWORD_STORE_CLIP_TIME=28800
export EDITOR="micro"
export BROWSER="google-chrome-unstable"
export SSL_CERT_DIR=/etc/ssl/certs
export LANG=en_US.UTF-8
export ANSIBLE_NOCOWS=1
export ELECTRON_OZONE_PLATFORM_HINT=wayland
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

function clear-screen-and-scrollback() {
    printf "\e[H\e[3J"
}

function watch-asb() {
	local command="$1"
	local file="$2"
	local entr_command="clear && $command $file"
	# echo $entr_command
	tput smcup && ls $file | entr -s $entr_command && tput rmcup
}

# function watch-python() {
# 	local pyscript="$1"
# 	watch-asb "python -c $1"
# }
# 
# 

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


# -----------------------------------------------------------------------------------------
# MY ALIASES

# Basic
alias cd='cd -P'
alias l='exa -lhg -s type --icons --git --ignore-glob="*.pyc"'
alias ll="exa -alhg -s type --icons --git"
alias lll="exa -aalhg -s type --icons --git"
alias llr="exa -alhg -s type --icons --git --recurse"
alias tree='exa -lhg -s type --icons --tree --git --ignore-glob="*.pyc"'
alias treel='exa -alhg -s type --icons --tree --git --ignore-glob="*.pyc"'
alias rg='rg -.'

alias clr='clear-screen-and-scrollback'

alias cbc='clipcopy'
alias cbp='clippaste'

# alias rm='echo "Nope, use trash-cli (trs)"'
alias trs='trash-put'
alias trsls='trash-list | sort -nk1'
alias trsemp='trash-empty'
alias trsrm='trash-rm'
alias trsrst='trash-restore'


# Terminal & Shells
alias kcl='clone-in-kitty'
alias src-act='source bin/activate'
alias src-act-poe='source .venv/bin/activate'
alias conda-start="~/miniconda3/etc/profile.d/conda.sh"
alias ipy="ipython"

# SSH
alias kit-ssh='kitty +kitten ssh'

# Tools
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan'
alias json_viewer="jless"
alias chrome="google-chrome-stable"
alias lazypodman='DOCKER_HOST=unix:///run/user/1000/podman/podman.sock lazydocker'

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
