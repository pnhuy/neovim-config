vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    pattern = {"*.md", "*.tex" },
    callback = require('nabla').popup,
})
