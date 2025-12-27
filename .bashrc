# .bashrc
# @author nate zhou
# @since 2023,2024,2025

case $- in # check shell options
    *i*) ;; # interactive shell
      *) return;; # don't do anything
esac

[ -n "$DVTM" ] && unset MANPAGER MANWIDTH

[ -f "/usr/share/bash-completion/bash_completion" ] && . /usr/share/bash-completion/bash_completion

[ -f "$HOME/.config/dircolors" ] && eval $(dircolors "$HOME/.config/dircolors")

SHELL_CONFIG="$HOME/.config/shell" # general shell configs
[ -f "$SHELL_CONFIG/aliases.sh" ] && . "$SHELL_CONFIG/aliases.sh"
[ -f "$SHELL_CONFIG/teleport.sh" ] && . "$SHELL_CONFIG/teleport.sh"
[ -f "$SHELL_CONFIG/functions.sh" ] && . "$SHELL_CONFIG/functions.sh"

BASH_CONFIG="$HOME/.config/bash" # bash specifc configs
[ -f "$BASH_CONFIG/aliases.bash" ] && . "$BASH_CONFIG/aliases.bash"
[ -f "$BASH_CONFIG/functions.bash" ] && . "$BASH_CONFIG/functions.bash"
[ -f "$BASH_CONFIG/completion.bash" ] && . "$BASH_CONFIG/completion.bash"

set -o vi
eval "$(/usr/bin/fzf --bash)"

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

bind '"\C-a":"address -e\C-m"'
bind '"\C-n":"newsboat\C-m"'
bind '"\C-e":"mutt\C-m"'
bind '"\C-p":"ncmpcpp\C-m"'
bind '"\C-h":"heart\C-m"'
bind '"\C-o":"lfcd\C-m"' # .config/shell/functions.sh
bind '"\C-v":"abduco -A dvtm dvtm-status\C-m"'

HISTSIZE=2000
HISTFILESIZE=40000
HISTCONTROL=ignoreboth      # ignore identical or empty lines in history
shopt -s histappend         # append instead of overwrite history

shopt -s globstar           # enable "**" wildcard for more subdir

shopt -s checkwinsize       # check window size after each command

shopt -s autocd             # auto cd by typing path

[ -f "/usr/share/git/completion/git-prompt.sh" ] && . /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1        # + for staged, * if unstaged
GIT_PS1_SHOWSTASHSTATE=1        # $ if something is stashed.
GIT_PS1_SHOWUNTRACKEDFILES=1    # % if there are untracked files
GIT_PS1_SHOWUPSTREAM=1 	        # <, >, <> behind, ahead, or diverged from upstream.
GIT_PS1_STATESEPARATOR=" " 	    # separator between branch name and state symbols
GIT_PS1_DESCRIBE_STYLE=1 	    # show commit relative to tag or branch, when detached HEAD
GIT_PS1_SHOWCOLORHINTS=1        # display in color

prompt() {
    if [ ! $UID -eq 0 ]; then
        if [ -n "$SSH_CONNECTION" ]; then
            PS1='\[\033[37;105m\]\u@\h\[\033[00;00m\] \[\033[01;40m\]\W$(__git_ps1 " %s")\[\033[00;00m\] \$ '
        else
            [ -n "$HISTFILE" ] && PS1='\[\033[00;106m\]\u@\h\[\033[00;00m\] \[\033[01;40m\]\W$(__git_ps1 " %s")\[\033[00;00m\] \$ '
            [ -z "$HISTFILE" ] && PS1='\[\033[30;106m\]\u@\h\[\033[00;00m\] \[\033[01;40m\]\W$(__git_ps1 " %s")\[\033[00;00m\] \$ '
        fi
    else
            PS1='\[\033[30;107m\]\u@\h\[\033[00;00m\] \[\033[01;40m\]\W$(__git_ps1 " %s")\[\033[00;00m\] \$ '
    fi
}
prompt

export PS4='+ ${LINENO}: '

export GPG_TTY=$(tty) # TUI pinentry, need be set for each pts
