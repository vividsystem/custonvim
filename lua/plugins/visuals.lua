return {
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
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				modules = {},
				ensure_installed = { "c", "lua", "bash", "html", "typescript", "go", "gomod" },
				sync_install = false,
				ignore_install = { "latex" },
				auto_install = true,
				highlight = {
					enable = true,
				},
			})
		end,
	},
	{
		"ray-x/guihua.lua",
	},
}
