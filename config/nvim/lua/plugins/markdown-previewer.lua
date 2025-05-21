-- https://github.com/iamcco/markdown-preview.nvim
local M = { "iamcco/markdown-preview.nvim", build = "cd app && yarn install", ft = { "markdown" } }

M.cmd = {
    "MarkdownPreviewToggle",
    "MarkdownPreview",
    "MarkdownPreviewStop",
}

M.init = function()
    vim.g.mkdp_filetypes = { "markdown" }
end

return M
