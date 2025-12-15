return {
    'smoka7/hop.nvim',
    config = function()
        require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
        vim.keymap.set('n', 'F', '<cmd>:HopNodes<cr>', { remap = true })
        vim.keymap.set('n', 'f', '<cmd>:HopWord<cr>', { remap = true })
    end
}
