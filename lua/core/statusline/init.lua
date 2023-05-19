local fn = vim.fn
local devicons = require("nvim-web-devicons")

local M = {}

local disabled_filetypes = {
	"NvimTree"
}

function Statusline()
	local mode_color = {
		["n"] = "%#StatusNormal#",
		["i"] = "%#StatusInsert#",
		["v"] = "%#StatusVisual#",
		["V"] = "%#StatusVisual#",
		["c"] = "%#StatusCommand#",
		["t"] = "%#StatusTerminal#",
		["s"] = "%#StatusSelect#",
		["S"] = "%#StatusSelect#",
		["R"] = "%#StatusReplace#"
	}

	local mode_map = {
		["n"] = "NORMAL",
		["i"] = "INSERT",
		["v"] = "VISUAL",
		["V"] = "V-LINE",
		["c"] = "COMMAND",
		["t"] = "TERMINAL",
		["s"] = "SELECT",
		["S"] = "S-LINE",
		["R"] = "REPLACE",
	}

	local bufnr = vim.fn.winbufnr(vim.g.statusline_winid)

	local mode = fn.mode()
	local mode_name = mode_map[mode]

	local filename = fn.expand("%:t")
	local file_icon = devicons.get_icon(fn.expand("%:t"), fn.expand("%:e"))
	local file_encoding = vim.bo.fileencoding

	if file_icon == nil then
		file_icon = ""
	end

	local line_col = fn.line(".") .. ":" .. fn.col(".")

	local current_time = os.date("%H:%M")

	local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')

	if vim.tbl_contains(disabled_filetypes, filetype) then
		vim.opt.laststatus = 1
		return ""
	else
		return mode_color[mode]
			.. " "
			.. mode_name
			.. " "
			.. "%#StatusLine#"
			.. " "
			.. file_icon
			.. " "
			.. filename
			.. "%="
			.. current_time
			.. " "
			.. file_encoding
			.. " "
			.. mode_color[mode]
			.. " "
			.. line_col
			.. " %*"
	end
end

function M.setup()
	vim.cmd([[
		augroup statusline
			autocmd!
			au ColorScheme * highlight StatusLine guifg=#F8F8F2 guibg=#282A436
			au ColorScheme * highlight StatusLineGreen guifg=#000000 guibg=#50FA7B
			au ColorScheme * highlight StatusLineBlue guifg=#000000 guibg=#8BE9FD
			au ColorScheme * highlight StatusLineRed guifg=#000000 guibg=#FF5555
			au ColorScheme * highlight StatusLineOrange guifg=#000000 guibg=#FFB86C
			au ColorScheme * highlight StatusLineYellow guifg=#000000 guibg=#F1FA8C
		augroup END
	]])



	vim.o.statusline = '%!luaeval("Statusline()")'
end

return M
