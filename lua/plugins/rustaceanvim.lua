if not vim.g.vscode then
	return {
		'mrcjkb/rustaceanvim',
		version = '^5',
		lazy = false,
	}
else
	return {}
end
