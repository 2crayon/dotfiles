# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o noclobber

shopt -s checkwinsize
shopt -s globstar 2> /dev/null
shopt -s histappend
shopt -s cmdhist

# Update history constantly instead of only when leaving the shell
PROMPT_COMMAND='history -a'

HISTSIZE=10000000
HISTFILESIZE=10000000
HISTCONTROL="erasedups:ignoreboth"

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set mark-symlinked-directories on'
bind 'set colored-stats on'
bind 'set completion-prefix-display-length 3'

bind '"Space": magic-space'
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'