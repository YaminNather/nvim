if not vim.g.vscode then
	return {
		{ 
			"williamboman/mason.nvim",
			config = true,
		},

		{ 
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = { "lua_ls", "gopls", "kotlin_language_server", "jdtls" },
			},
			config = true,
		},

		{
			"neovim/nvim-lspconfig",
			dependencies = {
				'saghen/blink.cmp',
			},
			config = function(_, opts)
				local lspconfig = require("lspconfig")

				local lsps = { "lua_ls", "rust_analyzer", "gopls", "kotlin_language_server" }

				for _, lsp in ipairs(lsps) do
					local capabilities = require("blink.cmp").get_lsp_capabilities()
					lspconfig[lsp].setup(capabilities)
				end

				vim.keymap.set('i', "<C-k>", function() vim.lsp.buf.signature_help() end, { silent = true, noremap = true, }, {desc = "Open LSP signature help"})
			end
		},

		{ "mfussenegger/nvim-jdtls", }

	}
else
	return {}
end
