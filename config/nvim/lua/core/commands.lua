vim.api.nvim_create_user_command(
    'Database',
    function()
        vim.cmd [[ :tabedit Database | DBUIToggle ]]
    end,
    {
        desc = 'Open Database',
    }
)
