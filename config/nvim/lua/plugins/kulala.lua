vim.api.nvim_create_autocmd("FileType", {
    pattern = "http",
    callback = function()
        -- map "<leader>x' to execute the HTTP request
        vim.keymap.set("n", "<C-CR>", function()
            require('kulala').run()
        end, { buffer = true })
    end,
})

-- https://github.com/mistweaverco/kulala.nvim
local M = { 'mistweaverco/kulala.nvim', ft = { "http" } }

local options = {
    display_mode = 'float',
    split_direction = "vertical",
}

M.config = function ()
    require('kulala').setup(options)
end

return M
