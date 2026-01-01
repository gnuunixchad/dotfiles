# vim:ft=sh
# @author nate zhou
# @since 2025, 2026
# functions in `~/.config/zsh/functions.zsh`

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
