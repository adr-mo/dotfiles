local http = {}
local utils = require('config.actions.utils')

function http.run()
    require('kulala').run()
end

function http.copy()
    require('kulala').copy()
end

function http.setup()
    utils.select(
        'PHP',
        {
            'Run current request',
            'Copy as cURL command',
        },
        {
            ['Run current request'] = http.run,
            ['Copy as cURL command'] = http.copy,
        }
    )
end

return http
