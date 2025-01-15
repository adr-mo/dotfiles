
local wezterm = require("wezterm")
local config = wezterm.config_builder()


-- This is where you actually apply your config choices

-- config.font = wezterm.font("FantasqueSansM Nerd Font Mono")
-- config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font("Iosevka Nerd Font Mono")
-- config.font = wezterm.font("FiraCode Nerd Font")
config.font = wezterm.font("Maple Mono")
config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.font_size = 18
config.line_height = 1.2
config.window_background_opacity = 0.8
config.macos_window_background_blur = 40
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 100

config.force_reverse_video_cursor = true
config.colors = {
    foreground = "#ebdbb2",
    background = "#282828",
    cursor_bg = "#ebdbb2",
    cursor_border = "#ebdbb2",
    cursor_fg = "#282828",
    selection_bg = "#3c3836",
    selection_fg = "#ebdbb2",
    split = "#504945",
    compose_cursor = "#fe8019",
    scrollbar_thumb = "#3c3836",
    ansi = {"#282828", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984"},
    brights = {"#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2"},
    tab_bar = {
        inactive_tab_edge = "#282828",
        background = "#282828",
        active_tab = {
            fg_color = "#458588",
            bg_color = "#282828",
            intensity = "Bold",
            italic = true
        },
        inactive_tab = {
            fg_color = "#ebdbb2",
            bg_color = "#282828"
        },
        inactive_tab_hover = {
            fg_color = "#282828",
            bg_color = "#458588"
        },
        new_tab_hover = {
            fg_color = "#458588",
            bg_color = "#282828",
            intensity = "Bold"
        },
        new_tab = {
            fg_color = "#ebdbb2",
            bg_color = "#282828"
        }
    }
}

-- makes the tabbar look more like TUI
config.use_fancy_tab_bar = false;

config.keys = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    {
        key = 'v',
        mods = 'CTRL|ALT',
        action = wezterm.action.SplitHorizontal,
    },
    {
        key = 'h',
        mods = 'CTRL|ALT',
        action = wezterm.action.SplitVertical,
    },
    {
        key = 'j',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection "Down",
    },
    {
        key = 'k',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection "Up",
    },
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection "Right",
    },
    {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection "Left",
    },
    {
        key = 'j',
        mods = 'CTRL|CMD',
        action = wezterm.action.AdjustPaneSize { "Down", 1 },
    },
    {
        key = 'k',
        mods = 'CTRL|CMD',
        action = wezterm.action.AdjustPaneSize { "Up", 1 },
    },
    {
        key = 'l',
        mods = 'CTRL|CMD',
        action = wezterm.action.AdjustPaneSize { "Right", 1 },
    },
    {
        key = 'h',
        mods = 'CTRL|CMD',
        action = wezterm.action.AdjustPaneSize { "Left", 1 },
    },
    {
        key = 'E',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },
}

-- and finally, return the configuration to wezterm
return config
