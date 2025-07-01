if not vim.g.vscode then
	return {
		{
			"stevearc/oil.nvim",
			--@module oil
			--@type oil.SetupOpts
			opts = {
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
				},
				columns = {
					"permissions",
					"size",
					"mtime",
					"icon",
				},
			},
			dependencies = {
				"echasnovski/mini.icons",
			},
			config = function(_, opts)
				require("oil").setup(opts)

				vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			end
		},

		-- {
		-- 	"nvim-neo-tree/neo-tree.nvim",
		-- 	branch = "v3.x",
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",
		-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		-- 		"MunifTanjim/nui.nvim",
		-- 		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		-- 	},
		-- 	lazy = false,
		-- 	opts = {},
		-- }
	}
else
	return {}
end
