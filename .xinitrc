#!/bin/sh

lxpolkit & # from lxsession
picom &
dunst &
clipmenud &
xrdb -load ~/.Xresources &
xwallpaper --zoom ~/assets/arch.png &
clipboard_notifications_daemon &
redshift -l $(curl -s "http://ip-api.com/json" | jq -r '"\(.lat):\(.lon)"') -t 4700:3600 &
udiskie &

configure_input 8
configure_monitors

exec i3
