# .bash_aliases
# @author nate zhou
# @since 2023,2024

### think twice ###
alias rm="rm -I";
alias cp="cp -i";
alias mv="mv -i";
### colorful ###
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto --group-directories-first'
fi
alias diff="diff --color=auto"
alias vdiff="nvim -d"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
### output format ###
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'
alias l.='ls -d .*'
alias ll.='ls -lh -d .*'
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
alias .r='. ~/.bash_profile && . ~/.bashrc && . ~/.bash_aliases'
alias heartstow='cd ~/doc/heart && stow --adopt -t ~ . && cd - &>/dev/null && echo "heart is stowed"'
alias heartunstow='cd ~/doc/heart && stow -D -t ~ . && cd - &>/dev/null && echo "heart is unstowed"'
alias heartrestow='cd ~/doc/heart && stow -R --adopt -t ~ . && cd - &>/dev/null && echo "heart is stowed"'
alias ollamastow='cd ~/pkg/ollama && stow --adopt -t ~ . && cd - &>/dev/null && echo "ollama is stowed"'
alias ollamarestow='cd ~/pkg/ollama && stow -R --adopt -t ~ . && cd - &>/dev/null && echo "ollama is stowed"'
alias ollamaunstow='cd ~/pkg/ollama && stow -D -t ~ . && cd - &>/dev/null && echo "ollama is unstowed"'
alias ..='cd ..'
alias ...='cd ../..'
alias ?='pwd'
alias ??='realpath'
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
alias Bh="cd ~/doc/heart"
alias Bc="cd ~/.config"
alias Bf="cd ~/.config/firejail"
alias BC="cd ~/.cache"
alias By="cd ~/.cache/yay"
alias Bl="cd ~/.local"
alias Bb="cd ~/.local/bin"
alias Bs="cd ~/smb"
alias Bt="cd ~/tmp"
alias BD="cd ~/dls"
alias Bd="cd ~/doc"
alias BB="cd ~/.local/share/bookmarks"
alias Be="cd ~/doc/ebook"
alias BE="cd ~/doc/code"
alias Bg="cd ~/doc/git"
alias B.="cd ~/doc/unixchad/dotfiles"
alias BG="cd ~/doc/gimp"
alias Bn="cd ~/doc/note"
alias Bm="cd ~/mus"
alias BP="cd ~/mus/podcasts"
alias Bp="cd ~/pic"
alias Bw="cd ~/pic/wallpapers"
alias Bv="cd ~/vid"
alias Bu="cd ~/vid/unixchad"
alias BV="cd ~/virt"
### legacy ###
#alias x="startx"
#alias transmission-cli="transmission-cli -w /data/tmp"
#alias mupdf="mupdf -I -C cccccc -r 140 -S13"
#alias fim="fim -a --no-commandline --no-etc-rc-file --no-stat-push"
#alias ed="ed -p :"
#alias mutt="neomutt"

dict () {
    /usr/bin/dict -d wn "$@" | /usr/bin/less -F
}
