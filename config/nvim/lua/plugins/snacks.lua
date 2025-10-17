local M = {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
}

M.keys = {
	{
		"<leader>ff",
		function()
			Snacks.picker.files()
		end,
		desc = "Find Files",
	},
	{
		"<leader>fb",
		function()
			Snacks.picker.buffers({
				on_show = function()
					vim.cmd.stopinsert()
				end,
				win = {
					input = {
						keys = {
							["d"] = "bufdelete",
						},
					},
					list = { keys = { ["d"] = "bufdelete" } },
				},
			})
		end,
		desc = "Find in buffers",
	},
	{
		"<leader>/",
		function()
			Snacks.picker.grep({})
		end,
		desc = "Grep",
	},
	{
		"<leader>fr",
		function()
			Snacks.picker.recent({ filter = { cwd = true } })
		end,
		desc = "Recent",
	},
	{
		"<leader>gb",
		function()
			Snacks.picker.lines()
		end,
		desc = "Buffer Lines",
	},
	{
		"<leader>sw",
		function()
			Snacks.picker.grep_word()
		end,
		desc = "Visual selection or word",
		mode = { "n", "x" },
	},
	{
		"<leader>sB",
		function()
			Snacks.picker.grep_buffers()
		end,
		desc = "Grep in buffers",
		mode = { "n", "x" },
	},
	-- search
	{
		"<leader>sd",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "Diagnostics",
	},
	{
		"gd",
		function()
			Snacks.picker.lsp_definitions()
		end,
		desc = "Goto Definition",
	},
	{
		"gr",
		function()
			Snacks.picker.lsp_references()
		end,
		nowait = true,
		desc = "References",
	},
	{
		"gi",
		function()
			Snacks.picker.lsp_implementations()
		end,
		desc = "Goto Implementation",
	},
	{
		"gy",
		function()
			Snacks.picker.lsp_type_definitions()
		end,
		desc = "Goto T[y]pe Definition",
	},
	{
		"<leader>rN",
		function()
			require("snacks").rename.rename_file()
		end,
		desc = "Fast Rename Current File",
	},
	{
		"<leader>ss",
		function()
			Snacks.picker.lsp_symbols({})
		end,
		desc = "Lsp Symbols",
	},
	{
		"<leader>E",
		function()
			Snacks.picker.explorer()
		end,
		desc = "Snacks Explorer",
	},
}

M.opts = {
	notifier = {
		enable = true,
		top_down = false,
	},
	input = {
		enable = true,
	},
	picker = {
		hidden = true,
		layout = {
			preset = "telescope",
			fullscreen = false,
			cycle = false,
		},
		layouts = {
			telescope = {
				reverse = false,
				layout = {
					box = "horizontal",
					backdrop = false,
					width = 0.9,
					height = 0.9,
					border = "none",
					{
						box = "vertical",
						{
							win = "input",
							height = 1,
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
						{ win = "list", title = " Results ", title_pos = "center", border = "none" },
					},
				},
			},
			custom = {
				layout = {
					box = "horizontal",
					width = 0.8,
					min_width = 120,
					height = 0.8,
					{
						box = "vertical",
						border = "rounded",
						title = "{title} {live} {flags}",
						{ win = "input", height = 1, border = "bottom" },
						{ win = "list", border = "none" },
					},
					-- { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
				},
			},
		},
		sources = {
			files = {
				hidden = true,
			},
			recent_files = {
				filter = { cwd = true },
			},
			explorer = {
				auto_close = true,
				win = {
					list = {
						keys = {
							["o"] = "confirm",
						},
					},
				},
			},
		},
		formatters = {
			file = {
				-- filename_first = true,
			},
		},
	},
	scope = {
		enabled = true,
		treesitter = {
			blocks = {
				"function_declaration",
				"function_definition",
				"method_declaration",
				"method_definition",
				"class_declaration",
				"class_definition",
				"do_statement",
				"while_statement",
				"repeat_statement",
				"if_statement",
				"for_statement",
				"try_statement",
				"with_statement",
			},
		},
	},
	indent = {
		enabled = false,
		animate = {
			enabled = false,
		},
	},
	win = {
		input = {
			keys = {
				["<Esc>"] = { "close", mode = { "n", "i" } },
				["J"] = { "preview_scroll_down", mode = { "i", "n" } },
				["K"] = { "preview_scroll_up", mode = { "i", "n" } },
				["H"] = { "preview_scroll_left", mode = { "i", "n" } },
				["L"] = { "preview_scroll_right", mode = { "i", "n" } },
			},
		},
	},
	formatters = {
		file = {
			filename_first = true, -- display filename before the file path
			truncate = 200,
		},
	},
}

return M
