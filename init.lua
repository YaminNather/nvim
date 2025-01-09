vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=0")

if string.find(vim.loop.os_uname().sysname:lower(), "windows") then
	vim.cmd("set shell=powershell")
end

require("custom_plugins.yank_on_delete_disabler").setup()

require("config.lazy")

vim.cmd.colorscheme("catppuccin")
