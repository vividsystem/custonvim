local M = {}

local servers = {
	['lua_ls'] = {},
	['html'] = {},
	['cssls'] = {},
	['pyright'] = {},
	['tsserver'] = {},
	['bashls'] = {},
}

function M.setup()

	require("plugins.lsp.completion").setup(servers)
	require("plugins.lsp.highlighting").setup()
	require("plugins.lsp.installer").setup(servers)
	require("plugins.lsp.handlers").setup(servers)

	require("neodev").setup()
end

return M
