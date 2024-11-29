# .bashrc
# @author nate zhou
# @since 2023,2024
# codeberg.org/unixchad/dotfiles
# github.com/gnuunixchad/dotfiles

# environment virables should be .profile or .bash_profile

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# enable programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
### SHELL OPTIONS ###
set -o vi                   # vi keybindins
eval "$(fzf --bash)"        # fzf keybindings

HISTCONTROL=ignoreboth      # ignore identical or empty lines in history
HISTSIZE=20000
HISTFILESIZE=40000

shopt -s histappend         # append instead of overwrite history
shopt -s autocd             # auto cd when entering a path
shopt -s globstar           # enable "**" wildcard for more subdir
shopt -s checkwinsize       # check window size after each command

source /usr/share/git/completion/git-prompt.sh      # git prompt
GIT_PS1_SHOWDIRTYSTATE=1        # + for staged, * if unstaged
GIT_PS1_SHOWSTASHSTATE=1        # $ if something is stashed.
GIT_PS1_SHOWUNTRACKEDFILES=1    # % if there are untracked files
GIT_PS1_SHOWUPSTREAM=1 	        # <, >, <> behind, ahead, or diverged from upstream.
GIT_PS1_STATESEPARATOR=" " 	    # separator between branch name and state symbols
GIT_PS1_DESCRIBE_STYLE=1 	    # show commit relative to tag or branch, when detached HEAD
GIT_PS1_SHOWCOLORHINTS=1        # display in color

# ANSI color: 00 white, 30 black, 31 red, 32 green,
#             33 yellow, 34 blue, 35 magenta, 36 cyan, 37 gray
#PS1='[\u@\h \W]\$ '
PS1='\[\033[01;31m\]\[\033[01;00m\]\[\033[01;41m\]\u\[\033[01;41m\]@\[\033[01;41m\]\h\[\033[00;00m\] \[\033[01;32m\]\W\[\033[00;00m\]$(__git_ps1 " (%s)")\[\033[01;31m\]\[\033[00;00m\] \$ '

### BASH ALIAS ###
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
alias du="du -h"
alias df="df -h -x tmpfs"
alias free="free -h"
alias less="less -F"
alias iostat="iostat -t 2"
alias mpv="mpv --loop"
alias fzf="/usr/bin/fzf --reverse --color=16 --preview-window=65%:wrap:border-sharp: --preview 'cat {}'"
alias sync="sync && notify-send -u low -r 3412 'sync finished'"
### abbreviation ###
alias ..='cd ..'
alias ...='cd ../..'
alias sw="ssh-agent -t 60m sway --unsupported-gpu" # start with ssh agent
alias hibernate="systemctl hibernate"
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias vim="nvim"
alias mutt="neomutt"
alias swayimg="swayimg --class swayimgapp" # sway window border per app_id
alias p="source $HOME/.local/sbin/prox"
alias P="getprox";
alias brn="brn2 -s"
alias yt-dlp="yt-dlp --embed-metadata --cookies-from-browser firefox"
alias epr="firejail --profile=$HOME/.config/firejail/epr.local epr"
alias epr-zh="firejail --profile=$HOME/.config/firejail/epr-zh.local epr-zh"
### git ###
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gdw="git diff --word-diff"
alias gl="git log"
alias gla="git log --graph --all --abbrev-commit"
alias gln="git log --pretty=oneline --name-only"
alias glf="git log --follow -p"
### legacy ###
#alias x="startx"
#alias i3lock="i3lock -e -f --color 000000"
#alias transmission-cli="transmission-cli -w /data/tmp"
#alias dict='dict -d gcide | less -F'
#alias mupdf="mupdf -I -C cccccc -r 140 -S13"
#alias fim="fim -a --no-commandline --no-etc-rc-file --no-stat-push"

### SHELL FUNCTIONS ###
# preventing nested ranger
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}
