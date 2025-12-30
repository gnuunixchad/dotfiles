# zshrc
# @author nate zhou
# @since 2025

case $- in # check shell options
    *i*) ;; # interactive shell
      *) return;; # don't do anything
esac

[ -n "$DVTM" ] && unset MANPAGER MANWIDTH

autoload -U compinit # enable programmable completion
zstyle ':completion:*' menu select # arrow-key driven
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # dircolors
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompdump
zstyle ':completion:*:processes' command 'NOCOLORS=1 ps -U $(whoami)|sed "/ps/d"' # all process owned by $USER, instead of current session
zstyle ':completion:*:processes' sort false # remain correct PID order
zstyle ':completion:*:processes-names' command 'NOCOLORS=1 ps xho command|sed "s/://g"' # more process name with `killall`
zstyle ':completion:*' list-prompt '' # no "do you wish to see all...?"
zstyle ':completion:*' select-prompt '' # no "do you wish to see all...?"
zmodload zsh/complist
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump # move cache out of home
_comp_options+=(globdots) # glob hidden files

autoload -U colors && colors
[ -f "$HOME/.config/dircolors" ] && source <(dircolors "$HOME/.config/dircolors")

SHELL_CONFIG="$HOME/.config/shell" # general shell configs
[ -f "$SHELL_CONFIG/aliases.sh" ] && . "$SHELL_CONFIG/aliases.sh"
[ -f "$SHELL_CONFIG/teleport.sh" ] && . "$SHELL_CONFIG/teleport.sh"
[ -f "$SHELL_CONFIG/functions.sh" ] && . "$SHELL_CONFIG/functions.sh"

ZSH_CONFIG="$HOME/.config/zsh" # zsh specifc configs
[ -f "$ZSH_CONFIG/aliases.zsh" ] && . "$ZSH_CONFIG/aliases.zsh"
[ -f "$ZSH_CONFIG/functions.zsh" ] && . "$ZSH_CONFIG/functions.zsh"
[ -f "$ZSH_CONFIG/completion.zsh" ] && . "$ZSH_CONFIG/completion.zsh"

set -o vi
source <(/usr/bin/fzf --zsh)

set -0 # spelling correction

bindkey -M menuselect '^p' vi-up-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char # allow previous deletion exiting vi mode

bindkey -s '^a' 'address -e\n'
bindkey -s '^n' 'newsboat\n'
bindkey -s '^e' 'mutt\n'
bindkey -s '^p' 'ncmpcpp\n'
bindkey -s '^h' 'heart\n'
bindkey -s '^o' 'lfcd\n'  # .config/shell/functions.sh
bindkey -s '^v' 'abduco -A dvtm dvtm-status\n'

# line editor v in normal mode
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

HISTSIZE=2000
SAVEHIST=40000
setopt INC_APPEND_HISTORY #SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

setopt +o nomatch   # disable no matches errors; fixes yt-dlp with wildcard URLs
setopt interactivecomments

setopt autocd		# auto cd by typing path
#setopt auto_menu menu_complete # reduce tap pressing for completion

setopt rm_star_silent

setopt PROMPT_SUBST

[ -f "/usr/share/git/completion/git-prompt.sh" ] && . /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1        # + for staged, * if unstaged
GIT_PS1_SHOWSTASHSTATE=1        # $ if something is stashed.
GIT_PS1_SHOWUNTRACKEDFILES=1    # % if there are untracked files
GIT_PS1_SHOWUPSTREAM=1 	        # <, >, <> behind, ahead, or diverged from upstream.
GIT_PS1_STATESEPARATOR=" " 	    # separator between branch name and state symbols
GIT_PS1_DESCRIBE_STYLE=1 	    # show commit relative to tag or branch, when detached HEAD
GIT_PS1_SHOWCOLORHINTS=1        # display in color

function prompt() {
    if [ ! $UID -eq 0 ]; then
        if [ -n "$SSH_CONNECTION" ]; then
            PS1='%{$(tput setab 13 setaf 15)%}%n@%m%{$reset_color%} %B%{$bg[black]%}%1~$(__git_ps1 " %s")%b%{$reset_color%} \$ '
        else
            [ -n "$HISTFILE" ] && PS1='%{$(tput setab 14 setaf 15)%}%n@%m%{$reset_color%} %B%{$bg[black]%}%1~$(__git_ps1 " %s")%b%{$reset_color%} \$ '
            [ -z "$HISTFILE" ] && PS1='%{$(tput setab 14 setaf 16)%}%n@%m%{$reset_color%} %B%{$bg[black]%}%1~$(__git_ps1 " %s")%b%{$reset_color%} \$ '
        fi
    else
            PS1='%{$bg[white]$fg[black]%}%n@%m%{$reset_color%} %B%{$bg[black]%}%1~$(__git_ps1 " %s")%b%{$reset_color%} \$ '
    fi
}
prompt

export GPG_TTY=$(tty) # TUI pinentry, need be set for each pts

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
ZSH_HIGHLIGHT_STYLES[precommand]=fg=magenta,bold;
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold;
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=cyan;
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=cyan;
ZSH_HIGHLIGHT_STYLES[comment]=fg=8; # comments and unset variables
