return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"trevorhauter/gitportal.nvim",
		config = function()
			local gitportal = require("gitportal")

			-- Opens the current file in your browser at the correct branch/commit.
			-- When in visual mode, selected lines are included in the permalink.
			vim.keymap.set("n", "<leader>gp", gitportal.open_file_in_browser)
			vim.keymap.set("v", "<leader>gp", gitportal.open_file_in_browser)

			-- Opens a Githost link directly in Neovim, optionally switching to the branch/commit.
			vim.keymap.set("n", "<leader>ig", gitportal.open_file_in_neovim)

			-- Generates and copies the permalink of your current file to your clipboard.
			-- When in visual mode, selected lines are included in the permalink.
			vim.keymap.set("n", "<leader>gc", gitportal.copy_link_to_clipboard)
			vim.keymap.set("v", "<leader>gc", gitportal.copy_link_to_clipboard)
		end,
	},
}
