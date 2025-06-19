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

table.insert(M, pairs)
table.insert(M, surround)
table.insert(M, trailspace)
table.insert(M, treesj)
table.insert(M, lazygit)

return M
