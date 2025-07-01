vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=0")
vim.cmd("set nowrap")

require("custom_plugins.yank_on_delete_disabler").setup()

if not vim.g.vscode then
	if vim.loop.os_uname().sysname:lower():match('windows') then
		local powershell_options = {
		  shell = "powershell",
		  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
		  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
		  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
		  shellquote = "",
		  shellxquote = "",
		}

		for option, value in pairs(powershell_options) do
		  vim.opt[option] = value
		end
	end
end

require("config.lazy")

if not vim.g.vscode then
	vim.cmd.colorscheme("nordfox")

    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#AAAAAA', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#AAAAAA', bold=true })
	
end

-- vim.keymap.set("n", "<Leader>bd", "<cmd>b#|bd#<Cr>", {desc = "Close buffer"})

require("buffer_oil").setup()
