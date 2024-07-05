return {
    'rcarriga/nvim-notify',
    config = function()
        local notify = require('notify')
        notify.setup({
            render = 'wrapped-compact',
            stages = 'fade',
            top_down = false,
            background_colour = "#000000"
        })
        vim.notify = notify
    end
}
