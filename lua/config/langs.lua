local M = {}

-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- for all available options
M.servers = {
	["ts_ls"] = {},
	["html"] = {},
	["bashls"] = {},
	["rust_analyzer"] = {},
	jdtls = {},
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
	["tailwindcss"] = {
		settings = {

		}
	},
	pylsp = {},
	["ruff"] = {
		init_options = {
			settings = {
				configurationPreference = "filesystemFirst"
			}
		}
	},
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
	qmlls = {}
}

M.tools = {
	"stylua",
	"shellcheck",
	"uv"
}

M.ensure_installed = require("util.tbl").get_keys(M.servers)
table.insert(M.ensure_installed, tools)

M.langs = {
	"typescript", "html", "bash", "rust", "java", "go", "c", "css", "python", "lua", "latex", "bibtex",
}

return M
