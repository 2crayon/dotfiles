function pless --wraps='pacman -Qe | less' --description 'alias pless=pacman -Qe | less'
  pacman -Qe | less $argv
        
end
