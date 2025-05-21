return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
    event = "BufRead",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "make",
                "http",
                "markdown",
                "php",
                "phpdoc",
                "query",
                "sql",
                "twig",
                "vim",
                "vimdoc",
                "yaml",
            },
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                },
            },
            additional_vim_regex_highlighting = false,
        })
    end,
}
