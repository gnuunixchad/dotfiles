# vim:ft=sh
# @author nate zhou
# @since 2026
# bash completion for ${HOME}/.local/bin/startw

_startw() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="dwl river-classic river sway"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _startw startw
