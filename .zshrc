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

autoload -Uz compinit && compinit
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
_comp_options+=(globdots)

bindkey -e

bindkey "^X" _expand_alias
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[P" delete-word
bindkey "^[[P" delete-char
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^[[C" forward-char
bindkey "^[[D" backward-char
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line

bindkey -s "^[2" "\C-a\C-kcd_into_project^M"
bindkey -s "^[3" "\C-a\C-kfd_clipboard -rf^M"
bindkey -s "^[4" "\C-a\C-kfd_clipboard -rd^M"
bindkey -s "^[5" "\C-a\C-kfd_clipboard -r^M"
bindkey -s "^[t" "\C-a\C-khistfzf^M"

bindkey -s "^[q" "\C-a\C-kc ..^M"
bindkey -s "^[e" "\C-a\C-kc -^M"
bindkey -s "^[w" "\C-a\C-kc .^M"
bindkey -s "^[r" "\C-a\C-kc^M"
bindkey -s "^[x" "\C-a\C-kpwdcb^M"

alias r='trash-put'
alias tl='trash-list'
alias tt='trash-restore'
alias te='trash-empty'
alias e='$EDITOR'
alias se='sudoedit'
alias b='bluetoothctl'
alias m='mkdir'
alias bt='btop'
alias d='dragon-drop'
alias z='zellij'
alias py='python'
alias t='touch'
alias c='cdor'
alias h='helpor'
alias pth='showpath'
alias l='lalpager'
alias a='atool'
alias x='nsxiv'
alias v='nsxiv -f'
alias zb='zig build'
alias ex='exit'
alias sx='startx'
alias cht='cheatsheet'
alias p='pacman'
alias sp='sudo pacman'
alias sd='systemctl'

alias dots='c ~/dotfiles'
alias stow='stow -v'
alias rme='cat <(echo "Explicitly installed packages on: $(date)") <(p -Qe | cut -d" " -f1) > ~/dotfiles/README.txt'
alias rez='source ~/.zshrc'
alias la='ls -a'
alias lsl='ls -l'
alias lal='ls -al'
alias ll='ls -a --hyperlink'
alias fa='fd -H'
alias mx='chmod a+x'
alias cl='clear && la'
alias cbi='xclip -i -sel clip -r'
alias xdgd='xdg-mime query default'
alias xdgt='xdg-mime query filetype'
alias wt='curl wttr.in/Herzlia'

alias ls='eza -bhgx --icons=auto --no-quotes --group-directories-first -s name'
alias rg='rg -in -.'
alias inxi='inxi -b --usb'
alias df='df -kHT'
alias rm='rm -v'
alias mv='mv -v'
alias ln='ln -v'
alias cp='cp -v'
alias ln='ln -iv'
alias mkdir='mkdir -pv'
alias diff='diff --color=auto'
alias zigup='zigup --install-dir ~/managed/zig --path-link ~/.local/bin/zig'
alias type='type -a'
alias dragon-drop='frk dragon-drop -x -T'
alias bat='bat -pn'
alias nsxiv='frk nsxiv -a --anti-alias=no'

alias gg='gitui'
alias gc='git clone'
alias gco='git checkout'
alias gs='git status'

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
    history 1 -1 | sed -r "s/ *[0-9]*\*? *//" | awk "!x[\$0]++" | tac | fzf --scheme=history | xclip -sel clip -r
}

pwdcb() {
    pwd | xclip -sel clip -r
}

homegrep() {
    cd ~ && rg -g "!repos" -g "!managed" -g "!.cache" -g "!.config/Code - OSS" -g "!.config/google-chrome" -g "!.mozilla" -g "!.minecraft" -g "!.vscode-oss" -g "!.local/state" -g "!.wine" -g "!.lunarclient" -g "!.zsh_history" -g "!.bash_history" -g "!.local/share/fnm" $@ ~
}

showpath() {
    echo "$PATH" | sed 's/:/\n/g'
}

lalpager() {
    lal --color always --icons always --hyperlink $@ | less -F
}

cheatsheet() {
    curl cht.sh/"$1"
}

eval "$(zellij setup --generate-auto-start zsh)"
eval "$(fnm env --use-on-cd)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

ll
