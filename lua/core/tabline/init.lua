local fn = vim.fn
local devicons = require("nvim-web-devicons")

local M = {}

function Tabline()
	local current_tab = fn.tabpagenr()
	local tab_count = fn.tabpagenr("$")
	local tab_list = {}

	for tab_number = 1, tab_count do
		local winnr = fn.tabpagewinnr(tab_number)
		local buflist = fn.tabpagebuflist(tab_number)
		local file_name = fn.bufname(buflist[winnr])
		local file_icon = devicons.get_icon(file_name, fn.fnamemodify(file_name, ":e"))

		if file_name == "" then
			file_name = "[No Name]"
		end

		if file_icon == nil then
			file_icon = ""
		end

		local tab_name = fn.fnamemodify(file_name, ":t")
		table.insert(
			tab_list,
			string.format(
				"%s %s %s %s",
				tab_number == current_tab and "%#TabLineSel#" or "%#TabLine#",
				file_icon,
				tab_name,
				"%#TabLineFill#"
			)
		)
	end

	local tabline = table.concat(tab_list, "")

	return tabline
end

function M.setup()
	vim.cmd([[
		augroup tabline
			autocmd!
			au TabEnter,BufEnter * setlocal showtabline=2
			au ColorScheme * highlight TabLine guibg=#000000
			au ColorScheme * highlight TabLineSel guifg=#F8F8F2 guibg=#44475A gui=italic
			au Colorscheme * highlight TabLineFill guibg=#282A36
		augroup END
	]])
	vim.o.tabline = '%!luaeval("Tabline()")'
end

return M
