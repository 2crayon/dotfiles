function frk --wraps='setsid --fork &>/dev/null' --description 'alias frk=setsid --fork &>/dev/null'
  setsid --fork &>/dev/null $argv
        
end
