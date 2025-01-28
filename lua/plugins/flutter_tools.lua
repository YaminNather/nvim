if not vim.g.vscode then
	return {
		'nvim-flutter/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = true,
	}
else
	return {}
end
