-- https://github.com/mistweaverco/kulala.nvim
local M = {
    'mistweaverco/kulala.nvim',
    ft = { "http" },
}

local options = {
    display_mode = 'float',
    global_keymaps = true
}

M.config = function()
    require('kulala').setup(options)
end

return M
