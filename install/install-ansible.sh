# Package manager (PM)
cur_pm="$(ls /usr/bin | grep -E '^(pacman|apt|apk|dnf|yum)$')"
# PMs install commands
declare -A pms_install_commands=( 
    ["pacman"]="pacman --noconfirm -S "
    ["apt"]="apt -y install "
    ["dnf"]="dnf -y install "
    ["apk"]="apk add "
)

pm_ins="${pms_install_commands[$cur_pm]}" # current PM install command
install_ansible_core="$pm_ins ansible-core" # command for installing ansible-core
$install_ansible_core # Install ansible core
ansible-galaxy collection install community.general # Install ansible community.general module