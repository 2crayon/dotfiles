#!/bin/sh

export PATH="$PATH:$HOME/scripts:$HOME/appimages:$HOME/.local/bin:$HOME/.config/emacs/bin"
export ARCHFLAGS="-arch x86_64"
export COLORTERM="truecolor"
export QT_QPA_PLATFORMTHEME="qt5ct"

export EDITOR="code"
export VISUAL="code"
export SUDO_EDITOR="vim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"
export PAGER="less"

export LESS="-rMi"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export STOW_DIR="$HOME/dotfiles"

# These env exports are not necessary, as applications
# should fallback to these values anyways as per the
# XDG specification, but some apps don't comply
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi