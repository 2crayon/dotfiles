function c
    clear -x; and cd $argv >/dev/null
    if test $status != 0
        ls --all; and return 1
    else
        ls --all
    end
end
