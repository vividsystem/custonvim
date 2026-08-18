local config = require("config.langs")

return {
	-- bottom bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
				lazy = true,
			},
		},
		opts = {
			options = {
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "diagnostics" },
				lualine_z = { "location" },
			},
		},
	},
	-- top bar
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				show_close_icon = false,
			},
		},
	},
	-- breadcrumbs at the top of buffer
	{
		"Bekaboo/dropbar.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		init = function()
			local alreadyInstalled = require('nvim-treesitter.config').get_installed()
			local parsersToInstall = vim.iter(config.langs)
					:filter(function(parser)
						return not vim.tbl_contains(alreadyInstalled, parser)
					end)
					:totable()
			require('nvim-treesitter').install(parsersToInstall)
		end
	},
	{
		"ray-x/guihua.lua",
	},
}
