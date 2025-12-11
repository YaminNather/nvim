if not vim.g.vscode then
	return {
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		opts = {
			theme = 'tomorrow_night',
		},
		config = true,
	}
else
	return {}
end
