require('nvim-treesitter.configs').setup {
    ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'python', 'html', 'htmldjango', 'xml', 'javascript', 'typescript' , 'tsx', 'markdown', 'latex' },
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { 
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { 'html', 'htmldjango', 'xml', 'javascript', 'typescript' , 'tsx', 'markdown' },
    },
}