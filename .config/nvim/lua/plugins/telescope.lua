return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
        local telescope = require 'telescope'
        local actions = require 'telescope.actions'
        local lga_actions = require 'telescope-live-grep-args.actions'

        telescope.setup {
            defaults = {
                path_display = { "truncate" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    },
                },
            },
            pickers = {
                buffers = {
                    theme = 'dropdown',
                    layout_strategy = 'horizontal',
                    layout_config = {
                        height = 0.50,
                        width = 0.80,
                        prompt_position = 'bottom'
                    },
                    sorting_strategy = 'descending',
                    previewer = false,
                    mappings = {
                        i = {
                            ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
                        }
                    }
                },
                find_files = {
                    theme = 'dropdown',
                    layout_strategy = 'horizontal',
                    layout_config = {
                        height = 0.50,
                        width = 0.80,
                        prompt_position = 'bottom',
                    },
                    sorting_strategy = 'descending',
                    previewer = false,
                },
                lsp_references = {
                    theme = 'dropdown',
                    layout_config = {
                        height = 0.50,
                        width = 0.80,
                        prompt_position = 'bottom'
                    },
                    layout_strategy = 'horizontal',
                    previewer = true,
                },
                oldfiles = {
                    theme = 'dropdown',
                    layout_strategy = 'horizontal',
                    layout_config = {
                        height = 0.50,
                        width = 0.80,
                        prompt_position = 'bottom'
                    },
                    previewer = false,
                    only_cwd = true,
                    sorting_strategy = 'descending',
                },
            },
            extensions = {
                live_grep_args = {
                    theme = 'dropdown',
                    previewer = false,
                    layout_strategy = 'horizontal',
                    layout_config = {
                        height = 0.50,
                        width = 0.80,
                        prompt_position = 'bottom'
                    },
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = {         -- extend mappings
                        n = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                }
            }
        }

        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>ft", "<cmd>Telescope live_grep_args<CR>", { desc = "Find string" })
        keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find in buffers" })
    end,
}
