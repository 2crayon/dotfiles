function sctl --wraps=systemctl --description 'alias sctl=sudo systemctl'
    sudo systemctl $argv
end
