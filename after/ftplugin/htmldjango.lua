-- Config formatter
vim.g.neoformat_htmldjango_djlint = {
    exe = 'djlint',
    args = {'--reformat', '--quiet', '--indent 2'},
    replace = 1,
    stdin = 0,
    valid_exit_codes = {0, 1}
}
