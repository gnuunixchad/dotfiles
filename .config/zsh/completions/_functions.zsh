# vim:ft=sh
# @author nate zhou
# @since 2025, 2026
# functions in `~/.config/{shell,zsh}/functions.zsh`

_hist() {
    local options
    options=("-d" "--disable"
             "-e" "--enable"
             "-f" "--file"
             "-D" "--Delete"
             "-h" "--help")
    _describe 'options' options
}
compdef _hist hist

_package() {
    local options
    options=($(pacman -Qq))
    _describe 'options' options
}
compdef _package plb
compdef _package pll
compdef _package pld
compdef _package what
compdef _package diffpkg
