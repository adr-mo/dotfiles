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
                    'dashboard',
                    'NvimNotify',
                    'snacks_dashboard',
                },
                buftypes = {
                    'terminal',
                    'nofile',
                },
            },
        }
    end
}
