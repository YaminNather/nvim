if not vim.g.vscode then
	return {
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
			},
			config = function(_, opts)
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<leader>be", builtin.buffers, {desc = "List Buffers"})

				require("telescope").load_extension("ui-select")

				vim.keymap.set(
					'n',
					'<Leader>ca',
					function() vim.lsp.buf.code_action() end,
					{desc = "List LSP Code Actions"}
				)
			end
		},
	}
else 
	return {}
end
