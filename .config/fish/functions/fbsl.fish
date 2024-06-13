function fbsl --wraps='find . -xtype l' --description 'alias fbsl=find . -xtype l'
  find . -xtype l $argv
        
end
