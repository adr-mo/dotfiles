local utils = require('config.actions.utils')
local actions = function()
    utils.select(
        'Actions',
        {
            'docker',
            'php',
            'database',
            'http'
        },
        {
            ['docker'] = require('config.actions.docker').setup,
            ['database'] = require('config.actions.database').setup,
            ['php'] = require('config.actions.php').setup,
            ['http'] = require('config.actions.http').setup
        }
    )
end

vim.keymap.set('n', '<leader>dv', actions)

vim.api.nvim_create_user_command("Cppath", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
