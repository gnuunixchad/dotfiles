# .config/zsh/aliases.zsh
# @author nate zhou
# @since 2025,2026
# zsh specific aliases

alias .r=". ~/.zprofile && . ~/.zshrc"
alias rh="rehash"

autoload -Uz run-help # bash like help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

alias bash="bash --login"
