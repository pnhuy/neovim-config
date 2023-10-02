local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, {})
end

local cmdmap = function(command_1, command_2)
    vim.keymap.set('c', command_1, command_2)
end

bufmap('<leader>f', require('telescope.builtin').find_files)
bufmap('<leader>e', '<Cmd>Neotree toggle reveal<CR>')
bufmap('<leader>tt', '<Cmd>ToggleTerm direction=float<CR>')
bufmap('<leader>p', require('telescope').extensions.projects.projects)


-- Trouble Plugin
bufmap("<leader>xx", function() require("trouble").toggle() end)
bufmap("<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
bufmap("<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
bufmap("<leader>xq", function() require("trouble").toggle("quickfix") end)
bufmap("<leader>xl", function() require("trouble").toggle("loclist") end)
bufmap("gR", function() require("trouble").toggle("lsp_references") end)

-- Copilot.vim (not used for zbirenbaum/copilot.lua)
-- accept current suggestion
-- vim.api.nvim_set_keymap('i', '<C-/>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

-- Exit the terminal with Esc
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Make the keymapping to fix first character uppercase in command such as :Wq
cmdmap('W!', 'w!')
cmdmap('Q!', 'q!')
cmdmap('Wq', 'wq')
cmdmap('Wa', 'wa')
cmdmap('wQ', 'wq')
cmdmap('WQ', 'wq')
cmdmap('W', 'w')
cmdmap('Q', 'q')
cmdmap('Qall', 'qall')
cmdmap('bd', 'Bd')


-- Neogen
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ng", ":lua require('neogen').generate()<CR>", opts)
vim.keymap.set("i", "<C-G>", function () require('neogen').generate() end, opts)

-- Naviation in Insert mode
vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)