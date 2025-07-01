return {
	"echasnovski/mini.nvim",
	version = false,
	config = function(_, opts)
		require("mini.surround").setup()

		if not vim.g.vscode then
			require("mini.files").setup()
		end
	end
}
