if not vim.g.vscode then
	return {
		"folke/noice.nvim",
		event = "VeryLazy",
		depedencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			cmdline = { enabled = false, },
			messages = { enabled = false, },
			popupmenu = { enabled = false, },
			notify = { enabled = false, },
			lsp = {
				hover = { enabled = false, },
				signature = { enabled = false, },
				message = { enabled = false, },
				progress = { enabled = true, },
			},
		},
	}
else
	return {}
end
