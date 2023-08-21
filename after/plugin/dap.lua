require("mason-nvim-dap").setup({
    ensure_installed = { "python", "rust" }
})


local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--     -- close neo-tree
--     vim.cmd('Neotree close')
--     dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

vim.keymap.set('n', '<leader>dd', function() require('dapui').toggle() end)
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)

require('dap.ext.vscode').load_launchjs()
