local wezterm = require 'wezterm'
local config = {}

config.default_prog = { 'Pwsh' }
config.font_size = 13
-- config.font = wezterm.font 'JetBrains Mono'
config.font = wezterm.font 'LiterationMono Nerd Font Mono'

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.colors = {
    background = '#1d1f21'
}

return config
