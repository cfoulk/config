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


-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1500 }
config.keys = {
    {
        key = '%',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '"',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'H',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Left', 5 },
    },
    {
        key = 'J',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Down', 5 },
    },
    {
        key = 'K',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Up', 5 }
    },
    {
        key = 'L',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Right', 5 },
    },
    {
        key = 'w',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
    },
}



return config
