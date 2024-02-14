# -----------------------------------------------------------------------------------------
# PROMPT

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
# PROMPT="[%B%F{cyan}%*%f%b] %K{black}%F{green}%n%f%k%K{black}%F{green}@%f%k%K{black}%F{green}%M%f%k%K{black} %F{cyan}%d%f%k%B%F{cyan} > %f%b"
# PROMPT="[%F{cyan}%*%f] %F{green}%n%f%F{green}@%f%F{green}%M%f:%F{cyan}%~%B%F{blue} \$vcs_info_msg_0_ > %f%b"

# With git [!] SLOWS
# PROMPT="%F{cyan}%*%f #%F{green}%n%f %F{cyan}%3~%B%F{blue} \$vcs_info_msg_0_ > %f%b"
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%f'

# Without git
PROMPT="%F{cyan}%*%f %F{blue}✡%f%F{green}%n%f %F{cyan}%3~%B%F{blue} > %f%b"

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
