---@type fun(client: vim.lsp.Client, bufnr: number)
local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local map = vim.keymap.set
    local Snacks = require('snacks')

    map('n', '<leader>d', vim.diagnostic.open_float, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    map('n', '<leader>lf', vim.lsp.buf.format, opts)
    map('n', '<leader>rn', vim.lsp.buf.rename, opts)
    map({ 'i', 'n' }, '<C-k>', vim.lsp.buf.signature_help, opts)

    map('n', '<leader>h',
        function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ filter = nil, bufnr = 0 }))
        end, opts)

    map('n', '<leader>q', function()
        Snacks.picker.diagnostics_buffer()
    end, opts)
    -- map('n', '<leader>q', vim.diagnostic.setloclist, opts)
    -- map('n', 'gd', vim.lsp.buf.definition, opts)
    -- map('n', 'gD', vim.lsp.buf.declaration, opts)
    -- map('n', 'gr', vim.lsp.buf.references, opts)
    -- map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', 'gr', function()
        Snacks.picker.lsp_references({
            on_show = function()
                vim.cmd.stopinsert()
            end,
        })
    end)
    map('n', 'gd', function()
        Snacks.picker.lsp_definitions()
    end)

    map('n', 'gi', function()
        Snacks.picker.lsp_implementations({
            on_show = function()
                vim.cmd.stopinsert()
            end,
        })
    end)

    map('n', 'gD', function()
        Snacks.picker.lsp_declarations()
    end)
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)

    -- Show errors and warnings in a floating window
    vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
            vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
        end,
    })
end

local servers = {
    'lua_ls',
    -- 'phpactor',
    'intelephense',
    'yamlls',
    'jsonls',
    'bashls',
    'marksman',
    'sqlls',
    'docker_compose_language_service',
    'dockerls',
}


vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities(), on_attach = on_attach })

for _, server in ipairs(servers) do
    local config = 'core.lsp.' .. server
    vim.lsp.config[server] = require(config)
    vim.lsp.enable(server)
end

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
