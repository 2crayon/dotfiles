local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'monospace'
config.enable_scroll_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.font_size = 11.5
config.underline_thickness = 2
-- config.bold_brightens_ansi_colors = false

return config