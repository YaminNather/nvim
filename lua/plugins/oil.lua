if not vim.g.vscode then
	return {
		"stevearc/oil.nvim",
		--@module oil
		--@type oil.SetupOpts
		opts = {
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = {
			{ "echasnovski/mini.icons" },
		},
		config = function(_, opts)
			require("oil").setup(opts)

			vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end
	}
else
	return {}
end
