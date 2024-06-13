function d
    set -l proot (projectroot)
    if test $status -eq 0
        c $proot
    else
        return 1
    end
end
