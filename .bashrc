# @author nate zhou
# @since 2023,2024

# add interactive (as a login shell, not running script) configs in this file
# environment virables should be exported in .profile or .bash_profile

set -o vi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put consecutive identical lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# auto cd when entering a path
shopt -s autocd

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=40000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# 00 white| 30 black | 31 red | 32 green | 33 yellow | 34 blue | 35 magenta | 36 cyan | 37 gray|

#PS1='[\u@\h \W]\$ '

source /usr/share/git/completion/git-prompt.sh # git prompt
GIT_PS1_SHOWDIRTYSTATE=1 # + for staged, * if unstaged.
GIT_PS1_SHOWSTASHSTATE=1 # $ if something is stashed.
GIT_PS1_SHOWUNTRACKEDFILES=1 # % if there are untracked files. 
GIT_PS1_SHOWUPSTREAM=1 	# <, >, <> behind, ahead, or diverged from upstream.
GIT_PS1_STATESEPARATOR=" " 	# separator between branch name and state symbols
GIT_PS1_DESCRIBE_STYLE=1 	# show commit relative to tag or branch, when detached HEAD
GIT_PS1_SHOWCOLORHINTS=1 # display in color 
PS1='\[\033[01;31m\]\[\033[01;00m\]\[\033[01;41m\]\u\[\033[01;41m\]@\[\033[01;41m\]\h\[\033[00;00m\] \[\033[01;32m\]\W\[\033[00;33m\]$(__git_ps1 " (%s)")\[\033[01;31m\]\[\033[00;00m\] \$ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto --group-directories-first'
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lhA'
alias l.='ls -d .*'     # -d prevents the contents of directories from being listed, not filtering out files that match the pattern.
alias ll.='ls -lh -d .*'

alias ..='cd ..'
alias ...='cd ../..'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias rm="rm -I";
alias cp="cp -i";
alias mv="mv -i";

alias vim="nvim";
alias mutt="neomutt";
alias brn="brn2";

alias diff="diff --color=auto";
alias grep="grep --color=auto";

alias whatis="whatis -l";

alias du="du -h";
alias df="df -h -x tmpfs";
alias free="free -h";

alias gs="git status";
alias gd="git diff";
alias gds="git diff --staged";
alias gdw="git diff --word-diff"
alias gl="git log"
alias gla="git log --graph --all --abbrev-commit";
alias gln="git log --pretty=oneline --name-only";
alias glf="git log --follow -p";

#alias x="startx";

#alias transmission-cli="transmission-cli -w /media/dsk0/temp";

alias p="source $HOME/.local/sbin/prox";
alias P="getprox";

# specifies a gcide database to search, excluding mueller7 english-russian database
alias dict='dict -d gcide | less -F';

alias less="less -F";

#alias poweroff="systemctl poweroff";
alias hibernate="systemctl hibernate";
#alias reboot="systemctl reboot";

#alias i3lock="i3lock -e -f --color 000000";

alias mupdf="mupdf -I -C cccccc -r 140 -S13";

#alias fim="fim -a --no-commandline --no-etc-rc-file --no-stat-push";

alias mpv="mpv --loop";

alias sync="sync && notify-send -u low -r 3412 'sync finished'";

alias epr="firejail --profile=$HOME/.config/firejail/epr.local epr";
alias epr-zh="firejail --profile=$HOME/.config/firejail/epr-zh.local epr-zh";

alias yt-dlp="yt-dlp --embed-metadata --cookies-from-browser firefox";

#alias fzf="/usr/bin/fzf --preview 'cat {}'"
alias fzf="/usr/bin/fzf --reverse --color=16 --preview-window=65%:wrap:border-sharp: --preview 'cat {}'"

alias iostat="iostat -t 2";

# start sway with ssh agent
alias sw="ssh-agent -t 60m sway --unsupported-gpu";

alias swayimg="swayimg --class swayimgapp";

# preventing nested ranger instances, form arch wiki
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

# Export GPG_TTY and update GPG agent startup TTY
#export GPG_TTY=$(tty)
#unset DISPLAY

# fzf bash embed
eval "$(fzf --bash)"
