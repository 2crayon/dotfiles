#!/bin/sh

lxpolkit & # from lxsession
picom &
dunst &
clipmenud &
xrdb -load ~/.Xresources &
xwallpaper --zoom ~/assets/arch.png &
# slstatus &
clipboard_notifications_daemon &
redshift -l $(curl -s "http://ip-api.com/json" | jq -r '"\(.lat):\(.lon)"') -t 4700:3600 &
udiskie &

# obsidian &
# todoist &
# google-chrome-stable &

configure_input 8
configure_monitors

#while true; do
#    dwm 2> ~/.dwm.log
#done

exec i3
