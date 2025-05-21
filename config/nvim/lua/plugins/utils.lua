local M = {}

-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
local pairs = { "echasnovski/mini.pairs", event = "VeryLazy" }

pairs.config = function()
    require('mini.pairs').setup({
        modes = { insert = true, command = true, terminal = false },
        -- skip autopair when next character is one of these
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        -- skip autopair when the cursor is inside these treesitter nodes
        skip_ts = { "string" },
        -- skip autopair when next character is closing pair
        -- and there are more closing pairs than opening pairs
        skip_unbalanced = true,
        -- better deal with markdown code blocks
        markdown = true,
        mappings = {
            ["`"] = false,
        },
    })
end

-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
local surround = { 'echasnovski/mini.surround', version = '*' }

surround.config = function()
    require('mini.surround').setup()
end

-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-trailspace.md
local trailspace = { 'echasnovski/mini.trailspace', version = '*' }

trailspace.config = function()
    require('mini.trailspace').setup()
end

-- https://github.com/Wansmer/treesj
local treesj = { 'Wansmer/treesj' }

treesj.config = function()
    require('treesj').setup()
end

-- https://github.com/kdheepak/lazygit.nvim
local lazygit = { "kdheepak/lazygit.nvim", lazy = true }

lazygit.cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
}

local files = { 'echasnovski/mini.files', version = '*' }
files.config = function()
    local MiniFiles = require('mini.files')
    MiniFiles.setup({
        -- Customization of shown content
        content = {
            -- Predicate for which file system entries to show
            filter = nil,
            -- What prefix to show to the left of file system entry
            prefix = nil,
            -- In which order to show file system entries
            sort = nil,
        },

        -- Module mappings created only inside explorer.
        -- Use `''` (empty string) to not create one.
        mappings = {
            close       = 'q',
            go_in       = 'l',
            go_in_plus  = 'L',
            go_out      = 'h',
            go_out_plus = 'H',
            mark_goto   = "'",
            mark_set    = 'm',
            reset       = '<BS>',
            reveal_cwd  = '@',
            show_help   = 'g?',
            synchronize = '=',
            trim_left   = '<',
            trim_right  = '>',
        },

        -- General options
        options = {
            -- Whether to delete permanently or move into module-specific trash
            permanent_delete = true,
            -- Whether to use for editing directories
            use_as_default_explorer = true,
        },

        -- Customization of explorer windows
        windows = {
            -- Maximum number of windows to show side by side
            max_number = math.huge,
            -- Whether to show preview of file/directory under cursor
            preview = false,
            -- Width of focused window
            width_focus = 50,
            -- Width of non-focused window
            width_nofocus = 15,
            -- Width of preview window
            width_preview = 25,
        },
    })

    vim.keymap.set(
        "n",
        "<leader>ee",
        "<cmd>lua MiniFiles.open()<CR>",
        { desc = "Toggle mini file explorer" }
    ) -- toggle file explorer

    vim.keymap.set(
        "n",
        "<leader>ef",
        function()
            MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
            MiniFiles.reveal_cwd()
        end,
        {
            desc = "Toggle into currently opened file",
        }
    )
end

table.insert(M, pairs)
table.insert(M, surround)
table.insert(M, trailspace)
table.insert(M, treesj)
table.insert(M, lazygit)
table.insert(M, files)

return M
