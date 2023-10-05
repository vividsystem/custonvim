local ensure_installed = {
	"html",
	"tsserver",
	"bashls",
	"rust_analyzer",
	"gopls",
	"clangd",
	"tailwindcss",
	"pyright",
}

local ensure_tools = {
	"stylua",
	"shellcheck",
}
return {
	{
		"folke/neodev.nvim",
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
			servers = {
				bashls = {},
				clangd = {},
				cssls = {},
				tailwindcss = {},
				tsserver = {
					settings = {},
				},
				pyright = {},
				html = {},
				rust_analyzer = {},
				lua_ls = {},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = ensure_installed,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = ensure_tools,
		},
	},
}
