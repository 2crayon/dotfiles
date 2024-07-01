function fzf_copy
    set -l chosen (fd --hidden --exclude .git | fzf --scheme=path)
    if test ! $status -eq 0
        return 1
    end

    echo "$chosen" | xclip -sel clipboard -rmlastnl
end
