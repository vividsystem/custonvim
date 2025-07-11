local opt = vim.opt
local g = vim.g

-- LOOKS
opt.termguicolors = true
opt.cursorline = true
opt.number = true
opt.relativenumber = true
-- FEATURES
g.mapleader = " "
opt.mouse = ""
opt.smartcase = true
opt.clipboard = "unnamedplus"
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.history = 20
opt.shell = "/bin/zsh"
opt.encoding = "utf-8"
opt.splitright = true
opt.showmode = false
opt.showtabline = 2
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.cache/nvim/undodir")
opt.updatetime = 500
