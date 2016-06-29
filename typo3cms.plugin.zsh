#compdef typo3cms

_typo3cms_get_command_list () {
    $_comp_command1 2>/dev/null | sed "1,/Available commands/d" | awk '$1 ~ /:/ { print $1 }'
}

_typo3cms () {
  local curcontext="$curcontext" state line
  typeset -A opt_args
  _arguments \
    '1: :->command' \
    '*: :->opts'

  case $state in
    command)
      compadd $(_typo3cms_get_command_list)
      ;;
    *)
      compadd ''
      ;;
  esac
}

compdef _typo3cms typo3cms
compdef _typo3cms ./typo3cms
