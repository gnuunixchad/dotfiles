#!/usr/bin/sh
# @author nate zhou
# @since 2023,2026

wm=${1:-dwm}

autostart() {
    xrandr -s 1920x1080

    xwallpaper --zoom ${HOME}/.local/share/wallpaper &

    picom &

    ${HOME}/.local/bin/lucia -d &

    ${HOME}/.local/bin/mbs-cron &

    xss-lock -- i3lock -i ${HOME}/.local/share/lockscreen -f  &

    redshift -P -O 5000 &

    clipmenud &

    pgrep 'dunst' || dunst -conf ${HOME}/.config/dunst/dunstrc-offset &

    pgrep 'xob' || ${HOME}/.local/bin/xobd &

    fcitx5 -d --verbose '*=0' &

}

config_x() {

    [ -f "${HOME}/.Xresources" ] && xrdb -m "${HOME}/.Xresources" &

    xset r rate 200 30 &

    setxkbmap -option caps:swapescape,altwin:swap_alt_win &

    unclutter --timeout 3 &

    touchpads=$(xinput list | grep -i "touchpad" | grep -oP 'id=\K[0-9]+')
    for touchpad in $touchpads ; do
        xinput set-prop "$touchpad" "libinput Tapping Enabled" 1
    done

    xset s on
    xset s 960

    export GTK_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    export QT_IM_MODULE=fcitx
    export XDG_SESSION_TYPE=xorg

}

config_x; autostart;

case "$wm" in
    dwm)
        damblocks --xsetroot &
        exec ssh-agent dwm
        ;;
    i3)
        exec ssh-agent i3
        ;;
esac
