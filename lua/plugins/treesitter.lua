if not vim.g.vscode then
	return {
		"nvim-treesitter/nvim-treesitter",
		branch = 'main',
		build = ":TSUpdate",
		init = function()
			local ensure_installed = { "lua", "vim", "go", "rust", "kotlin", "java", "dart", "yaml", "svelte", "php", "terraform", "hcl", "blade", "html", "typescript", "javascript", "prisma", "powershell" , "kulala_http" }
			
			local already_installed = require('nvim-treesitter.config').get_installed()
			local parsers_to_install = vim.iter(ensure_installed)
				:filter(function(parser)
					return not vim.tbl_contains(already_installed, parser)
				end)
				:totable()

			require('nvim-treesitter').install(parsers_to_install)

			vim.api.nvim_create_autocmd('FileType', {
				callback = function()
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end
		-- config = function(_, opts)
		-- 	local ensure_installed = { "lua", "vim", "go", "rust", "kotlin", "java", "dart", "yaml", "svelte", "php", "terraform", "hcl", "blade", "html", "typescript", "javascript", "prisma", "powershell" , "kulala_http" }
		-- 	if not string.match(string.lower(vim.loop.os_uname().sysname), "windows") then
		-- 		table.insert(ensure_installed, "bash")
		-- 	end
		--
		-- 	require("nvim-treesitter.config").setup({
		-- 		ensure_installed = ensure_installed,
		-- 		sync_install = "false",
		-- 		highlight = { enable = true, },
		-- 		indent = { enable = true, },
		-- 	})
		-- end
	}
else
	return {}
end
