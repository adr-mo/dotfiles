-- https://github.com/Saghen/blink.cmp
local M = {
    'saghen/blink.cmp',
    dependencies = {
        { "L3MON4D3/LuaSnip" },
        {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
            end,
        }
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
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
    },
    completion = {
        menu = {
            border = nil,
            scrolloff = 1,
            scrollbar = false,
            draw = {
                columns = {
                    { "kind_icon" },
                    { "label",      "label_description", gap = 1 },
                    { "kind" },
                    { "source_name" },
                },
            },
        },
        documentation = {
            window = {
                border = nil,
                scrollbar = false,
                winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
            },
            auto_show = true,
            auto_show_delay_ms = 500,
        },
    },
    -- completion = {
    --     accept = {
    --         auto_brackets = { enabled = true },
    --     },
    --     documentation = {
    --         auto_show = true,
    --         auto_show_delay_ms = 250,
    --         treesitter_highlighting = true,
    --         window = { border = "rounded", winblend = 10 }
    --     },
    --     menu = {
    --         border = 'rounded',
    --         draw = {
    --             columns = {
    --                 {
    --                     "label",
    --                     "label_description",
    --                     gap = 1,
    --                 },
    --                 {
    --                     "kind_icon",
    --                     "kind",
    --                 }
    --             }
    --         }
    --     }
    -- },
    signature = {
        enabled = true,
        window = { border = "rounded", winblend = 10 }
    },
    snippets = {
        preset = "luasnip",
    },
    sources = {
        default = { 'lsp', 'snippets', 'buffer' },
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
