local M =  {}

function M.setup(servers)
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())


--	lspconfig.lua_ls.setup {
--		capabilities = capabilities
--	}

  for server, opts in pairs(servers) do
    lspconfig[server].setup(vim.tbl_deep_extend("force", {
    	on_attach = function ()
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
end

return M
