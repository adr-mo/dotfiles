vim.lsp.enable({
    "lua_ls",
    "bashls",
    "dockerls",
    "docker_compose_language_service",
    "jsonls",
    "phpactor",
    "marksman",
    "sqlls",
    "yamlls",
    -- "intelephense",
    "phpactor",
})

---@type fun(client: vim.lsp.Client, bufnr: number)
local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local Snacks = require('snacks')

    vim.keymap.set(
        {
            'n',
            'v',
        },
        '<leader>ca',
        vim.lsp.buf.code_action,
        opts
    )

    vim.keymap.set('n', 'gr', function()
        Snacks.picker.lsp_references({
            on_show = function()
                vim.cmd.stopinsert()
            end,
        })
    end)

    vim.keymap.set('n', 'gd', function()
        Snacks.picker.lsp_definitions()
    end)

    vim.keymap.set(
        'n',
        '<leader>d',
        vim.diagnostic.open_float,
        opts
    )
    vim.keymap.set(
        'n',
        'K',
        vim.lsp.buf.hover,
        opts
    )
    vim.keymap.set(
        'n',
        '<leader>D',
        vim.lsp.buf.type_definition,
        opts
    )
    vim.keymap.set(
        'n',
        '<leader>lf',
        vim.lsp.buf.format,
        opts
    )
    vim.keymap.set(
        'n',
        '<leader>rn',
        vim.lsp.buf.rename,
        opts
    )
    vim.keymap.set(
        { 'i', 'n' },
        '<C-f>',
        vim.lsp.buf.signature_help,
        opts
    )
    vim.keymap.set(
        'n',
        '<leader>h',
        function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ filter = nil, bufnr = 0 }))
        end,
        opts
    )

    vim.keymap.set(
        'n',
        'gi',
        vim.lsp.buf.implementation,
        opts
    )
end

-- vim.lsp.config(
--     '*',
--     { capabilities = require('blink.cmp').get_lsp_capabilities(), on_attach = on_attach }
-- )

vim.lsp.config('*', { on_attach = on_attach})

vim.diagnostic.config({
    -- virtual_lines = true,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = false,
})
