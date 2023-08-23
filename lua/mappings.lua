local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, {})
end

local cmdmap = function(command_1, command_2)
    vim.keymap.set('c', command_1, command_2)
end

bufmap('<leader>f', require('telescope.builtin').find_files)
bufmap('<leader>e', '<Cmd>Neotree toggle<CR>')
bufmap('<leader>tt', '<Cmd>ToggleTerm direction=float<CR>')
bufmap('<leader>p', require('telescope').extensions.projects.projects)


-- Trouble Plugin
bufmap("<leader>xx", function() require("trouble").open() end)
bufmap("<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
bufmap("<leader>xd", function() require("trouble").open("document_diagnostics") end)
bufmap("<leader>xq", function() require("trouble").open("quickfix") end)
bufmap("<leader>xl", function() require("trouble").open("loclist") end)
bufmap("gR", function() require("trouble").open("lsp_references") end)

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
