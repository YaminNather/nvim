if not vim.g.vscode then
	return {
		"nvzone/typr",
		dependencies = "nvzone/volt",
		config = true,
		cmd = { "Typr", "TyprStats" },
	}
else
	return {}
end
