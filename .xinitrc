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
fd --hidden . / >/dev/null & # https://askubuntu.com/questions/1027186/improve-initial-use-of-find-performance-time

configure_mouse 8
configure_monitors
while true; do
    dwm 2> ~/.dwm.log
done
