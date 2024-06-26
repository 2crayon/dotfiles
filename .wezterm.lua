local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config.bold_brightens_ansi_colors = false

config.font = wezterm.font 'monospace'
config.enable_scroll_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.font_size = 11.5
config.underline_thickness = 2
config.default_cursor_style = 'BlinkingBar'
config.cursor_thickness = 1
config.cursor_blink_rate = 500

config.keys = {
    { key = "UpArrow",   mods = "SHIFT", action = wezterm.action.ScrollToPrompt(-1) },
    { key = "DownArrow", mods = "SHIFT", action = wezterm.action.ScrollToPrompt(1) },
}

return config