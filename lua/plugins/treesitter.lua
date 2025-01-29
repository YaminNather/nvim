if not vim.g.vscode then
	return {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function(_, opts)
			local ensure_installed = { "lua", "vim", "go", "rust", "kotlin", "java", "dart", "yaml" }
			if !string.match(string.lower(vim.loop.os_uname().sysname), "windows") then
				table.insert(ensure_installed, "bash")
			end

			require("nvim-treesitter.configs").setup({
				ensure_installed = ensure_installed,
				sync_install = "false",
				highlight = { enable = true, },
				indent = { enable = true, },
			})
		end
	}
end
