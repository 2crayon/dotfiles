function nsxiv --wraps='nsxiv --animate --anti-alias=no' --description 'alias nsxiv=nsxiv --animate --anti-alias=no'
    setsid --fork nsxiv --animate --anti-alias=no $argv &>/dev/null
end
