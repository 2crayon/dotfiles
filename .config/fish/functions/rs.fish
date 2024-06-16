function rs --wraps=restic --wraps='sudo restic' --wraps='sudo restic --repo /media/backup' --description 'alias rs=sudo restic --repo /media/backup'
  sudo restic --repo /media/backup $argv
        
end
