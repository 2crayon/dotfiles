function ls --wraps='eza -bhgx --icons=never --no-quotes --group-directories-first -s name' --description 'alias ls=eza -bhgx --icons=never --no-quotes --group-directories-first -s name'
    eza --binary --header --group --across --icons=never --group-directories-first --sort=name $argv
end
