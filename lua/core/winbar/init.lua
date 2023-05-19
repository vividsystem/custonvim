local M = {}

function Winbar()
	local navic = require("nvim-navic")
	if navic.is_available() then
		return " > " .. navic.get_location()
	else
		return ""
	end
end

function M.setup()
	vim.o.winbar = '%!luaeval("Winbar()")'
end
return M
