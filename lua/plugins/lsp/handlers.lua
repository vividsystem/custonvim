local M =  {}

local config = {
		virtual_text =  {
			severity = {
				min = vim.diagnostic.severity.ERROR
			}
		},
		float = {
			focus = false,
			focusable = true,
			closable = true,
			source = 'always',
			style = 'minimal',
			border = 'double',
			header = "",
			prefix = ""
		}
}

function update_diagnostics()
	local diagnostics = vim.diagnostic.get(0)
	local bufnr = vim.api.nvim_get_current_buf()

	for _, diagnostic in ipairs(diagnostics) do
		vim.diagnostic.open_float(
			bufnr,
			diagnostic,
			config.float
		)
	end
end

function M.setup(servers)
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())


--	lspconfig.lua_ls.setup {
--		capabilities = capabilities
--	}

	vim.diagnostic.config(config)

  for server, opts in pairs(servers) do
    lspconfig[server].setup(vim.tbl_deep_extend("force", {
    	on_attach = function (_, bufnr)
				require('lsp_signature').on_attach({
						bind = true,
						hint_enable = false,
						handler_opts = {
							border = 'single'
						}
				}, bufnr)
    	end,
			capabilities = capabilities,
    }, opts or {}))
  end

	vim.cmd [[ autocmd CursorMoved * lua update_diagnostics() ]]

end

return M
