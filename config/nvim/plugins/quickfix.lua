return {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function ()
        require('bqf').setup({
            auto_enable = true,
            preview = {
                auto_preview = true,
                win_height = 12,
                win_vheight = 12,
                delay_syntax = 80,
                border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'},
            },
        })
    end
}
