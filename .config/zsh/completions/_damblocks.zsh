# vim:ft=sh
# @author nate zhou
# @since 2026
# zsh completion for damblocks

_damblocks() {
    local options
    options=("--fifo")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    fi
}
compdef _damblocks damblocks
