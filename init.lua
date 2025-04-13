vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=0")
vim.cmd("set nowrap")

require("custom_plugins.yank_on_delete_disabler").setup()

require("config.lazy")

if not vim.g.vscode then
	vim.cmd.colorscheme("onedark_vivid")
end

vim.keymap.set("n", "<Leader>bd", "<cmd>b#|bd#<Cr>", {desc = "Close buffer"})
