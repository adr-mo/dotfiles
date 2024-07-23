-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         local palette = require("catppuccin.palettes").get_palette "mocha"
--         require("catppuccin").setup({
--             flavour = "mocha", -- latte, frappe, macchiato, mocha
--             background = {     -- :h background
--                 light = "latte",
--                 dark = "mocha",
--             },
--             transparent_background = true, -- disables setting the background color.
--             term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
--             custom_highlights = {

--             },
--         })
--
--         -- setup must be called before loading
--         vim.cmd.colorscheme "catppuccin"
--     end
-- }
--
return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
        require("rose-pine").setup({
            variant = "moon",      -- auto, main, moon, or dawn
            dark_variant = "moon", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true,        -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            highlight_groups = {
                FloatBorder = { bg = 'none', fg = "rose" },
                NormalFloat = { bg = 'none' },
                TelescopeBorder = { fg = "rose", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "none" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "rose", bg = "none" },
                TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
                TelescopeMatching = { fg = "love" },
                CmpItemKindSnippet = { fg = "text", bg = "iris" },
                CmpItemKindKeyword = { fg = "text", bg = "love" },
                CmpItemKindText = { fg = "text", bg = "pine" },
                CmpItemKindMethod = { fg = "text", bg = "pine" },
                CmpItemKindConstructor = { fg = "text", bg = "pine" },
                CmpItemKindFunction = { fg = "text", bg = "pine" },
                CmpItemKindFolder = { fg = "text", bg = "pine" },
                CmpItemKindModule = { fg = "text", bg = "pine" },
                CmpItemKindConstant = { fg = "text", bg = "foam" },
                CmpItemKindField = { fg = "text", bg = "pine" },
                CmpItemKindProperty = { fg = "text", bg = "pine" },
                CmpItemKindEnum = { fg = "text", bg = "pine" },
                CmpItemKindUnit = { fg = "text", bg = "pine" },
                CmpItemKindClass = { fg = "text", bg = "gold" },
                CmpItemKindVariable = { fg = "text", bg = "love" },
                CmpItemKindFile = { fg = "text", bg = "pine" },
                CmpItemKindInterface = { fg = "text", bg = "gold" },
                CmpItemKindColor = { fg = "text", bg = "love" },
                CmpItemKindReference = { fg = "text", bg = "love" },
                CmpItemKindEnumMember = { fg = "text", bg = "love" },
                CmpItemKindStruct = { fg = "text", bg = "pine" },
                CmpItemKindValue = { fg = "text", bg = "foam" },
                CmpItemKindEvent = { fg = "text", bg = "pine" },
                CmpItemKindOperator = { fg = "text", bg = "pine" },
                CmpItemKindTypeParameter = { fg = "text", bg = "pine" },
                CmpItemKindCopilot = { fg = "text", bg = "pine" },
                OilDir = { fg = "rose", bg = "none" }
            },
        })

        vim.cmd("colorscheme rose-pine")
    end
}
