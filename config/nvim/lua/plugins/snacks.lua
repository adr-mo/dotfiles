local M = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
}
M.keys = {

    { "<leader>ff", function() Snacks.picker.files() end,                             desc = "Find Files" },
    {
        "<leader>fb",
        function()
            Snacks.picker.buffers({
                on_show = function() vim.cmd.stopinsert() end,
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
    { "/",          function() Snacks.picker.lines() end,                             desc = "Buffer Lines" },
    { "<leader>sw", function() Snacks.picker.grep_word() end,                         desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end,                      desc = "Grep in buffers",          mode = { "n", "x" } },
    -- search
    { "<leader>sd", function() Snacks.picker.diagnostics() end,                       desc = "Diagnostics" },
    { "gd",         function() Snacks.picker.lsp_definitions() end,                   desc = "Goto Definition" },
    { "gr",         function() Snacks.picker.lsp_references() end,                    nowait = true,                     desc = "References" },
    { "gi",         function() Snacks.picker.lsp_implementations() end,               desc = "Goto Implementation" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end,              desc = "Goto T[y]pe Definition" },
    { "<leader>rN", function() require("snacks").rename.rename_file() end,            desc = "Fast Rename Current File" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols({}) end,                     desc = "Lsp Symbols" },
    { "<leader>E",  function() Snacks.picker.explorer() end,                          desc = "Snacks Explorer" }
}

M.opts = {
    notifier = {
        enable = true,
        top_down = false,
    },
    input = {
        enable = true
    },
    picker = {
        hidden = true,
        layout = {
            preset = "vscode",
            fullscreen = false,
            cycle = false,
        },
        layouts = {
            vscode = {
                preview = false,
                layout = {
                    backdrop = false,
                    row = 0,
                    width = 0,
                    min_width = 80,
                    height = 0.4,
                    border = "none",
                    box = "vertical",
                    { win = "input",   height = 1,          border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
                    { win = "list",    border = "hpad" },
                    { win = "preview", title = "{preview}", border = "rounded" },
                },
            }
        },
        sources = {
            files = {
                hidden = true,
            },
            recent_files = {
                filter = { cwd = true },
            },
            explorer = {
                auto_close = true,
                win = {
                    list = {
                        keys = {
                            ["o"] = "confirm",
                        },
                    },
                },
                -- layout = {
                --     fullscreen = true,
                --     preview = true,
                --     layout = {
                --         backdrop = false,
                --         width = 40,
                --         min_width = 40,
                --         height = 0,
                --         position = "right",
                --         border = "none",
                --         box = "vertical",
                --         {
                --             win = "input",
                --             height = 1,
                --             border = "rounded",
                --             title = "{title} {live} {flags}",
                --             title_pos = "center",
                --         },
                --         { win = "list", border = "none" },
                --     },
                -- },
            },
        },
        formatters = {
            file = {
                filename_first = true,
            },
        },
    },
    zen = {
        win = {
            enter = true,
            fixbuf = false,
            minimal = false,
            width = 150,
            height = 0,
            backdrop = { transparent = true, blend = 10 },
            keys = { q = false },
            zindex = 40,
            wo = {
                winhighlight = "NormalFloat:Normal",
            },
        },
    },
    scope = {
        enabled = true,
        treesitter = {
            blocks = {
                "function_declaration",
                "function_definition",
                "method_declaration",
                "method_definition",
                "class_declaration",
                "class_definition",
                "do_statement",
                "while_statement",
                "repeat_statement",
                "if_statement",
                "for_statement",
                "try_statement",
                "with_statement",
            },
        },
    },
    indent = {
        enabled = false,
        animate = {
            enabled = false,
        },
    },
    win = {
        input = {
            keys = {
                ["<Esc>"] = { "close", mode = { "n", "i" } },
                ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
                ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
                ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
                ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
            },
        },
    },
    formatters = {
        file = {
            filename_first = true, -- display filename before the file path
            truncate = 200,
        },
    },
}

return M
