-- https://github.com/lukas-reineke/indent-blankline.nvim
local M = { "lukas-reineke/indent-blankline.nvim", main = "ibl" }

M.config = function ()
    require('ibl').setup()
end

return M
