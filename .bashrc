# .bashrc
# @author nate zhou
# @since 2023,2024
# codeberg.org/unixchad/dotfiles
# github.com/gnuunixchad/dotfiles

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
# source aliases
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi
### SHELL OPTIONS ###
set -o vi                   # vi keybindins
bind -m vi-command 'Control-l: clear-screen' # command mode clear
bind -m vi-insert 'Control-l: clear-screen'  # insert mode clear

eval "$(fzf --bash)"        # fzf keybindings

HISTCONTROL=ignoreboth      # ignore identical or empty lines in history
HISTSIZE=2000
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

#PS1='[\u@\h \W]\$ '
PS1='\[\033[00;31m\]\[\033[00;00m\]\[\033[00;45m\]\u\[\033[00;45m\]@\[\033[00;45m\]\h\[\033[00;00m\] \[\033[01;32m\]\W\[\033[00;00m\]$(__git_ps1 " (%s)")\[\033[01;31m\]\[\033[00;00m\] \$ '
# different color for ssh
if [[ -n "$SSH_CONNECTION" ]]; then
    export PS1='\[\033[00;31m\]\[\033[00;00m\]\[\033[00;45m\]\u\[\033[00;45m\]@\[\033[45;33m\]\h\[\033[00;00m\] \[\033[01;32m\]\W\[\033[00;00m\]$(__git_ps1 " (%s)")\[\033[01;31m\]\[\033[00;00m\] \$ '
fi

### SHELL FUNCTIONS ###
# preventing nested ranger
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}
# print the 16 terminal colors
colors() {
    for i in {0..15}; do
        printf "\e[48;5;${i}m  \e[0m"
        if [ $((($i + 1) % 8)) -eq 0 ]; then
            printf "\n"
        fi
    done
}
