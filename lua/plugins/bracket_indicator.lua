if not vim.g.vscode then
	return {
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function(_, opts)
			require("ibl").setup()
		end,
	}
else
	return {}
end
