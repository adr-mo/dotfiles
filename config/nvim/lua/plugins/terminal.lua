local M = {
    'akinsho/toggleterm.nvim',
    version = "*",
}

M.config = function()
    require('toggleterm').setup({
        size = 15,
        direction = 'horizontal'
    })

    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = "Open terminal" })
end

return M
