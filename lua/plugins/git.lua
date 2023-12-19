return {
	{
		"NeogitOrg/neogit",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			{
				"sindrets/diffview.nvim",
				config = function(opts)
					vim.api.nvim_create_user_command("DiffviewToggle", function(e)
						local view = require("diffview.lib").get_current_view()

						if view then
							vim.cmd("DiffviewClose")
						else
							vim.cmd("DiffviewOpen " .. e.args)
						end
					end, { nargs = "*" })
					return require("diffview").setup(opts)
				end,
			},
		},
	},
	{
		"f-person/git-blame.nvim",
		opts = {
			enabled = true,
			message_template = "<summary> • <date> • <author>",
			message_when_not_committed = "pls commit dumbass",
			highlight_group = "GitBlameVirtualText",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signcolumn = true,
		},
	},
}
