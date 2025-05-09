local M = {}

-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- for all available options
M.servers = {
	["ts_ls"] = {},
	["html"] = {},
	["bashls"] = {},
	["rust_analyzer"] = {},
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
	["tailwindcss"] = {},
	pyright = {},
	["lua_ls"] = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
	texlab = {},
}

M.tools = {
	"stylua",
	"shellcheck",
}

M.ensure_installed = require("util.tbl").get_keys(M.servers)
table.insert(M.ensure_installed, tools)

return M
