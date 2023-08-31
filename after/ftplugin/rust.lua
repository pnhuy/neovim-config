local rt = require("rust-tools")
local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path

if (vim.fn.has('linux')) then
    liblldb_path = extension_path .. "lldb/lib/liblldb.so"
else
    liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
end

local dap_adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)

-- vim.print("codelldb_path: " .. codelldb_path)
-- vim.print("liblldb_path: " .. liblldb_path)
-- vim.print(dap_adapter)

rt.setup({
  server = {
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          autoReload = true
        }
      },
    },
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  dap = {
    adapter = dap_adapter
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    },
    runnables = {
      use_telescope = true,
    },
  }
})

require('dap').adapters.lldb = dap_adapter
require('dap').configurations.rust = {
  {
    type = 'lldb',
    name = "Debug",
    request = 'launch',
    program = function()
      -- run before
      vim.api.nvim_echo({{'Compiling...'}}, false, {})
      vim.fn.system('cargo build')
      vim.api.nvim_echo({{'Compiling done!'}}, false, {})
      
      local meta_str= vim.fn.system("cargo metadata --format-version=1", true)
      local meta_json = vim.json.decode(meta_str)
      local packages = meta_json.packages
      if (packages ~= nil) then
        if ((packages[1].name ~= nil) and (meta_json.target_directory ~= nil)) then
          local fp = meta_json.target_directory .. '/debug/' .. packages[1].name
          if vim.fn.filereadable(fp) == 1 then
            return fp
          end
        end
      end
      -- vim.print(meta_json)
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}