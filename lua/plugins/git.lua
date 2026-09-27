if not vim.g.vscode then
	return {
		'isakbm/gitgraph.nvim',
		config = true,
		keys = {
			{
				"<leader>gl",
				function()
					require('gitgraph').draw({}, { all = true, max = 5000 })
				end,
				desc = "GitGraph - Draw",
			}
		},
	}
else
	return {}
end
