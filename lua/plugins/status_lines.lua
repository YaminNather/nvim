if not vim.g.vscode then
	return {
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = true,
	}
else
	return {}
end
