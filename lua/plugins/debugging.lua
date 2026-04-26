if not vim.g.vscode then
	return {
		{
			"mfussenegger/nvim-dap",
			config = function(_, opts)
				local os_checker = require('os_checker')
				local dap = require('dap')
				local dap_ui_widgets = require('dap.ui.widgets')

				vim.keymap.set("n", "<Leader>dt", function() dap.toggle_breakpoint() end, {desc = "Toggle breakpoint"})

				vim.keymap.set('n', '<F5>', function() dap.continue() end, {desc =  "DAP Continue"})
				vim.keymap.set('n', '<Leader>dr', function() dap.restart() end, {desc = "DAP Restart"})
				vim.keymap.set('n', '<S-F5>', function() dap.terminate() end, {desc = "DAP Debug terminate"})
				vim.keymap.set('n', '<Leader>ds', function() dap.terminate() end, {desc = "DAP Debug terminate"})
				vim.keymap.set('n', '<F10>', function() dap.step_over() end, {desc = "DAP Step over"})
				vim.keymap.set('n', '<F12>', function() dap.step_into() end, {desc = "DAP Step into"})
				vim.keymap.set('n', '<S-F12>', function() dap.step_out() end, {desc = "DAP Step out"})

				vim.keymap.set("n", "<Leader>duh", function() dap_ui_widgets.hover() end, {desc = "DAP UI Debug Hover"})
				vim.keymap.set("n", "<Leader>dup", function() dap_ui_widgets.preview() end, {desc = "DAP UI Debug preview"})
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

				local js_dap_executable = nil
				if os_checker.os() == os_checker.OS.windows then
					js_dap_executable = {
						command = "node",
						args = {"E:\\Program Files\\js-debug-dap\\js-debug\\src\\dapDebugServer.js", "5858"},
					}
				elseif os_checker.os() == os_checker.OS.linux then
					js_dap_executable = {
						command = "js-debug-dap",
						args = {"5858"}
					}
				end

				dap.adapters["pwa-node"] = {
					type = "server",
					host = "localhost",
					port = "5858",
					executable = js_dap_executable,
				}

				dap.adapters["node"] = function(cb, config)
					if config.type == "node" then
						config.type = "pwa-node"
					end
					local nativeAdapter = dap.adapters["pwa-node"]
					if type(nativeAdapter) == "function" then
						nativeAdapter(cb, config)
					else
						cb(nativeAdapter)
					end
				end
			end
		},
		
		{
			"jay-babu/mason-nvim-dap.nvim",
			opts = {
				ensure_installed = { "js" },
				automatic_installation = true,
			},
		},

		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"mfussenegger/nvim-dap",
				"nvim-neotest/nvim-nio",
			},
			opts = {
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.25
							},
							{
								id = "breakpoints",
								size = 0.25
							},
							{
								id = "stacks",
								size = 0.25
							},
							{
								id = "watches",
								size = 0.25
							}
						},
						position = "left",
						size = 40
					},
					{
						elements = {
							{
								id = "console",
								size = 1.0
							}
						},
						position = "bottom",
						size = 10
					}
				}
			},
			-- config = function(_, opts)
			-- 	local dap = require("dap")
			-- 	local dapui = require("dapui")
			--
			-- 	dapui.setup(opts)
			--
			-- 	vim.keymap.set("n", "<Leader>dut", function() dapui.toggle() end, {desc = "Debug dap ui toggle"})
			--
			-- 	dap.listeners.before.attach.dapui_config = function()
			-- 		dapui.open()
			-- 	end
			-- 	dap.listeners.before.launch.dapui_config = function()
			-- 		dapui.open()
			-- 	end
			-- 	dap.listeners.before.event_terminated.dapui_config = function()
			-- 		dapui.close()
			-- 	end
			-- 	dap.listeners.before.event_exited.dapui_config = function()
			-- 		dapui.close()
			-- 	end
			-- end,
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
		},

		{
			"igorlfs/nvim-dap-view",
			--@module 'dap-view'
			--@type dapview.Config
			opts = {},
		},
	}
else
	return {}
end
