-- ---@type vim.lsp.Config
return {
    cmd = { 'phpactor', 'language-server' },
    filetypes = { 'php' },
    init_options = {
        ['language_server_configuration.auto_config'] = false,
        ['phpunit.enabled'] = true,
        ['symfony.enabled'] = true,
        ['language_server_worse_reflection.inlay_hints.enable'] = true,
        ['language_server_worse_reflection.inlay_hints.types'] = true,
        ['language_server_worse_reflection.inlay_hints.params'] = true,
        ['code_transform.class_new.variants'] = {
            ['core'] = 'core_class',
            ['modules'] = 'modules_class',
            ['core_interface'] = 'core_interface',
            ['modules_interface'] = 'modules_interface',
        },
        ['code_transform.refactor.generate_accessor.prefix'] = 'get',
        ['code_transform.refactor.generate_accessor.upper_case_first'] = true,
        ['code_transform.refactor.generate_mutator.prefix'] = 'set',
        ['code_transform.refactor.generate_mutator.upper_case_first'] = true,
        ['language_server_completion.trim_leading_dollar'] = true,
    },
    root_markers = {
        'composer.json',
        '.git',
        '.phpactor.json',
        '.phpactor.yml'
    },
}
