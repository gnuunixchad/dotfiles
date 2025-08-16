# .config/shell/aliases.sh
# @author nate zhou
# @since 2023,2024,2025
# general aliases for bash/zsh

command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# the current shell will not return when sway exits
# no one can have the current tty access in case sway crashes
alias sw="exec ssh-agent sway --unsupported-gpu"
alias rv="exec ssh-agent river -no-xwayland"
alias dl="exec ssh-agent ${HOME}/.local/bin/damblocks | /usr/local/bin/dwl"

alias rm="rm -I";
alias cp="cp -i";
alias mv="mv -i";

alias ls='ls -F --color=auto --group-directories-first'
alias diff="diff --color=auto"
alias vdiff="nvim -d"
alias grep="grep --color=auto"
alias ip="ip -color=auto"

alias ll="ls -lh --time-style=long-iso"
alias la="ls -A"
alias lla="ls -lhA --time-style=long-iso"
alias l.="ls -d .*"
alias ll.="ls -lh -d --time-style=long-iso .*"
alias lt="ls -lt --time-style=long-iso"
alias lx="lsix"

alias ..="cd .."
alias ...="cd ../.."
alias Gi="cd /run/media/$USER/ && pwd"

alias info="info --vi-keys"
alias less="less -i -F"
alias bat="bat --style='plain,changes,rule,snip'"
alias whatis="whatis -l"
alias sync="~/.local/bin/sync-notify"

alias du="du -Lh -d 1"
alias dU="du -Lh -d 1 | sort -rh"
alias ncdu="ncdu -x --hide-hidden"
alias df="df -h -x tmpfs -x efivarfs -x devtmpfs"
alias lsblk="lsblk -o name,mountpoints,type,size"
alias free="free -h"
alias iostat="iostat -ht 2"

alias fzf="FZF_LEVEL=1 /usr/bin/fzf --preview 'scope {}' --bind=ctrl-j:preview-down,ctrl-k:preview-up --reverse"
alias fvi="fzf --bind='enter:execute(nvim {+}),ctrl-j:preview-down,ctrl-k:preview-up'"
alias jvi="vim /usr/lib/jvm/default/lib/src.zip"
alias mutt="$HOME/.local/bin/mutt"
alias tsk="task";
alias twt="taskwarrior-tui"
alias mpv="mpv --loop"
alias ncmpcpp="ncmpcpp -q"
alias newsboat="newsboat -q"

alias wmenu="$HOME/.local/bin/wmenu-color"
alias ,,="~/.local/bin/teleport-genesis-search"

alias heartstow='cd ~/doc/heart && stow --adopt -t ~ . && cd - &>/dev/null && echo "heart is stowed"'
alias heartunstow='cd ~/doc/heart && stow -D -t ~ . && cd - &>/dev/null && echo "heart is unstowed"'
alias heartrestow='cd ~/doc/heart && stow -R --adopt -t ~ . && cd - &>/dev/null && echo "heart is stowed"'
alias ollamastow='cd ~/pkg/ollama && stow --adopt -t ~ . && cd - &>/dev/null && echo "ollama is stowed"'
alias ollamarestow='cd ~/pkg/ollama && stow -R --adopt -t ~ . && cd - &>/dev/null && echo "ollama is stowed"'
alias ollamaunstow='cd ~/pkg/ollama && stow -D -t ~ . && cd - &>/dev/null && echo "ollama is unstowed"'

alias hibernate="systemctl hibernate"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"

alias yt-dlp="yt-dlp --embed-metadata --cookies-from-browser firefox"
alias id3v2="mid3v2"

alias epr="firejail --profile=$HOME/.config/firejail/epr.local epr"
alias epr-zh="firejail --profile=$HOME/.config/firejail/epr-zh.local epr-zh"

alias p="source $HOME/.local/sbin/prox"
alias P="getprox";

alias tksv="tmux kill-server"
alias tlss="tmux list-session"
alias tkss="tmux kill-session -t"
alias tat="tmux attach"

alias cksv="sudo checkservices"
alias ckrb="checkrebuild"
alias ckud="$HOME/.local/bin/checkupdates-cron"
alias ckkn="$HOME/.local/bin/checkkernels"
alias lsud="$HOME/.local/bin/lsupdates"
alias rmcc="$HOME/.local/bin/rmcache"
alias rmop="$HOME/.local/bin/rmorphan"
alias pl="pacman -Ql"
alias po="pacman -Qo"
alias pd="pactree -d1"
alias pv="pactree -rd1"

alias gu="printf '%-20s %s\n' 'user.name:' \"\$(git config user.name)\"; printf '%-20s %s\n' 'user.email:' \"\$(git config user.email)\"; printf '%-20s %s\n' 'user.signingkey:' \"\$(git config user.signingkey)\"; printf '%-20s %s\n' 'commit.gpgsign:' \"\$(git config commit.gpgsign)\""
alias gs="git status -s 2>/dev/null"
alias gsh="git show"
alias gb="git branch"
alias gck="git checkout"
alias ga="git add"
alias gac="git add . && git commit -m update"
alias gd="git diff"
alias gds="git diff --staged"
alias gdw="git diff --word-diff"
alias gdws="git diff --word-diff --staged"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s%Cgreen(%cr)' --abbrev-commit"

alias gll="git log --graph --all"
alias gln="git log --graph --abbrev-commit --name-only"
alias glf="git log --follow -p"
alias glfa="git log --follow -p --graph --abbrev-commit --show-signature"
alias gls="git log --show-signature"
alias gla="git log --graph --all --name-only --abbrev-commit --show-signature"
alias fgl="git log | grep '^commit ' | cut -d' ' -f2 | /usr/bin/fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --preview 'git show {} | bat --color=always --style=plain,changes ' --preview-window=90% | wl-copy"
alias fglf=" /usr/bin/fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --preview 'git log --follow -p {} | bat --color=always --style=plain,changes' "

alias vm="virt-manager"
alias wshowkeys="firejail --noprofile --net=none --nosound --novideo --no3d --nodbus wshowkeys -a bottom -b '#11111188' -F 'SourceCodePro 20'"

alias ftree="realpath * | /usr/bin/fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --prompt='ftree: ' --reverse --preview 'tree -L1 {}'"
alias fpinfo="pacman -Qq | /usr/bin/fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --prompt='package info: ' --preview-window=70%:bottom: --preview 'pacman -Qi {}'"
alias fpcache="pacman -Qq | /usr/bin/fzf --bind=ctrl-j:preview-down,ctrl-k:preview-up --prompt='package cache: ' --preview-window=70%:bottom: --preview 'ls /var/cache/pacman/pkg/{}-[0-9]*.pkg.tar.zst'"

alias ttypers="ttyper -w 10 -l symbol"
alias ttyperb="ttyper -w 25 -l bash"

alias transmission-cli="transmission-cli -w $HOME/dls"

alias resshagent="systemctl restart --user ssh-agent.service"
