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

function php.clear_cache()
    local Terminal = require('toggleterm.terminal').Terminal
    local php_logs = Terminal:new({
        cmd = 'docker exec -ti centreon-dev sudo -u apache /usr/bin/php /usr/share/centreon/bin/console c:c',
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
    vim.ui.input(
        {
            prompt = 'File or directory',
            default = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
        },
        function(input)
            require('toggleterm').exec(
                "./vendor/bin/phpstan analyze --configuration=phpstan.core.neon --level=9 " .. input
            )
            vim.notify(input .. ' analyzed', vim.log.levels.INFO, { title = "PHP" })
        end
    )
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
            'Execute PHPCsFixer',
            'Execute PHPStan',
            'Clear Symfony cache on container',
            'Execute unit tests'
        },
        {
            ['New class'] = php.new_class,
            ['Execute PHPCsFixer'] = php.phpcsfixer,
            ['Execute PHPStan'] = php.phpstan,
            ['Clear Symfony cache on container'] = php.clear_cache,
            ['Execute unit tests'] = php.pest
        }
    )
end

return php
