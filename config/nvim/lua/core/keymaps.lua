local map = vim.keymap.set

map("n", "<leader>cw", function()
	require("mini.trailspace").trim()
end, { desc = "Trim trailing whitespace" })
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
map("v", "<", "<gv") -- Reselect visual selection after indenting because annoying
map("v", ">", ">gv") -- Reselect visual selection after indenting because annoying
map("i", "jk", "<ESC>") -- use jk to exit insert mode
map("n", "J", "mzJ`z") -- Remap the join line action
map("n", "Y", "ggVG") -- copy the whole file
map("n", "n", "nzzzv") -- keep display buffer centered when cycling through searches
map("n", "N", "Nzzzv") -- keep display buffer centered when cycling through searches
map("n", "<leader>sv", "<C-w>v", { desc = "Vertical split" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Horizontal split" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Equal size splits" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>") -- close current split window
map("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>") --  go to next tab
map("n", "<leader>tp", "<cmd>tabp<CR>") --  go to previous tab
map({ "n", "i" }, "<C-s>", "<Cmd>w!<CR><ESC>", { desc = "Save file", silent = true })
map({ "n", "i" }, "<C-sa>", "<Cmd>wa!<CR><ESC>", { desc = "Save all files", silent = true })
map("n", "<C-q>", "<cmd> %bd|e#|bd# <CR>", { desc = "Delete buffers except the current one" })
map("i", "<C-h>", "<Left>") -- Move around buffer in insert mode
map("i", "<C-l>", "<Right>") -- Move around buffer in insert mode
map("i", "<C-k>", "<Up>") -- Move around buffer in insert mode
map("i", "<C-j>", "<Down>") -- Move around buffer in insert mode
map("t", "<C-t>", "<C-\\><C-n>") -- Exit the terminal insert mode with ESC
map("n", "<C-b>", "<cmd>pop<cr>", { desc = "Go back in stack" })
map("i", ";;", "<ESC>A;")
map("i", ",,", "<ESC>A,")
map("n", ";;", "A;<ESC>")
map("n", ",,", "A,<ESC>")
map("n", "gb", "<cmd>pop<cr>", { desc = "Go back in the stack" })
map("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open file explorer" })

map("n", "<leader>cn", function()
	require("phpactor").rpc(
		"new_class",
		{ new_path = vim.api.nvim_buf_get_name(0), current_path = vim.api.nvim_buf_get_name(0) }
	)
end)

map("n", "<leader>ct", function()
	require("phpactor").rpc("transform", {})
end)
