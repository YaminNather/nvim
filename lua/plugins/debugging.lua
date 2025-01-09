if not vim.g.vscode then
	return {
		{
			"mfussenegger/nvim-dap",
			config = function(_, opts)
				vim.keymap.set("n", "<Leader>dt", function() require('dap').toggle_breakpoint() end, {desc = "Toggle breakpoint"})

				vim.keymap.set('n', '<F5>', function() require('dap').continue() end, {desc =  "Continue"})
				vim.keymap.set('n', '<F9>', function() require('dap').step_over() end, {desc = "Step over"})
				vim.keymap.set('n', '<F10>', function() require('dap').step_into() end, {desc = "Step into"})
				vim.keymap.set('n', '<F11>', function() require('dap').step_out() end, {desc = "Step out"})

				vim.keymap.set(
					"n",
					"<Leader>duh",
					function()
						require('dap.ui.widgets').hover()
					end,
					{desc = "Debug Hover"}
				)
				vim.keymap.set(
					"n",
					"<Leader>dup",
					function()
						require('dap.ui.widgets').preview()
					end,
					{desc = "Debug preview"}
				)
				vim.keymap.set(
					"n",
					"<Leader>dus",
					function()
						local widgets = require('dap.ui.widgets')
						local sidebar = widgets.sidebar(widgets.scopes)
						sidebar.open()
					end,
					{desc = "Open debugging sidebar"}
				)
			end
		},

		{
			"leoluz/nvim-dap-go",
			ft = "go",
			dependencies = {
				"mfussenegger/nvim-dap",
			},
			config = function(_, opts)
				require("dap-go").setup(opts)

				vim.keymap.set("n", "<leader>dgt", function() require("dap-go").debug_test() end, {desc = "Debug go test"})
				vim.keymap.set("n", "<leader>dgl", function() require("dap-go").debug_last() end, {desc = "Debug last go test"})
			end,
		}
	}
else
	return {}
end
