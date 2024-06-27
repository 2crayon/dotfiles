function pt --wraps='sudo -E gparted' --description 'alias pt=sudo -E gparted'
    setsid --fork sudo -E gparted $argv &>/dev/null
end
