return {
        "tpope/vim-dadbod",
        config = function()
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.dbs = {
                ['docker-database'] = 'mysql://root@127.0.0.1:3307'
            }

            vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "sql",
                },
                command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "sql",
                    "mysql",
                    "plsql",
                },
                callback = function()
                    require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
                end,
            })
        end,
        cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
    },
    {
        "nanotee/sqls.nvim",
        cmd = {
            "SqlsExecuteQuery",
            "SqlsExecuteQueryVertical",
            "SqlsShowDatabases",
            "SqlsShowSchemas",
            "SqlsShowConnections",
            "SqlsSwitchDatabase",
            "SqlsSwitchConnection",
        },
    }
