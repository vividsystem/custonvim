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
Map({ "n", "t" }, "<C-Up>", ":resize -2<CR>")
Map({ "n", "t" }, "<C-Down>", ":resize +2<CR>")
Map({ "n", "t" }, "<C-Left>", ":vertical resize -2<CR>")
Map({ "n", "t" }, "<C-Right>", ":vertical resize +2<CR>")

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

Map("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Terminal" })

local telescope_builtin = require("telescope.builtin")
Map("n", "<leader>ff", telescope_builtin.find_files, { desc = "File" })
Map("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Text search" })
Map("n", "<leader>fx", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" })

Map("n", "<leader>db", require("dap").toggle_breakpoint, {desc = "toggle breakpoint" })
Map("n", "<leader>dc", require("dap").continue, { desc = "continue/start debugging" })
Map("n", "<leader>dr", require("dap").repl.toggle, { desc = "toggle repl" })
Map("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Declaration" })
Map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Definition" })
Map("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Implementation" })
Map("n", "<leader>lr", function()
	local _, guihua = pcall("guihua.lua", "guihua.floating")
	local input = vim.ui.input

	if guihua then
		vim.ui.input = require("guihua.input").input
	end
	vim.lsp.buf.rename()
	return vim.defer_fn(function()
		vim.ui.input = input
	end, 1000)
end, { desc = "Rename" })
Map("n", "<leader>vd", "<cmd>DiffviewToggle", { desc = "Diffs" })
Map("n", "<leader>vo", "<cmd>Neogit<cr>", { desc = "Open" })

function M.wk_bindings()
	return {
		{ "<leader>f", group = "file"},
		{ "<leader>v", group = "vcs"},
		{ "<leader>d", group = "debug"},
		{ "<leader>g", group = "goto"},
		{ "<leader>l", group = "lsp"},
	}
end
return M
