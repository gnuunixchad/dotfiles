# .config/shell/functions.sh
# @author nate zhou
# @since 2025
# general functions for bash/zsh

# cd into parent
Cd() {
    cd "$(dirname $1)"
}

gcd() {
    cd $(git rev-parse --show-toplevel)
}
# avoid nested lf
lf() {
    [ -z "$LF_LEVEL" ] && command lf "$@" || exit &>/dev/null
}

lfcd() {
    cd "$(command lf -print-last-dir "$@")"
}

du() {
    printUsage() {
        if [ -z "$1" ]; then
                command du -aLhd1 "$PWD" 2> /dev/null | sort -rh
        else
            for file in "$@"; do
                command du -aLhd1 "$file" 2> /dev/null | sort -rh
                printf '\n'
            done
        fi
    }
printUsage "$@" | sed '${/^[[:space:]]*$/d;}' | less -Xi
}

# print the 16 terminal colors
colors() {
    for i in {0..15}; do
        printf "\e[48;5;${i}m  \e[0m"
        [ $((($i + 1) % 8)) -eq 0 ] && printf "\n"
    done
}

print_err() {
    local RED='\033[0;31m'
    local RESET='\033[0m'
    echo -e ${RED}"${1}"${RESET}
}

# offline dictionary with wordnet
dict() {
    command dict "$@" | command less -i -F
}

# package management
## list binaries
plb() {
    pacman -Ql "$@" | grep -E '/usr/bin/.+$'
}
## list licenses
pll() {
    pacman -Qi "$@" | grep '^Licenses' | cut -d' ' -f10-
}
## list build date
pld() {
    pacman -Qi "$@" | grep -e '^Build Date' -e '^Version'
}

# display one-line manual page or package descriptions
what() {
    [ -z "$1" ] && command whatis
    while [ -n "$1" ]; do
            command whatis -l "$1" 2>/dev/null || (\
                printf "%-20s - " "$1 (pacman)"
                pacman -Qi "$1" | \
                sed -n 's/^Description *: //p')
        shift
    done
}

diffpkg() {
    if [ -z "$1" ]; then
        echo "Missing remote [USER@]HOST"
        return
    fi
    diff <(pacman -Qeq) <(ssh "$@" 'pacman -Qeq')
}

# list git objects in the CWD
lg() {
    local branch="$(git branch --show-current 2> /dev/null)"
    local format='%(objectmode) %(objectsize:padded)%x09 %(path)%(objecttype)'

    local output="$(git ls-tree --format="$format" "$branch" 2> /dev/null)"
    if [ -z "$output" ]; then
        return
    else
        echo "$output" | sed 's/blob$//;s/tree$/\//'
    fi
}

# git show
gsh() {
    showHEAD() {
        git show HEAD'~'"$1"
    }
    [ -z "$1" ] && git show || showHEAD "$1"
}

# select a file owned by a package with fzf then edit
fpl() {
    file="$(pacman -Ql $@ | cut -d' ' -f2 \
        | fzf --preview '${HOME}/.local/bin/scope {}' \
              --preview-window bottom)"
    [ -n "$file" ] && ${HOME}/.local/bin/rifle "$file"
}

extract() {
    case "$f" in
        *.tar) tar xf "$f" ;;
        *.zip|*.apk) unzip "$f" -d "$(basename $f | sed -E 's/.apk$|.zip$//')" ;;
        *.7z) 7z x "$f" ;;
        *.tar.gz|*.tgz|*.taz) tar xzf "$f" ;;
        *.gz) gunzip -k "$f" ;;
        *.tar.bz2|*.tbz2|*.tbz|*.tz2|*.tb2) tar xjf "$f" ;;
        *.bz2) bzip2 -dk "$f" ;;
        *.tar.xz|*.txz) tar xJf "$f" ;;
        *.xz) xz -dk "$f" ;;
        *.tar.zst|*.tzst) tar xf "$f" --zstd ;;
        *.zst) zstd -dk "$f" ;;
    esac
}
