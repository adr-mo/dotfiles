local M = { 'kristijanhusak/vim-dadbod-ui' }

M.cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
}

M.init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.dbs = {
        ['docker-database'] = 'mysql://root:centreon@127.0.0.1:3307'
    }
end

local dadbod = { 'tpope/vim-dadbod', lazy = true }
local dadbod_cmp = { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }

local dependencies = {}

table.insert(dependencies, dadbod)
table.insert(dependencies, dadbod_cmp)

M.dependencies = dependencies

return M
