# .bashrc
# @author nate zhou
# @since 2023,2024,2025

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

[ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"

### SHELL OPTIONS ###
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

eval "$(fzf --bash)"

HISTCONTROL=ignoreboth      # ignore identical or empty lines in history
HISTSIZE=2000
HISTFILESIZE=40000

shopt -s histappend         # append instead of overwrite history
shopt -s autocd             # auto cd when entering a path
shopt -s globstar           # enable "**" wildcard for more subdir
shopt -s checkwinsize       # check window size after each command

[ -f "$HOME/.config/dircolors" ] && eval $(dircolors "$HOME/.config/dircolors")

[ -f "/usr/share/git/completion/git-prompt.sh" ] && . /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1        # + for staged, * if unstaged
GIT_PS1_SHOWSTASHSTATE=1        # $ if something is stashed.
GIT_PS1_SHOWUNTRACKEDFILES=1    # % if there are untracked files
GIT_PS1_SHOWUPSTREAM=1 	        # <, >, <> behind, ahead, or diverged from upstream.
GIT_PS1_STATESEPARATOR=" " 	    # separator between branch name and state symbols
GIT_PS1_DESCRIBE_STYLE=1 	    # show commit relative to tag or branch, when detached HEAD
GIT_PS1_SHOWCOLORHINTS=1        # display in color

if [ ! $UID -eq 0 ]; then
    if [ -n "$SSH_CONNECTION" ]; then
        PS1='\[\033[30;43m\]\u@\h\[\033[00;00m\] \[\033[01;32m\]\W\[\033[00;00m\]$(__git_ps1 " (%s)")\[\033[00;00m\] \$ '
    else
        PS1='\[\033[00;45m\]\u@\h\[\033[00;00m\] \[\033[01;32m\]\W\[\033[00;00m\]$(__git_ps1 " (%s)")\[\033[00;00m\] \$ '
    fi
else
        PS1='\[\033[00;41m\]\u@\h\[\033[00;00m\] \[\033[01;32m\]\W\[\033[00;00m\]$(__git_ps1 " (%s)")\[\033[00;00m\] \$ '
fi

export PS4='+ ${LINENO}: '
