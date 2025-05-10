if not vim.g.vscode then
	local lsps = {
		"lua_ls",
		"gopls",
		"kotlin_language_server",
		"jdtls",
		"bashls",
		"vtsls",
		"svelte",
		"tailwindcss",
		"intelephense",
		"basedpyright",
		"angularls",
		"html",
	}

	local mason_lspconfig_lsps = {}
	local nvim_lspconfig_lsps = {"gh_actions_ls"}

	for i = 1, #lsps, 1 do
		table.insert(mason_lspconfig_lsps, lsps[i])
		table.insert(nvim_lspconfig_lsps, lsps[i])
	end

	return {
		{
			"williamboman/mason.nvim",
			config = true,
		},

		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = mason_lspconfig_lsps,
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

				-- local lsps = { "lua_ls", "rust_analyzer", "gopls", "kotlin_language_server", "bashls", "vtsls" }
				-- local lsps = { "lua_ls", "gopls", "kotlin_language_server", "bashls", "vtsls", "svelte", "tailwindcss", "intelephense" }

				for _, lsp in ipairs(nvim_lspconfig_lsps) do
					local capabilities = require("blink.cmp").get_lsp_capabilities()
					-- lspconfig[lsp].setup(capabilities)
					vim.lsp.config(lsp, capabilities)
				end

				vim.keymap.set('i', "<C-k>", function() vim.lsp.buf.signature_help() end, { silent = true, noremap = true, }, {desc = "Open LSP signature help"})
				vim.keymap.set('n', "<Leader>cr", function() vim.lsp.buf.rename() end, { silent = true, noremap = true, }, {desc = "Rename code symbol"})
			end
		},

		{ "mfussenegger/nvim-jdtls", }

	}
else
	return {}
end
