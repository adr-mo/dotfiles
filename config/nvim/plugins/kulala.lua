return {
    {
        'mistweaverco/kulala.nvim',
        config = function()
            require('kulala').setup({
                display_mode = 'split',
                split_direction = "vertical",
            })

            local map = vim.keymap.set

            map(
                "n",
                "<C-CR>",
                "<cmd>lua require('kulala').run()<cr>",
                { noremap = true, silent = true, desc = "Execute the request" }
            )
        end
    }
}
