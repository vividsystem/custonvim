local M = {}

local config = require("config.langs")

function M.on_attach(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true)
	end
	if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end

	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

function M.capabilities()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	return capabilities
end

function M.setupServers()
	for server, settings in pairs(config.servers) do
		settings.capabilities = settings.capabilities or M.capabilities()
		settings.on_attach = settings.on_attach or M.on_attach
		vim.lsp.config(server, settings)
		vim.lsp.enable(server)
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
