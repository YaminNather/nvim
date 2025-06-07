if not vim.g.vscode then
	return {
		"echasnovski/mini.nvim",
		version = false,
		config = function(_, opts)
			require("mini.surround").setup()
			require("mini.files").setup()
		end
	}
end
