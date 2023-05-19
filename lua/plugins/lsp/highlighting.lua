local M = {}

local treesitter = require("nvim-treesitter.configs")

local langs = {
	"bash",
	"c",
	"go",
	"gomod",
	"gosum",
	"javascript",
	"jsdoc",
	"json",
	"lua",
	"python",
	"regex",
	"typescript",
	"vim",
	"vimdoc",
	"query",
}

function M.setup()
	treesitter.setup({
		ensure_installed = langs,

		auto_install = true,

		highlight = {
			enable = true,
		},
	})
end
return M
