return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.ai').setup()
        require('mini.pairs').setup()
        require('mini.cursorword').setup()
        require('mini.surround').setup()
    end
}
