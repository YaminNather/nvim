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
			"YaminNather/oh-lucy.nvim",
			branch = 'test',
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
			"EdenEast/nightfox.nvim",
			opts = {
				options = {
					transparent = true,
				}
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

		{
			"nickkadutskyi/jb.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
			config = function()
				-- require("jb").setup({transparent = true})
				-- vim.cmd("colorscheme jb")
			end,
		},

		{ 
			"akinsho/horizon.nvim", 
			version = "*",
			config = true,
		},

		{
			"aktersnurra/no-clown-fiesta.nvim",
			opts = {
				theme = "dim",
			},
			config = true,
		},

		{ 
			'olivercederborg/poimandres.nvim',
			lazy = false,
			priority = 1000,
			config = true,
		},

		{
			'marko-cerovac/material.nvim',
			lazy = false,
			priority = 1000,
			config = true,
		},
	}
else
	return {}
end

