-- https://github.com/smoka7/hop.nvim
local M = {
    'smoka7/hop.nvim',
}

M.config = function()
    require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    vim.keymap.set('n', 'f', '<cmd>:HopWord<cr>', { remap = true })
end

return M
