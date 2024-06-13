function z --wraps='pwd | xclip -sel clip -rmlastnl' --description 'alias z=pwd | xclip -sel clip -rmlastnl'
    pwd | xclip -sel clip -rmlastnl $argv

end
