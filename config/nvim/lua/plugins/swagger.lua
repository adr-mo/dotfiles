-- https://github.com/vinnymeller/swagger-preview.nvim
local M = {
    "vinnymeller/swagger-preview.nvim",
    build = "npm install",
    cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
    config = true
}

return M
