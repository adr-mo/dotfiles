return {
    {
        "gbprod/phpactor.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required to update phpactor
            "neovim/nvim-lspconfig"  -- required to automaticly register lsp serveur
        },
        -- build = function()
        --     require'phpactor.handler.update'()
        -- end,
        config = function()
            require("phpactor").setup({
                install = {
                    bin = "/Users/Adrien/.local/bin/phpactor",
                    php_bin = "php",
                    composer_bin = "composer",
                    git_bin = "git",
                    check_on_startup = "none",
                },
                lspconfig = {
                    enabled = false,
                    options = {},
                },
            })
        end
    },
}


