function rme --wraps='cat (echo "Explicitly installed packages on: $(date)" | psub) (p -Qe | cut -d" " -f1 | psub) > ~/dotfiles/README.txt' --description 'alias rme=cat (echo "Explicitly installed packages on: $(date)" | psub) (p -Qe | cut -d" " -f1 | psub) > ~/dotfiles/README.txt'
  cat (echo "Explicitly installed packages on: $(date)" | psub) (p -Qe | cut -d" " -f1 | psub) > ~/dotfiles/README.txt $argv
        
end
