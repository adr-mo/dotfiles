-- if a file is a .env or .envrc file, set the filetype to sh
vim.filetype.add({
	filename = {
		[".env"] = "sh",
		[".env.local"] = "sh",
		["phpstan.legacy.src.neon"] = "yaml",
		["phpstan.legacy.test.baseline.neon"] = "yaml",
		["phpstan.legacy.test.neon"] = "yaml",
		["phpstan.legacy.www.baseline.neon"] = "yaml",
		["phpstan.legacy.www.neon"] = "yaml",
	},
})
