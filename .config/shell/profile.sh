# .config/shell/profile.sh
# @author nate zhou
# @since 2023,2024,2025
# general profile for bash/zsh

[ "$UID" -eq 0 ] || umask 027 # dir/file:750/640

[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:${PATH}"
[ -d "$HOME/.local/sbin" ] && PATH="$HOME/.local/sbin:${PATH}"
[ -d "/usr/share/neomutt/oauth2" ] && PATH="${PATH}:/usr/share/neomutt/oauth2"

[ -x /usr/bin/bat ] && export MANROFFOPT="-c" && export MANPAGER="sh -c 'col -bx | bat --pager \"less -R\" -l man -p'"

export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8 # locale
export EDITOR="/usr/bin/nvim"
export PAGER="/usr/bin/less"
export MOZ_USE_XINPUT2=1 # firefox pixel-perfect trackpad scrolling
export QTWEBENGINE_CHROMIUM_FLAGS='--disable-gpu' # fix qutebrowser crash on wlroots with nvidia
[ -x "/usr/bin/qutebrowser" ] && export BROWSER="qutebrowser" || export BROWSER="/usr/local/bin/firefox"

export XDG_DOWNLOAD_DIR="$HOME/dls"
export XDG_DOCUMENTS_DIR="$HOME/doc"
export XDG_MUSIC_DIR="$HOME/mus"
export XDG_PICTURES_DIR="$HOME/pic"
export XDG_VIDEOS_DIR="$HOME/vid"
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/fzfrc"

export XDG_CONFIG_HOME="$HOME/.config"      # analogous to /etc
export XDG_CACHE_HOME="$HOME/.cache"        # analogous to /var/cache
export XDG_DATA_HOME="$HOME/.local/share"   # analogous to /usr/share
export XDG_STATE_HOME="$HOME/.local/state"

export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

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
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
#export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GRIM_DEFAULT_DIR="$HOME/tmp"

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket # ssh-agent
export ABDUCO_SOCKET_DIR=/$XDG_RUNTIME_DIR # abduco

export QT_QPA_PLATFORMTHEME=qt5ct # qt theme
export QT_STYLE_OVERRIDE=adwaita-dark # qt theme
export GTK_THEME=Adwaita-dark # for firejail'ed libreoffice theme

export WLR_DRM_NO_ATOMIC=1 # fix sway terminal freezes
export ELECTRON_OZONE_PLATFORM_HINT=wayland # electron, disabled to run in xwayland for fcitx5 support
#export WLR_NO_HARDWARE_CURSORS=1 # external monitor cursor on nvidia

# fcitx
#export GTK_IM_MODULE=wayland
#export XMODIFIERS=@im=fcitx
#export QT_IM_MODULE="wayland;fcitx;ibus"

# ibus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
