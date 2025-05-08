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
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_syntax_enabled = 1
			vim.g.vimtex_view_method = "zathura"
			vim.g.tex_flavor = "latex"

			vim.g.vimtex_compiler_latexmk = {
				aux_dir = "",
				out_dir = "",
				callback = 1,
				continuous = 1,
				executable = "latexmk",
				hooks = {},
				options = {
					"-verbose",
					"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
					"-shell-escape", -- fixes the svg package
				},
			}
		end,
		ft = { "tex", "bib" },
	},
}
