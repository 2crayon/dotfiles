function prns --wraps='sudo pacman -Rns' --description 'alias prns=sudo pacman -Rns'
  sudo pacman -Rns $argv
        
end
