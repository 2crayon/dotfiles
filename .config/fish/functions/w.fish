function w
    history | fzf --scheme=history | xclip -sel clip -rmlastnl
end
