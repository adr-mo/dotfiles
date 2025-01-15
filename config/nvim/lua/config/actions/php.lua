local php = {}
local utils = require('config.actions.utils')

function php.new_class()
    local oil_directory = require('oil').get_current_dir()
    if oil_directory == nil or oil_directory == '' then
        require('phpactor').rpc('new_class', {})
    else
        vim.ui.input({ prompt = 'Enter class name', },
            function(input)
                require('phpactor').rpc('new_class', { new_path = oil_directory .. '/' .. input .. '.php' })
            end
        )
    end
end

local function list_indexed_path()
    local current_file = vim.fn.expand("%:p")
    local relative_path = vim.fn.fnamemodify(current_file, ":~:.")
    local directories = {}
    local path = ""

    for dir in relative_path:gmatch("[^/]+") do
        path = path .. dir
        if dir ~= relative_path:match("[^/]+$") then
            path = path .. "/"
        end
        table.insert(directories, path)
    end

    local indexed_directories = {}
    for i, dir in ipairs(directories) do
        table.insert(indexed_directories, i .. ": " .. dir)
    end

    return indexed_directories
end

function php.phpstan_parser()
    local directories = list_indexed_path()
    vim.ui.select(directories, { prompt = 'Select directory' }, function(selected)
        if selected then
            local index = tonumber(selected:match("^(%d+):"))
            if index then
                local to_analyze = directories[index]:sub(4)
                local cmd =
                    './vendor/bin/phpstan analyze --no-progress --configuration=phpstan.core.neon --level=9 --error-format=raw ' ..
                    to_analyze
                local handle = io.popen(cmd)
                if handle ~= nil then
                    local result = handle:read("*a")
                    handle:close()

                    local qf_list = {}
                    for line in result:gmatch("([^\n]*)\n?") do
                        local file, line_num, message = line:match("([^:]+):(%d+):(.*)")
                        if file and line_num and message then
                            table.insert(qf_list, {
                                filename = file,
                                lnum = tonumber(line_num),
                                text = message
                            })
                        end
                    end

                    if #qf_list == 0 then
                        vim.notify('No errors found', vim.log.levels.INFO, { title = "PHP" })
                    else
                        vim.fn.setqflist(qf_list, 'r')
                        vim.cmd('copen')
                    end
                end
            end
        end
    end)
end

function php.move_class()
    require('phpactor').rpc('move_class')
end

function php.transform()
    require('phpactor').rpc('transform')
end

function php.clear_cache()
    local Terminal = require('toggleterm.terminal').Terminal
    local php_logs = Terminal:new({
        cmd = 'docker exec -ti centreon-app sudo -u apache /usr/bin/php /usr/share/centreon/bin/console c:c',
        direction = 'horizontal',
        close_on_exit = false
    })
    vim.notify('Clearing Symfony cache on container', vim.log.levels.INFO, { title = "PHP" })
    php_logs:toggle()
end

local function __phpcsfixer(mode, file)
    vim.ui.input(
        {
            prompt = 'File or directory',
            default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
        },
        function(input)
            vim.cmd('silent !./vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php --diff fix ' .. input)
            vim.notify(input .. ' fixed', vim.log.levels.INFO, { title = "PHP" })
        end
    )
end

local function __phpcsfixer_dry(file)
    vim.ui.input(
        {
            prompt = 'File or directory',
            default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
        },
        function(input)
            require('toggleterm').exec('./vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php --diff --dry-run fix ' ..
                input)
            vim.notify(input .. ' fixed', vim.log.levels.INFO, { title = "PHP" })
        end
    )
end

function php.phpcsfixer()
    utils.select(
        'Mode',
        {
            'fix',
            'dry-run',
        },
        {
            ['fix'] = __phpcsfixer,
            ['dry-run'] = __phpcsfixer_dry,
        }
    )
end

function php.phpstan()
    require("lint").try_lint()
end

function php.pest()
    vim.ui.input(
        {
            prompt = 'File or directory',
            default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
        },
        function(input)
            require('toggleterm').exec('./vendor/bin/pest ' .. input)
            vim.notify(input .. ' tested', vim.log.levels.INFO, { title = "PHP" })
        end
    )
end

function php.setup()
    utils.select(
        'PHP',
        {
            'New class',
            'Move class',
            'Transform',
            'Execute PHPCsFixer',
            'Execute PHPStan',
            'Execute PHPStan Parser',
            'Clear Symfony cache on container',
            'Execute unit tests',
            'Test'
        },
        {
            ['New class'] = php.new_class,
            ['Move class'] = php.move_class,
            ['Transform'] = php.transform,
            ['Execute PHPCsFixer'] = php.phpcsfixer,
            ['Execute PHPStan'] = php.phpstan,
            ['Execute PHPStan Parser'] = php.phpstan_parser,
            ['Clear Symfony cache on container'] = php.clear_cache,
            ['Test'] = php.select_path,
        }
    )
end

return php
