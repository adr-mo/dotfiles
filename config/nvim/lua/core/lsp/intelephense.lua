---@type vim.lsp.Config
return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { 'php' },
    settings = {},
    root_markers = {
        'composer.json',
        '.git',
        '.phpactor.json',
        '.phpactor.yml'
    },
}
