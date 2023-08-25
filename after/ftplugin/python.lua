vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

local venv_path = os.getenv("VIRTUAL_ENV")
local dap = require('dap')

-- Set up virtual envs
require('swenv').setup({
    -- Should return a list of tables with a `name` and a `path` entry each.
    -- Gets the argument `venvs_path` set below.
    -- By default just lists the entries in `venvs_path`.
    get_venvs = function(venvs_path)
        return require('swenv.api').get_venvs(venvs_path)
    end,
    -- Path passed to `get_venvs`.
    venvs_path = vim.fn.expand('~/.local/share/virtualenvs'),
    -- Something to do after setting an environment, for example call vim.cmd.LspRestart
    post_set_venv = function()
        -- Restart LSP servers
        vim.cmd('LspRestart')
        -- Set pythonPath of current virtual env for all configurations of dap
        vim.g.python3_host_prog = require('swenv.api').get_current_venv()['path'] .. '/bin/python'
        for k, v in pairs(require('dap').configurations.python) do
            v.pythonPath = require('swenv.api').get_current_venv()['path'] .. '/bin/python'
        end
    end
})

if venv_path then
    vim.cmd('let g:python3_host_prog="' .. venv_path .. '/bin/python"')
end

dap.adapters.python = {
    type = 'executable',
    command = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/debugpy/venv/bin/python',
    args = {'-m', 'debugpy.adapter'}
}

dap.configurations.python = {{
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
        if venv_path then
            return venv_path .. "/bin/python"
        end
        return 'python3'
    end
}, {
    type = 'python',
    request = 'launch',
    name = "Launch Flask",
    module = "flask",
    args = {"run", "--no-debugger", "--no-reload"},
    pythonPath = function()
        if venv_path then
            return venv_path .. "/bin/python"
        end
        return 'python3'
    end
}, {
    type = 'python',
    request = 'launch',
    name = "Launch FastAPI",
    module = "uvicorn",
    args = function()
        if vim.g.fastapi_app_path == nil then
            vim.g.fastapi_app_path = vim.fn.input('App path: ')
        end
        return {vim.g.fastapi_app_path}
    end,
    pythonPath = function()
        if venv_path then
            return venv_path .. "/bin/python"
        end
        return 'python3'
    end
}}

vim.keymap.set('n', '<leader>v', function()
    require('swenv.api').pick_venv()
end)

-- Config formatter
vim.g.neoformat_python_ruff = {
    exe = vim.fn.expand('~/.local/share/nvim/mason/bin/ruff'),
    args = {'check', '--fix', '--line-length 120', '--select ALL'},
    replace = 1,
    stdin = 0,
    valid_exit_codes = {0, 1}
}

vim.g.neoformat_enabled_python = {'ruff', 'black'}
