set fish_greeting
set fish_prompt_pwd_dir_length 0

fish_add_path "$HOME/scripts"
fish_add_path "$HOME/.local/bin"

set -x EDITOR code
set -x VISUAL code
set -x SUDO_EDITOR code
set -x TERMINAL wezterm
set -x BROWSER google-chrome-stable
set -x PAGER less
set -x FZF_DEFAULT_OPTS --exact

# set -x ARCHFLAGS "-arch x86_64"
set -x LESS -rMi
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANROFFOPT -c
set -x STOW_DIR "$HOME/dotfiles"
set -x GTK_THEME Adwaita-dark
set -x QT_QPA_PLATFORMTHEME qt5ct
set -x COLORTERM truecolor
# set -x CM_LAUNCHER 

# These env exports are not necessary, as applications
# should fallback to these values anyways as per the
# XDG specification, but some apps don't comply
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"

fnm env --use-on-cd | source

ls --all

# Make commands stay in the prompt when they error
function _stay_pre --on-event fish_preexec
    set -g _last_command "$argv"
end
function _stay_post --on-event fish_postexec
    test $status != 0
    and commandline -i $_last_command
end
