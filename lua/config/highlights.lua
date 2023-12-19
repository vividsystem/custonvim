local color = require("util.color")

vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true, bg="none" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true, bg="none" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true, bg="none" })
vim.api.nvim_set_hl(0, "GitBlameVirtualText", {
	fg = color.get_color("Comment", "fg"),
	bg = color.get_color("CursorLine", "bg")
})
