function pi --wraps='pacman -Qi' --description 'alias pi=pacman -Qi'
  pacman -Qi $argv
        
end
