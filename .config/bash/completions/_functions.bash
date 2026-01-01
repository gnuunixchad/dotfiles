# vim:ft=sh
# @author nate zhou
# @since 2025, 2026
# functions in `~/.config/{shell,bash}/functions.zsh`

_hist() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-d --disable -e --enable -f --file -D --Delete -h --help"
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
}
complete -F _hist hist

_package() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="$(pacman -Qq)"
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
}
complete -F _package plb
complete -F _package pll
complete -F _package pld
complete -F _package what
complete -F _package diffpkg
