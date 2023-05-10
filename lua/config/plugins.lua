local ensure_packer = function() local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-tree/nvim-web-devicons")
	use({"L3MON4D3/LuaSnip"})
	use("nyoom-engineering/oxocarbon.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function() vim.cmd [[ :TSUpdate ]] end
	})

	-- 
	-- VCS
	--
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

	use { 'lewis6991/gitsigns.nvim', config = function () require("gitsigns").setup() end}
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	--
	-- LSP
	--

	use {
		"hrsh7th/nvim-cmp",
		config = function() require("plugins.lsp.completion").setup() end,
		requires = {
			{ "hrsh7th/cmp-nvim-lsp", module = {"cmp_nvim_lsp" } },
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			{ "onsails/lspkind-nvim", module = { "lspkind" } }
		}
	}

	use ({
		"ray-x/lsp_signature.nvim",
	})

	use { "folke/neodev.nvim", config = function () require("neodev").setup() end }

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"ray-x/lsp_signature.nvim",
			{
				"williamboman/mason.nvim",
				requires = {
					"williamboman/mason-lspconfig.nvim",
					"WhoIsSethDaniel/mason-tool-installer.nvim",
				},
			},
			{ "hrsh7th/nvim-cmp",
				requires = {
					{ "hrsh7th/cmp-nvim-lsp", module = {"cmp_nvim_lsp" } },
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-cmdline",
					"hrsh7th/cmp-nvim-lsp-signature-help",
					"saadparwaiz1/cmp_luasnip",
					{ "onsails/lspkind-nvim", module = { "lspkind" } }
				}
			},
		},
		config = function()
			require("plugins.lsp").setup()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
