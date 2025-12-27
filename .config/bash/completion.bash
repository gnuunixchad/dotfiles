# vim:ft=sh
# @author nate zhou
# @since 2025
# bash completion for my scripts in ${HOME}/.local/bin/*

_saddle() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-m --mount -u --unmount -p --power-off -e --eject"
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
}
complete -F _saddle saddle

_seal() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-c --cipher -e --encrypt -d --decrypt -r -rifle -s --sign
             -v --verify"
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
}
complete -F _seal seal

_phone() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-l --list -m --mount -u --unmount"
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
}
complete -F _phone phone

_address() {
    local options
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    options="-e --edit"
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
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
    COMPREPLY=($(compgen -W "${options}" -- ${current_word}))
}
complete -F _bright bright
