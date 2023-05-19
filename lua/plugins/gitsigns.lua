local M = {}

local config = {
	signcolumn = true,
	linehl = false,
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol',
		delay = 100,
		ignore_whitespace = false
	},
  current_line_blame_formatter = '<summary> ・ <author> <author_time:%Y-%m-%d>'
}

function M.setup()
	require("gitsigns").setup(config)
end

return M
