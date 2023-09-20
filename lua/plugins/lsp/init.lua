local M = {}

local servers = {
	["lua_ls"] = {},
	["html"] = {},
	["cssls"] = {},
	["pyright"] = {},
	["tsserver"] = {},
	["bashls"] = {},
	["rust_analyzer"] = {},
	["gopls"] = {},
}

function M.on_attach(client, bufnr)
	local capabilities = client.server_capabilities

	if capabilities.documentSymbolProvider then
		local navic = require("nvim-navic")
		navic.attach(client, bufnr)
	end
end

function M.setup()
	require("neodev").setup()

	require("plugins.lsp.completion").setup(servers)
	require("plugins.lsp.highlighting").setup()
	require("plugins.lsp.installer").setup(servers)
	require("plugins.lsp.handlers").setup(servers)
end

return M
