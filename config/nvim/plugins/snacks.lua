return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        { "<leader>ff", function() Snacks.picker.files({ layout = { preview = false } }) end, desc = "Find Files" },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers({
                    -- I always want my buffers picker to start in normal mode
                    on_show = function()
                        vim.cmd.stopinsert()
                    end,
                    win = {
                        input = {
                            keys = {
                                ["d"] = "bufdelete",
                            },
                        },
                        list = { keys = { ["d"] = "bufdelete" } },
                    },
                })
            end,
            desc = "Find in buffers",
        },
        { "<leader>/",  function() Snacks.picker.grep({}) end,                            desc = "Grep" },
        { "<leader>fr", function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = "Recent" },
        { "<leader>sb", function() Snacks.picker.lines() end,                             desc = "Buffer Lines" },
        { "<leader>sw", function() Snacks.picker.grep_word() end,                         desc = "Visual selection or word", mode = { "n", "x" } },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end,                      desc = "Grep in buffers",          mode = { "n", "x" } },
        -- search
        { "<leader>sd", function() Snacks.picker.diagnostics() end,                       desc = "Diagnostics" },
        { "gd",         function() Snacks.picker.lsp_definitions() end,                   desc = "Goto Definition" },
        { "gr",         function() Snacks.picker.lsp_references() end,                    nowait = true,                     desc = "References" },
        { "gi",         function() Snacks.picker.lsp_implementations() end,               desc = "Goto Implementation" },
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,              desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols({}) end,                     desc = "Lsp Symbols" },
    },
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        indent = { enabled = false },
        input = { enabled = true },
        picker = {
            formatters = {
                file = {
                    filename_first = true, -- display filename before the file path
                    truncate = 50,         -- truncate the file path to (roughly) this length
                    filename_only = false, -- only show the filename
                },
            },
            -- layout = {
            --     preview = true,
            --     -- layout = {
            --     --     backdrop = false,
            --     --     row = 1,
            --     --     width = 0.8,
            --     --     min_width = 80,
            --     --     height = 0.8,
            --     --     border = "none",
            --     --     box = "vertical",
            --     --     { win = "input",   height = 1,          border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
            --     --     { win = "list",    border = "rounded" },
            --     --     { win = "preview", title = "{preview}", border = "rounded" },
            --     -- },
            --     layout = {
            --         box = "horizontal",
            --         width = 0.8,
            --         min_width = 120,
            --         height = 0.8,
            --         {
            --             box = "vertical",
            --             border = "rounded",
            --             title = "{title} {live} {flags}",
            --             { win = "input", height = 1,     border = "bottom" },
            --             { win = "list",  border = "none" },
            --         },
            --         { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
            --     },
            -- }
        },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
    }
}
