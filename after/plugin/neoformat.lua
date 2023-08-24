-- Enable alignment
vim.g.neoformat_basic_format_align = 1

-- Enable tab to spaces conversion
vim.g.neoformat_basic_format_retab = 1

-- Enable trimmming of trailing whitespace
vim.g.neoformat_basic_format_trim = 1

vim.g.neoformat_verbose = 0


vim.api.nvim_create_user_command('Format', function(_)
    local supported_fmt = vim.g['neoformat_enabled_' .. vim.bo.filetype]
    if (supported_fmt == nil) then
        vim.g.neoformat_run_all_formatters = 0
    else
        vim.g.neoformat_run_all_formatters = 1
    end
    vim.cmd('Neoformat')
end, {})