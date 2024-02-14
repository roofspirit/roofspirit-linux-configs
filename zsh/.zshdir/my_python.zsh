# PYTHON ================================================================================

# Something for pyenv
export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Created by `pipx` on 2023-07-28 16:35:55
export PATH="$PATH:/home/ricky/.local/bin"

# Locales for Python
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# CONDA ==================================================================================

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/miniconda3/etc/profile.d/conda.sh" ]; then
        . "~/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
compinit conda
