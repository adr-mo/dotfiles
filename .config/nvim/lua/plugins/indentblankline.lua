return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = function()
        require('ibl').setup {
            exclude = {
                filetypes = {
                    'help',
                    'lazy',
                    'toggleterm',
                    'NvimTree',
                    'dashboard'
                },
                buftypes = {
                    'terminal',
                    'nofile',
                },
            },
        }
    end
}
