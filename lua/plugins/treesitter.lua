if not vim.g.vscode then
	return {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function(_, opts)
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "vim", "go", "rust", "kotlin", "java", "yaml", "bash" },
				sync_install = "false",
				highlight = { enable = true },
				indent = { enable = false },
			})
		end
	}
end
