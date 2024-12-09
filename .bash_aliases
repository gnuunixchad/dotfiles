# .bash_aliases
# @author nate zhou
# @since 2023,2024
# codeberg.org/unixchad/dotfiles
# github.com/gnuunixchad/dotfiles

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
alias grep="grep --color=auto"
### output format ###
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'
alias l.='ls -d .*'
alias ll.='ls -lh -d .*'
alias whatis="whatis -l"
alias du="du -h -d 1"
alias dU="du -h -d 1 | sort -rh"
alias ncdu="ncdu -x"
alias df="df -h -x tmpfs -x efivarfs -x devtmpfs"
alias lsblk="lsblk -o name,mountpoints,type,size"
alias free="free -h"
alias less="less -F"
alias iostat="iostat -t 2"
alias mpv="mpv --loop"
alias fzf="/usr/bin/fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --reverse --color=16 --preview-window=65%:wrap:border-sharp: --preview 'cat {}'"
alias fptree="pacman -Qq | fzf --prompt='reverse depends: ' --preview-window=70%:bottom: --preview 'pactree -rd2 {}'"
alias fpinfo="pacman -Qq | fzf --prompt='package info: ' --preview-window=70%:bottom: --preview 'pacman -Qi {}'"
alias fpcache="pacman -Qq | fzf --prompt='package cache: ' --preview-window=70%:bottom: --preview 'ls /var/cache/pacman/pkg/{}-*.pkg.tar.zst'"
alias sync="~/.local/bin/sync-notify"
### abbreviation ###
alias ..='cd ..'
alias ...='cd ../..'
alias sw="ssh-agent -t 60m sway --unsupported-gpu" # start with ssh agent
alias vm="virt-manager"
alias hibernate="systemctl hibernate"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias vim="nvim"
alias ed="ed -p :"
alias mutt="neomutt"
alias swayimg="swayimg --class swayimgapp" # sway window border per app_id
alias p="source $HOME/.local/sbin/prox"
alias P="getprox";
alias brn="brn2 -s"
alias yt-dlp="yt-dlp --embed-metadata --cookies-from-browser firefox"
alias epr="firejail --profile=$HOME/.config/firejail/epr.local epr"
alias epr-zh="firejail --profile=$HOME/.config/firejail/epr-zh.local epr-zh"
alias tmux-ks="tmux kill-server"
### git ###
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gdw="git diff --word-diff"
alias gl="git log"
alias gla="git log --graph --all --abbrev-commit"
alias gln="git log --pretty=oneline --name-only"
alias glf="git log --follow -p"
alias gac="git add . && git commit -m update"
### teleport ###
alias Bc="cd ~/.config"
alias BC="cd ~/.cache"
alias Bl="cd ~/.local"
alias Bb="cd ~/.local/bin"
alias Bs="cd ~/smb"
alias Bt="cd ~/tmp"
alias BD="cd ~/dls"
alias Br="cd ~/repo"
alias Bd="cd ~/doc"
alias BB="cd ~/doc/bookmarks"
alias Be="cd ~/doc/ebooks "
alias Bg="cd ~/doc/git"
alias BG="cd ~/doc/gimp"
alias Bn="cd ~/doc/note"
alias Bm="cd ~/mus"
alias BP="cd ~/mus/podcasts"
alias Bp="cd ~/pic"
alias Bw="cd ~/pic/wallpapers"
alias Bv="cd ~/vid"
alias Bu="cd ~/vid/unixchad"

### legacy ###
#alias x="startx"
#alias i3lock="i3lock -e -f --color 000000"
#alias transmission-cli="transmission-cli -w /data/tmp"
#alias dict='dict -d gcide | less -F'
#alias mupdf="mupdf -I -C cccccc -r 140 -S13"
#alias fim="fim -a --no-commandline --no-etc-rc-file --no-stat-push"
#alias sync="sync && notify-send -u low -r 3412 'sync finished'"
#alias bat="bat --style='plain,changes,rule,snip'"
