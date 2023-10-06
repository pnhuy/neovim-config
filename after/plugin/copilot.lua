local node_path = string.gsub(vim.fn.system('ls ~/.nvm/versions/node/*/bin/node | tail -n 1'), '%s*$', '')
if vim.fn.executable(node_path) == 0 then
    node_path = string.gsub(vim.fn.system('which node'), '%s*$', '')
end

require("copilot").setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>"
        }
    },
    filetypes = {
        yaml = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = true
    },
    copilot_node_command = node_path,
})
