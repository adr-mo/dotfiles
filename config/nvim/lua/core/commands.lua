-- local create_class = function(args)
--     require('phpactor').rpc('new_class', {
--         current_path = vim.fn.expand("%:p"),
--         new_path = vim.fn.expand("%:p"),
--         variant = args['args'],
--         overwrite = true
--     })
-- end
--
-- vim.api.nvim_create_user_command(
--     'CreateClass',
--     create_class,
--     { desc = 'Create PHP class' }
-- )
--
vim.api.nvim_create_user_command(
    'Database',
    function()
        vim.cmd [[ :tabedit Database | DBUIToggle ]]
    end,
    {
        desc = 'Open Database',
    }
)
