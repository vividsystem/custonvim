vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { scope = "line", closeEvents = { "CursorMoved" }, source = "if_many" })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "*.tex" },
	callback = function()
		vim.cmd("VimtexCompile")
	end,
})
