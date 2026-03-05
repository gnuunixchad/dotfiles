# vim:ft=sh
# @author nate zhou
# @since 2026
# zsh completion for ${HOME}/.local/bin/startw

_startw() {
    local options
    options=("dwl" "river-classic" "river" "sway")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    fi
}
compdef _startw startw
