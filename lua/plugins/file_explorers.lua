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
			config = function(config, opts)
				require('oil').setup(opts)

				require("custom_plugins.explorer_toggler").register_explorer(
					function()
						vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
					end,
					function() end
				)
			end
		},

		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
			},
			lazy = false,
			opts = {
				filesystem = {
					hijack_netrw_behavior = "disabled",
				},
			},
			config = function(config, opts)
				require('neo-tree').setup(opts)

				require("custom_plugins.explorer_toggler").register_explorer(
					function()
						vim.keymap.set("n", "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle Neotree" })
					end,
					function() end
				)
			end
		},
	}
else
	return {}
end
