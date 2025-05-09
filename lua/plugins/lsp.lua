local M = {}

local config = require("config.langs")

function M.on_attach(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true)
	end
end

function M.capabilities()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	return capabilities
end

function M.setupServers()
	local lspconfig = require("lspconfig")
	local default_capabilities =
		require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	for server, settings in pairs(config.servers) do
		settings.capabilities = settings.capabilities or default_capabilities
		settings.on_attach = settings.on_attach or M.on_attach
		lspconfig[server].setup(settings)
	end
end


return {
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
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = config.ensure_installed
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {}
			},
		}
	}
}
