# vim:ft=sh
# @author nate zhou
# @since 2025,2026
# bash completion for my scripts in ${HOME}/.local/bin/*

_saddle() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-m --mount -u --unmount -p --power-off -e --eject"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _saddle saddle

_seal() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-c --cipher -e --encrypt -d --decrypt -r -rifle -s --sign
             -v --verify"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    elif [ "$COMP_CWORD" -eq 2 ]; then
        COMPREPLY=($(compgen -A file -- "${COMP_WORDS[COMP_CWORD]}"))
    fi
}
complete -F _seal seal

_phone() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-l --list -m --mount -u --unmount"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _phone phone

_address() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-e --edit"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _address address

_capture() { # do not suggest options that have already been typed
    local options used remaining
    options=(-6 --60 -m --mkv -M --mute)
    # $used array contains everything been typed in the current command line
    [ $COMP_CWORD -ge 2 ] && used=("${COMP_WORDS[@]:1:COMP_CWORD-1}") || used=()
    for opt in "${options[@]}"; do
        if [[ ! " ${used[@]} " =~ " $opt " ]]; then
            remaining+=("$opt")
        fi
    done
    COMPREPLY=($(compgen -W "${remaining[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
}

complete -F _capture capture
_bright() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="--minus --minus10 --plus --plus10 --max --min --no-fifo"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _bright bright

_audio() {
    local targets options
    targets="sink source all"
    options="--minus --minus10 --plus --plus10 --mute --reload"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=( $(compgen -W "${targets[*]}" -- "${COMP_WORDS[1]}") )
    elif [ "$COMP_CWORD" -eq 2 ]; then
        COMPREPLY=( $(compgen -W "${options[*]}" -- "${COMP_WORDS[2]}") )
    fi
}
complete -F _audio audio

_sync-to() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="$(grep '^Host ' ~/.ssh/servers.conf | cut -d' ' -f2-)\
             $(cat ~/.ssh/known_hosts | cut -d' ' -f1 | sort | uniq)"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _sync-to sync-to

_os() {
    local options used remaining
    options=(-a -d -l -o -t -h)
    [ $COMP_CWORD -ge 2 ] && used=("${COMP_WORDS[@]:1:COMP_CWORD-1}") || used=()
    for opt in "${options[@]}"; do
        if [[ ! " ${used[@]} " =~ " $opt " ]]; then
            remaining+=("$opt")
        fi
    done
    COMPREPLY=($(compgen -W "${remaining[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _os os

_cropper() {
    local options used remaining
    options=(-t -b -l -r)
    [ $COMP_CWORD -ge 2 ] && used=("${COMP_WORDS[@]:1:COMP_CWORD-1}") || used=()
    for opt in "${options[@]}"; do
        if [[ ! " ${used[@]} " =~ " $opt " ]]; then
            remaining+=("$opt")
        fi
    done
    COMPREPLY=($(compgen -W "${remaining[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _cropper cropper

_lucia() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-a --alter -e --enlighten -E --eclipse -d --demonize -r --rotate \
             -p --peruse"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _lucia lucia

_xwl() {
    _init_completion || return
    # complete 1st positional parameter with executables in PATH
    if [ "$COMP_CWORD" -eq 1 ]; then
        mapfile -t COMPREPLY < <(compgen -c -- "$cur")
        return 0
    fi
    # complete the rest with the executables' original completion
    _command_offset 1
}
complete -F _xwl xwl

_ytv() {
    local options used remaining
    options=(--height --format)
    [ $COMP_CWORD -ge 2 ] && used=("${COMP_WORDS[@]:1:COMP_CWORD-1}") || used=()
    for opt in "${options[@]}"; do
        if [[ ! " ${used[@]} " =~ " $opt " ]]; then
            remaining+=("$opt")
        fi
    done
    COMPREPLY=($(compgen -W "${remaining[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _ytv ytv

_mu() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    # avoid `comm=` format in `ps` which truncates long commands, resulting
    # incomplete command names for `.local/bin/mu` to find the PIDs.
    options="$(ps -e -o cmd= | sed 's/^\[//; s/\]$//' | cut -d' ' -f1)"
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
}
complete -F _mu mu

_muttauth() {
    local options used remaining
    options=(--provider --authflow --client-id --token-dir --help)
    [ $COMP_CWORD -ge 2 ] && used=("${COMP_WORDS[@]:1:COMP_CWORD-1}") || used=()
    for opt in "${options[@]}"; do
        if [[ ! " ${used[@]} " =~ " $opt " ]]; then
            remaining+=("$opt")
        fi
    done
    COMPREPLY=($(compgen -W "${remaining[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _muttauth muttauth

_reload() {
    local options used remaining
    options=(--cronjobs --damblocks-fifo --damblocks-xsetroot --help)
    [ $COMP_CWORD -ge 2 ] && used=("${COMP_WORDS[@]:1:COMP_CWORD-1}") || used=()
    for opt in "${options[@]}"; do
        if [[ ! " ${used[@]} " =~ " $opt " ]]; then
            remaining+=("$opt")
        fi
    done
    COMPREPLY=($(compgen -W "${remaining[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _reload reload

_wttr() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-u --update -c --cron -e --edit -h --help"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _wttr wttr

_wobd() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-c --config"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    elif [ "$COMP_CWORD" -eq 2 ]; then
        COMPREPLY=($(compgen -A file -- "${COMP_WORDS[COMP_CWORD]}"))
    fi
}
complete -F _wobd wobd

_xobd() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-c --config"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    elif [ "$COMP_CWORD" -eq 2 ]; then
        COMPREPLY=($(compgen -A file -- "${COMP_WORDS[COMP_CWORD]}"))
    fi
}
complete -F _xobd xobd

_clip() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="--wipe --help"
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
    fi
}
complete -F _clip clip
