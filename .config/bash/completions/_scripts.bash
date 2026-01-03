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

_capture() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-6 --60 -m --mkv -M --mute"
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
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
