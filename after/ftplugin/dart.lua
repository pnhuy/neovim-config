vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.autoindent = true
vim.opt_local.expandtab = true
vim.opt_local.smartindent = true

require("flutter-tools").setup {
    flutter_lookup_cmd = "dirname $(which flutter)",
}