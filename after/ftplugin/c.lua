-- clangd
local clangd_capabilities = vim.lsp.protocol.make_client_capabilities()
clangd_capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = clangd_capabilities })
vim.cmd [[
    let g:neoformat_cpp_clangformat = {
        \ 'exe': 'clang-format',
        \ 'args': ['--style="{IndentWidth: 4}"']
    \}
]]