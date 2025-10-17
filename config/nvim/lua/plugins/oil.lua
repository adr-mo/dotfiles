local function process_path(input)
    if input:match("%.%w+$") then
        -- If the input has a file extension, return it as is
        return '/usr/share/centreon/' .. input
    else
        -- Otherwise, remove everything after the last '/'
        return '/usr/share/centreon/' .. input:match("^(.*)/") or input
    end
end

-- https://github.com/stevearc/oil.nvim
local M = {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil"
}

---@module 'oil'
---@type oil.SetupOpts
local options = {
    use_default_keymaps = false,
    default_file_explorer = true,
    buf_options = { buflisted = true },
    keymaps = {
        ["<Tab>"] = "actions.select",
        ["<S-Tab>"] = "actions.parent",
        ["<leader>p"] = "actions.preview",
        ["<C-r>"] = "actions.refresh",
        ["q"] = { "actions.close", mode = "n" },
        ["`"] = "actions.cd",
        [">"] = {
            callback = function()
                local oil = require("oil")

                local entry = oil.get_cursor_entry()
                local dir = oil.get_current_dir()
                if not entry or not dir then
                    return
                end

                local path = dir .. entry.name
                if vim.fn.isdirectory(path) ~= 0 == false then
                    path = vim.fn.fnamemodify(path, ":p:h")
                end

                local snacks = require("snacks")
                snacks.picker.grep({ layout = "ivy", dirs = { path } })
            end
        },
        ["cpp"] = {
            callback = function()
                local oil = require('oil')
                local entry = oil.get_cursor_entry()
                local dir = oil.get_current_dir()
                if not entry or not dir then
                    return
                end
                local relpath = vim.fn.fnamemodify(dir, ":.")
                vim.fn.setreg("+", relpath .. entry.name)
                vim.notify(relpath .. entry.name .. ' copied to clipboard')
            end,
        },
        ["S"] = {
            callback = function()
                local oil = require('oil')
                local entry = oil.get_cursor_entry()
                local dir = oil.get_current_dir()
                if not entry or not dir then
                    return
                end
                local local_path = vim.fn.fnamemodify(dir, ":.") .. entry.name
                local remove_path = process_path(local_path)
                os.execute('docker cp ' .. local_path .. ' centreon-app:' .. remove_path .. ' 2>&1 > /dev/null')
                vim.notify(local_path .. ' synchronized on container !')
            end,
        },
    },
    view_options = { show_hidden = true },
    lsp_file_methods = { enabled = false },
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = true,
}

M.config = function()
    require('oil').setup(options)

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "oil",     -- Adjust if Oil uses a specific file type identifier
        callback = function()
            vim.opt_local.cursorline = true
            vim.opt_local.relativenumber = false
            vim.opt_local.number = false
        end,
    })
end

return M
