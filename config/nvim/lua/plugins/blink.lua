return {
	"saghen/blink.cmp",
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
			end,
		},
	},
	version = "1.*",
	opts_extend = { "sources.default" },
	config = function()
		require("blink.cmp").setup({
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			cmdline = {
				enabled = true,
				completion = {
					menu = { auto_show = true },
				},
				keymap = {
					preset = "super-tab",
					["<C-j>"] = { "select_next", "fallback" },
					["<C-k>"] = { "select_prev", "fallback" },
				},
			},
			keymap = {
				preset = "super-tab",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
			},
			completion = {
				menu = {
					min_width = 34,
					max_height = 10,
					border = "none",
					scrolloff = 1,
					scrollbar = false,
					draw = {
						treesitter = { "lsp" },
						align_to = "cursor",
						padding = 1,
						gap = 3,
						columns = {
							{ "kind_icon", gap = 1, "label" },
							{ "label_description" },
							{ "source_name" },
						},
					},
				},
				documentation = {
					window = {
						border = "none",
						scrollbar = false,
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
					},
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			signature = {
				enabled = true,
			},
			snippets = {
				preset = "luasnip",
			},
			sources = {
				default = { "lsp", "snippets", "buffer" },
				per_filetype = {
					mysql = { "snippets", "dadbod", "buffer" },
					php = { "lsp", "snippets" },
				},
				providers = {
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				},
			},
		})
	end,
}
