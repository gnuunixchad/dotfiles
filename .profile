# @author nate zhou
# @since 2024

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# environment virables should be exported in .profile or .bash_profile
# alias should be in .bashrc

# setting umask for default file permission
# umask     permission
# 022       755 (default user on debian)
# 027       750 (default root on debian)
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
    PATH="$HOME/.local/bin/dmenu:$PATH"
fi

if [ -d "$HOME/.local/sbin" ] ; then
    PATH="$HOME/.local/sbin:$PATH"
fi

#environments
export TERM=xterm-256color

export LANG=en_US.UTF-8

# locale
export LC_ALL=en_US.UTF-8

# clean up home
# user-specific config files should be (analogous to /etc)
export XDG_CONFIG_HOME="$HOME/.config"
# user-specific non-essential (cached) data should be (analogous to /var/cache)
export XDG_CACHE_HOME="$HOME/.cache"
# user-specific data files should be (analogous to /usr/share)
export XDG_DATA_HOME="$HOME/.local/share"

export CALCHISTFILE="$XDG_CACHE_HOME/calc_history"
export CUDA_CACHE_PATH="$XDG_HOME_HOME/nv"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# XDG user directories
export XDG_DOWNLOAD_DIR="$HOME/dls"
export XDG_DOCUMENTS_DIR="$HOME/doc"
export XDG_MUSIC_DIR="$HOME/mus"
export XDG_PICTURES_DIR="$HOME/pic"
export XDG_VIDEOS_DIR="$HOME/vid"

export EDITOR=/bin/nvim;

export GRIM_DDEFAULT_DIR="$HOME/pic/screenshots"

## ibus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

# QT platform theme
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=adwaita-dark

# gtk theme
# libreoffice in firejail sandbox won't read gtk theme unless environment variable is set
export GTK_THEME=Adwaita-dark

# electron on wayland
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# fcitx
export GTK_IM_MODULE=wayland
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE="wayland;fcitx;ibus"

# fix sway no cursor on external monitor with nvidia driver
export WLR_NO_HARDWARE_CURSORS=1

# make gpg use curses pinentry mode in wayland
#export GPG_TTY=$(tty)
#unset DISPLAY
