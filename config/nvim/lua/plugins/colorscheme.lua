local palette = {
	normal_fg = "#CCD5E5",
	float_fg = "#D6DDEA",
	nontext_fg = "#394156",
	comment_fg = "#464A68",
	float_comment_fg = "#585c77",
	quote_fg = "#566A78",

	-- background
	normal_bg = "#191d23",
	normal_bg_alt = "#222731",
	normal_bg_accent = "#272D39",
	panel_bg = "#1B1F25",
	float_bg = "#20242D",
	float_bg_select = "#1E2944",
	float_bg_border = "#2A2F39",
	float_bg_thumb = "#2B303C",

	-- accent
	v_select = "#111E53",
	v_select_nontext = "#32416F",
	string = "#74BAA8",
	raw_string = "#2B8265",
	cursor = "#5DCD9A",
	operator = "#b09884",
	constant = "#BCB6EC",
	keyword = "#91A6C7",
	important = "#6A8BE3",
	search = "#E9B872",
	number = "#B85B53",
	url = "#4F729F",

	-- notifications
	info = "#1A8C9F",
	warn = "#FF9B17",
	error = "#F71735",

	-- git
	git_add_fg = "#9FDACC",
	git_add_bg = "#1E3A34",
	git_add_col_unstaged = "#04724D",
	git_add_col_staged = "#02442E",
	git_delete_fg = "#FFC0C5",
	git_delete_bg = "#3A1A21",
	git_delete_col_unstaged = "#942B27",
	git_delete_col_staged = "#671E1B",
	git_change_fg = "#B7C4FF",
	git_change_bg = "#1F2B5C",
	git_change_col_unstaged = "#3F58BB",
	git_change_col_staged = "#253470",
}

return {
	"mcauley-penney/techbase.nvim",
	branch = "lightening",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("techbase")
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.normal_bg, bg = palette.normal_bg })
	end,
}
