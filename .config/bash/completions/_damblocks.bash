# vim:ft=sh
# @author nate zhou
# @since 2026
# bash completion for damblocks

_damblocks() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="--fifo --xsetroot"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _damblocks damblocks
