ZSH_GIT_PROMPT_FORCE_BLANK=1
ZSH_GIT_PROMPT_SHOW_UPSTREAM="no"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
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
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# In the second line of the prompt $psvar[12] is read
# PROMPT=$'%F{blue}%~%f %F{242}$(gitprompt)%f
# %(12V.%F{242}%12v%f .)%(?.%F{magenta}.%F{red})❯%f '

PROMPT=$'%(12V.%F{white}%12v%f .)%(?.%F{magenta}.%F{red})%F{cyan}%*%f %F{blue}✡%f%F{green}%n%f %F{cyan}%3~%f $(gitprompt) %B%F{blue}> %f%b'
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
}
setup

