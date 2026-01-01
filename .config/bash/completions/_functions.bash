# vim:ft=sh
# @author nate zhou
# @since 2025, 2026
# functions in `~/.config/bash/functions.zsh`

_hist() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-d --disable -e --enable -f --file -D --Delete -h --help"
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
}
complete -F _hist hist
