if not vim.g.vscode then
	return {
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = '\\',
			insert_mappings = false,
			terminal_mappings = false,
			direction = 'float',
		},
	}
else 
	return {}
end
