local function mysplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

local function get_path()
    local sp = mysplit(vim.fn.expand('%'), '/')
    local choices = {}

    for i in ipairs(sp) do
        table.insert(choices, table.concat(sp, '/'))
        table.remove(sp)
    end

    return choices
end

local function __select(choices)
    vim.ui.select(
        choices,
        {
            prompt = "Path to analyze",
            telescope = require("telescope.themes").get_dropdown(),
        },
        function(selected)
            if selected == 'git-diff' then
            elseif selected == 'paths' then
                __select(get_path())
            end
            vim.notify('Path selected ' .. selected)
        end
    )
end

-- __select({'git-diff', 'paths'})
--
-- print(vim.inspect(sp))

