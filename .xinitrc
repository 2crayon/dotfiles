#!/bin/sh

lxpolkit & # from lxsession
picom &
dunst &
clipmenud &
xrdb -load ~/.Xresources &
xwallpaper --zoom ~/assets/arch.png &
slstatus &
clipboard_notifications_daemon &
redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq -r '"\(.location.lat):\(.location.lng)"') -t 4700:3600 &
emacs --daemon &
udiskie &
fd --hidden . / >/dev/null & # Makes the future identical syscalls called by this command likely to be cached by Linux

# obsidian &
# todoist &
# google-chrome-stable &

configure_input 8
configure_monitors

#while true; do
#    dwm 2> ~/.dwm.log
#done

exec i3
