# bash/functions.sh
# @author nate zhou
# @since 2025
# bash specific functions

osc7_cwd() { # new footclient in current working directory for bash
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+${PROMPT_COMMAND%;}; }osc7_cwd

help() { # read help with a pager
    help_output=$(command help "$@")
    [ "$?" -eq 0 ] && echo "$help_output" | /usr/bin/less -i
}

# shell history switch
hist() {
    PROFILE="${HOME}/.profile"

    status() {
        if [ -z "$HISTFILE" ]; then
            echo "[bash]: history is disabled"
        else
            echo "[bash]: history is enabled"
        fi
    }

    disable() {
        unset HISTFILE
        status
    }

    enable() {
        eval "$( grep '^export HISTFILE=' $PROFILE)"
        status
    }

    help() {
        cat <<_EOF_
USAGE
        $(basename "$0") [OPTIONS]
OPTIONS
        -d,--disable    disable shell history for current session
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
            -f|--file) echo "[bash]: history is saved to $HISTFILE";;
            -h|--help) help;;
            *) help;;
        esac
        shift
    done
}
