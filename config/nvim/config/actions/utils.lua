local utils = {}

function utils.select(title, choices, actions)
    Snacks.picker.select(
        choices,
        {
            prompt = title,
        },
        function(selected)
            if actions[selected] then
                actions[selected]()
            end
        end
    )
end

function utils.list_indexed_path()
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

return utils
