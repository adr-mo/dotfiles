local P = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
}

P.config = function()
    require('tokyonight').setup({
        style = "moon",         -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
        light_style = "day",    -- The theme is used when the background is set to light
        transparent = false,    -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
            -- Style to be applied to different syntax groups
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            comments = { italic = true },
            keywords = { italic = false },
            functions = {},
            variables = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "transparent", -- style for sidebars, see below
            floats = "transparent",   -- style for floating windows
        },
        on_colors = function(colors) end,
        on_highlights = function(highlights, colors)
            highlights.InclineNormal = { bg = colors.blue, fg = colors.bg }
        end,
    })

    vim.o.background = 'dark'
    vim.cmd.colorscheme 'tokyonight'
end

return P
