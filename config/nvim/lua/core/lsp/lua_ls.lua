---@type vim.lsp.Config
return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    },
    settings = {
        Lua = {
            hint = {
                enable = true,
            },
            runtime = {
                version = 'LuaJIT',
            },
            telemetry = {
                enable = false,
            },
            workspace = {
                checkThirdParty = 'Disable',
                completion = {
                    callSnippet = 'Replace',
                },
                library = {
                    vim.env.VIMRUNTIME,
                    vim.fn.expand('$VIMRUNTIME/lua'),
                    vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
                    vim.fn.stdpath('data') .. '/lazy',
                    vim.fn.stdpath('data') .. '/lazy/lazy.nvim/lua/lazy',
                },
            },
        }
    },
}
