# .config/zsh/aliases.zsh
# @author nate zhou
# @since 2025
# zsh specific aliases

alias .r=". ~/.zprofile && . ~/.zshrc"

autoload -Uz run-help # bash like help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

alias bash="bash --login"
