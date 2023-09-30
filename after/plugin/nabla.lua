vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    pattern = {"*.md", "*.tex" },
    callback = function()
        local ok, err = pcall(require('nabla').popup)
    end,
})
