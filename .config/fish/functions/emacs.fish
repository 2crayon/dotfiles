function emacs --wraps='frk emacsclient --create-frame --alternate-editor=emacs' --description 'alias emacs=frk emacsclient --create-frame --alternate-editor=emacs'
  frk emacsclient --create-frame --alternate-editor=emacs $argv
        
end
