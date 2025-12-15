local colors = {
	red = "#F57F82",
	orange = "#F7A182",
	yellow = "#F5D098",
	lime = "#DBE6AF",
	green = "#CBE3B3",
	aqua = "#B3E3CA",
	skye = "#B3E6DB",
	snow = "#AFD9E6",
	blue = "#B2CAED",
	purple = "#D2BDF3",
	pink = "#F3C0E5",
	cherry = "#F6CEE5",
	surface0 = "#262F33",
	base = "#1E2528",
	mantle = "#191E21",
    foreground = "#f8f9e8"
}
return {
	"everviolet/nvim",
	name = "evergarden",
	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	opts = {
		theme = {
			variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
			accent = "green",
		},
		editor = {
			transparent_background = false,
			sign = { color = "none" },
			float = {
				color = "mantle",
				solid_border = false,
			},
			completion = {
				color = "surface0",
			},
		},
        style = {
            types = {},
            keyword = {},
            comment = {},
        },
		overrides = {
			WinSeparator = { bg = colors.base, fg = colors.base },
            FloatBorder = { fg = colors.mantle, bg = colors.mantle },
            FloatTitle = { fg = colors.mantle, bg = colors.cherry },
            BlinkCmpMenuSelection = { fg = colors.mantle, bg = colors.cherry }
		},
	},
	config = function(_, opts)
		require("evergarden").setup(opts)
		vim.cmd.colorscheme("evergarden")
	end,
}
