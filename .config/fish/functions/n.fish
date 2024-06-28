function n --wraps=nsxiv
    setsid --fork nsxiv --animate --anti-alias=no $argv &>/dev/null
end
