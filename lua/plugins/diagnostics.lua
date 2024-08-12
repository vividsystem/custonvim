vim.diagnostic.config({
	virtual_text = false,
	float = {
		header = "",
		border = "rounded", -- none, single, double, rounded, solid, shadow
		focusable = false,
		-- wrap = true,
		-- wrap_at = theheight,
		-- max_width = ,
		-- max_height = ,
	},
})
return {
	{
		"folke/trouble.nvim",
		opts = {
			position = "bottom",
		},
	},
}
