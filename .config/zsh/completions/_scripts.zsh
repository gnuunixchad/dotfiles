# vim:ft=sh
# @author nate zhou
# @since 2025,2026
# zsh completion for my scripts in ${HOME}/.local/bin/*

_saddle() {
    local options
    options=("-m" "--mount" "-u" "--unmount" "-p" "--power-off" "-e" "--eject")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    fi
}
compdef _saddle saddle

_seal() {
    local options
    options=("-c" "--cipher" "-e" "--encrypt" "-d" "--decrypt" "-r" "-rifle" \
             "-s" "--sign" "-v" "--verify")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    elif [ "$CURRENT" -eq 3 ]; then
        _files "$@"
    fi
}
compdef _seal seal

_phone() {
    local options
    options=("-l" "--list" "-m" "--mount" "-u" "--unmount")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    fi
}
compdef _phone phone
_address() {
    local options
    options=("-e" "--edit")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    fi
}
compdef _address address

_capture() { # do not suggest options that have already been typed
    local options used remaining
    options=("-6" "--60" "-m" "--mkv" "-M" "--mute")
    # $words array continas everything been typed in the current command line
    used=(${words[2,-1]})
    remaining=(${options:|used})
    _describe 'options' remaining
}
compdef _capture capture

_bright() {
    local options
    options=("--minus" "--minus10" "--plus" "--plus10" "--max" "--min" "--no-fifo")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    fi
}
compdef _bright bright

_audio() {
    local targets options
    targets=("sink" "source" "all")
    options=("--minus" "--minus10" "--plus" "--plus10" "--mute" "--reload")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'targets' targets
    elif [ "$CURRENT" -eq 3 ]; then
        _describe 'options' options
    fi
}
compdef _audio audio

_sync-to() {
    local options
    options=($(grep '^Host ' ~/.ssh/servers.conf | cut -d' ' -f2-) \
             $(cat ~/.ssh/known_hosts | cut -d' ' -f1 | sort | uniq))
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    fi
}
compdef _sync-to sync-to
