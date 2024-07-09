local database = {}
local utils = require('config.actions.utils')

function database.centreon_database()
    vim.cmd [[ :tabedit Database | DBUIToggle ]]
end

function database.setup()
    utils.select(
        'Database',
        {
            'enter',
        },
        {
            ['enter'] = database.centreon_database,
        }
    )
end

return database
