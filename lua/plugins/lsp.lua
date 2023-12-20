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
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
			lspconfig.clangd.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.pyright.setup({})
			lspconfig.gopls.setup({})
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
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
		},
		opts = {
			go = "go",
			goimport = "gopls",
			fillstruct = "gopls",
			gofmt = "gofumpt",
			lsp_cfg = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(
					vim.lsp.protocol.make_client_capabilities()
				),
			},
			lsp_keymaps = false,
		},
		ft = { "go", "gomod" },
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
