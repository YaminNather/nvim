local m = {}

function m.setup()
	vim.filetype.add({
		extension = {
			tofu = "opentofu",
			tf = "opentofu",
		}
	})

	vim.treesitter.language.register("terraform", { "tf", "tofu", "opentofu" })
end

return m

