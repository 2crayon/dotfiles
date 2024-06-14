local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'monospace'
config.enable_scroll_bar = false
config.enable_tab_bar = false
config.font_size = 14
config.default_cursor_style = 'BlinkingBar'
config.cursor_thickness = 1
config.cursor_blink_rate = 500

config.color_scheme = 'PaleNightHC'

config.initial_rows = 40
config.initial_cols = 140

return config