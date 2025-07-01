if not vim.g.vscode then
	return {
		{
			'romgrk/barbar.nvim',
			dependencies = {
				'lewis6991/gitsigns.nvim',
				'nvim-tree/nvim-web-devicons',
			},
			config = function(_, opts)
				require('barbar').setup(opts)

				-- Move to previous/next
				vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { silent = true })
				vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { silent = true })

				-- Re-order to previous/next
				vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true })
				vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { silent = true })

				-- Goto buffer in position...
				vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { silent = true })
				vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { silent = true })
				vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { silent = true })
				vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { silent = true })
				vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { silent = true })
				vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { silent = true })
				vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { silent = true })
				vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { silent = true })
				vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { silent = true })
				vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', { silent = true })

				-- Pin/unpin buffer
				vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', { silent = true })

				-- Close buffer
				vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', { silent = true })

				-- Restore buffer
				vim.keymap.set('n', '<A-s-c>', '<Cmd>BufferRestore<CR>', { silent = true })

				-- Magic buffer-picking mode
				vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', { silent = true })
				vim.keymap.set('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', { silent = true })

				-- -- Sort automatically by...
				-- vim.keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { silent = true })
				-- vim.keymap.set('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', { silent = true })
				-- vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', { silent = true })
				-- vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', { silent = true })
				-- vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { silent = true })
			end,
		},
	}
else
	return {}
end
