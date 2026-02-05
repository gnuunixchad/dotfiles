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

_os() {
    local options
    options=("-a" "-d" "-l" "-o" "-t" "-h")
    used=(${words[2,-1]})
    remaining=(${options:|used})
    _describe 'options' remaining
}
compdef _os os

_cropper() {
    local options
    options=("-t" "-b" "-l" "-r")
    used=(${words[2,-1]})
    remaining=(${options:|used})
    _describe 'options' remaining
}
compdef _cropper cropper

_lucia() {
    local options
    options=("-a" "--alter" "-e" "--enlighten" "-E" "--eclipse" \
             "-d" "--demonize" "-r" "--rotate" "-p" "--peruse")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    fi
}
compdef _lucia lucia

_xwl() {
    # complete 1st positional parameter with executables in PATH
    if [ "$CURRENT" -eq 2 ]; then
        compadd - ${(k)commands}
    else
    # complete the rest with the executables' original completion
        shift words
        (( CURRENT-- ))
        _normal
    fi
}
compdef _xwl xwl

_ytv() {
    local options
    options=("--height" "--format")
    used=(${words[2,-1]})
    remaining=(${options:|used})
    _describe 'options' remaining
}
compdef _ytv ytv

_mu() {
    local options
    # avoid `comm=` format in `ps` which truncates long commands, resulting
    # incomplete command names for `.local/bin/mu` to find the PIDs.
    options=($(ps -e -o cmd= | sed 's/^\[//; s/\]$//' | cut -d' ' -f1))
    _describe 'options' options
}
compdef _mu mu

_muttauth() {
    local options
    options=("--provider" "--authflow" "--client-id" "--token-dir" "--help")
    used=(${words[2,-1]})
    remaining=(${options:|used})
    _describe 'options' remaining
}
compdef _muttauth muttauth

_reload() {
    local options
    options=("--cronjobs" "--damblocks-fifo" "--damblocks-xsetroot" "--help")
    used=(${words[2,-1]})
    remaining=(${options:|used})
    _describe 'options' remaining
}
compdef _reload reload

_wttr() {
    local options
    options=("-u" "--update" "-c" "--cron" "-e" "--edit" "-h" "--help")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    fi
}
compdef _wttr wttr

_wobd() {
    local options
    options=("-c" "--config")
    if [ "$CURRENT" -eq 2 ]; then
        _describe 'options' options
    elif [ "$CURRENT" -eq 3 ]; then
        _files "$@"
    fi
}
compdef _wobd wobd
