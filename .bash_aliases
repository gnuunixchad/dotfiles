# .bash_aliases
# @author nate zhou
# @since 2023,2024,2025

### think twice ###
alias rm="rm -I";
alias cp="cp -i";
alias mv="mv -i";
### colorful ###
if [ -x /usr/bin/dircolors ]; then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto --group-directories-first'
fi
alias diff="diff --color=auto"
alias vdiff="nvim -d"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
### output format ###
alias ll="ls -lh"
alias la="ls -A"
alias lla="ls -lhA"
alias l.="ls -d .*"
alias ll.="ls -lh -d .*"
alias bat="bat --style='plain,changes,rule,snip'"
alias whatis="whatis -l"
alias du="du -h -d 1"
alias dU="du -h -d 1 | sort -rh"
alias ncdu="ncdu -x --hide-hidden"
alias df="df -h -x tmpfs -x efivarfs -x devtmpfs"
alias lsblk="lsblk -o name,mountpoints,type,size"
alias free="free -h"
alias less="less -F"
alias iostat="iostat -t 2"
alias mpv="mpv --loop"
alias wmenu="wmenu -f 'SourceCodePro Medium 13' -i -S 6f3f89 -s ffffff -M 6f3f89 -m ffffff"
alias fzf="/usr/bin/fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --reverse --color=16 --preview-window=65%:wrap:border-sharp: --preview 'bat --color=always --style=plain,changes {}'"
alias fimg="find -type f \( -name "*.png" -o -name "*.jpeg" -o -name "*.jpg" \) | fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --preview 'catimg -w100 {}' --preview-window=90%:bottom: --bind='enter:execute(swayimg {})'"
alias fvi="fzf --bind='enter:execute(nvim {+}),ctrl-j:preview-down,ctrl-k:preview-up'"
alias ftree="realpath * | fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --prompt='ftree: ' --reverse --preview 'tree -L1 {}'"
alias fptree="pacman -Qq | fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --prompt='reverse depends: ' --preview-window=70%:bottom: --preview 'pactree -rd2 {}'"
alias fpinfo="pacman -Qq | fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --prompt='package info: ' --preview-window=70%:bottom: --preview 'pacman -Qi {}'"
alias fpcache="pacman -Qq | fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --prompt='package cache: ' --preview-window=70%:bottom: --preview 'ls /var/cache/pacman/pkg/{}-[0-9]*.pkg.tar.zst'"
alias sync="~/.local/bin/sync-notify"
### abbreviation ###
alias .r=". ~/.bash_profile && . ~/.bashrc && . ~/.bash_aliases"
alias heartstow='cd ~/doc/heart && stow --adopt -t ~ . && cd - &>/dev/null && echo "heart is stowed"'
alias heartunstow='cd ~/doc/heart && stow -D -t ~ . && cd - &>/dev/null && echo "heart is unstowed"'
alias heartrestow='cd ~/doc/heart && stow -R --adopt -t ~ . && cd - &>/dev/null && echo "heart is stowed"'
alias ollamastow='cd ~/pkg/ollama && stow --adopt -t ~ . && cd - &>/dev/null && echo "ollama is stowed"'
alias ollamarestow='cd ~/pkg/ollama && stow -R --adopt -t ~ . && cd - &>/dev/null && echo "ollama is stowed"'
alias ollamaunstow='cd ~/pkg/ollama && stow -D -t ~ . && cd - &>/dev/null && echo "ollama is unstowed"'
alias ..="cd .."
alias ...="cd ../.."
alias ?="pwd"
alias ??="realpath"
alias sw="sway --unsupported-gpu" # start with ssh agent
alias vm="virt-manager"
alias hibernate="systemctl hibernate"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias vim="nvim"
alias swayimg="swayimg --class swayimgapp" # sway window border per app_id
alias p="source $HOME/.local/sbin/prox"
alias P="getprox";
alias brn="brn2 -s"
alias yt-dlp="yt-dlp --embed-metadata --cookies-from-browser firefox"
alias epr="firejail --profile=$HOME/.config/firejail/epr.local epr"
alias epr-zh="firejail --profile=$HOME/.config/firejail/epr-zh.local epr-zh"
alias tksv="tmux kill-server"
alias tlss="tmux list-session"
alias tkss="tmux kill-session -t"
### git ###
alias gs="git status"
alias gsh="git show"
alias ga="git add"
alias gd="git diff"
alias gds="git diff --staged"
alias gdw="git diff --word-diff"
alias gl="git log"
alias gla="git log --graph --all --abbrev-commit"
alias gln="git log --pretty=oneline --name-only"
alias glf="git log --follow -p"
alias gac="git add . && git commit -m update"
alias fgl="git log | grep '^commit ' | cut -d' ' -f2 | fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --preview 'git show {} | bat --color=always --style=plain,changes ' --preview-window=90% | wl-copy"
alias fgln="git log | grep '^commit '| cut -d' ' -f2 | fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --preview 'git log --name-only {} | bat --color=always --style=plain,changes' | wl-copy"
alias fglf=" fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --preview 'git log --follow -p {} | bat --color=always --style=plain,changes' "
### teleport ###
alias Gi="cd /run/media/$USER/ && pwd"
alias Bh="cd ~/doc/heart && pwd"
alias Bc="cd ~/.config && pwd"
alias Bf="cd ~/.config/firejail && pwd"
alias BC="cd ~/.cache && pwd"
alias By="cd ~/.cache/yay && pwd"
alias Bl="cd ~/.local && pwd"
alias Bb="cd ~/.local/bin && pwd"
alias Bs="cd ~/smb && pwd"
alias Bt="cd ~/tmp && pwd"
alias BD="cd ~/dls && pwd"
alias Bd="cd ~/doc && pwd"
alias BB="cd ~/.local/share/bookmarks && pwd"
alias Be="cd ~/doc/ebook && pwd"
alias BE="cd ~/doc/code && pwd"
alias Bg="cd ~/doc/git && pwd"
alias B.="cd ~/doc/unixchad/dotfiles && pwd"
alias BG="cd ~/doc/gimp && pwd"
alias Bn="cd ~/doc/note && pwd"
alias Bm="cd ~/mus && pwd"
alias BP="cd ~/mus/podcasts && pwd"
alias Bp="cd ~/pic && pwd"
alias Bw="cd ~/pic/wallpapers && pwd"
alias Bv="cd ~/vid && pwd"
alias Bu="cd ~/vid/unixchad && pwd"
alias BV="cd ~/virt && pwd"
### echo
alias Er="echo RANGER_LEVEL=$RANGER_LEVEL"

### legacy ###
#alias x="startx"
#alias transmission-cli="transmission-cli -w /data/tmp"
#alias mupdf="mupdf -I -C cccccc -r 140 -S13"
#alias fim="fim -a --no-commandline --no-etc-rc-file --no-stat-push"
#alias ed="ed -p :"
#alias mutt="neomutt"

### SHELL FUNCTIONS ###
# cd into parent
Cd () {
    cd "$(dirname $1)"
}
# read help with a pager
help () {
    help_output=$(command help "$@")
    [ "$?" -eq 0 ] && echo "$help_output" | /usr/bin/less
}
# avoid nested ranger
ranger() {
    [ -z "$RANGER_LEVEL" ] && /usr/bin/ranger "$@" || exit &>/dev/null
}
# print the 16 terminal colors
colors() {
    for i in {0..15}; do
        printf "\e[48;5;${i}m  \e[0m"
        [ $((($i + 1) % 8)) -eq 0 ] && printf "\n"
    done
}
# offline dictionary with wordnet
dict () {
    /usr/bin/dict -d wn "$@" | /usr/bin/less -F
}
