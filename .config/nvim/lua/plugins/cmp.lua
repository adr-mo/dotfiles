return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-buffer',
        'rafamadriz/friendly-snippets',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind.nvim',
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        {
            'kristijanhusak/vim-dadbod-completion',
            ft = { 'sql', 'mysql', 'plsql' },
            lazy = true
        }
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local icons = require('config.icons')
        local border = function(hl)
            return {
                { '╭', hl },
                { '─', hl },
                { '╮', hl },
                { '│', hl },
                { '╯', hl },
                { '─', hl },
                { '╰', hl },
                { '│', hl },
            }
        end

        luasnip.setup({
            keys = function()
                return {}
            end,
        })

        cmp.setup {
            completion = {
                completeopt = 'menu,menuone,longest,preview,noinsert,noselect'
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- Luasnip expand
                end
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ['<C-Space>'] = cmp.mapping(function() if cmp.visible() then cmp.abort() else cmp.complete() end end),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                    end
                end),
                ["<S-Tab>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) == 1 then
                        luasnip.jump(-1)
                    end
                end),
                ['<C-f>'] = cmp.mapping(function(fallback) if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end end),
                ['<C-b>'] = cmp.mapping(function(fallback) if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end end),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = function(fallback)
                    if cmp.visible() and cmp.get_active_entry() then
                        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                    else
                        fallback()
                    end
                end,
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },                -- LSP
                { name = 'nvim_lsp_signature_help' }, -- LSP for parameters in functions
                { name = 'luasnip' },                 -- Luasnip
                { name = 'buffer' },
                { name = 'nvim_lua' },                -- Lua Neovim API
                { name = 'path' },                    -- Paths
            }),
            window = {
                completion = {
                    border = border("PmenuBorder"),
                    winhighlight = "Normal:CmpDoc,CursorLine:PmenuSel,Search:PmenuSel",
                    scrollbar = true,
                    col_offset = -3,
                    side_padding = 0,
                },
                documentation = {
                    border = border("CmpDocBorder"),
                    winhighlight = "Normal:CmpDoc",
                },
            },
            formatting = {
                fields = { "kind", "menu", "abbr" },
                format = function(_, vim_item)
                    vim_item.menu = vim_item.kind
                    vim_item.kind = " " .. icons.kind[vim_item.kind] .. " "
                    return vim_item
                end,
            },
            -- experimental = {
            --     ghost_text = {
            --         hl_group = "CmpItemKindKeyword",
            --     },
            -- }
        }

        -- Use buffer source for `/` and `?` (don't enable `native_menu`, otherwise this won't work).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
        -- Use cmdline & path source for ':' (don't enable `native_menu`, otherwise this won't work).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline {
                ['<C-y>'] = {
                    c = cmp.mapping.close(), --avoids ghost text behavior with noice
                },
            },
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
        })

        -- Add snippets from Friendly Snippets
        require('luasnip/loaders/from_vscode').lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })
    end
}
