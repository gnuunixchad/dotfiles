# .config/shell/aliases.sh
# @author nate zhou
# @since 2023,2024,2025
# general aliases for bash/zsh

if [ ! $UID -eq 0 ]; then
    command -v nvim >/dev/null \
        && [ -z "$DVTM" ] \
        && alias vim="nvim" \
           vimdiff="nvim -d"
fi

alias cmd="command"

alias rv="exec ssh-agent river -no-xwayland"
alias dl="exec ssh-agent ${HOME}/.local/bin/damblocks | /usr/local/bin/dwl"

alias faketty="XDG_SESSION_TYPE=tty TERM=xterm-256color"
alias fakewl="XDG_SESSION_TYPE=wayland TERM=foot"
alias resshagent="systemctl restart --user ssh-agent.service"

alias rm="rm -I";
alias cp="cp -i";
alias mv="mv -i";

alias ls='ls -F --color=auto --group-directories-first'
alias diff="diff --color=auto"
alias vdiff="nvim -d"
alias grep="grep --color=auto"

alias ll="ls -lh --time-style=long-iso"
alias la="ls -A"
alias lla="ls -lhA --time-style=long-iso"
alias l.="ls -d .*"
alias ll.="ls -lh -d --time-style=long-iso .*"
alias lt="ls -lt --time-style=long-iso"
alias lw="ls -ldh $(pwd)"
alias lx="lsix"
alias le="ls | grep -o '.[^.]*$' | sort | uniq"
alias lsmb="smbclient -L localhost -N"
alias lb="lsblk -o name,mountpoints,type,size"
alias lm="file -Lb --mime-type"
alias lsml="grep --color=never -m 5 '^[^#]' /etc/pacman.d/mirrorlist"

alias vls="virsh list"
alias vla="virsh list --all"
alias vnl="virsh net-list"
alias vsl="virsh snapshot-list"

alias ,,="~/.local/bin/teleport-genesis-search"

alias ..="cd .."
alias ...="cd ../.."
alias Gi="cd /run/media/$USER/ && pwd"

alias less="less -i -F"
alias info="info --vi-keys"
alias whatis="whatis -l"
alias sync="~/.local/bin/sync-notify"

alias ip="ip -color=auto"
alias ipa="ip -4 addr show scope global"
alias acl="getfacl"
alias atr="lsattr"
alias ncdu="ncdu -x --hide-hidden"
alias df="df -h -x tmpfs -x efivarfs -x devtmpfs"
alias lsblk="lsblk -o name,mountpoints,type,size"
alias free="free -h"
alias iostat="iostat -ht 2"

alias fzf="FZF_LEVEL=1 /usr/bin/fzf --preview '${HOME}/.local/bin/scope {}'"
alias ff="fzf --bind='enter:execute(${HOME}/.local/bin/rifle {+})'"

alias ab="abduco"
alias abc="abduco -c"
alias aba="abduco -a"
alias abd="abduco -A dvtm dvtm-status"

alias wmenu="$HOME/.local/bin/wmenu-color"
alias mutt="$HOME/.local/bin/mutt"
alias tsk="task";
alias ncmpcpp="ncmpcpp -q"
alias newsboat="${HOME}/.local/bin/news"
alias ytl="yt-dlp --list-formats"
alias id3v2="mid3v2"
alias exifpurge="exiftool -all= "
alias epr="firejail --profile=$HOME/.config/firejail/epr.local epr"
alias epr-zh="firejail --profile=$HOME/.config/firejail/epr-zh.local epr-zh"
alias vm="virt-manager"
alias wshowkeys="firejail --noprofile --net=none --nosound --novideo --no3d --nodbus wshowkeys -a bottom -b '#11111188' -F 'SourceCodePro 20'"
alias transmission-cli="transmission-cli -w $HOME/dls"

alias heartstow='stow -S --adopt -d "${HOME}/doc/heart"  -t "$HOME" . && echo "heart is stowed"'
alias heartrest='stow -R --adopt -d "${HOME}/doc/heart"  -t "$HOME" . && echo "heart is restowed"'
alias heartunst='stow -D -d "${HOME}/doc/heart"  -t "$HOME" . && echo "heart is unstowed"'

alias ollamastow='stow -S --adopt -d "${HOME}/pkg/ollama" -t "$HOME" . && echo "ollama is stowed"'
alias ollamarest='stow -R --adopt -d "${HOME}/pkg/ollama" -t "$HOME" . && echo "ollama is restowed"'
alias ollamaunst='stow -D -d "${HOME}/pkg/ollama" -t "$HOME" . && echo "ollama is unstowed"'

alias p="source $HOME/.local/sbin/prox"
alias P="getprox";

alias hibernate="systemctl hibernate"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"

alias cksv="sudo checkservices"
alias rskr="sudo systemctl restart archlinux-keyring-wkd-sync.service"
alias ckrb="checkrebuild"
alias ckud="$HOME/.local/bin/checkupdates-cron"
alias ckkn="$HOME/.local/bin/checkkernels"
alias lsud="$HOME/.local/bin/lsupdates"
alias rmcc="$HOME/.local/bin/rmcache"
alias rmop="$HOME/.local/bin/rmorphan"
alias rmlk="rm -I ${HOME}/.gnupg/.#lk0x*"
alias pl="pacman -Ql"
alias po="pacman -Qo"
alias pd="pactree -d1"
alias pv="pactree -rd1"

alias gpl="gpg --list-keys"
alias gpls="gpg --list-secret-keys"
alias gR="${HOME}/.local/bin/gpg-rifle"
alias gC="${HOME}/.local/bin/gpg-cipher"
alias gE="${HOME}/.local/bin/gpg-encrypt"
alias gD="${HOME}/.local/bin/gpg-decrypt"
alias gS="${HOME}/.local/bin/gpg-sign"
alias gV="gpg --verify"

alias gu="printf '%-20s %s\n' 'user.name:' \"\$(git config user.name)\"; printf '%-20s %s\n' 'user.email:' \"\$(git config user.email)\"; printf '%-20s %s\n' 'user.signingkey:' \"\$(git config user.signingkey)\"; printf '%-20s %s\n' 'commit.gpgsign:' \"\$(git config commit.gpgsign)\""
alias gs="git status -s 2>/dev/null"
alias gb="git branch"
alias gck="git checkout"
alias gcp="git cherry-pick"
alias ga="git add"
alias gac="git add . && git commit -m update"
alias gd="git diff"
alias gds="git diff --staged"
alias gdw="git diff --word-diff"
alias gdws="git diff --word-diff --staged"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s%Cgreen(%cr)' --abbrev-commit"
alias grs="git remote -v"
alias ggc="git gc"
alias gll="git log --graph --all"
alias gln="git log --graph --abbrev-commit --name-only"
alias gf=" /usr/bin/fzf  --preview 'git log --follow -p {} | bat --color=always --style=plain,changes' --preview-window=80%:bottom: "
alias gF="git log --follow -p"
alias gfa="git log --follow -p --graph --abbrev-commit --show-signature"
alias gls="git log --show-signature"
alias gla="git log --graph --all --name-only --abbrev-commit --show-signature"
alias gh="git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s%Cgreen(%cr)' --abbrev-commit | /usr/bin/fzf --layout=reverse-list --preview-window=80%:bottom: --preview 'parse-fgl {}' | cut -d' ' -f2 | xargs -I{} git rev-parse {} | wl-copy"
alias gcl="git clone"

alias jvi="vim /usr/lib/jvm/default/lib/src.zip"

alias ftree="realpath * | /usr/bin/fzf --prompt='ftree: ' --reverse --preview 'tree -L1 {}'"
alias fpinfo="pacman -Qq | /usr/bin/fzf --prompt='package info: ' --preview-window=70%:bottom: --preview 'pacman -Qi {}'"
alias fpcache="pacman -Qq | /usr/bin/fzf --prompt='package cache: ' --preview-window=70%:bottom: --preview 'ls /var/cache/pacman/pkg/{}-[0-9]*.pkg.tar.zst'"

alias ttypers="ttyper -w 10 -l symbol"
alias ttyperb="ttyper -w 25 -l bash"
