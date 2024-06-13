function s --wraps=nextd --wraps=prevd
clear -x
prevd $argv
if test $status != 0
ls --all; and return 1
else
ls --all
end
end
