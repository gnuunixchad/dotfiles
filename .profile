# .profile
# @author nate zhou
# @since 2023,2024
# codeberg.org/unixchad/dotfiles
# github.com/gnuunixchad/dotfiles

# executed by login shells, ignored if ~/.bash_profile exists

# default file permission
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
fi
if [ -d "$HOME/.local/sbin" ] ; then
    PATH="$HOME/.local/sbin:$PATH"
fi

### ENVIRONMENT VARIABLES ###
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8   # locale
export EDITOR=/bin/nvim
export XDG_DOWNLOAD_DIR="$HOME/dls"
export XDG_DOCUMENTS_DIR="$HOME/doc"
export XDG_MUSIC_DIR="$HOME/mus"
export XDG_PICTURES_DIR="$HOME/pic"
export XDG_VIDEOS_DIR="$HOME/vid"
### CLEAN-UP HOME ###
export XDG_CONFIG_HOME="$HOME/.config"      # analogous to /etc
export XDG_CACHE_HOME="$HOME/.cache"        # analogous to /var/cache
export XDG_DATA_HOME="$HOME/.local/share"   # analogous to /usr/share
### other softwares ###
export CALCHISTFILE="$XDG_CACHE_HOME/calc_history"
export CUDA_CACHE_PATH="$XDG_HOME_HOME/nv"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

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
