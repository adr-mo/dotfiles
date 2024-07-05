-- Available hl
--   -- General
--   DashboardHeader DashboardFooter
--   Hyper theme
--   DashboardProjectTitle DashboardProjectTitleIcon DashboardProjectIcon
--   DashboardMruTitle DashboardMruIcon DashboardFiles DashboardShortCutIcon
return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        local dashboard = require 'dashboard'

        dashboard.setup {
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        desc = '󰊳 Update',
                        group = '@property',
                        action = 'Lazy update',
                        key = 'u',
                    },
                    {
                        icon_hl = '@variable',
                        desc = ' Files',
                        group = 'Label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        icon = ' ',
                        desc = 'Grep',
                        group = 'DiagnosticHint',
                        action = 'Telescope live_grep_args',
                        key = 'g',
                    },
                    {
                        icon = ' ',
                        desc = 'Quit',
                        group = 'DiagnosticError',
                        action = ':q',
                        key = 'q',
                    },
                },
                mru = {
                    enable = false,
                    limit = 10,
                    icon = ' ',
                    label = 'Recent Files',
                    cwd_only = true,
                },
                project = {
                    enable = false
                }
            },
        }

        -- vim.api.nvim_set_hl(1, 'DashboardHeader', { fg = colors.mauve })
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
