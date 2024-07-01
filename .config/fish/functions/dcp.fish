function dcp
    setsid --fork dash -c "cp -rv \"\$(dragon-drop --and-exit --on-top --target --print-path \"\$@\")\" $(pwd)" -- $argv &>/dev/null
end
