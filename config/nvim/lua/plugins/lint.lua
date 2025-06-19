return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        local phpstan = require('lint').linters.phpstan

        phpstan.args = {
            'analyze',
            '--error-format=json',
            '--no-progress',
            '--memory-limit=1G',
            '--level=max',
            '--configuration=phpstan.core.neon'
        }

        lint.linters_by_ft = {
            php = { 'phpstan' }
        }

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
