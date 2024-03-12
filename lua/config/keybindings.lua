local M = {}

function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- use your keyboard, idiot
Map("n", "<ScrollWheelUp>", "<Nop>")
Map("n", "<S-ScrollWheelUp>", "<Nop>")
Map("n", "<C-ScrollWheelUp>", "<Nop>")
Map("n", "<ScrollWheelDown>", "<Nop>")
Map("n", "<S-ScrollWheelDown>", "<Nop>")
Map("n", "<C-ScrollWheelDown>", "<Nop>")
Map("n", "<ScrollWheelLeft>", "<Nop>")
Map("n", "<S-ScrollWheelLeft>", "<Nop>")
Map("n", "<C-ScrollWheelLeft>", "<Nop>")
Map("n", "<ScrollWheelRight>", "<Nop>")
Map("n", "<S-ScrollWheelRight>", "<Nop>")
Map("n", "<C-ScrollWheelRight>", "<Nop>")
Map("n", "<Up>", "<Nop>")
Map("n", "<Down>", "<Nop>")
Map("n", "<Left>", "<Nop>")
Map("n", "<Right>", "<Nop>")

-- Movement
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")

Map("t", "<C-h>", "<cmd>wincmd h<CR>")
Map("t", "<C-j>", "<cmd>wincmd j<CR>")
Map("t", "<C-k>", "<cmd>wincmd k<CR>")
Map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- Sizing
Map({"n", "t"}, "<C-Up>", ":resize -2<CR>")
Map({"n", "t"}, "<C-Down>", ":resize +2<CR>")
Map({"n", "t"}, "<C-Left>", ":vertical resize -2<CR>")
Map({"n", "t"}, "<C-Right>", ":vertical resize +2<CR>")

-- terminal
Map("t", "<C-Up>", "<cmd>resize -2<CR>")
Map("t", "<C-Down>", "<cmd>resize +2<CR>")
Map("t", "<C-Left>", "<cmd>vertical resize -2<CR>")
Map("t", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- buffers
Map("n", "<TAB>", ":bn<CR>")
Map("n", "<S-TAB>", ":bp<CR>")

Map("n", "<ESC>", "<cmd>noh<CR>")
Map("t", "<ESC>", "<C-\\><C-n>")
Map("n", "K", function()
	vim.lsp.buf.hover()
end)

local ls = require("luasnip")
Map({"i", "s"}, "<C-n>", function() ls.jump( 1) end, { desc = "jump to next snippet" })
Map({"i", "s"}, "<C-p>", function() ls.jump(-1) end, { desc = "jump to previous snippet" })
Map({"i", "s"}, "<S-Right>", function() ls.jump( 1) end, { desc = "jump to next snippet" })
Map({"i", "s"}, "<S-Left>", function() ls.jump(-1) end, { desc = "jump to previous snippet" })

function M.wk_bindings()
	return {
		t = { "<cmd>ToggleTerm<cr>", "Termial" },
		f = {
			name = "file",
			f = { "<cmd>Telescope find_files<cr>", "Find file" },
			x = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
		},
		v = {
			name = "vcs",
			o = { "<cmd>Neogit<cr>", "Open" },
			d = { "<cmd>DiffviewToggle", "Diffs" },
		},
		g = {
			name = "goto",
			f = { "<cmd>Telescope find_files<cr>", "File" },
			d = { vim.lsp.buf.definition, "Definition" },
			D = { vim.lsp.buf.declaration, "Declaration" },
			i = { vim.lsp.buf.implementation, "Implementation" },
		},
		l = {
			name = "lsp",
			r = {
				function ()
					local _, guihua = pcall("guihua.lua", "guihua.floating")
  				local input = vim.ui.input

  				if guihua then
    				vim.ui.input = require('guihua.input').input
  				end
  				vim.lsp.buf.rename()
  				return vim.defer_fn(function()
    				vim.ui.input = input
  				end, 1000)
				end, "Rename"
			}
		},
		d = {
			name = "dap",
			b = {require('dap').toggle_breakpoint, "toggle breakpoint"},
			c = {require('dap').continue, "continue/start debugging"},
			r = {require('dap').repl.toggle, "toggle repl"}
		}
	}
end

return M
