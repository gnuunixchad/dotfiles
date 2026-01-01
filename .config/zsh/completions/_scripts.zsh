# vim:ft=sh
# @author nate zhou
# @since 2025
# zsh completion for my scripts in ${HOME}/.local/bin/*

_saddle() {
    local options
    options=("-m" "--mount" "-u" "--unmount" "-p" "--power-off" "-e" "--eject")
    _describe 'options' options
}
compdef _saddle saddle

_seal() {
    local options
    options=("-c" "--cipher" "-e" "--encrypt" "-d" "--decrypt" "-r" "-rifle" \
             "-s" "--sign" "-v" "--verify")
    _describe 'options' options
}
compdef _seal seal

_phone() {
    local options
    options=("-l" "--list" "-m" "--mount" "-u" "--unmount")
    _describe 'options' options
}
compdef _phone phone
_address() {
    local options
    options=("-e" "--edit")
    _describe 'options' options
}
compdef _address address

_capture() {
    local options
    options=("-6" "--60" "-m" "--mkv" "-M" "--mute")
    _describe 'options' options
}
compdef _capture capture

_bright() {
    local options
    options=("--minus" "--minus10" "--plus" "--plus10" "--max" "--min" "--no-fifo")
    _describe 'options' options
}
compdef _bright bright

_audio() {
    local targets options
    targets=("sink" "source" "all")
    options=("--minus" "--minus10" "--plus" "--plus10" "--mute" "--reload")
    if [ "$CURRENT" -eq 2 ]; then
        compadd "${targets[@]}"
    elif [ "$CURRENT" -eq 3 ]; then
        compadd "${options[@]}"
    fi
}
compdef _audio audio

_sync-to() {
    local options
    options=($(cat ~/.ssh/known_hosts | cut -d' ' -f1 | sort | uniq))
    _describe 'options' options
}
compdef _sync-to sync-to
