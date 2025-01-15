return {
    'nvim-tree/nvim-tree.lua',
    keys = {
        { "\\", "<cmd>NvimTreeFindFileToggle<cr>", desc = "NvimTree" },
    },
    config = function()
        require('nvim-tree').setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 40,
                side = 'left'
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
    end
}
