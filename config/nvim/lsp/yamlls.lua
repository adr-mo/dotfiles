return {
    cmd = { 'yaml-language-server', '--stdio' },
    filetypes = { 'yaml' },
    root_markers = {},
    settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
            format = {
                enable = true,
                singleQuote = true,
                bracketSpacing = true,
                proseWrap = 'always',
                printWidth = 80,
            },
            schemas = {
                ['/Users/Adrien/.config/nvim/lua/core/lsp/schemas/open-api-3.0.json'] = '/**/doc/API/**/*-api.yaml',
            },
            validate = true,
            completion = true,
            hover = true,
            navigation = { enable = true }
        },
    },
}
