function clearx
set -l row (cursor_pos | jq .row)
and printf "\e[""$row""S"
and clear -x
end
