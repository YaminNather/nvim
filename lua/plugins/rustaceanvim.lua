if not vim.g.vscode then
	return {
		'mrcjkb/rustaceanvim',
		version = '^8',
		lazy = false,
	}
else
	return {}
end
