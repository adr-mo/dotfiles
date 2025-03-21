return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = false, -- disables setting the background color.
            no_italic = true,               -- Force no italic
            color_overrides = {},
            custom_highlights = function(colors)
                return {
                    FloatTitle = {fg = colors.base, bg = colors.mauve},
                    NormalFloat = { bg = colors.none },
                    FloatBorder = { bg = colors.base, fg = colors.base }
                }
            end,
            default_integrations = true,
        })

        vim.cmd.colorscheme 'catppuccin-latte'
    end
}
