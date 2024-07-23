-- local colors = require("catppuccin.palettes").get_palette "mocha"
--
-- local theme = {
--     normal = {
--         a = { bg = colors.blue, fg = colors.base, gui = 'bold' },
--         b = { bg = colors.none, fg = colors.blue },
--         c = { bg = colors.none, fg = colors.text },
--         x = { bg = colors.none, fg = colors.blue },
--     },
--     insert = {
--         a = { bg = colors.gold, fg = colors.base, gui = 'bold' },
--         b = { bg = colors.none, fg = colors.gold },
--         c = { bg = colors.none, fg = colors.gold },
--         x = { bg = colors.none, fg = colors.gold },
--     },
--     visual = {
--         a = { bg = colors.mauve, fg = colors.base, gui = 'bold' },
--         b = { bg = colors.none, fg = colors.mauve },
--         c = { bg = colors.none, fg = colors.mauve },
--         x = { bg = colors.none, fg = colors.mauve },
--     },
--     replace = {
--         = { bg = colors.love, fg = colors.base, gui = 'bold' },
--         b = { bg = colors.none, fg = colors.love },
--         c = { bg = colors.none, fg = colors.love },
--         x = { bg = colors.none, fg = colors.love }
--     },
--     command = {
--         a = { bg = colors.none, fg = colors.pink, gui = 'bold' },
--         b = { bg = colors.none, fg = colors.pink },
--         c = { bg = colors.none, fg = colors.pink },
--         x = { bg = colors.none, fg = colors.pink }
--
--     },
--     inactive = {
--         a = { bg = colors.none, fg = colors.subtle, gui = 'bold' },
--         b = { bg = colors.none, fg = colors.subtle },
--         c = { bg = colors.none, fg = colors.subtle },
--         x = { bg = colors.none, fg = colors.subtle }
--     }
-- }

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "meuter/lualine-so-fancy.nvim",
    },
    enabled = true,
    lazy = false,
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },
    config = function()
        require("lualine").setup({
            options = {
                globalstatus = true,
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {
                        "alpha",
                        "help",
                        "oil",
                        "toggleterm",
                        "TelescopePrompt",
                        'lazy',
                        'qf'
                    },
                    winbar = {},
                },
            },
            sections = {
                lualine_a = {
                    {
                        "fancy_mode",
                        width = 1,
                    }
                },
                lualine_b = {
                    {
                        "branch",
                    },
                },
                lualine_c = {
                    -- "%=",
                    {
                        "filename",
                        path = 1, -- 2 for full path
                    },
                },
                lualine_x = {
                    "fancy_lsp_servers",
                    "fancy_diff",
                    {
                        "fancy_diagnostics",
                        sources = { "nvim_lsp" },
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " "
                        },
                    },
                    {
                        "fancy_searchcount",
                    },
                    "progress",
                },
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    "%=",
                    {
                        "filename",
                        path = 1, -- 2 for full path
                    },
                },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "lazy" },
        })
    end,
}
