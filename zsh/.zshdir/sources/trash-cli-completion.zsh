#compdef trash-list

# AUTOMATICALLY GENERATED by `shtab`


_shtab_trash_list_commands() {
  local _commands=(
    
  )
  _describe 'trash-list commands' _commands
}

_shtab_trash_list_options=(
  "(- : *)"{-h,--help}"[show this help message and exit]"
  "(- : *)--print-completion[print shell completion script]:print_completion:(bash zsh tcsh)"
  "--version[show program\'s version number and exit]"
  "--volumes[list volumes]"
  "--trash-dirs[list trash dirs]"
  "*--trash-dir[specify the trash directory to use]:trash_dirs:(${$(trash-list --trash-dirs)#parent_*:})"
  "--all-users[list trashcans of all the users]"
)


_shtab_trash_list() {
  local context state line curcontext="$curcontext" one_or_more='(-)*' remainder='(*)'

  if ((${_shtab_trash_list_options[(I)${(q)one_or_more}*]} + ${_shtab_trash_list_options[(I)${(q)remainder}*]} == 0)); then  # noqa: E501
    _shtab_trash_list_options+=(': :_shtab_trash_list_commands' '*::: :->trash-list')
  fi
  _arguments -C -s $_shtab_trash_list_options

  case $state in
    trash-list)
      words=($line[1] "${words[@]}")
      (( CURRENT += 1 ))
      curcontext="${curcontext%:*:*}:_shtab_trash_list-$line[1]:"
      case $line[1] in
        
      esac
  esac
}

# Custom Preamble

# https://github.com/zsh-users/zsh/blob/19390a1ba8dc983b0a1379058e90cd51ce156815/Completion/Unix/Command/_rm#L72-L74
_trash_files() {
  (( CURRENT > 0 )) && line[CURRENT]=()
  line=( ${line//(#m)[\[\]()\\*?#<>~\^\|]/\\$MATCH} )
  _files -F line
}

# End Custom Preamble


typeset -A opt_args
_shtab_trash_list "$@"
