#!/bin/sh

lxpolkit & # from lxsession
picom &
dunst &
clipmenud &
xrdb -load ~/.Xresources &
xwallpaper --zoom ~/assets/arch.png &
slstatus &
setxkbmap us,il &

configure_mouse 14
xrandr --output DP-4 --mode 1920x1080 --rate 144 --primary
xrandr --output HDMI-0 --mode 1920x1080 --right-of DP-4
while true; do
    dwm 2> ~/.dwm.log
done
