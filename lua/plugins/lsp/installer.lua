local M = {}

function M.setup(servers)
	local lspconfig = require("lspconfig")

	require("mason").setup()

	require("mason-lspconfig").setup {
		ensured_installed = vim.tbl_keys(servers)
	}

	require("mason-tool-installer").setup {
		ensure_installed = { "stylua", "shfmt" }
	}

	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	for server, _ in ipairs(servers) do
		lspconfig[server].setup {
			on_attach = require("init").on_attach,
			capabilities = capabilities
		}

	end
end

return M
