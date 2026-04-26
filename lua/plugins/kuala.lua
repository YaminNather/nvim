if not vim.g.vscode then
	return {
		"mistweaverco/kulala.nvim",
		keys = {
		  { "<leader>ks", desc = "Send request" },
		  { "<leader>ka", desc = "Send all requests" },
		  { "<leader>kb", desc = "Open scratchpad" },
		},
		ft = {"http", "rest"},
		opts = {
		  global_keymaps = true,
		  global_keymaps_prefix = "<leader>R",
		  kulala_keymaps_prefix = "",
		},
	  }
	  else	return {}
end
