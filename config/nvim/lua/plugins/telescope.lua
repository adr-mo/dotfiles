return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "benfowler/telescope-luasnip.nvim",
    },
    config = function()
        local telescope = require 'telescope'
        local actions = require 'telescope.actions'
        local lga_actions = require 'telescope-live-grep-args.actions'

        local layout_config = {
            width = 0.6,
            height = 0.6,
            prompt_position = "top",
        }

        telescope.setup {
            defaults = {
                path_display = { 'truncate' },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<ESC>"] = actions.close,
                        ["<TAB>"] = actions.toggle_selection,
                    },
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true
                },
                buffers = {
                    theme = 'dropdown',
                    previewer = false,
                    layout_config = layout_config,
                    sorting_strategy = 'ascending',
                    mappings = {
                        i = {
                            ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
                        }
                    },
                },
                find_files = {
                    theme = 'ivy',
                    previewer = false,
                    layout_config = layout_config,
                    sorting_strategy = 'ascending',
                },
                lsp_references = {
                    theme = 'ivy',
                    previewer = true,
                    layout_config = {
                        height = 0.50,
                        width = 0.80,
                        prompt_position = 'top'
                    },
                },
                oldfiles = {
                    theme = 'ivy',
                    previewer = false,
                    layout_config = layout_config,
                    sorting_strategy = 'ascending',
                    only_cwd = true,
                },
            },
            extensions = {
                live_grep_args = {
                    theme = 'ivy',
                    previewer = true,
                    layout_config = {
                        height = 0.50,
                    },
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = {         -- extend mappings
                        n = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                    additional_args = { '--hidden' }
                }
            }
        }

        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")
        telescope.load_extension('luasnip')

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>ft", "<cmd>Telescope live_grep_args<CR>", { desc = "Find string" })
        keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find in buffers" })
    end,
}
