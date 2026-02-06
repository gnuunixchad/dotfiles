#!/usr/bin/sh
# @author nate zhou
# @since 2023,2026

autostart() {
    xrandr -s 1920x1080

    xwallpaper --zoom ${HOME}/.local/share/wallpaper &

    damblocks --xsetroot &

    picom --experimental-backends --vsync &

    xautolock -time 16 -locker "i3lock" &

    redshift -P -O 5000 &

    pgrep 'dunst' || dunst -conf ${HOME}/.config/dunst/dunstrc-offset &

    pgrep 'xob' || ${HOME}/.local/bin/xobd &

    fcitx5 -d --verbose '*=0' &

}

config_x() {

    [ -f "${HOME}/.Xresources" ] && xrdb -m "${HOME}/.Xresources" &

    xset r rate 200 30 &

    setxkbmap -option caps:swapescape,altwin:swap_alt_win &

    export GTK_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    export QT_IM_MODULE=fcitx
    export XDG_SESSION_TYPE=xorg

}

config_x; autostart;

exec ssh-agent dwm
