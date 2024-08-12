return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		local mappings = require("config.keybindings").wk_bindings()
		wk.register(mappings, { prefix = "<leader>" })
	end,
}
