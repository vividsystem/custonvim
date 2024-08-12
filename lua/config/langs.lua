local M = {}

function M.servers()
	return {
		tsserver = {},
		html = {},
		bashls = {},
		rust_analyzer = {},
		gopls = {},
		clangd = {},
		tailwindcss = {},
		pyright = {},
		lua_ls = {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		}
	}
end

function M.capabilities()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	return capabilities
end

function M.bind_servers()
	local lspconfig_status, lspconfig = pcall(require, "lspconfig")
	if not lspconfig_status then
		return
	end
	for server, settings in pairs(lspconfig) do
		settings.capabilities = settings.capabilities or M:capabilities()
		lspconfig[server].setup(settings)
	end
end

function M.setup()

end
return M
