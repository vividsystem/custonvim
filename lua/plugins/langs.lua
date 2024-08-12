return {
	{
		"sbdchd/neoformat",
	},
	{
		"gennaro-tedesco/nvim-jqx",
		ft = { "json", "yaml" },
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
