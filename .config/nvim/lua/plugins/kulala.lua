return {
    {
        'mistweaverco/kulala.nvim',
        lazy = false,
        config = function()
            require('kulala').setup({})
        end
    }
}
