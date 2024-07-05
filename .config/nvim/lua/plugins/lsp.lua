local on_attach = function()
    local options = { noremap = true, silent = true }

    local keymap = vim.keymap.set

    keymap('n', 'gr', '<cmd>Telescope lsp_references show_line=false<CR>', options)
    keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')
    keymap('n', 'K', vim.lsp.buf.hover)
    keymap('n', '<leader>d', vim.diagnostic.open_float)
    keymap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, options)
    keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', options)
    keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>')
    keymap('n', '<space>q', vim.diagnostic.setloclist)
    keymap('n', '<C-k>', vim.lsp.buf.signature_help, options)
    keymap('n', '<space>rn', vim.lsp.buf.rename, options)
    keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols ignore_symbols='variable' theme=ivy<cr>", options)
end

local languages = {
    'lua_ls',
    'tsserver',
    'cssls',
    'jsonls',
    'bashls',
    'marksman',
    'intelephense',
    'yamlls',
    'sqlls',
    'docker_compose_language_service',
    'dockerls'
}

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'b0o/schemastore.nvim',
        },
        opts = {
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                    ok = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                    ok = { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
            },
        },
        config = function()
            local lspconfig = require 'lspconfig'

            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                vim.lsp.handlers.hover, {
                    border = 'rounded'
                }
            )
            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
                vim.lsp.handlers.signature_help, {
                    border = 'rounded'
                }
            )
            vim.diagnostic.config {
                float = { border = 'rounded' }
            }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim', 'describe', 'it' },
                        },
                        hint = { enable = true }
                    },
                },
            })

            lspconfig.yamlls.setup({
                settings = {
                    yaml = {
                        schemastore = {
                            enable = false,
                            url = '',
                        },
                        schemas = require('schemastore').yaml.schemas(),
                    }
                }
            })

            lspconfig.jsonls.setup({
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable = true }
                    },
                },
            })

            lspconfig.intelephense.setup({
                commands = {
                    IntelephenseIndex = {
                        function()
                            vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
                        end,
                    },
                },
                settings = {
                    intelephense = {
                        phpDoc = {
                            returnVoid = false,
                        },
                        environment = {
                            phpVersion = "8.1"
                        }
                    }
                },
            })

            for _, language in pairs(languages) do
                lspconfig[language].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end

            vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = true
                }
            )
        end
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({
                ui = {
                    border = 'rounded',
                    icons = {
                        package_installed = '✓',
                        package_pending = '➜',
                        package_uninstalled = '✗',
                    },
                },
            })
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local mason_lspconfig = require 'mason-lspconfig'
            mason_lspconfig.setup {
                ensure_installed = languages
            }
        end
    },
}
