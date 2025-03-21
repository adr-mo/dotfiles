return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        'V13Axel/neotest-pest',
    },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-pest'),
            }
        })

        vim.keymap.set('n', '<leader>pn', function() require('neotest').run.run() end)
        vim.keymap.set('n', '<leader>pf', function() require('neotest').run.run(vim.fn.expand('%')) end)
    end
}
