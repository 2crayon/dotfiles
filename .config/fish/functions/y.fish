function y
    set -f selected (fd --base-directory=$HOME . repos src -d 1 -H | fzf)
    if test -n "$selected"
        c (cd $HOME; and realpath "$selected")
    else
        echo "No project selected."
        return 1
    end
end
