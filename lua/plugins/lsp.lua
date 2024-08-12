local M = {}
M.servers = {
	tsserver = {},
	html = {},
	bashls = {},
	rust_analyzer = {},
	gopls = {
		settings = {
			gopls = {
				gofumpt = true,
				codelenses = {
					generate = true, -- show the `go generate` lens.
					gc_details = true, -- Show a code lens toggling the display of gc's choices.
					test = true,
					tidy = true,
					vendor = true,
					regenerate_cgo = true,
					upgrade_dependency = true,
				},
				usePlaceholders = true,
				staticcheck = true,
				hints = {
					compositeLiteralFields = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	},
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
	},
}
M.tools = {
	"stylua",
	"shellcheck",
}

function M.on_attach(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true)
	end
end

function M.setupServers()
	local lspconfig = require("lspconfig")
	local default_capabilities =
		require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	for server, settings in pairs(M.servers) do
		settings.capabilities = settings.capabilities or default_capabilities
		settings.on_attach = settings.on_attach or M.on_attach
		lspconfig[server].setup(settings)
	end
end

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"folke/neodev.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			M:setupServers()
		end,
		dependencies = {
			"nvimdev/lspsaga.nvim",
			{
				"folke/neodev.nvim",
				opts = {
					library = {
						enabled = true,
						runtime = true,
						types = true,
						plugins = true,
					},
					lspconfig = true,
					inlay_hints = { enabled = true },
				},
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {},
		-- opts = function(_, opts)
		--  vim.list_extend(opts.ensure_installed, ensure_installed)
		-- end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
			servers = M.servers,
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = M.servers,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = M.tools,
		},
	},
}
