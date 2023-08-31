local on_attach = function(_, bufnr)
	local bufmap = function(keys, func)
		vim.keymap.set('n', keys, func, { buffer = bufnr })
	end

	bufmap('<leader>r', vim.lsp.buf.rename)
	bufmap('<leader>a', vim.lsp.buf.code_action)

	bufmap('gd', vim.lsp.buf.definition)
	bufmap('gD', vim.lsp.buf.declaration)
	bufmap('gI', vim.lsp.buf.implementation)
	bufmap('<leader>D', vim.lsp.buf.type_definition)

	bufmap('gr', require('telescope.builtin').lsp_references)
	bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
	bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

	bufmap('K', vim.lsp.buf.hover)

	-- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		-- vim.lsp.buf.format()
	-- end, {})

	--check if current language is dart
	if vim.bo.filetype == 'dart' then
		bufmap('<leader>F', require('telescope').extensions.flutter.commands)
	end

	-- add lsp_signature
	local signature_setup = {
		hint_prefix = " ",
	}
	require("lsp_signature").on_attach(signature_setup, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- no mason
-- require('lspconfig').lua_ls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--     },
-- }
require('lspconfig').dartls.setup {
	cmd = { "dart", 'language-server', '--protocol=lsp' },
	on_attach = on_attach,
	capabilities = capabilities,
}

-- mason
local lsp_config =  { "lua_ls", "rust_analyzer", "pyright", "clangd", "tsserver" }

require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = lsp_config,
}

require('mason-tool-installer').setup {
	ensure_installed = {
		'djlint', 'black', 'ruff', 'prettier', 'codelldb'
	}
}

for _, server in ipairs(lsp_config) do
	require("lspconfig")[server].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
