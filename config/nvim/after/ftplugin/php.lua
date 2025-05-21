local create_class = function(args)
    local phpactor = require('phpactor')

    phpactor.rpc('new_class', {
        current_path = vim.fn.expand("%:p"),
        new_path = vim.fn.expand("%:p"),
        variant = args['args'],
        overwrite = true
    })
end

vim.api.nvim_buf_create_user_command(
    0,
    'CreateClass',
    create_class,
    { desc = 'Create PHP class' }
)

