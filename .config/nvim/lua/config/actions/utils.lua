local utils = {}

function utils.select(title, choices, actions)
    vim.ui.select(
        choices,
        {
            prompt = title,
            telescope = require("telescope.themes").get_dropdown(),
        },
        function(selected)
            if actions[selected] then
                actions[selected]()
            end
        end
    )
end

return utils
