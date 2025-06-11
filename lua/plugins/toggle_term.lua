if not vim.g.vscode then
	return {
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = '\\'
		},
	}
else 
	return {}
end
