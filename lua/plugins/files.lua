return {
	{
		"mbbill/undotree",
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			on_attach = "default",
			hijack_netrw = true,
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
			view = {
				side = "right",
			},
		},
	},
}
