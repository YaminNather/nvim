if not vim.g.vscode then
	return {
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets"
		},
		--@module 'blink.cmp'
		--@type blink.cmp.Config
		opts = {
			keymap = { 
				preset = "default",

				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono',
			},
			completion = {
				-- documentation = {
				-- 	auto_show = true,
				-- 	auto_show_delay_ms = 200,
				-- },

			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", },
			},

			-- signature = { enabled = true },
		},
		opts_extend = { "sources.default" }
	}
else
	return {}
end
