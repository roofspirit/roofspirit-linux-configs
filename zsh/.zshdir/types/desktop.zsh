declare -a __zsh_sources=(
    # Base
    "$MY_ZSHDIR/sources/ohmyzsh-settings.zsh"
    "$MY_ZSHDIR/sources/zshrc.zsh"
    "$MY_ZSHDIR/sources/git-prompt.zsh"
    "$MY_ZSHDIR/sources/prompt.zsh"

    # Utils
    "$MY_ZSHDIR/sources/shell-utils.zsh"
    "$MY_ZSHDIR/sources/utils/python.zsh"
    "$MY_ZSHDIR/sources/utils/conda.zsh"
    "$MY_ZSHDIR/sources/utils/rust.zsh"
    "$MY_ZSHDIR/sources/utils/pnpm.zsh"
    "$MY_ZSHDIR/sources/utils/uv.zsh"

    # Hidden
    "$MY_ZSHDIR/sources/hidden/envs.zsh"
    "$MY_ZSHDIR/sources/hidden/git-profiles.zsh"
)
