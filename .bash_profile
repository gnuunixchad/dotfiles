# .profile
# @author nate zhou
# @since 2023,2024
# codeberg.org/unixchad/dotfiles
# github.com/gnuunixchad/dotfiles

# default file permission
umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.local/sbin" ] ; then
    PATH="$HOME/.local/sbin:$PATH"
fi

# colorful manpage with bat
if [ -x /usr/bin/bat ]; then
    export MANROFFOPT="-c"
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# show os info on login
if [ -x ~/.local/bin/osi ] ; then
    ~/.local/bin/os -ld
fi

### ENVIRONMENT VARIABLES ###
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8   # locale
export EDITOR="/bin/nvim"
export BROWSER="/usr/local/bin/firefox"
export XDG_DOWNLOAD_DIR="$HOME/dls"
export XDG_DOCUMENTS_DIR="$HOME/doc"
export XDG_MUSIC_DIR="$HOME/mus"
export XDG_PICTURES_DIR="$HOME/pic"
export XDG_VIDEOS_DIR="$HOME/vid"
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/fzfrc"
### CLEAN-UP HOME ###
export XDG_CONFIG_HOME="$HOME/.config"      # analogous to /etc
export XDG_CACHE_HOME="$HOME/.cache"        # analogous to /var/cache
export XDG_DATA_HOME="$HOME/.local/share"   # analogous to /usr/share
export XDG_STATE_HOME="$HOME/.local/state"
### other softwares ###
export HISTFILE="$XDG_STATE_HOME/bash/history"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export CALCHISTFILE="$XDG_CACHE_HOME/calc_history"
export CUDA_CACHE_PATH="$XDG_HOME_HOME/nv"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export W3M_DIR="$XDG_STATE_HOME/w3m"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export GRIM_DEFAULT_DIR="$HOME/tmp"
#export OLLAMA_MODELS="$XDG_DATA_HOME/ollama/models"

### IME ###
# fcitx
export GTK_IM_MODULE=wayland
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE="wayland;fcitx;ibus"
# ibus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

### THEMES ###
# qt
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=adwaita-dark
# gtk
export GTK_THEME=Adwaita-dark # for firejail'ed libreoffice

### WAYLAND ###
export ELECTRON_OZONE_PLATFORM_HINT=wayland # electron
export WLR_NO_HARDWARE_CURSORS=1 # external monitor cursor on nvidia
