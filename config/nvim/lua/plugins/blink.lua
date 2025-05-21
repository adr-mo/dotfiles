-- https://github.com/Saghen/blink.cmp
local M = {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim'
    },
    version = '1.*',
}

local options = {
    cmdline = {
        enabled = true,
        completion = {
            menu = { auto_show = true }
        },
        keymap = {
            preset = 'super-tab',
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback' },
        },
    },
    keymap = {
        preset = 'super-tab',
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
    },
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 250,
            treesitter_highlighting = true,
            window = { border = "" },
        },
        menu = {
            border = '',
            draw = {
                columns = {
                    { "kind_icon", "label", gap = 1 },
                    { "kind" },
                },
                components = {
                    kind_icon = {
                        text = function(item)
                            local kind = require("lspkind").symbol_map[item.kind] or ""
                            return kind .. " "
                        end,
                        highlight = "CmpItemKind",
                    },
                    label = {
                        text = function(item)
                            return item.label
                        end,
                        highlight = "CmpItemAbbr",
                    },
                    kind = {
                        text = function(item)
                            return item.kind
                        end,
                        highlight = "CmpItemKind",
                    },
                },
            },
        },
    },
    signature = {
        enabled = true,
        window = { border = "" },
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
            mysql = { 'snippets', 'dadbod', 'buffer' },
        },
        providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
    },
}

M.opts_extend = { "sources.default" }

M.config = function()
    require('blink.cmp').setup(options)
end

return M
