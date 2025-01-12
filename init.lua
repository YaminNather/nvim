vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=0")

require("custom_plugins.yank_on_delete_disabler").setup()

vim.lsp.set_log_level('trace')

require("config.lazy")

vim.cmd.colorscheme("catppuccin")
