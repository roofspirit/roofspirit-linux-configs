export MY_ZSHDIR="$HOME/.zshdir"

source "$MY_ZSHDIR/types/$MY_ZSHDIR_TYPE.zsh"

for __zsh_source in "${__zsh_sources[@]}"
do
   source $__zsh_source
done