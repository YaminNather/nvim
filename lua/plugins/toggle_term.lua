if not vim.g.vscode then
	return {
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = "<C-j>",
			insert_mappings = false,
			terminal_mappings = true,
			direction = 'float',
			hide_numbers = false,
		},
		config = function(config, opts)
			require('toggleterm').setup(opts)
		end,
	}
else 
	return {}
end
