vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    pattern = {"*.md", "*.tex", "*.txt"},
    callback = require('nabla').popup,
})