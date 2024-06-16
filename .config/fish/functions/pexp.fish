function pexp --wraps='sudo pacman -D --asexplicit' --description 'alias pexp=sudo pacman -D --asexplicit'
  sudo pacman -D --asexplicit $argv
        
end
