-- https://github.com/chrisgrieser/nvim-scissors
local M = { "chrisgrieser/nvim-scissors" }

local options = {
    snippetDir = vim.fn.stdpath("config") .. "/snippets/",
}

M.config = function ()
    require('scissors').setup(options)
end

return M
