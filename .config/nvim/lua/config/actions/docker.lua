local docker = {}

function docker.enter()
    local Terminal = require('toggleterm.terminal').Terminal
    local enter_container = Terminal:new({
        cmd = 'docker exec -ti centreon-dev bash',
        direction = 'horizontal',
        close_on_exit = false
    })

    vim.notify('Entering dev container', vim.log.levels.INFO, { title = "Docker" })
    enter_container:toggle()
end

function docker.cp()
    vim.ui.input(
        {
            prompt = 'Source to copy on container',
            default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:."),
        },
        function(source)
            vim.ui.input(
                {
                    prompt = 'Destination on container',
                    default = "/usr/share/centreon/" .. source,
                },
                function(input)
                    os.execute('docker cp ' .. source .. ' centreon-dev:' .. input)
                    vim.notify('Sync ' .. source .. ' to ' .. input .. ' on container', vim.log.levels.INFO, { title = "Docker" })
                end
            )
        end
    )
end

function docker.setup()
    require('config.actions.utils').select(
        'Docker',
        {
            'Copy files on container',
            'Enter dev container (centreon-dev)'
        },
        {
            ['Copy files on container'] = docker.cp,
            ['Enter dev container (centreon-dev)'] = docker.enter
        }
    )
end

return docker
