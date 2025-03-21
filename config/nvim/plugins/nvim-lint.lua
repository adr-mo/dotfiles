return {
    'mfussenegger/nvim-lint',
    config = function ()
        local phpstan = require('lint').linters.phpstan

        phpstan.args = {
            'analyze',
            '--error-format=json',
            '--no-progress',
            '--configuration=phpstan.core.neon',
            '--level=9',
            '--memory-limit=1G'
        }

        require('lint').linters_by_ft = {
            php = {'phpstan'}
        }
    end
}
