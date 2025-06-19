local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.force_reverse_video_cursor = true

config.color_scheme = 'tokyonight_moon_oled'
config.color_scheme_dirs = { "~/.config/wezterm/colors/" }

config.font_size = 17.0
config.line_height = 1.0

config.font = wezterm.font({
    family = "Agave Nerd Font Mono",
    weight = "Medium",
    harfbuzz_features = {
        "calt", -- Contains all ligatures. Substitution for : between digits
        "clig",
        "liga",
        "zero", -- Changes 0 to slashed variant.
        "cv02", -- t with curly tail (ss02)
        "cv03", -- g with more complex construction
        "cv04", -- j with curly descender
        "cv05", -- l with curly tail (ss02)
        "cv06", -- m with shorter middle leg (ss02)
        "cv07", -- Ww with lower middle peak (ss02)
        "cv11", -- y with different ascender construction (ss01)
        "cv12", -- u with traditional construction (ss01)
        "cv14", -- $ with broken bar
        "cv15", -- & alternative ampersand
        "cv16", -- Q with bent tail
        "cv17", -- f with curly ascender (ss02)
        "cv18", -- 269 variant
        "cv20", -- 5 old variant
    },
})

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.85
-- config.macos_window_background_blur = 40
config.adjust_window_size_when_changing_font_size = false

-- makes the tabbar look more like TUI
config.use_fancy_tab_bar = false;

config.window_padding = {
    left = 18,
    right = 15,
    top = 20,
    bottom = 5,
}

-- and finally, return the configuration to wezterm
return config
