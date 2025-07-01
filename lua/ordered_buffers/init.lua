local m = {}

local buffers = { vim.api.nvim_get_current_buf() }

function m.setup()
	vim.api.nvim_create_autocmd("BufAdd", {
		callback = function(args)
			if not vim.api.nvim_buf_get_option(args.buf, "buflisted") then
				return
			end

			table.insert(buffers, args.buf)

			-- print(string.format("CustomLog: added buffer %d, %s", args.buf, vim.api.nvim_buf_get_name(args.buf)))
			-- print(string.format("CustomLog: new list %s", m.ls()))
		end
	})

	vim.api.nvim_create_autocmd("BufDelete", {
		callback = function(args)
			for i, value in pairs(buffers) do
				if value == args.buf then
					table.remove(buffers, i)

					-- vim.api.nvim_buf_get_name(args.buf)
					-- print(string.format("CustomLog: removed buffer %d", args.buf))
					-- print(string.format("CustomLog: new list %s", m.ls()))
					break
				end
			end
		end
	})
end

function m.get_buffers()
	r = {}
	for _, buffer in pairs(buffers) do
		table.insert(r, buffer)
	end

	return r
end

function m.reorder_all_buffers(new_order)
	buffers = new_order
end

function m.ls()
	r = ""
	for i, value in pairs(buffers) do
		if i ~= 1 then
			r = r .. ", "
		end

		r = r .. value
	end

	return r
end

return m
