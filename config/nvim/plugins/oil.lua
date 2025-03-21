return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require('oil')
        oil.setup({
            win_options = {
                wrap = false,
                signcolumn = "no",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "nvic",
                winblend = 0
            },
            view_options = {
                show_hidden = true
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.preview",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<Tab>"] = "actions.select",
                ["q"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["<S-Tab>"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
                ["yp"] = {
                    callback = function()
                        local entry = oil.get_cursor_entry()
                        local dir = oil.get_current_dir()
                        if not entry or not dir then
                            return
                        end
                        local relpath = vim.fn.fnamemodify(dir, ":.")
                        vim.fn.setreg("+", relpath .. entry.name)
                        vim.notify(relpath .. entry.name .. ' copied to clipboard')
                    end,
                }
            },
        })

        vim.keymap.set('n', '<leader>e', '<cmd>Oil<cr>')
    end
}
