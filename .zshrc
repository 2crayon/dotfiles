PROMPT='%B%F{#000000}%K{#54c490}(%?)%n@%m:%~%K{#54c490}$%k%f%b '

HISTFILE="$HOME/.zsh_history"
HISTSIZE=2000
SAVEHIST=2000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

WORDCHARS=''

autoload -Uz compinit && compinit
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
_comp_options+=(globdots)

bindkey -e
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

source ~/.aliases

cdor() {
    clear -x && cd $@ >/dev/null ; ll
}

helpor() {
    "$@" --help 2>&1 | bat -p -l help
}

cd_into_project() {
    # A project is a folder that exists in ~/src or ~/repos
    selected="$(fd --base-directory=$HOME . repos src -d 1 -H --color never | fzf)"
    [[ $selected ]] || return
    c "$(cd $HOME && realpath $selected)"
    unset selected
}

histfzf() {
    # If you quit the fuzzy find without picking, it empties your clipboard, but it doesn't matter
    history 1 -1 | sed -r "s/ *[0-9]*\*? *//" | awk "!x[\$0]++" | tac | fzf --scheme=history | xclip -sel clip -r
}

pwdcb() {
    pwd | xclip -sel clip -r
}

showpath() {
    echo "$PATH" | sed 's/:/\n/g'
}

lalpager() {
    lal --color always --hyperlink $@ | less -F
}

cheatsheet() {
    curl cht.sh/"$1"
}

# eval "$(zellij setup --generate-auto-start zsh)"
eval "$(fnm env --use-on-cd)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

ll
