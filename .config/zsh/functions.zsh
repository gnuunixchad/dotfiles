# .config/zsh/functions.zsh
# @author nate zhou
# @since 2025
# zsh specific functions

function osc7-pwd() { # new footclient in current working directory for zsh
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}
function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd chpwd-osc7-pwd

function zle-keymap-select () { # vi indicator cursor
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';; # normal mode
        viins|main) echo -ne '\e[6 q';; # insert mode
    esac
}
zle -N zle-keymap-select

# initiate `vi insert` as keymap
function zle-line-init() {
    zle -K viins
}
zle -N zle-line-init

#echo -ne '\e[6 q' # insert mode cursor on start up
#preexec() { echo -ne '\e[6 q' ;} # insert mode  cursor for new prompt

# line editor v in normal mode
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# shell history switch
function hist() {
    PROFILE="${HOME}/.zprofile"

    function status() {
        if [ -z "$HISTFILE" ]; then
            echo "[zsh]: history is disabled"
        else
            echo "[zsh]: history is enabled"
        fi
    }

    function disable() {
        unset HISTFILE && prompt # `prompt()` defined in zshrc
        status
    }

    function enable() {
        eval "$( grep '^export HISTFILE=' $PROFILE)" && prompt
        status
    }

    function delete() {
        selection=$(cat "$HISTFILE" | nl -n'ln' -s' ' \
            | /usr/bin/fzf --height 50% --no-preview --wrap \
                           --layout=reverse-list --color \
                           --tac \
                   )
        [ -z "$selection" ] && echo aboarted && return
        echo "$selection"

        lineNumber=$(echo "$selection" | cut -d' ' -f1)
        read "?Delete history entry? (y/n): "
        [ "$REPLY" = "y"  ] && sed -i "${lineNumber}d" "$HISTFILE" || echo aborted
    }

    function print_help() {
        cat <<_EOF_
USAGE
        $(basename "$0") [OPTIONS]
OPTIONS
        -d,--disable    disable shell history for current session
        -D, --Delete    choose a history to be deleted
        -e,--enable     enable shell history for current session
        -f,--file       print shell history file for current session
        -h,--help       print this help info
_EOF_
    }

    [ -z "$1" ] && status

    while [ -n "$1" ]; do
        case "$1" in
            -d|--disable) disable;;
            -e|--enable) enable;;
            -f|--file) echo "[zsh]: history is saved to $HISTFILE";;
            -D|--Delete) delete;;
            -h|--help) print_help;;
            *) print_help;;
        esac
        shift
    done
}
_hist() {
    local options
    options=("-d" "-e" "-f" "-D" "-h")
    _describe 'options' options
}
compdef _hist hist
