if not vim.g.vscode then
	return {
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
		}
	}
else
	return {}
end

