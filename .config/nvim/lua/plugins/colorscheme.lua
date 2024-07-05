return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "moon",      -- auto, main, moon, or dawn
            dark_variant = "moon", -- main, moon, or dawn
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
            highlight_groups = {
                FloatBorder = { bg = 'none', fg = "foam" },
                NormalFloat = { bg = 'none' },
                TelescopeBorder = { fg = "foam", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "base" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "foam", bg = "base" },
                TelescopeSelectionCaret = { fg = "foam", bg = "foam" },
                TelescopeMatching = { fg = "pine" },
                CmpItemKindSnippet = { fg = "base", bg = "iris" },
                CmpItemKindKeyword = { fg = "base", bg = "love" },
                CmpItemKindText = { fg = "base", bg = "pine" },
                CmpItemKindMethod = { fg = "base", bg = "pine" },
                CmpItemKindConstructor = { fg = "base", bg = "pine" },
                CmpItemKindFunction = { fg = "base", bg = "pine" },
                CmpItemKindFolder = { fg = "base", bg = "pine" },
                CmpItemKindModule = { fg = "base", bg = "pine" },
                CmpItemKindConstant = { fg = "base", bg = "rose" },
                CmpItemKindField = { fg = "base", bg = "foam" },
                CmpItemKindProperty = { fg = "base", bg = "foam" },
                CmpItemKindEnum = { fg = "base", bg = "foam" },
                CmpItemKindUnit = { fg = "base", bg = "foam" },
                CmpItemKindClass = { fg = "base", bg = "gold" },
                CmpItemKindVariable = { fg = "base", bg = "love" },
                CmpItemKindFile = { fg = "base", bg = "pine" },
                CmpItemKindInterface = { fg = "base", bg = "gold" },
                CmpItemKindColor = { fg = "base", bg = "love" },
                CmpItemKindReference = { fg = "base", bg = "love" },
                CmpItemKindEnumMember = { fg = "base", bg = "love" },
                CmpItemKindStruct = { fg = "base", bg = "pine" },
                CmpItemKindValue = { fg = "base", bg = "rose" },
                CmpItemKindEvent = { fg = "base", bg = "pine" },
                CmpItemKindOperator = { fg = "base", bg = "pine" },
                CmpItemKindTypeParameter = { fg = "base", bg = "pine" },
                CmpItemKindCopilot = { fg = "base", bg = "pine" },
            },
        })

        vim.cmd("colorscheme rose-pine")
    end
}
