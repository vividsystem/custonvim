vim.api.nvim_create_autocmd("CursorHold", {
	callback = function ()
		vim.diagnostic.open_float(nil, { scope = "line", closeEvents = {"CursorMoved" }, source = "if_many"})
	end
})
