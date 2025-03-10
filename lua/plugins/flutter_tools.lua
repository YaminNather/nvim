if not vim.g.vscode then
	return {
		'nvim-flutter/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		opts = {
			debugger = {
				enabled = true,
				exception_breakpoints = {},
			},
		},
		config = function(_, opts)
			local flutter_tools = require("flutter-tools")
			flutter_tools.setup(opts)

			vim.keymap.set("n", "<Leader>fR", "<cmd>FlutterRestart<CR>", {})
			vim.keymap.set("n", "<Leader>fe", "<cmd>FlutterEmulators<CR>", {})
			vim.keymap.set("n", "<Leader>fd", "<cmd>FlutterDebug<CR>", {})
			vim.keymap.set("n", "<Leader>fD", "<cmd>FlutterDevices<CR>", {})
			vim.keymap.set("n", "<Leader>fq", "<cmd>FlutterQuit<CR>", {})
		end,
	}
else
	return { }
end
