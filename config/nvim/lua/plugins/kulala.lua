-- https://github.com/mistweaverco/kulala.nvim
local M = {
	"mistweaverco/kulala.nvim",
	ft = { "http" },
}

local options = {
	display_mode = "split",
	split_direction = "horizontal",
	global_keymaps = true,
	icons = {
		inlay = {
			loading = "󰄨",
			done = "",
			error = "",
		},
	},
    show_request_summary = false
}

M.config = function()
	require("kulala").setup(options)
end

return M
