local utils = require('config.actions.utils')
local docker = {}

function docker.enter()
    local Terminal = require('toggleterm.terminal').Terminal
    local enter_container = Terminal:new({
        cmd = 'docker exec -ti centreon-app bash',
        direction = 'horizontal',
        close_on_exit = false
    })

    vim.notify('Entering dev container', vim.log.levels.INFO, { title = "Docker" })
    enter_container:toggle()
end

function docker.cp()
    local directories = utils.list_indexed_path()
    vim.ui.select(directories, { prompt = 'Source to copy on container' }, function(selected)
        if selected then
            local index = tonumber(selected:match("^(%d+):"))
            if index then
                local to_copy = directories[index]:sub(4)
                vim.ui.input(
                {
                    prompt = 'Destination on container',
                    default = "/usr/share/centreon/" .. to_copy,
                },
                function(input)
                    os.execute('docker cp ' .. to_copy .. ' centreon-app:' .. input)
                    vim.notify('Sync ' .. to_copy .. ' to ' .. input .. ' on container', vim.log.levels.INFO, { title = "Docker" })
                end
            )
            end
        end
    end)
end

function docker.setup()
    require('config.actions.utils').select(
        'Docker',
        {
            'Copy files on container',
            'Enter dev container (centreon-app)'
        },
        {
            ['Copy files on container'] = docker.cp,
            ['Enter dev container (centreon-app)'] = docker.enter
        }
    )
end

return docker
