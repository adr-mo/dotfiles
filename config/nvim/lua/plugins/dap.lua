return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio"
    },
    keys = {
        { "<F2>", ":lua require'dap'.step_over()<CR>",         desc = "DAP step over" },
        { "<F3>", ":lua require'dap'.step_into()<CR>",         desc = "DAP step into" },
        { "<F4>", ":lua require'dap'.step_out()<CR>",          desc = "DAP step out" },
        { "<F5>", ":lua require'dap'.toggle_breakpoint()<CR>", desc = "DAP toggle breakpoint" },
        { "<F6>", ":lua require'dapui'.toggle()<CR>",          desc = "DAP toggle UI" },
        { "<F8>", ":lua require'dap'.continue()<CR>",          desc = "DAP continue" },
        { "<F9>", ":lua require('dapui').eval()<CR>",          desc = "DAP eval" },
    },
    config = function()
        local dap, dapui = require('dap'), require('dapui')
        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
        end

        dapui.setup({
            {
                controls = {
                    element = "repl",
                    enabled = true,
                    icons = {
                        disconnect = "",
                        pause = "",
                        play = "",
                        run_last = "",
                        step_back = "",
                        step_into = "",
                        step_out = "",
                        step_over = "",
                        terminate = ""
                    }
                },
                element_mappings = {},
                expand_lines = true,
                floating = {
                    max_height = 0.9,
                    max_width = 0.5,    -- Floats will be treated as percentage of your screen.
                    border = 'rounded', -- Border style. Can be 'single', 'double' or 'rounded'
                    mappings = {
                        close = { 'q', '<Esc>' },
                    },
                },
                force_buffers = true,
                icons = {
                    collapsed = "",
                    current_frame = "",
                    expanded = ""
                },
                layouts = {
                    {
                        elements = {
                            { id = 'scopes',      size = 0.33 },
                            { id = 'breakpoints', size = 0.17 },
                            { id = 'stacks',      size = 0.25 },
                            { id = 'watches',     size = 0.25 },
                        },
                        position = "left",
                        size = 0.33
                    },
                    {
                        elements = {
                            { id = 'repl',    size = 0.45 },
                            { id = 'console', size = 0.55 },
                        },
                        size = 0.27,
                        position = "bottom",
                    }
                },
                mappings = {
                    edit = "e",
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    repl = "r",
                    toggle = "t"
                },
                render = {
                    indent = 1,
                    max_value_lines = 100
                }
            }
        })

        dap.adapters.php = {
            type = "executable",
            command = "php-debug-adapter",
            -- args = { os.getenv("HOME") .. ".vscode/extensions/felixfbecker.php-debug-1.14.12/out/phpDebug.js" }
        }

        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "Listen for xdebug",
                hostname = "127.0.0.1",
                port = "9001",
                log = true,
                pathMappings = {
                    ['/usr/share/centreon/'] = "/Users/Adrien/workspace/code/centreon/centreon/"
                },
            },
        }

        local sign = vim.fn.sign_define

        sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
        sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
        sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

        dap.defaults.fallback.terminal_win_cmd = "20split new"
    end
}

