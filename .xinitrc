#!/usr/bin/sh
# @author nate zhou
# @since 2023,2026

[ -f "${HOME}/.Xresources" ] && xrdb -m "${HOME}/.Xresources"

damblocks --xsetroot &

exec ssh-agent dwm
