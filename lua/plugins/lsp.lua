local servers = {
	html = {},
	tsserver = {},
	bashls = {},
	rust_analyzer = {},
	gopls = {},
	clangd = {},
	tailwindcss = {},
	pyright = {},
	lua_ls = {}
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
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace"
						}
					}
				}
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
						plugins = true
					},
					lspconfig = true,
				}
			},
		}
	},
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
		},
		opts = {
			go = 'go',
			goimport = 'gopls',
			fillstruct = 'gopls',
			gofmt = 'gofumpt',
			lsp_cfg = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			},
			lsp_keymaps = false
		},
		ft = {"go", "gomod"},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = servers 
		}
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = ensure_tools
		}
	},
}
