if not vim.g.vscode then
	return {
		"famiu/bufdelete.nvim",
		config = function (_, _)
			vim.keymap.set("n", "<Leader>bd", ":Bdelete<CR>", {desc = "Delete buffer"})
		end
	}
else
	return {}
end
