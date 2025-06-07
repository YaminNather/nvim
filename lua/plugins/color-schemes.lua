if not vim.g.vscode then
	return {
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			main = "catppuccin",
			config = true,
		},

		{
			'vague2k/vague.nvim',
			opts = {},
		},

		{
			"olimorris/onedarkpro.nvim",
			priority = 1000,
		},

		{
			"Yazeed1s/oh-lucy.nvim",
			priority = 1000,
		},

		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				-- transparent = "true",
			},
		},

		{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				-- transparent = true,
			},
		},
	}
else
	return {}
end

