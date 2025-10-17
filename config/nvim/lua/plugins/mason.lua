-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
local M = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'b0o/schemastore.nvim',
    }
}

M.config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'lua_ls',
            'cssls',
            'jsonls',
            'bashls',
            'marksman',
            'intelephense',
            'yamlls',
            'sqlls',
            'docker_compose_language_service',
            'dockerls',
            'biome',
            'vtsls'
            -- 'phpactor'
        },
        automatic_installation = true,
        handlers = nil
    })
end

return M
