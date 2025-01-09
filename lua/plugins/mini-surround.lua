return {
	"echasnovski/mini.nvim",
	version = false,
	config = function(_, opts)
		require("mini.surround").setup()
	end
}
