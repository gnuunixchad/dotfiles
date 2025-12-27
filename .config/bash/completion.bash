# vim:ft=sh
# @author nate zhou
# @since 2025
# bash completion for my scripts in ${HOME}/.local/bin/*

_saddle() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-m --mount -u --unmount -p --power-off -e --eject"

    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))

}
complete -F _saddle saddle
