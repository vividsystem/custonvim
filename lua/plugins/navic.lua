local M = {}

function M.setup()
	require("nvim-navic").setup({
		lsp = {
			auto_attach = true,
			preference = nil,
		},
		highlight = true,
		separator = " > ",
	})
end

return M
